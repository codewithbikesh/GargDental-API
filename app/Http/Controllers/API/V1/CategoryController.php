<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller
{
    public function get_categories()
    {
        $categories = Category::active()->whereNull('parent_id')                
            ->with(['activeChildren' => function($query) {
                $query->active()
                    ->with('activeChildren');
            }])
            ->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Categories fetched successfully.', 'categories' => $categories], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching categories', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get categories',
                'error' => $e->getMessage()
            ], 500);
        }
    }
        
    public function get_top_categories()
    {
        $categories = Category::active()->top()->whereNull('parent_id')                
            ->with(['activeChildren' => function($query) {
                $query->active()
                    ->with('activeChildren');
            }])
            ->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Categories fetched successfully.', 'categories' => $categories], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching categories', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get categories',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}