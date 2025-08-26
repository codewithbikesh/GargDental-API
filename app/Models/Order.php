<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $table = 'orders';
    protected $fillable = ['order_id', 'api_order_id', 'customer_id', 'shipping_delivery_information_id', 'billing_delivery_information_id',
                           'payment_method', 'shipping_method', 'subtotal_without_tax', 'subtotal', 'tax', 'shipping_cost', 'shipping_snapshot', 'discount', 
                           'total_amount', 'order_status', 'payment_status'];
    
    public function getTotalItemsAttribute()
    {
        return $this->orderItems ? $this->orderItems->count() : 0;
    }

    public function deliveryInfo()
    {
        return $this->hasOne(OrderDelivered::class, 'order_id', 'order_id');
    }

    public function orderItems()
    {
        return $this->hasMany(OrderItem::class, 'order_id', 'order_id');
    }
    
    public function orderPayment()
    {
        return $this->hasOne(OrderPayment::class, 'order_id', 'order_id');
    }
    
    public function cancelDetails()
    {
        return $this->hasOne(OrderItemCancel::class, 'order_id', 'order_id');
    }
    
    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id', 'id');
    }

    public function deliveryInformation()
    {
        return $this->belongsTo(DeliveryInformation::class, 'shipping_delivery_information_id', 'id');
    }


}
