<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Inquiry;
use App\Models\Newsletter;
use App\Models\User;
use App\Models\Reviews;

class AdminDashboardController extends Controller
{
    public function index()
    {
        $product_count = Product::count();
        $category_count = Category::whereNull('parent_id')->count();
        $brand_count = Brand::count();
        $customer_count = User::count();
        $order_count = Order::where('order_status', '!=', 'cancelled')->count();
        $processing_order_count = Order::where('order_status', 'processing')->count();
        $shipped_order_count = Order::where('order_status', 'shipped')->count();
        $delivered_order_count = Order::where('order_status', 'delivered')->count();
        $cancelled_order_count = Order::where('order_status', 'cancelled')->count();
        $inquiry_count = Inquiry::count();
        $newsletter_count = Newsletter::count();
        $user_count = User::count();
        $reviews_count = Reviews::count();
        $orders = Order::with('customer')
            ->orderBy('created_at', 'asc')
            ->where('order_status', '=' , 'processing')
            ->limit(5)
            ->get()
            ->map(function ($order) {
                $order->total_items = OrderItem::where('order_id', $order->order_id)->count();
                return $order;
            });

        return view('backend.dashboard', compact('product_count', 'category_count', 'brand_count', 'customer_count', 'order_count', 'processing_order_count', 'shipped_order_count', 'delivered_order_count', 'cancelled_order_count', 'inquiry_count', 'newsletter_count', 'user_count', 'orders', 'reviews_count'));
    }
}
