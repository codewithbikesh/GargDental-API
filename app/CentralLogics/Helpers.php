<?php
namespace App\CentralLogics;

use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use App\Models\SystemSetting;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderReturn;
use App\Models\Wishlist;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Log;

class Helpers
{
    public static function error_processor($validator)
    {
        $err_keeper = [];
        foreach ($validator->errors()->getMessages() as $index => $error) {
            array_push($err_keeper, ['code' => $index, 'message' => $error[0]]);
        }
        return $err_keeper;
    }

    public static function error_formater($key, $mesage, $errors = [])
    {
        $errors[] = ['code' => $key, 'message' => $mesage];

        return $errors;
    }

    public static function get_business_settings($name, $json_decode = true)
    {
        $config = null;

        $paymentmethod = SystemSetting::where('key', $name)->first();

        if ($paymentmethod) {
            $config = $json_decode ? json_decode($paymentmethod->value, true) : $paymentmethod->value;
        }

        return $config;
    }

    public static function getAccessToken($key)
    {
        $jwtToken = [
            'iss' => $key['client_email'],
            'scope' => 'https://www.googleapis.com/auth/firebase.messaging',
            'aud' => 'https://oauth2.googleapis.com/token',
            'exp' => time() + 3600,
            'iat' => time(),
        ];
        $jwtHeader = base64_encode(json_encode(['alg' => 'RS256', 'typ' => 'JWT']));
        $jwtPayload = base64_encode(json_encode($jwtToken));
        $unsignedJwt = $jwtHeader . '.' . $jwtPayload;
        openssl_sign($unsignedJwt, $signature, $key['private_key'], OPENSSL_ALGO_SHA256);
        $jwt = $unsignedJwt . '.' . base64_encode($signature);

        $response = Http::asForm()->post('https://oauth2.googleapis.com/token', [
            'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
            'assertion' => $jwt,
        ]);
        return $response->json('access_token');
    }
    
    public static function day_part()
    {
        $part = "";
        $morning_start = date("h:i:s", strtotime("5:00:00"));
        $afternoon_start = date("h:i:s", strtotime("12:01:00"));
        $evening_start = date("h:i:s", strtotime("17:01:00"));
        $evening_end = date("h:i:s", strtotime("21:00:00"));

        if (time() >= $morning_start && time() < $afternoon_start) {
            $part = "morning";
        } elseif (time() >= $afternoon_start && time() < $evening_start) {
            $part = "afternoon";
        } elseif (time() >= $evening_start && time() <= $evening_end) {
            $part = "evening";
        } else {
            $part = "night";
        }

        return $part;
    }

    public static function env_update($key, $value)
    {
        $path = base_path('.env');
        if (file_exists($path)) {
            file_put_contents($path, str_replace(
                $key . '=' . env($key),
                $key . '=' . $value,
                file_get_contents($path)
            ));
        }
    }

    public static function env_key_replace($key_from, $key_to, $value)
    {
        $path = base_path('.env');
        if (file_exists($path)) {
            file_put_contents($path, str_replace(
                $key_from . '=' . env($key_from),
                $key_to . '=' . $value,
                file_get_contents($path)
            ));
        }
    }

    public static  function remove_dir($dir)
    {
        if (is_dir($dir)) {
            $objects = scandir($dir);
            foreach ($objects as $object) {
                if ($object != "." && $object != "..") {
                    if (filetype($dir . "/" . $object) == "dir") Helpers::remove_dir($dir . "/" . $object);
                    else unlink($dir . "/" . $object);
                }
            }
            reset($objects);
            rmdir($dir);
        }
    }

    public static function getDisk()
    {
        $config=self::get_business_settings('local_storage');

        return isset($config)?($config==0?'s3':'public'):'public';
    }

    public static function upload(string $dir, string $format, $image = null)
    {
        try {
            if ($image != null) {
                $imageName = \Carbon\Carbon::now()->toDateString() . "-" . uniqid() . "." . $format;
                if (!Storage::disk(self::getDisk())->exists($dir)) {
                    Storage::disk(self::getDisk())->makeDirectory($dir);
                }
                Storage::disk(self::getDisk())->putFileAs($dir, $image, $imageName);
            } else {
                $imageName = null;
            }
        } catch (\Exception $e) {
        }
        return $imageName;
    }

    public static function upload_file(string $dir, $file = null)
    {
        try {
            if ($file != null) {
                if ($file instanceof \Illuminate\Http\UploadedFile) {
                    $originalName = pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME);
                    $extension = $file->getClientOriginalExtension();
                } elseif ($file instanceof \Illuminate\Http\File) {
                    $originalName = pathinfo($file->getFilename(), PATHINFO_FILENAME);
                    $extension = $file->guessExtension() ?? pathinfo($file->getFilename(), PATHINFO_EXTENSION);
                } else {
                    return null;
                }
    
                $safeFileName = Str::slug($originalName, '_') . '.' . $extension;
    
                if (!Storage::disk(self::getDisk())->exists($dir)) {
                    Storage::disk(self::getDisk())->makeDirectory($dir);
                }
    
                Storage::disk(self::getDisk())->putFileAs($dir, $file, $safeFileName);
            } else {
                $safeFileName = null;
            }
        } catch (\Exception $e) {
            Log::error('upload_file error: ' . $e->getMessage());
            return null;
        }
    
        return $safeFileName;
    }

    public static function update(string $dir, $old_image, string $format, $image = null)
    {
        if ($image == null) {
            return $old_image;
        }
        try {
            if (Storage::disk(self::getDisk())->exists($dir . $old_image)) {
                Storage::disk(self::getDisk())->delete($dir . $old_image);
            }
        } catch (\Exception $e) {
        }
        $imageName = Helpers::upload($dir, $format, $image);
        
        return $imageName;
    }

    public static function update_file(string $dir, $old_file, $file = null)
    {
        if ($file == null) {
            return $old_file;
        }
        try {
            if (Storage::disk(self::getDisk())->exists($dir . $old_file)) {
                Storage::disk(self::getDisk())->delete($dir . $old_file);
            }
        } catch (\Exception $e) {
        }
        $fileName = Helpers::upload_file($dir, $file);
        return $fileName;
    }

    public static function check_and_delete(string $dir, $old_image)
    {

        try {
            if (Storage::disk('public')->exists($dir . $old_image)) {
                Storage::disk('public')->delete($dir . $old_image);
            }
            if (Storage::disk('s3')->exists($dir . $old_image)) {
                Storage::disk('s3')->delete($dir . $old_image);
            }
        } catch (\Exception $e) {
        }

        return true;
    }

    public static function check_and_delete_file(string $dir, $old_file)
    {

        try {
            if (Storage::disk('public')->exists($dir . $old_file)) {
                Storage::disk('public')->delete($dir . $old_file);
            }
            if (Storage::disk('s3')->exists($dir . $old_file)) {
                Storage::disk('s3')->delete($dir . $old_file);
            }
        } catch (\Exception $e) {
        }

        return true;
    }

    public static function get_full_url($path,$data,$type,$placeholder = null){
        
        $place_holders = [
            'default' => dynamicAsset('public/assets/admin/img/100x100/no-image-found.png'),
            'admin' => dynamicAsset('public/assets/admin/img/160x160/img1.jpg'),
            'system' => dynamicAsset('public/assets/admin/img/160x160/img2.jpg'),
            'banner' => dynamicAsset('public/assets/admin/img/900x400/img1.jpg'),
            'upload_image' => dynamicAsset('public/assets/admin/img/upload-img.png'),
            'upload_1_1' => dynamicAsset('public/assets/admin/img/upload-3.png'),
            'upload_placeholder' => dynamicAsset('/public/assets/admin/img/upload-placeholder.png'),
            'email_template' => dynamicAsset('/public/assets/admin/img/blank1.png'),
            'vendor' => dynamicAsset('public/assets/admin/img/160x160/img1.jpg'),
            'favicon' => dynamicAsset('public/assets/admin/img/favicon.png'),
            'authfav' => dynamicAsset('/public/assets/admin/img/auth-fav.png'),
        ];

        try {
            if ($data && $type == 's3' && Storage::disk('s3')->exists($path .'/'. $data)) {
                return Storage::disk('s3')->url($path .'/'. $data);
            }
        } catch (\Exception $e){
        }

        if ($data && Storage::disk('public')->exists($path .'/'. $data)) {
            return dynamicStorage('storage/app/public') . '/' . $path . '/' . $data;
        }

        if (request()->is('api/*')) {
            return null;
        }

        if(isset($placeholder) && array_key_exists($placeholder, $place_holders)){
            return $place_holders[$placeholder];
        }elseif(array_key_exists($path, $place_holders)){
            return $place_holders[$path];
        }else{
            return $place_holders['default'];
        }

        return 'def.png';
    }

    public static function format_coordiantes($coordinates)
    {
        $data = [];
        foreach ($coordinates as $coord) {
            $data[] = (object)['lat' => $coord[1], 'lng' => $coord[0]];
        }
        return $data;
    }

    public static function get_landing_data()
    {
        $key=['company_name', 'company_logo_header', 'company_logo_footer', 'whatsapp', 'primary_phone', 'secondary_phone', 'primary_email', 'secondary_email', 'address', 'website_link', 'map_url', 'shipping_option', 'no_category_display'];
        $system_settings =  SystemSetting::whereIn('key', $key)->pluck('value','key')->toArray();

        $landing_data = [
            'company_name' =>  $system_settings['company_name'] ?? 'Garg Dental',
            'company_logo_header'=>   Helpers::get_full_url('system',$system_settings['company_logo_header'] ??  null,$system_settings['company_logo_header'] ?? null),
            'company_logo_footer'=>   Helpers::get_full_url('system',$system_settings['company_logo_footer'] ??  null,$system_settings['company_logo_footer'] ?? null),
            'whatsapp' =>  $system_settings['whatsapp'],
            'primary_phone' =>  $system_settings['primary_phone'],
            'secondary_phone' =>  $system_settings['secondary_phone'],
            'primary_email' =>  $system_settings['primary_email'],
            'secondary_email' =>  $system_settings['secondary_email'],
            'address' =>  $system_settings['address'],
            'website_link' =>  $system_settings['website_link'],
            'map_url' =>  $system_settings['map_url'],
            'shipping_option' =>  $system_settings['shipping_option'],
            'no_category_display' =>  $system_settings['no_category_display']
        ];

        return $landing_data;
    }

    public static function getCustomerStats($customerId)
    {
        $wishitem_count = Wishlist::where('customer_id', $customerId)->count();

        $orderStats = Order::selectRaw("
                SUM(CASE WHEN order_status != 'Cancelled' THEN 1 ELSE 0 END) as order_count,
                SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) as cancelled_count
            ")
            ->where('customer_id', $customerId)
            ->first();

        $cart = Cart::with('items.product.images')->where('customer_id', $customerId)->first();
        $cartItems = $cart->items ?? collect();
        $cartItemCount = $cartItems->count();
        $cartproducts = $cartItems->pluck('product')->filter();

        return [
            'wishitem_count' => $wishitem_count,
            'order_count' => $orderStats->order_count ?? 0,
            'cancelled_count' => $orderStats->cancelled_count ?? 0,
            'cart' => $cart,
            'cartItems' => $cartItems,
            'cartItemCount' => $cartItemCount,
            'cartproducts' => $cartproducts,
        ];
    }

    public static function generateOrderId()
    {
        $prefix = rand(1000, 9999);
        $timestamp = now()->format('Ymd');
        $latestOrder = Order::whereDate('created_at', now())->latest('id')->first();
        $lastNumber = $latestOrder ? intval(substr($latestOrder->order_id, -4)) : 0;
        return $prefix . $timestamp . str_pad($lastNumber + 1, 4, '0', STR_PAD_LEFT);
    }
    
    public static function generateReturnId()
    {
        $prefix = rand(10, 99);
        $timestamp = now()->format('Ymd');
        $latestReturn = OrderReturn::whereDate('created_at', now())->latest('id')->first();
        $lastNumber = $latestReturn ? intval(substr($latestReturn->order_id, -4)) : 0;
        return $prefix . $timestamp . str_pad($lastNumber + 1, 4, '0', STR_PAD_LEFT);
    }
    
   public static function module_permission_check($mod_name)
{
    $user = auth('admin')->user();

    if (!$user || !$user->role) {
        return false;
    }

    if ($mod_name == 'zone' && $user->zone_id) {
        return false;
    }

    $permission = $user->role->modules;
    if (isset($permission) && in_array($mod_name, (array)json_decode($permission))) {
        return true;
    }

    return false;
}


    public static function get_settings($name)
    {
        $config = null;
        $data = SystemSetting::where(['key' => $name])->first();
        if (isset($data)) {
            $config = json_decode($data['value'], true);
            if (is_null($config)) {
                $config = $data['value'];
            }
        }
        return $config;
    }
    public static function get_settings_storage($name)
    {
        $config = 'public';
        $data = SystemSetting::where(['key' => $name])->first();
        if(isset($data) && count($data->storage)>0){
            $config = $data->storage[0]['value'];
        }
        return $config;
    }

    public static function setEnvironmentValue($envKey, $envValue)
    {
        $envFile = app()->environmentFilePath();
        $str = file_get_contents($envFile);
        $oldValue = env($envKey);
        if (strpos($str, $envKey) !== false) {
            $str = str_replace("{$envKey}={$oldValue}", "{$envKey}={$envValue}", $str);
        } else {
            $str .= "{$envKey}={$envValue}\n";
        }
        $fp = fopen($envFile, 'w');
        fwrite($fp, $str);
        fclose($fp);
        return $envValue;
    }

    public static function insert_business_settings_key($key, $value = null)
    {
        $data =  SystemSetting::where('key', $key)->first();
        if (!$data) {
            DB::table('business_settings')->updateOrInsert(['key' => $key], [
                'value' => $value,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
        return true;
    }

    public static function get_language_name($key)
    {
        $languages = array(
            "af" => "Afrikaans",
            "sq" => "Albanian - shqip",
            "am" => "Amharic - አማርኛ",
            "ar" => "Arabic - العربية",
            "an" => "Aragonese - aragonés",
            "hy" => "Armenian - հայերեն",
            "ast" => "Asturian - asturianu",
            "az" => "Azerbaijani - azərbaycan dili",
            "eu" => "Basque - euskara",
            "be" => "Belarusian - беларуская",
            "bn" => "Bengali - বাংলা",
            "bs" => "Bosnian - bosanski",
            "br" => "Breton - brezhoneg",
            "bg" => "Bulgarian - български",
            "ca" => "Catalan - català",
            "ckb" => "Central Kurdish - کوردی (دەستنوسی عەرەبی)",
            "zh" => "Chinese - 中文",
            "zh-HK" => "Chinese (Hong Kong) - 中文（香港）",
            "zh-CN" => "Chinese (Simplified) - 中文（简体）",
            "zh-TW" => "Chinese (Traditional) - 中文（繁體）",
            "co" => "Corsican",
            "hr" => "Croatian - hrvatski",
            "cs" => "Czech - čeština",
            "da" => "Danish - dansk",
            "nl" => "Dutch - Nederlands",
            "en" => "English",
            "en-AU" => "English (Australia)",
            "en-CA" => "English (Canada)",
            "en-IN" => "English (India)",
            "en-NZ" => "English (New Zealand)",
            "en-ZA" => "English (South Africa)",
            "en-GB" => "English (United Kingdom)",
            "en-US" => "English (United States)",
            "eo" => "Esperanto - esperanto",
            "et" => "Estonian - eesti",
            "fo" => "Faroese - føroyskt",
            "fil" => "Filipino",
            "fi" => "Finnish - suomi",
            "fr" => "French - français",
            "fr-CA" => "French (Canada) - français (Canada)",
            "fr-FR" => "French (France) - français (France)",
            "fr-CH" => "French (Switzerland) - français (Suisse)",
            "gl" => "Galician - galego",
            "ka" => "Georgian - ქართული",
            "de" => "German - Deutsch",
            "de-AT" => "German (Austria) - Deutsch (Österreich)",
            "de-DE" => "German (Germany) - Deutsch (Deutschland)",
            "de-LI" => "German (Liechtenstein) - Deutsch (Liechtenstein)",
            "de-CH" => "German (Switzerland) - Deutsch (Schweiz)",
            "el" => "Greek - Ελληνικά",
            "gn" => "Guarani",
            "gu" => "Gujarati - ગુજરાતી",
            "ha" => "Hausa",
            "haw" => "Hawaiian - ʻŌlelo Hawaiʻi",
            "he" => "Hebrew - עברית",
            "hi" => "Hindi - हिन्दी",
            "hu" => "Hungarian - magyar",
            "is" => "Icelandic - íslenska",
            "id" => "Indonesian - Indonesia",
            "ia" => "Interlingua",
            "ga" => "Irish - Gaeilge",
            "it" => "Italian - italiano",
            "it-IT" => "Italian (Italy) - italiano (Italia)",
            "it-CH" => "Italian (Switzerland) - italiano (Svizzera)",
            "ja" => "Japanese - 日本語",
            "kn" => "Kannada - ಕನ್ನಡ",
            "kk" => "Kazakh - қазақ тілі",
            "km" => "Khmer - ខ្មែរ",
            "ko" => "Korean - 한국어",
            "ku" => "Kurdish - Kurdî",
            "ky" => "Kyrgyz - кыргызча",
            "lo" => "Lao - ລາວ",
            "la" => "Latin",
            "lv" => "Latvian - latviešu",
            "ln" => "Lingala - lingála",
            "lt" => "Lithuanian - lietuvių",
            "mk" => "Macedonian - македонски",
            "ms" => "Malay - Bahasa Melayu",
            "ml" => "Malayalam - മലയാളം",
            "mt" => "Maltese - Malti",
            "mr" => "Marathi - मराठी",
            "mn" => "Mongolian - монгол",
            "ne" => "Nepali - नेपाली",
            "no" => "Norwegian - norsk",
            "nb" => "Norwegian Bokmål - norsk bokmål",
            "nn" => "Norwegian Nynorsk - nynorsk",
            "oc" => "Occitan",
            "or" => "Oriya - ଓଡ଼ିଆ",
            "om" => "Oromo - Oromoo",
            "ps" => "Pashto - پښتو",
            "fa" => "Persian - فارسی",
            "pl" => "Polish - polski",
            "pt" => "Portuguese - português",
            "pt-BR" => "Portuguese (Brazil) - português (Brasil)",
            "pt-PT" => "Portuguese (Portugal) - português (Portugal)",
            "pa" => "Punjabi - ਪੰਜਾਬੀ",
            "qu" => "Quechua",
            "ro" => "Romanian - română",
            "mo" => "Romanian (Moldova) - română (Moldova)",
            "rm" => "Romansh - rumantsch",
            "ru" => "Russian - русский",
            "gd" => "Scottish Gaelic",
            "sr" => "Serbian - српски",
            "sh" => "Serbo-Croatian - Srpskohrvatski",
            "sn" => "Shona - chiShona",
            "sd" => "Sindhi",
            "si" => "Sinhala - සිංහල",
            "sk" => "Slovak - slovenčina",
            "sl" => "Slovenian - slovenščina",
            "so" => "Somali - Soomaali",
            "st" => "Southern Sotho",
            "es" => "Spanish - español",
            "es-AR" => "Spanish (Argentina) - español (Argentina)",
            "es-419" => "Spanish (Latin America) - español (Latinoamérica)",
            "es-MX" => "Spanish (Mexico) - español (México)",
            "es-ES" => "Spanish (Spain) - español (España)",
            "es-US" => "Spanish (United States) - español (Estados Unidos)",
            "su" => "Sundanese",
            "sw" => "Swahili - Kiswahili",
            "sv" => "Swedish - svenska",
            "tg" => "Tajik - тоҷикӣ",
            "ta" => "Tamil - தமிழ்",
            "tt" => "Tatar",
            "te" => "Telugu - తెలుగు",
            "th" => "Thai - ไทย",
            "ti" => "Tigrinya - ትግርኛ",
            "to" => "Tongan - lea fakatonga",
            "tr" => "Turkish - Türkçe",
            "tk" => "Turkmen",
            "tw" => "Twi",
            "uk" => "Ukrainian - українська",
            "ur" => "Urdu - اردو",
            "ug" => "Uyghur",
            "uz" => "Uzbek - o‘zbek",
            "vi" => "Vietnamese - Tiếng Việt",
            "wa" => "Walloon - wa",
            "cy" => "Welsh - Cymraeg",
            "fy" => "Western Frisian",
            "xh" => "Xhosa",
            "yi" => "Yiddish",
            "yo" => "Yoruba - Èdè Yorùbá",
            "zu" => "Zulu - isiZulu",
        );
        return array_key_exists($key, $languages) ? $languages[$key] : $key;
    }

    public static function default_lang()
    {
        if (strpos(url()->current(), '/api')) {
            $lang = App::getLocale();
        } elseif ( request()->is('admin*') && auth('admin')?->check() && session()->has('local')) {
            $lang = session('local');
        }
        elseif (session()->has('landing_local')) {
            $lang = session('landing_local');
        }
        elseif (session()->has('local')) {
            $lang = session('local');
        } else {
            $data = Helpers::get_business_settings('language');
            $code = 'en';
            $direction = 'ltr';
            foreach ($data as $ln) {
                if (is_array($ln) && array_key_exists('default', $ln) && $ln['default']) {
                    $code = $ln['code'];
                    if (array_key_exists('direction', $ln)) {
                        $direction = $ln['direction'];
                    }
                }
            }
            session()->put('local', $code);
            $lang = $code;
        }
        return $lang;
    }

    public static function system_default_language()
    {
        $languages = json_decode(\App\Models\SystemSetting::where('key', 'system_language')->first()?->value);
        $lang = 'en';

        foreach ($languages as $key => $language) {
            if($language->default){
                $lang = $language->code;
            }
        }
        return $lang;
    }
    
    public static function system_default_direction()
    {
        $languages = json_decode(\App\Models\SystemSetting::where('key', 'system_language')->first()?->value);
        $lang = 'en';

        foreach ($languages as $key => $language) {
            if($language->default){
                $lang = $language->direction;
            }
        }
        return $lang;
    }

    public static function remove_invalid_charcaters($str)
    {
        return str_ireplace(['\'', '"',';', '<', '>'], ' ', $str);
    }

    public static function export_attributes($collection){
        $data = [];
        foreach($collection as $key=>$item){
            $data[] = [
                'SL'=>$key+1,
                 translate('messages.id') => $item['id'],
                 translate('messages.name') => $item['name'],
            ];
        }

        return $data;
    }

    public static function hex_to_rbg($color){
        list($r, $g, $b) = sscanf($color, "#%02x%02x%02x");
        $output = "$r, $g, $b";
        return $output;
    }

    public static function getLanguageCode(string $country_code): string
    {
        $locales = array(
            'en-English(default)',
            'af-Afrikaans',
            'sq-Albanian - shqip',
            'am-Amharic - አማርኛ',
            'ar-Arabic - العربية',
            'an-Aragonese - aragonés',
            'hy-Armenian - հայերեն',
            'ast-Asturian - asturianu',
            'az-Azerbaijani - azərbaycan dili',
            'eu-Basque - euskara',
            'be-Belarusian - беларуская',
            'bn-Bengali - বাংলা',
            'bs-Bosnian - bosanski',
            'br-Breton - brezhoneg',
            'bg-Bulgarian - български',
            'ca-Catalan - català',
            'ckb-Central Kurdish - کوردی (دەستنوسی عەرەبی)',
            'zh-Chinese - 中文',
            'zh-HK-Chinese (Hong Kong) - 中文（香港）',
            'zh-CN-Chinese (Simplified) - 中文（简体）',
            'zh-TW-Chinese (Traditional) - 中文（繁體）',
            'co-Corsican',
            'hr-Croatian - hrvatski',
            'cs-Czech - čeština',
            'da-Danish - dansk',
            'nl-Dutch - Nederlands',
            'en-AU-English (Australia)',
            'en-CA-English (Canada)',
            'en-IN-English (India)',
            'en-NZ-English (New Zealand)',
            'en-ZA-English (South Africa)',
            'en-GB-English (United Kingdom)',
            'en-US-English (United States)',
            'eo-Esperanto - esperanto',
            'et-Estonian - eesti',
            'fo-Faroese - føroyskt',
            'fil-Filipino',
            'fi-Finnish - suomi',
            'fr-French - français',
            'fr-CA-French (Canada) - français (Canada)',
            'fr-FR-French (France) - français (France)',
            'fr-CH-French (Switzerland) - français (Suisse)',
            'gl-Galician - galego',
            'ka-Georgian - ქართული',
            'de-German - Deutsch',
            'de-AT-German (Austria) - Deutsch (Österreich)',
            'de-DE-German (Germany) - Deutsch (Deutschland)',
            'de-LI-German (Liechtenstein) - Deutsch (Liechtenstein)
            ',
            'de-CH-German (Switzerland) - Deutsch (Schweiz)',
            'el-Greek - Ελληνικά',
            'gn-Guarani',
            'gu-Gujarati - ગુજરાતી',
            'ha-Hausa',
            'haw-Hawaiian - ʻŌlelo Hawaiʻi',
            'he-Hebrew - עברית',
            'hi-Hindi - हिन्दी',
            'hu-Hungarian - magyar',
            'is-Icelandic - íslenska',
            'id-Indonesian - Indonesia',
            'ia-Interlingua',
            'ga-Irish - Gaeilge',
            'it-Italian - italiano',
            'it-IT-Italian (Italy) - italiano (Italia)',
            'it-CH-Italian (Switzerland) - italiano (Svizzera)',
            'ja-Japanese - 日本語',
            'kn-Kannada - ಕನ್ನಡ',
            'kk-Kazakh - қазақ тілі',
            'km-Khmer - ខ្មែរ',
            'ko-Korean - 한국어',
            'ku-Kurdish - Kurdî',
            'ky-Kyrgyz - кыргызча',
            'lo-Lao - ລາວ',
            'la-Latin',
            'lv-Latvian - latviešu',
            'ln-Lingala - lingála',
            'lt-Lithuanian - lietuvių',
            'mk-Macedonian - македонски',
            'ms-Malay - Bahasa Melayu',
            'ml-Malayalam - മലയാളം',
            'mt-Maltese - Malti',
            'mr-Marathi - मराठी',
            'mn-Mongolian - монгол',
            'ne-Nepali - नेपाली',
            'no-Norwegian - norsk',
            'nb-Norwegian Bokmål - norsk bokmål',
            'nn-Norwegian Nynorsk - nynorsk',
            'oc-Occitan',
            'or-Oriya - ଓଡ଼ିଆ',
            'om-Oromo - Oromoo',
            'ps-Pashto - پښتو',
            'fa-Persian - فارسی',
            'pl-Polish - polski',
            'pt-Portuguese - português',
            'pt-BR-Portuguese (Brazil) - português (Brasil)',
            'pt-PT-Portuguese (Portugal) - português (Portugal)',
            'pa-Punjabi - ਪੰਜਾਬੀ',
            'qu-Quechua',
            'ro-Romanian - română',
            'mo-Romanian (Moldova) - română (Moldova)',
            'rm-Romansh - rumantsch',
            'ru-Russian - русский',
            'gd-Scottish Gaelic',
            'sr-Serbian - српски',
            'sh-Serbo-Croatian - Srpskohrvatski',
            'sn-Shona - chiShona',
            'sd-Sindhi',
            'si-Sinhala - සිංහල',
            'sk-Slovak - slovenčina',
            'sl-Slovenian - slovenščina',
            'so-Somali - Soomaali',
            'st-Southern Sotho',
            'es-Spanish - español',
            'es-AR-Spanish (Argentina) - español (Argentina)',
            'es-419-Spanish (Latin America) - español (Latinoamérica)
            ',
            'es-MX-Spanish (Mexico) - español (México)',
            'es-ES-Spanish (Spain) - español (España)',
            'es-US-Spanish (United States) - español (Estados Unidos)
            ',
            'su-Sundanese',
            'sw-Swahili - Kiswahili',
            'sv-Swedish - svenska',
            'tg-Tajik - тоҷикӣ',
            'ta-Tamil - தமிழ்',
            'tt-Tatar',
            'te-Telugu - తెలుగు',
            'th-Thai - ไทย',
            'ti-Tigrinya - ትግርኛ',
            'to-Tongan - lea fakatonga',
            'tr-Turkish - Türkçe',
            'tk-Turkmen',
            'tw-Twi',
            'uk-Ukrainian - українська',
            'ur-Urdu - اردو',
            'ug-Uyghur',
            'uz-Uzbek - o‘zbek',
            'vi-Vietnamese - Tiếng Việt',
            'wa-Walloon - wa',
            'cy-Welsh - Cymraeg',
            'fy-Western Frisian',
            'xh-Xhosa',
            'yi-Yiddish',
            'yo-Yoruba - Èdè Yorùbá',
            'zu-Zulu - isiZulu',
        );

        foreach ($locales as $locale) {
            $locale_region = explode('-',$locale);
            if ($country_code == $locale_region[0]) {
                return $locale_region[0];
            }
        }

        return "en";
    }

    public static function auto_translator($q, $sl, $tl)
    {
        $res = file_get_contents("https://translate.googleapis.com/translate_a/single?client=gtx&ie=UTF-8&oe=UTF-8&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at&sl=" . $sl . "&tl=" . $tl . "&hl=hl&q=" . urlencode($q), $_SERVER['DOCUMENT_ROOT'] . "/transes.html");
        $res = json_decode($res);
        return str_replace('_',' ',$res[0][0][0]);
    }

    public static function language_load()
    {
        if (\session()->has('language_settings')) {
            $language = \session('language_settings');
        } else {
            $language = SystemSetting::where('key', 'system_language')->first();
            \session()->put('language_settings', $language);
        }
        return $language;
    }

    public static function landing_language_load()
    {
        if (\session()->has('landing_language_settings')) {
            $language = \session('landing_language_settings');
        } else {
            $language = SystemSetting::where('key', 'system_language')->first();
            \session()->put('landing_language_settings', $language);
        }
        return $language;
    }

    public static function generate_reset_password_code() {
        $code = strtoupper(Str::random(15));
        if (self::reset_password_code_exists($code)) {
            return self::generate_reset_password_code();
        }
        return $code;
    }

    public static function reset_password_code_exists($code) {
        return DB::table('password_resets')->where('token', '=', $code)->exists();
    }

    public static function Export_generator($datas) {
        foreach ($datas as $data) {
            yield $data;
        }
        return true;
    }

    public static function get_mail_status($name)
    {
        return SystemSetting::where('key', $name)->first()?->value ?? 0;
    }

    public static function text_variable_data_format($value,$user_name=null)
    {
        $data = $value;
        if ($value) {
            if($user_name){
                $data =  str_replace("{userName}", $user_name, $data);
            }
        }

        return $data;
    }

    public static function time_date_format($data){
        if (empty($data)) {
            return null; // Return null or any default text like 'N/A'
        }
        $time=config('timeformat') ?? 'H:i';
        return Carbon::parse($data)->locale(app()->getLocale())->translatedFormat('d M Y ' . $time);
    }

    public static function date_format($data){
        return  Carbon::parse($data)->locale(app()->getLocale())->translatedFormat('d M Y');
    }

    public static function time_format($data){
        $time=config('timeformat') ?? 'H:i';
        return  Carbon::parse($data)->locale(app()->getLocale())->translatedFormat($time);
    }

    public static function get_business_data($name)
        {
            $paymentmethod = SystemSetting::where('key', $name)->first();
            return $paymentmethod?->value;
        }

    public static function onerror_image_helper($data, $src, $error_src ,$path){

        if(isset($data) && strlen($data) >1 && Storage::disk('public')->exists($path.$data)){
            return $src;
        }
        return $error_src;
    }

    public static function updateStorageTable($dataType, $dataId, $image)
    {
        $value = Helpers::getDisk();
        DB::table('storages')->updateOrInsert([
            'data_type' => $dataType,
            'data_id' => $dataId,
            'key' => 'image',
        ], [
            'value' => $value,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
    }

    public static function  getImageForExport($imagePath)
    {
        $temporaryImage = self::getTemporaryImageForExport($imagePath);
        $pngImage = imagecreatetruecolor(imagesx($temporaryImage), imagesy($temporaryImage));
        imagealphablending($pngImage, false);
        imagesavealpha($pngImage, true);
        imagecopy($pngImage, $temporaryImage, 0, 0, 0, 0, imagesx($temporaryImage), imagesy($temporaryImage));
        return $pngImage;
    }

    public static function  getTemporaryImageForExport($imagePath)
    {
        try {
            $imageData = file_get_contents($imagePath);
            return imagecreatefromstring($imageData);
            } catch (\Throwable $th) {
            $imageData = file_get_contents(dynamicAsset('public/assets/admin/img/100x100/no-image-found.png'));
            return imagecreatefromstring($imageData);

        }
    }

}
