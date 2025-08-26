<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderDelivered extends Model
{
    protected $table = 'order_delivered';
    protected $fillable = ['order_id', 'delivery_date', 'received_by'];
}
