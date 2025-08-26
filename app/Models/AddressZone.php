<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AddressZone extends Model
{
    use HasFactory;
    protected $table = 'address_zone'; // specify the correct table name
    protected $fillable = ['city_id', 'zone_name'];
    
    public function city()
    {
        return $this->belongsTo(Shipping::class, 'city_id');
    }
}
