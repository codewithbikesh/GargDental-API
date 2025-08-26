<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\RecommendedProduct;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\Helpers;
use App\Models\Reviews;

class ProductController extends Controller
{
    // public function get_all_products(Request $request)
    // {        
    //     $validator = Validator::make($request->all(), [
    //         'limit' => 'required',
    //         'offset' => 'required',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
    //     }

    //     try {
    //         $limit = $request->input('limit');
    //         $offset = $request->input('offset');
    //         $user = Auth::guard('api')->user();
    //         $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
    //         $products = Product::active()
    //             ->with('variations', 'category', 'brand')
    //             ->whereNull('parent_id')
    //             ->offset($offset)
    //             ->limit($limit)
    //             ->get()
    //             ->map(function ($product) use ($wishlistProductIds) {
    //                 if ($product->has_variations) {
    //                     $minPrice = Product::where('parent_id', $product->id)
    //                         ->min('sell_price');
    //                     $product->starting_price = $minPrice;
    //                 } else {
    //                     $product->starting_price = $product->sell_price;
    //                 }

    //                 $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

    //                 return $product;
    //             });
        
    //         return response()->json([
    //             'success' => true,
    //             'message' => 'Products fetched successfully',
    //             'products' => $products
    //         ], 200);
    //     } catch (\Exception $e) {
    //         Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Failed to get products',
    //             'error' => $e->getMessage()
    //         ], 500);
    //     }
    // }

    //changes
    public function get_all_products(Request $request)
{
    try {
        $limit = $request->input('limit');
        $offset = $request->input('offset');
        $user = Auth::guard('api')->user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];

        $query = Product::active()
            ->with('variations', 'category', 'brand')
            ->whereNull('parent_id');

        // Apply limit and offset only if they are present
        if (!is_null($offset)) {
            $query->offset($offset);
        }

        if (!is_null($limit)) {
            $query->limit($limit);
        }

        $products = $query->get()->map(function ($product) use ($wishlistProductIds) {
            if ($product->has_variations) {
                $minPrice = Product::where('parent_id', $product->id)
                    ->min('sell_price');
                $product->starting_price = $minPrice;
            } else {
                $product->starting_price = $product->sell_price;
            }

            $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

            return $product;
        });

        return response()->json([
            'success' => true,
            'message' => 'Products fetched successfully',
            'products' => $products
        ], 200);
    } catch (\Exception $e) {
        Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
        return response()->json([
            'success' => false,
            'message' => 'Failed to get products',
            'error' => $e->getMessage()
        ], 500);
    }
}


    public function get_products_by_category(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'category_id' => 'required|exists:categories,id',
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {
            $limit = $request->input('limit');
            $offset = $request->input('offset');
            $user = Auth::guard('api')->user();
            $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
            $products = Product::active()
                ->with('variations', 'category', 'brand')
                ->whereNull('parent_id')
                ->where('category_id', $request->category_id)
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($product) use($wishlistProductIds) {
                    if ($product->has_variations) {
                        $minPrice = Product::where('parent_id', $product->id)
                            ->min('sell_price');
                        $product->starting_price = $minPrice;
                    } else {
                        $product->starting_price = $product->sell_price;
                    }

                    $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

                    return $product;
                });
        
            return response()->json([
                'success' => true,
                'message' => 'Category wise products fetched successfully',
                'products' => $products
            ], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_products_by_brand(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'brand_id' => 'required|exists:brands,id',
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {
            $limit = $request->input('limit');
            $offset = $request->input('offset');
            $user = Auth::guard('api')->user();
            $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
            $products = Product::active()
                ->with('variations', 'category', 'brand')
                ->whereNull('parent_id')
                ->where('brand_id', $request->brand_id)
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($product) use ($wishlistProductIds) {
                    if ($product->has_variations) {
                        $minPrice = Product::where('parent_id', $product->id)
                            ->min('sell_price');
                        $product->starting_price = $minPrice;
                    } else {
                        $product->starting_price = $product->sell_price;
                    }

                    $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

                    return $product;
                });
        
            return response()->json([
                'success' => true,
                'message' => 'Category wise products fetched successfully',
                'products' => $products
            ], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_flash_sale_products(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'limit' => 'required',
            'offset' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {
            $limit = $request->input('limit');
            $offset = $request->input('offset');
            $user = Auth::guard('api')->user();
            $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
            $products = Product::active()
                ->with('variations', 'category', 'brand')
                ->whereNull('parent_id')
                ->where('flash_sale', 1)
                ->offset($offset)
                ->limit($limit)
                ->get()
                ->map(function ($product) use ($wishlistProductIds) {
                    if ($product->has_variations) {
                        $minPrice = Product::where('parent_id', $product->id)
                            ->min('sell_price');
                        $product->starting_price = $minPrice;
                    } else {
                        $product->starting_price = $product->sell_price;
                    }

                    $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

                    return $product;
                });
        
            return response()->json([
                'success' => true,
                'message' => 'Flash Sale products fetched successfully',
                'products' => $products
            ], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching flash sale products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get flash sale products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_latest_products()
    {        
        $user = Auth::guard('api')->user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
        $products = Product::active()
            ->with('variations', 'category', 'brand')
            ->whereNull('parent_id')
            ->latest()
            ->limit(20)
            ->get()
            ->map(function ($product) use ($wishlistProductIds) {
                if ($product->has_variations) {
                    $minPrice = Product::where('parent_id', $product->id)
                        ->min('sell_price');
                    $product->starting_price = $minPrice;
                } else {
                    $product->starting_price = $product->sell_price;
                }

                $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);

                return $product;
            });

        try {
            return response()->json(['success' => true, 'message' => 'Latest products fetched successfully.', 'products' => $products], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_searched_products(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $user = Auth::guard('api')->user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
        $name = trim(strip_tags(request('name')));
        $key = isset($name) && $name != 'null'  ?  explode(' ', $name) : null;

        if(is_array($key)){
            $key = array_filter($key);
            $key = array_values($key);
        }

        try {
            $query = Product::active()->where('parent_id', null)->select(['products.*'])
            ->when(isset($key) , function($q) use($key){
                $q->where(function ($q) use ($key) {
                    foreach ($key as $value) {
                        $q->orWhere('product_name', 'like', "%{$value}%");
                    }
                });
            });
            $products = $query->get();
            $products->map(function ($product) use ($wishlistProductIds) {
                $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);
                return $product;
            });

            $data =  [
                'total_size' => $products->count(),
                'products' => $products
            ];

            return response()->json(['success' => true, 'message' => 'Searched products fetched successfully.', 'products' => $data], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching search products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get search products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_product($product_code)
    {
        $product_code = trim(strip_tags($product_code));
        $user = Auth::guard('api')->user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
        try {
            $product = Product::active()->with('variations', 'category', 'brand')->when(!empty($product_code),function ($query) use($product_code){
                            $query-> where('product_code', $product_code);
                        })
                        ->first();
            if ($product) {
                $product->is_wishlisted = in_array($product->product_code, $wishlistProductIds);
            }

            return response()->json(['success' => true, 'message' => 'Product Details fetched successfully.', 'product' => $product], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching product details', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get product details',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_related_products($product_code)
    {
        $user = Auth::guard('api')->user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
        try {
            $product = Product::where('product_code', $product_code)->first();
            if ($product) {
                $related_products = Product::active()->with('variations', 'category', 'brand')
                    ->where('category_id', $product->category_id)
                    ->where('product_code', '!=', $product->product_code)
                    ->where('parent_id', null)
                    ->limit(10)
                    ->get()
                    ->map(function ($relatedProduct) use ($wishlistProductIds) {
                        $relatedProduct->is_wishlisted = in_array($relatedProduct->product_code, $wishlistProductIds);
                        return $relatedProduct;
                    });
                    
                return response()->json(['success' => true,'message' => 'Related products fetched successfully','related_products' => $related_products, 200]);
            }

            return response()->json([
                'errors' => ['success' => false, 'message' => 'Not found']
            ], 404);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching related products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get related products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function add_to_recommended($product_code)
    {
        $product = Product::where('product_code', $product_code)->where('parent_id', null)->first();
        $customer = Auth::user();
    
        if ($customer) {
            DB::transaction(function () use ($customer, $product) {
                $now = now();
    
                DB::table('recommended_products')->insertOrIgnore([
                    [
                        'customer_id'    => $customer->id,
                        'product_code' => $product->product_code,
                        'created_at' => $now,
                        'updated_at' => $now,
                    ]
                ]);
    
                $count = DB::table('recommended_products')
                    ->where('customer_id', $customer->id)
                    ->count();
    
                if ($count > 10) {
                    DB::table('recommended_products')
                        ->where('customer_id', $customer->id)
                        ->orderBy('created_at')
                        ->limit($count - 10)
                        ->delete();
                }
            });
        }
        
        return response()->json(['success' => true,'message' => 'Added to recommended'], 200);
    }

    public function get_recommended()
    {
        $customerId = Auth::user()->id;
        $user = Auth::user();
        $wishlistProductIds = $user ? $user->wishlist()->pluck('products.product_code')->toArray() : [];
        try {
            $recommended_products = RecommendedProduct::with('product')->where('customer_id', $customerId)->limit(10)->get(); 
            $recommendedCount = $recommended_products->count();
            if ($recommendedCount === 0) {
                $recommendedProducts = Product::active()->inRandomOrder()->limit(10)->get();

            }
            if ($recommendedCount < 5) {
                $recommendedProducts = $recommended_products->take($recommendedCount)->pluck('product');
                $recommendedCodes = $recommended_products->pluck('product_code');

                $randomProducts = Product::active()->whereNotIn('product_code', $recommendedCodes)
                    ->inRandomOrder()
                    ->limit(10 - $recommendedCount)
                    ->get();

                $recommendedProducts = $recommendedProducts->merge($randomProducts);

            }
                    
            $recommendedProducts = $recommendedProducts->map(function ($product) use ($wishlistProductIds) {
                $product->wishlist = in_array($product->product_code, $wishlistProductIds);
                return $product;
            });

            return response()->json(['success' => true,'message' => 'Recommended products fetched successfully','recommended_products' => $recommendedProducts], 200);       
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching recommended products', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get recommended products',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}