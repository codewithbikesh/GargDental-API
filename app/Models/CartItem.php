<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    use HasFactory;
    protected $table = 'cart_items';
    protected $fillable = ['cart_id', 'product_code', 'quantity', 'price', 'mr_price'];
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }

    public function cart()
    {
        return $this->belongsTo(Cart::class);
    }
    
    public function productImages()
    {
        return $this->hasMany(ProductImages::class, 'product_code', 'product_code');
    }

}
