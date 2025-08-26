<?php

namespace App\Http\Controllers\API\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\ClinicSetupRequest;
use App\Models\Compliance;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ClinicController extends Controller
{
    public function get_clinic_setup()
    {
        $clinic = Compliance::whereIn('key', ['clinic_cover_image', 'clinic_video_title', 'clinic_video_link', 'clinic_video_description'])->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Clinic setup fetched successfully.', 'clinic' => $clinic], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching clinic setup', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get clinic setup',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function getAboutPageDetails()
    {
        try {
            $keys = [
                'introduction_video', 'about_us_title', 'youtube_video', 'about_us',
                'story_title',
                'story_1_image', 'story_1_name', 'story_1_designation', 'story_1_description',
                'story_2_image', 'story_2_name', 'story_2_designation', 'story_2_description'
            ];

            $about = Compliance::whereIn('key', $keys)->get()->keyBy('key');

            $introVideoUrl = isset($about['introduction_video']) && $about['introduction_video']->value
                ? Helpers::get_full_url('backend/about', $about['introduction_video']->value, 'public')
                : null;

            $story1ImageUrl = isset($about['story_1_image']) && $about['story_1_image']->value
                ? Helpers::get_full_url('backend/about', $about['story_1_image']->value, 'public')
                : null;

            $story2ImageUrl = isset($about['story_2_image']) && $about['story_2_image']->value
                ? Helpers::get_full_url('backend/about', $about['story_2_image']->value, 'public')
                : null;

            $responseData = [
                'introduction_video_url' => $introVideoUrl,
                'about_us_title'         => $about['about_us_title']->value ?? null,
                'youtube_video'          => $about['youtube_video']->value ?? null,
                'about_us'               => $about['about_us']->value ?? null,
                'story_title'            => $about['story_title']->value ?? null,

                'story_1' => [
                    'image_url'   => $story1ImageUrl,
                    'name'        => $about['story_1_name']->value ?? null,
                    'designation' => $about['story_1_designation']->value ?? null,
                    'description' => $about['story_1_description']->value ?? null,
                ],

                'story_2' => [
                    'image_url'   => $story2ImageUrl,
                    'name'        => $about['story_2_name']->value ?? null,
                    'designation' => $about['story_2_designation']->value ?? null,
                    'description' => $about['story_2_description']->value ?? null,
                ],
            ];

            return response()->json([
                'success' => true,
                'message' => 'About page details fetched successfully.',
                'data'    => $responseData
            ], 200);

        } catch (\Exception $e) {
            \Log::error('Exception while fetching about page details', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get about page details.',
                'error'   => $e->getMessage()
            ], 500);
        }
    }

    public function clinic_setup_store(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'email' => 'required|email',
            'phone' => 'required'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {    
            $clinic = new ClinicSetupRequest();
            $clinic->full_name = $request->full_name;
            $clinic->email = $request->email;
            $clinic->phone = $request->phone;
            $clinic->city = $request->city;
            $clinic->budget = $request->budget;
            $clinic->remarks = $request->remarks;
            if ($clinic->save()) {
                return response()->json([
                    'status' => 'success',
                    'message' => 'Thank you for requesting clinic setup. We will contact you soon.'
                ], 201);
            }
        } catch (\Exception $e) {
            Log::error('Exception occurred while requesting clinic setup', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to request clinic setup.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
        
}