<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Reviews;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class ReviewController extends Controller
{
    public function addReview(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'rating' => 'required|integer|min:1|max:5',
            'review_detail' => 'required|string',
            'product_code' => 'required|string',
            'order_id' => [
                        'required',
                        'integer',
                        Rule::exists('orders', 'order_id')->where(function ($query) {
                            $query->where('order_status', 'delivered');
                        }),
                    ],
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => 'Validation errors',
                'errors' => $validator->errors()
            ], 422);
        }

        $customer = Auth::user();
        $customerId = $customer->id;

        try {
            $review = new Reviews();
            $review->customer_id = $customerId;
            $review->product_code = $request->product_code;
            $review->order_id = $request->order_id;
            $review->name = $customer->full_name;
            $review->email = $customer->email;
            $review->review_detail = $request->review_detail;
            $review->rating = $request->rating;
            $review->save();

            DB::table('order_items')
                ->where('order_id', $request->order_id)
                ->where('product_code', $request->product_code)
                ->update(['reviewed' => 1]);

            return response()->json([
                'success' => true,
                'message' => 'Thank you for your review!',
                'data' => $review
            ], 201);
        
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to give review.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function get_my_reviews()
    {
        $customer = Auth::user();
        $customerId = $customer->id;

        try {        
            $reviews = Reviews::with('product')->where('customer_id', $customerId)->get();

            return response()->json(['success' => true, 'message' => 'Reviews fetched successfully.', 'reviews' => $reviews], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching reviews', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get reviews',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}