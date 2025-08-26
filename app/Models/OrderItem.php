<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    use HasFactory;
    protected $table = 'order_items';
    protected $fillable = ['order_id', 'product_code', 'quantity', 'price', 'actual_price', 'subtotal_without_tax', 'tax', 'subtotal', 'discount', 'shipping_cost'];
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }
    
    public function cancellations()
    {
        return $this->hasMany(OrderItemCancel::class, 'order_item_id', 'id');
    }

    public function review()
    {
        return $this->hasOne(Reviews::class, 'product_code', 'product_code')
            ->where('order_id', $this->order_id);
    }

}
