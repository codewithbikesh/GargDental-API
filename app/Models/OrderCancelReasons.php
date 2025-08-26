<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderCancelReasons extends Model
{
    use HasFactory;
    protected $table = 'order_cancel_reasons';
    protected $fillable = ['reason_name', 'reason_for', 'status'];

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
}
