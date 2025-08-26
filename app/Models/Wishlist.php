<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wishlist extends Model
{
    use HasFactory;
    protected $table = 'wishlist'; // specify the correct table name
    protected $fillable = ['customer_id', 'product_code'];
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }
    
    public function reviews()
    {
        return $this->hasMany(Reviews::class, 'product_code', 'product_code');
    }
}
