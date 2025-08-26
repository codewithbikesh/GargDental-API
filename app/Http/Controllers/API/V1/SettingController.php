<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\SystemSetting;
use Illuminate\Support\Facades\Log;

class SettingController extends Controller
{
    public function get_settings()
    {
        $settings = SystemSetting::all()->mapWithKeys(function ($setting) {
            $data = [
                'id' => $setting->id,
                'value' => $setting->value,
                'created_at' => $setting->created_at,
                'updated_at' => $setting->updated_at,
            ];

            if ($setting->key === 'company_logo_header') {
                $data['header_logo_full_url'] = $setting->header_logo_full_url;
            }

            if ($setting->key === 'company_logo_footer') {
                $data['footer_logo_full_url'] = $setting->footer_logo_full_url;
            }

            return [$setting->key => $data];
        });
        
        try {
            return response()->json(['success' => true, 'message' => 'settings fetched successfully.', 'settings' => $settings], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching settings', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get settings',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}