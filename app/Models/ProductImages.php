<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class ProductImages extends Model
{
    use HasFactory;
    protected $table = 'product_images';
    protected $fillable = ['product_code', 'image_path'];
    
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_code', 'product_code');
    }

    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }

    protected static function boot()
    {
        parent::boot();

        static::saved(function ($model) {
            
            if($model->isDirty('image_path')){
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
