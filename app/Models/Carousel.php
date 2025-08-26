<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class Carousel extends Model
{
    use HasFactory;
    protected $table = 'carousel_images';
    protected $fillable = ['product_code', 'file_path', 'is_offer', 'status'];

    protected $appends = ['image_full_url'];

    public function getImageFullUrlAttribute(){
        $value = $this->file_path;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'file') {
                    return Helpers::get_full_url('backend/carousel_files',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/carousel_files',$value,'public');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }

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
        
        static::retrieved(function ($model) {
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
        });

        static::saved(function ($model) {
            if($model->isDirty('file_path')){
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
