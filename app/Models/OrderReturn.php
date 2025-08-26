<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OrderReturn extends Model
{
    protected $fillable = ['return_id', 'order_id', 'return_amount', 'return_reason', 'return_description', 'return_initiated_by', 'return_status'];
}
