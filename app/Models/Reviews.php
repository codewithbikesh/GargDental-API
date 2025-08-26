<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class Reviews extends Model
{
    use HasFactory;
    protected $table = 'product_reviews';

    protected $appends = ['image_full_url'];

    public function getImageFullUrlAttribute(){
        $value = $this->image_path;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'file') {
                    return Helpers::get_full_url('reviews/' . $this->product_code,$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('reviews/' . $this->product_code,$value,'public');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }

    public function customer()
    {
        return $this->belongsTo(User::class, 'customer_id');
    }
    
    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }

    protected static function boot()
    {
        parent::boot();

        static::saved(function ($model) {
            
            if($model->isDirty('product_image')){
                $value = Helpers::getDisk();

                DB::table('storages')->updateOrInsert([
                    'data_type' => get_class($model),
                    'data_id' => $model->id,
                    'key' => 'file',
                ], [
                    'value' => $value,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        });
    }

}
