<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderItemCancel extends Model
{
    use HasFactory;
    protected $table = 'order_cancel';
    protected $fillable = ['order_id', 'cancel_reason', 'reason_description', 'policy_checked', 'cancelled_by'];

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id', 'order_id');
    }
    
    public function reason()
    {
        return $this->belongsTo(OrderCancelReasons::class, 'cancel_reason', 'id');
    }

}
