<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\Cart;
use App\Models\CustomerAddressBook;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Models\SystemSetting;
use App\Models\Order;
use App\Jobs\ProcessOrder;
use App\Models\DeliveryInformation;
use App\Models\OrderCancelReasons;
use App\Models\OrderItem;
use App\Models\OrderItemCancel;
use App\Models\OrderReturn;
use App\Models\Product;
use Illuminate\Support\Facades\Validator;

class OrderController extends Controller
{
    public function get_orders(Request $request)
    {
        $customerId = Auth::user()->id;
        $status = $request->query('status', 'processing');

        try {
            if (!in_array($status, ['processing', 'shipped', 'delivered', 'cancelled', 'returned'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid order status requested.'
                ], 400);
            }

            $query = Order::where('customer_id', $customerId)
                        ->where('order_status', $status)
                        ->with('orderItems.product', 'orderItems.review', 'deliveryInfo');

            if ($status === 'cancelled') {
                $query->with('cancelDetails');
            }

            $orders = $query->latest()->get();

            foreach ($orders as $order) {
                $returnAvailable = false;

                if ($order->deliveryInfo && $order->deliveryInfo->delivery_date) {
                    $deliveryDate = \Carbon\Carbon::parse($order->deliveryInfo->delivery_date);
                    $daysSinceDelivery = $deliveryDate->diffInDays(now());

                    $returnAvailable = $daysSinceDelivery <= 3;
                }

                $order->return_available = $returnAvailable;
            }

            return response()->json([
                'success' => true,
                'message' => ucfirst($status) . ' orders fetched successfully!',
                'orders' => [
                    'count' => $orders->count(),
                    'orders' => $orders
                ]
            ], 200);

        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching orders', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch orders',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function add_to_order(Request $request)
    {        
        $validator = Validator::make($request->all(), [
            'payment_method' => 'required|in:C,E,NP', // C = Cash, E = eSewa, NP = Nepal Pay
            'billing_address' => 'required|integer|exists:customer_address_book,id',
            'shipping_address' => 'required|integer|exists:customer_address_book,id',
            'invoice_email' => 'required|email',
            'selected_items' => 'required|array',
            'selected_items.*' => 'integer|exists:cart_items,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $tax_amount = 0;
        $shipping = 0;
        $discount = 0;
        $tax_rate = 0.13;
        $landing_data = Helpers::get_landing_data();
        $customer_user = Auth::user();  
        $customerId = $customer_user->id;  
        $customerPhone = $customer_user->phone;
        $customername = $customer_user->full_name;

        $payment_method = $request->input('payment_method');
        if ($payment_method === 'C') {
            $paymentmethodName = "Cash On Delivery";
        } elseif ($payment_method === 'E') {
            $paymentmethodName = "e-Sewa";
        } elseif ($payment_method === 'NP') {
            $paymentmethodName = "Nepal Pay";
        } else {
            $paymentmethodName = "Unknown";
        }

        try {
            DB::beginTransaction();

            $freeShippingOption = optional(SystemSetting::where('key', 'free_shipping_option')->first())->value;
            $freeShippingThreshold = optional(SystemSetting::where('key', 'free_shipping_threshold')->first())->value;

            $billingAddress = $this->getAddress($customerId, $request->billing_address);
            $shippingAddress = $this->getAddress($customerId, $request->shipping_address);
            $invoiceEmail = $request->invoice_email;

            $billingInfo = $this->createDeliveryInformation($customerId, $billingAddress, $invoiceEmail, 'billing');
            $shippingInfo = $this->createDeliveryInformation($customerId, $shippingAddress, $invoiceEmail, 'shipping');

            $newOrderId = Helpers::generateOrderId();

            $shipping_snapshot = [
                'free_shipping_option' => $freeShippingOption,
                'free_shipping_threshold' => $freeShippingThreshold,
            ];

            $cart = Cart::where('customer_id', $customerId)->first();
            if (!$cart) {
                return response()->json(['error' => 'Cart not found'], 404);
            }

            $selectedItems = $cart->items()->whereIn('id', $request->selected_items)->get();

            if ($selectedItems->isEmpty()) {
                return response()->json(['error' => 'No selected cart items found.'], 400);
            }

            $subtotal = $selectedItems->sum(function ($item) {
                return $item->product->actual_price * $item->quantity;
            });

            $subtotal_without_tax = $subtotal - ($tax_rate * $subtotal);
            $total_tax = $subtotal - $subtotal_without_tax;

            $total_discount = $selectedItems->sum(function ($item) {
                return $item->product->discount * $item->quantity;
            });

            if ($shippingAddress->city->apply_shipping == 0) {
                $shipping = 0;
            } else {
                if ($freeShippingOption == "free_threshold") {
                    if ($subtotal < $freeShippingThreshold) {
                        $shipping = $shippingAddress->city->shipping_cost;
                    } else {
                        $shipping = 0;
                    }
                } else if ($freeShippingOption == "no_free_threshold") {
                    $shipping = $shippingAddress->city->shipping_cost;
                }
            }
            $grandtotal = $subtotal + $shipping - $total_discount;

            $order = Order::create([
                'order_id' => $newOrderId,
                'customer_id' => $customerId,
                'shipping_delivery_information_id' => $shippingInfo->id,
                'billing_delivery_information_id' => $billingInfo->id,
                'payment_method' => $payment_method,
                'subtotal_without_tax' => $subtotal_without_tax,
                'tax' => $total_tax,
                'subtotal' => $subtotal,
                'shipping_cost' => $shipping,
                'shipping_snapshot' => json_encode($shipping_snapshot),
                'discount' => $total_discount ?? $discount,
                'total_amount' => $grandtotal,
                'order_status' => 'processing',
                'payment_status' => 'unpaid',
            ]);

            $billingInfo->update(['order_id' => $order->order_id]);
            $shippingInfo->update(['order_id' => $order->order_id]);

            $this->createOrderItems($order->order_id, $discount, $cart, $request->selected_items);

            $shippingDetails = $this->formatShippingAddress($shippingAddress);

            ProcessOrder::dispatch(
                $landing_data, 
                $customername, 
                $invoiceEmail, 
                $newOrderId
            );

            $this->updateCartAfterOrder($cart, $subtotal, $request);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order placed successfully',
                'order_id' => $order->order_id
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Failed to dispatch order: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Failed to place order. Please try again.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    private function getAddress($customerId, $addressId)
    {
        $address = CustomerAddressBook::where('customer_id', $customerId)->find($addressId);
        if (!$address) {
            throw new \Exception('Address not found');
        }
        return $address;
    }

    private function createDeliveryInformation($customerId, $address, $email, $type)
    {
        return DeliveryInformation::create([
            'customer_id' => $customerId,
            'full_name' => $address->full_name,
            'invoice_email' => $email,
            'phone' => $address->phone,
            'province_id' => $address->province_id,
            'city_id' => $address->city_id,
            'zone_id' => $address->zone_id,
            'address' => $address->address,
            'landmark' => $address->landmark,
            'address_type' => $address->address_type,
            'type' => $type,
        ]);
    }

    private function createOrderItems($orderId, $discount, $cart, $selectedItems)
    {
        $tax_rate = 0.13;
        $items = $cart->items->whereIn('id', $selectedItems);
        foreach ($items as $item) {
            $price_with_tax = $item->product->actual_price;
            $quantity = $item->quantity;

            //Reverse Calculation
            $price_without_tax = $price_with_tax - ($tax_rate * $price_with_tax);
            $tax_amount_per_quantity = $price_with_tax - $price_without_tax;

            //Calculate Totals
            $subtotal_without_tax = $price_without_tax * $quantity;
            $total_tax = $tax_amount_per_quantity * $quantity;
            $subtotal_with_tax = $subtotal_without_tax + $total_tax;
            $discount_amount = $item->product->discount * $quantity;

            OrderItem::create([
                'order_id' => $orderId,
                'product_code' => $item->product_code,
                'quantity' => $quantity,
                'price' => $item->product->sell_price,
                'actual_price' => $price_with_tax,
                'subtotal_without_tax' => $subtotal_without_tax,
                'tax' => $total_tax,
                'subtotal' => $subtotal_with_tax,
                'discount' => $discount_amount ?? $discount
            ]);
            
            $product = $item->product;
            $quantityOrdered = $item->quantity;

            $product->available_quantity = max(0, $product->available_quantity - $quantityOrdered);
            $product->stock_quantity = max(0, $product->stock_quantity - $quantityOrdered);
            $product->save();
        }
        $cart->items()->whereIn('id', $selectedItems)->delete();
    }

    private function formatShippingAddress($address)
    {
        return $address->address . ',' .
            $address->zone->zone_name . ',' .
            $address->city->city . ',' .
            $address->province->province_name;
    }

    private function updateCartAfterOrder($cart, $subtotal, $request)
    {
        $cart->update([
            'subtotal' => max(0, $cart->subtotal - $subtotal)
        ]);
    }

    public function buy_now(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'payment_method' => 'required|in:C,E,NP', // C = Cash, E = eSewa, NP = Nepal Pay
            'billing_address' => 'required|integer|exists:customer_address_book,id',
            'shipping_address' => 'required|integer|exists:customer_address_book,id',
            'invoice_email' => 'required|email',
            'buy_now_item.product_code' => 'required|string|exists:products,product_code',
            'buy_now_item.quantity' => 'required|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $tax_amount = 0;
        $shipping = 0;
        $discount = 0;
        $tax_rate = 0.13;
        $landing_data = Helpers::get_landing_data();
        $customer = Auth::user();
        $customerId = $customer->id;

        try {
            DB::beginTransaction();

            $freeShippingOption = optional(SystemSetting::where('key', 'free_shipping_option')->first())->value;
            $freeShippingThreshold = optional(SystemSetting::where('key', 'free_shipping_threshold')->first())->value;

            $payment_method = $request->input('payment_method');
            if ($payment_method === 'C') {
                $paymentmethodName = "Cash On Delivery";
            } elseif ($payment_method === 'E') {
                $paymentmethodName = "e-Sewa";
            } elseif ($payment_method === 'NP') {
                $paymentmethodName = "Nepal Pay";
            } else {
                $paymentmethodName = "Unknown";
            }

            $billingAddress = $this->getAddress($customerId, $request->billing_address);
            $shippingAddress = $this->getAddress($customerId, $request->shipping_address);
            $invoiceEmail = $request->invoice_email;

            $billingInfo = $this->createDeliveryInformation($customerId, $billingAddress, $invoiceEmail, 'billing');
            $shippingInfo = $this->createDeliveryInformation($customerId, $shippingAddress, $invoiceEmail, 'shipping');

            $orderId = Helpers::generateOrderId();

            $shipping_snapshot = [
                'free_shipping_option' => $freeShippingOption,
                'free_shipping_threshold' => $freeShippingThreshold,
            ];

            $item = $request->buy_now_item;
            $product = Product::where('product_code', $item['product_code'])->first();
            $subtotal = $item['quantity'] * $product->actual_price;
            $subtotal_without_tax = $subtotal - ($tax_rate * $subtotal);
            $tax_amount = $tax_rate * $subtotal;
            $discount = $item['quantity'] * $product->discount;
            if ($shippingAddress->city->apply_shipping == 0) {
                $shipping = 0;
            } else {
                if ($freeShippingOption == "free_threshold") {
                    if ($subtotal < $freeShippingThreshold) {
                        $shipping = $shippingAddress->city->shipping_cost;
                    } else {
                        $shipping = 0;
                    }
                } else if ($freeShippingOption == "no_free_threshold") {
                    $shipping = $shippingAddress->city->shipping_cost;
                }
            }
            $grandtotal = ($subtotal + $shipping) - $discount;

            $order = Order::create([
                'order_id' => $orderId,
                'customer_id' => $customerId,
                'shipping_delivery_information_id' => $shippingInfo->id,
                'billing_delivery_information_id' => $billingInfo->id,
                'payment_method' => $payment_method,
                'subtotal_without_tax' => $subtotal_without_tax,
                'subtotal' => $subtotal,
                'tax' => $tax_amount,
                'shipping_cost' => $shipping,
                'shipping_snapshot' => json_encode($shipping_snapshot),
                'discount' => $product->discount ?? $discount,
                'total_amount' => $grandtotal,
                'order_status' => 'processing',
                'payment_status' => 'unpaid',
            ]);

            $billingInfo->update(['order_id' => $order->order_id]);
            $shippingInfo->update(['order_id' => $order->order_id]);

            // Create single order item
            OrderItem::create([
                'order_id' => $order->order_id,
                'product_code' => $item['product_code'],
                'quantity' => $item['quantity'],
                'price' => $product->sell_price,
                'actual_price' => $product->actual_price,
                'subtotal_without_tax' => $subtotal_without_tax,
                'tax' => $tax_amount,
                'subtotal' => $subtotal,
                'discount' => $product->discount ?? $discount,
                'shipping_cost' => $shipping
            ]);

            $product->available_quantity = max(0, $product->available_quantity - $item['quantity']);
            $product->stock_quantity = max(0, $product->stock_quantity - $item['quantity']);
            $product->save();

            $shippingDetails = $this->formatShippingAddress($shippingAddress);

            ProcessOrder::dispatch(
                $landing_data,
                $customer->full_name,
                $invoiceEmail,
                $order->order_id
            );

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order placed successfully',
                'order_id' => $order->order_id
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Buy now failed: ' . $e->getMessage());

            return response()->json([
                'success' => false,
                'message' => 'Failed to place order',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_order_cancel_reasons()
    {
        $reasons = OrderCancelReasons::active()
            ->where('reason_type', 'cancel')
            ->where('reason_for', 'customer')
            ->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Cancel Reasons fetched successfully.', 'reasons' => $reasons], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching cancel reasons', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get cancel reasons',
                'error' => $e->getMessage()
            ], 500);
        }
        
    }
    
    public function get_order_return_reasons()
    {
        $reasons = OrderCancelReasons::active()
            ->where('reason_type', 'return')
            ->where('reason_for', 'customer')
            ->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Return Reasons fetched successfully.', 'reasons' => $reasons], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching return reasons', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get return reasons',
                'error' => $e->getMessage()
            ], 500);
        }
        
    }

    public function add_to_cancel(Request $request)
    {
        $validator = Validator::make($request->all(), [     
            'order_id' => 'required|integer|exists:orders,order_id',
            'reason_id' => 'required|integer|exists:order_cancel_reasons,id',
            'reason_description' => 'required|string',
            'policy_checked' => 'required|in:Y,N'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }
        
        $customer = Auth::user();
        $customerId = $customer->id;
        try {
            DB::beginTransaction();
            $order = Order::where('order_id', $request->order_id)->where('customer_id', $customerId)->first();
            if (!in_array($order->order_status, ['processing'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order cannot be cancelled in its current status.'
                ], 403);
            }
            $order->order_status = 'cancelled';
            $order->save();
            
            // Restore stock
            $orderItems = OrderItem::where('order_id', $order->order_id)->get();

            foreach ($orderItems as $item) {
                $product = Product::where('product_code', $item->product_code)->first();
                if ($product) {
                    $product->available_quantity += $item->quantity;
                    $product->stock_quantity += $item->quantity;
                    $product->save();
                }
            }

            OrderItemCancel::create([
                'order_id' => $request->order_id,
                'cancel_reason' => $request->reason_id,
                'reason_description' => $request->reason_description,
                'policy_checked' => $request->policy_checked,
                'cancelled_by' => 'customer',
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order cancelled successfully',
                'order_id' => $request->order_id
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to cancel order',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function add_to_return(Request $request)
    {
        $validator = Validator::make($request->all(), [     
            'order_id' => 'required|integer|exists:orders,order_id',
            'reason_id' => 'required|integer|exists:order_cancel_reasons,id',
            'reason_description' => 'required|string'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }
        
        $customer = Auth::user();
        $customerId = $customer->id;
        try {
            DB::beginTransaction();
            $order = Order::where('order_id', $request->order_id)->where('customer_id', $customerId)->first();
            if (!in_array($order->order_status, ['delivered'])) {
                return response()->json([
                    'success' => false,
                    'message' => 'Order cannot be returned in its current status.'
                ], 403);
            }
            $order->order_status = 'returned';
            $order->save();

            $returnId = Helpers::generateReturnId();
            OrderReturn::create([
                'return_id' => $returnId,
                'order_id' => $request->order_id,
                'return_reason' => $request->reason_id,
                'return_description' => $request->reason_description,
            ]);

            DB::commit();

            return response()->json([
                'success' => true,
                'message' => 'Order return process initiated.',
                'return_id' => $returnId
            ], 201);

        } catch (\Exception $e) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'message' => 'Failed to return order',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}