<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Carousel;
use App\Models\Product;
use App\Models\PosterCard;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use App\Models\SystemSetting;

class WebsiteController extends Controller
{
    public function data()
    {
        return view('backend.website.setting');
    }

    public function update(Request $request)
    {
        Validator::make($request->all(), [
            'company_logo_header' => 'nullable|max:2048',
            'company_logo_footer' => 'nullable|max:2048',
        ]);

        $key =['company_logo_header','company_logo_footer'];
        $settings =  array_column(SystemSetting::whereIn('key', $key)->get()->toArray(), 'value', 'key');

        SystemSetting::query()->updateOrInsert(['key' => 'company_name'], [
            'value' => $request['company_name']
        ]);

        SystemSetting::query()->updateOrInsert(['key' => 'timezone'], [
            'value' => $request['timezone']
        ]);

        if ($request->has('company_logo_header')) {
            $image_name = Helpers::update( dir: 'system/', old_image:$settings['company_logo_header'],format: 'png',image: $request->file('company_logo_header'));
        } else {
            $image_name = $settings['company_logo_header'];
        }

        SystemSetting::query()->updateOrInsert(['key' => 'company_logo_header'], [
            'value' => $image_name
        ]);

        if ($request->has('company_logo_footer')) {

            $image_name = Helpers::update( dir: 'system/', old_image:$settings['company_logo_footer'], format:'png', image: $request->file('company_logo_footer'));
        } else {
            $image_name = $settings['company_logo_footer'];
        }

        SystemSetting::query()->updateOrInsert(['key' => 'company_logo_footer'], [
            'value' => $image_name
        ]);
        
        SystemSetting::query()->updateOrInsert(['key' => 'whatsapp'], [
            'value' => $request['whatsapp']
        ]);

        SystemSetting::query()->updateOrInsert(['key' => 'primary_phone'], [
            'value' => $request['primary_phone']
        ]);
        
        SystemSetting::query()->updateOrInsert(['key' => 'secondary_phone'], [
            'value' => $request['secondary_phone']
        ]);

        SystemSetting::query()->updateOrInsert(['key' => 'primary_email'], [
            'value' => $request['primary_email']
        ]);
        
        SystemSetting::query()->updateOrInsert(['key' => 'secondary_email'], [
            'value' => $request['secondary_email']
        ]);

        SystemSetting::query()->updateOrInsert(['key' => 'address'], [
            'value' => $request['address']
        ]);

        SystemSetting::query()->updateOrInsert(['key' => 'website_link'], [
            'value' => $request['website_link']
        ]);

        // Always update free_shipping_option
        SystemSetting::query()->updateOrInsert(
            ['key' => 'free_shipping_option'],
            ['value' => $request['free_shipping_option']]
        );

        if ($request['free_shipping_option'] === 'free_threshold') {
            SystemSetting::query()->updateOrInsert(
                ['key' => 'free_shipping_threshold'],
                ['value' => $request['free_shipping_threshold']]
            );
        } elseif ($request['free_shipping_option'] === 'no_free_threshold') {
            SystemSetting::query()->updateOrInsert(
                ['key' => 'free_shipping_threshold'],
                ['value' => null]
            );
        }

        SystemSetting::query()->updateOrInsert(['key' => 'no_category_display'], [
            'value' => $request['no_category_display']
        ]);
        
        SystemSetting::query()->updateOrInsert(['key' => 'map_url'], [
            'value' => $request['map_url']
        ]);
        
        return back()->with('success', 'Successfully updated. To see the changes in app restart the app.');
    }

    public function carousel_data()
    {
        $products = Product::all();
        $carouseldata = Carousel::get();
        if (!$carouseldata) {
            $carouseldata = new Carousel();
        }
        return view('backend.website.carousel', compact('carouseldata', 'products'));
    }

    public function carousel_add(Request $request)
    {
        $request->validate([
            'product_code' => 'required',
            'file_path' => 'required|file|mimes:jpeg,png,gif,mp4,webm,ogg|max:2400', // Max 2MB
        ]);
        
        $carousel = new Carousel();
        $carousel->product_code = $request->product_code;
        $carousel->status = 1;
        $carousel->file_path = Helpers::upload_file( dir: 'backend/carousel_files/', file: $request->file('file_path'));
        
        if ($carousel->save()) {
            session()->flash('success', 'Carousel File Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding carousel file!');
        }
        return redirect()->route('backend.website.carousel');
    }
        
    public function carousel_view(Request $request)
    {
        $carousel = Carousel::where('id', $request->input('id'))->first();
        if (!$carousel) {
            abort(404, 'Carousel File not found');
        }

        return view('backend.website.view', compact('carousel'));
    }

    public function carousel_edit(Request $request, $id)
    {
        $products = Product::all();
        $carousel = Carousel::findOrFail($id);
        return view('backend.website.edit', compact('carousel', 'products'));
    }
    
    public function carousel_update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'file_path' => 'nullable|file|mimes:png,jpg,gif,jpeg,mp4,webm,ogg',
            'product_code' => 'required',
        ]);
        
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
  
        $carousel = Carousel::findOrFail($id);
        $carousel->product_code = $request->input('product_code');
        if ($request->has('file_path')) {
            $carousel->file_path = Helpers::update_file( dir: 'backend/carousel_files/', old_file:$carousel->file_path, file: $request->file('file_path'));
        } else {
            $carousel->file_path = $carousel->file_path;
        }
        $carousel->save();
    
        return redirect()->route('backend.website.carousel')
            ->with('success', 'Carousel details updated successfully.');
    }
    
    public function carousel_status(Request $request)
    {
        $carousel = Carousel::findOrFail($request->id);
        $carousel->status = $request->status;
        $carousel->save();

        return back()->with('Carousel status updated.');
    }
    
    public function carousel_offer(Request $request)
    {
        $carousel = Carousel::findOrFail($request->id);
        $carousel->is_offer = $request->is_offer;
        $carousel->save();

        return back()->with('Carousel offer updated.');
    }
    
    public function carousel_delete($id)
    {
        $carousel = Carousel::findOrFail($id);
        Helpers::check_and_delete_file(dir: 'backend/carousel_files/', old_file: $carousel->file_path);
        $carousel->storage()->delete();
        $carousel->delete();
        return redirect()->back()->with('success', 'Carousel File deleted successfully');
    }
    
    public function poster_card()
    {
        $postercarddata = PosterCard::first();
        if (!$postercarddata) {
            $postercarddata = new PosterCard();
        }
        return view('backend.website.poster_card', compact('postercarddata'));
    }
    
    public function poster_card_update(Request $request, $id)
    {
        $postercarddata = PosterCard::findOrFail($id);
    
        if ($request->has('card_1')) {
            $card_1 = Helpers::update( dir: 'backend/poster_cards/', old_image:$postercarddata->card_1,format: 'png',image: $request->file('card_1'));
        } else {
            $card_1 = $postercarddata->card_1;
        }
        $postercarddata->card_1 = $card_1;

        if ($request->has('card_2')) {
            $card_2 = Helpers::update( dir: 'backend/poster_cards/', old_image:$postercarddata->card_2,format: 'png',image: $request->file('card_2'));
        } else {
            $card_2 = $postercarddata->card_2;
        }
        $postercarddata->card_2 = $card_2;

        if ($request->has('card_3')) {
            $card_3 = Helpers::update( dir: 'backend/poster_cards/', old_image:$postercarddata->card_3,format: 'png',image: $request->file('card_3'));
        } else {
            $card_3 = $postercarddata->card_3;
        }
        $postercarddata->card_3 = $card_3;
        $postercarddata->save();
    
        return redirect()->route('backend.website.poster_card')->with('success', 'Card updated successfully');
    }
    
}
