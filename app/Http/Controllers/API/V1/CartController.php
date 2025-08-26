<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Validator;
use App\Models\Product;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Wishlist;
use App\Models\CustomerAddressBook;
use App\Models\Shipping;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CartController extends Controller
{
    public function get_carts()
    {
        $customerId = Auth::user()->id;
        try {
            $stats = Helpers::getCustomerStats($customerId);
            $cart = $stats['cart'];

            return response()->json(['success' => true, 'message' => 'Cart fetched successfully.', 'cart' => $cart], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching cart items', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get cart items',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function add_to_cart(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'product_code' => 'required|exists:products,product_code',
            'price' => 'required|numeric',
            'quantity' => 'required|integer|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $customerId = Auth::user()->id;    
        try {
            DB::transaction(function () use ($request, $customerId, &$cart) {
                $product = Product::where('product_code', $request->product_code)->firstOrFail();
                if ($product->available_quantity < 1) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Out of stock',
                    ], 403);
                }
        
                if($request->quantity > $product->available_quantity){
                    return response()->json([
                        'success' => false, 
                        'message' => 'Please select less than available quantity.',
                    ], 403);
                }

                $stats = Helpers::getCustomerStats($customerId);
                $cart = $stats['cart'];
                $cartItems = $stats['cartItems'];
                $cartItem = $cartItems->where('product_code', $request->product_code)->first();

                if($cartItem){
                    return response()->json([
                        'success' => false, 
                        'message' => 'Item already in cart!',
                    ], 403);
                }
                
                if (!$cart) {
                    $cart = Cart::firstOrCreate(
                        ['customer_id' => $customerId],
                        [
                            'province_id' => null,
                            'city_id' => null,
                            'tax' => 0,
                            'shipping_cost' => 0,
                            'subtotal' => 0,
                        ]
                    );
                }

                CartItem::create([
                    'cart_id' => $cart->id,
                    'product_code' => $request->product_code,
                    'quantity' => $request->quantity,
                    'price' => $request->price,
                ]);

                foreach ($cart->items as $item) {
                    $latestProduct = Product::where('product_code', $item->product_code)->first();
                    if ($latestProduct && $item->price != $latestProduct->sell_price) {
                        $item->price = $latestProduct->sell_price;
                        $item->save();
                    }
                }

                Wishlist::where('customer_id', $customerId)->where('product_code', $request->product_code)->delete();
            });
            $cart = Cart::with('items.product.images')->where('customer_id', $customerId)->first();
        } catch (\Exception $e) {
            return response()->json([
                'errors' => [
                    ['code' => 'cart_item', 'message' => $e->getMessage()]
                ]
            ], 403);
        }

        $address = CustomerAddressBook::where('customer_id', $customerId)
                    ->where('default_shipping', 'Y')
                    ->first();

        $this->updateCartShippingCost($cart, $address);
        $this->updateCartTotals($cart, $address);
        
        return response()->json(['success' => true,'message' => 'Added to cart successfully!','cart' => $cart->load('items')], 200);
    }

    private function updateCartShippingCost($cart, $address)
    {
        if ($cart && $address) {
            $cityId = $address->city_id;
            $shippingSetting = Shipping::where('id', $cityId)->first();
            $shippingcosttotal = $shippingSetting->shipping_cost;

            if ($shippingSetting) {
                $cart->shipping_cost = $shippingcosttotal;
                $cart->save();
            }
        }
    }

    private function updateCartTotals($cart, $address)
    {
        $landing_data = Helpers::get_landing_data();
        $subtotal = $cart->items()->with('product')->get()->sum(function ($item) {
            return $item->quantity * $item->product->sell_price;
        });

        $cartItemCount = $cart->items()->count();
        $shippingCost = $cart->shipping_cost;
        if ($cartItemCount >= 1){
            if ($landing_data['shipping_option'] === "citywisecost"){
                $shippingcosttotal = $shippingCost;
            } else if ($landing_data['shipping_option'] === "itemwisecost"){
                $shippingcosttotal = $shippingCost * $cartItemCount;
            }
        } else {
            $shippingcosttotal = 0;
        }

        $tax = 0;
        $provinceId = null;
        $cityId = null;

        if ($address) {
            $provinceId = $address->province_id;
            $cityId = $address->city_id;
        }

        $cart->subtotal = $subtotal;
        $cart->tax = $tax;
        $cart->shipping_cost_total = $shippingcosttotal;
        $cart->province_id = $provinceId;
        $cart->city_id = $cityId;
        $cart->save();
    }

    public function remove_cart_item(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'item_id' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }
        
        $customerId = Auth::user()->id;        
        try {
            DB::beginTransaction();
            $address = CustomerAddressBook::where('customer_id', $customerId)
                            ->where('default_shipping', 'Y')
                            ->first();
            $stats = Helpers::getCustomerStats($customerId);
            $cart = $stats['cart'];
            $cartItems = $stats['cartItems'];
            
            if ($cart) {
                $cartItem = $cartItems->where('id', $request->item_id)->first();
                if ($cartItem) {
                    $cartItem->delete();
                    $this->updateCartTotals($cart, $address);
                }
            }
            DB::commit();

            return response()->json(['success' => true,'message' => 'Item successfully removed.','cart' => $cart->load('items')], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Failed to remove item from cart.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function remove_cart()
    {
        $customerId = Auth::user()->id;        
        try {
            DB::beginTransaction();
            $stats = Helpers::getCustomerStats($customerId);
            $cart = $stats['cart'];
            CartItem::where('cart_id', $cart->id)->delete();
            $cart->update(['subtotal' => 0, 'tax' => 0, 'shipping_cost_total' => 0]);
            DB::commit();

            return response()->json(['success' => true,'message' => 'Cart cleared.','cart' => $cart->load('items')], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Failed to clear cart.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function update_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'item_id' => 'required|integer|exists:cart_items,id',
            'quantity' => 'required|integer|min:1',
        ], [
            'item_id.required' => 'The item_id is required.',
            'item_id.integer' => 'The item_id must be an integer.',
            'item_id.exists' => 'The specified item_id does not exist.',
            'quantity.required' => 'The quantity is required.',
            'quantity.integer' => 'The quantity must be an integer.',
            'quantity.min' => 'The quantity must be at least 1.',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $customerId = Auth::user()->id;

        try {
            DB::beginTransaction();

            $stats = Helpers::getCustomerStats($customerId);
            $cart = $stats['cart'];

            $cartItem = CartItem::find($request->item_id);

            if ($cartItem) {
                $cartItem->quantity = $request->quantity;
                $cartItem->save();
            }

            // Recalculate subtotal from all cart items
            $subtotal = $cart->items()->with('product')->get()->sum(function ($item) {
                return $item->quantity * $item->product->sell_price;
            });

            $cart->update(['subtotal' => $subtotal]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Cart item updated.',
                'cart' => $cart->load('items'),
            ], 200);

        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'success' => false,
                'message' => 'Failed to update cart.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    // public function update_cart(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'items' => 'required|array',
    //         'items.*.item_id' => 'required|integer|exists:cart_items,id',
    //         'items.*.quantity' => 'required|integer|min:1',
    //     ], [
    //         'items.required' => 'The items field is required and must be an array of objects.',
    //         'items.*.item_id.required' => 'Each item must have an item_id.',
    //         'items.*.item_id.integer' => 'Each item_id must be an integer.',
    //         'items.*.item_id.exists' => 'The specified item_id does not exist in cart_items.',
    //         'items.*.quantity.required' => 'Each item must have a quantity.',
    //         'items.*.quantity.integer' => 'Each quantity must be an integer.',
    //         'items.*.quantity.min' => 'Each quantity must be at least 1.',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json(['errors' => Helpers::error_processor($validator)], 403);
    //     }

    //     $subtotal = 0;
    //     $customerId = Auth::user()->id;
    //     try {
    //         DB::beginTransaction();
    //         $stats = Helpers::getCustomerStats($customerId);
    //         $cart = $stats['cart'];
            
    //         foreach ($request->items as $item) {
    //             $cartItem = CartItem::find($item['item_id']);
    //             if ($cartItem) {
    //                 $cartItem->quantity = $item['quantity'];
    //                 $cartItem->save();
    //                 $subtotal += $cartItem->product->sell_price * $item['quantity'];
    //             }
    //         }
    //         $cart->update(['subtotal' => $subtotal]);
    //         DB::commit();

    //         return response()->json(['success' => true,'message' => 'Cart updated.','cart' => $cart->load('items')], 200);
    //     } catch (\Exception $e) {
    //         DB::rollBack();
    //         return response()->json([
    //             'success' => false,
    //             'message' => 'Failed to update cart.',
    //             'error' => $e->getMessage()
    //         ], 500);
    //     }
    // }

}