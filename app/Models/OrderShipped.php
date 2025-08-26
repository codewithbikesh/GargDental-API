<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderShipped extends Model
{
    protected $table = 'order_shipped';
    protected $fillable = ['order_id', 'tracking_number', 'shipping_carrier', 'estimated_delivery_date'];
}
