<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Auth;

class WishlistController extends Controller
{
    public function get_wishlist()
    {
        $customerId = Auth::user()->id;
        $wishlist = Wishlist::with('product.variations', 'product.category', 'product.brand')->where('customer_id', $customerId)->get();
        
        try {
            return response()->json(['success' => true,'message' => 'Wishlist items fetched.','wishlist' => $wishlist], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching wishlist items', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get wishlist items',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function add_to_wishlist(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'product_code' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $customerId = Auth::user()->id;        
        try {
            $exists = Wishlist::where('customer_id', $customerId)
                    ->where('product_code', $request->product_code)
                    ->exists();

            if ($exists) {
                return response()->json([
                    'success' => false,
                    'message' => 'Already in wishlist'
                ], 200);
            }

            $wishlist = new Wishlist();
            $wishlist->customer_id = $customerId;
            $wishlist->product_code = $request->product_code;
            $wishlist->save();

            return response()->json(['success' => true,'message' => 'Added to wishlist','wishlist' => $wishlist], 200);
        } catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    ['code' => 'wishlist', 'message' => $e->getMessage()]
                ]
            ], 403);
        }
    }

    public function remove_wishlist_item(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'item_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }
        
        $customerId = Auth::user()->id;        
        try {
            $wishlist = Wishlist::where('id', $request->item_id)->where('customer_id', $customerId)->first();
            if ($wishlist) {
                $wishlist->delete();
                return response()->json(['success' => true,'message' => 'Removed from wishlist.'], 200);
            }
            return response()->json(['success' => false,'message' => 'Not found'], 404);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to remove wishlist item.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}