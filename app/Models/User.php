<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Relations\HasMany;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;
use Laravel\Passport\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory;

    protected $fillable = ['full_name', 'email', 'phone', 'gender', 'is_phone_verified',
                           'is_email_verified', 'email_verified_at', 'status', 'order_count', 'login_medium', 'social_id', 'password', 
                           'remember_token', 'profile_photo_path'];

    public function orders(): HasMany
    {
        return $this->hasMany(Order::class, 'customer_id');
    }
    
    public function addresses(): HasMany
    {
        return $this->hasMany(CustomerAddressBook::class, 'customer_id', 'id');
    }
    
    public function wishlist()
    {
        return $this->belongsToMany(Product::class, 'wishlist', 'customer_id', 'product_code', 'id', 'product_code');
    }

    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }

    protected $appends = ['image_full_url'];

    public function getImageFullUrlAttribute(){
        $value = $this->profile_photo_path;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'image') {
                    return Helpers::get_full_url('profile',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('profile',$value,'public');
    }

    protected static function boot()
    {
        parent::boot();
        static::saved(function ($model) {
            if($model->isDirty('profile_photo_path')){
                $value = Helpers::getDisk();

                DB::table('storages')->updateOrInsert([
                    'data_type' => get_class($model),
                    'data_id' => $model->id,
                    'key' => 'image',
                ], [
                    'value' => $value,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        });
    }

}
