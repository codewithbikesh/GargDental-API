<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use Illuminate\Support\Facades\Log;

class BrandController extends Controller
{
    public function get_brands()
    {
        $brands = Brand::active()->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Brands fetched sucecssfully.', 'brands' => $brands], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching brands', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get brands',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    public function get_top_brands()
    {
        $brands = Brand::active()->top()->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Brands fetched sucecssfully.', 'brands' => $brands], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching brands', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get brands',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}