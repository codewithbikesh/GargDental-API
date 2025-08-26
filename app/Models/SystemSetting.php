<?php

namespace App\Models;

use App\CentralLogics\Helpers;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Facades\DB;

class SystemSetting extends Model
{
    use HasFactory;
    
    protected $guarded = ['id'];

    protected $appends = [];

    public function getHeaderLogoFullUrlAttribute()
    {
        if ($this->key === 'company_logo_header' && $this->value) {
            return Helpers::get_full_url('system/', $this->value, 'public');
        }
        return null;
    }

    public function getFooterLogoFullUrlAttribute()
    {
        if ($this->key === 'company_logo_footer' && $this->value) {
            return Helpers::get_full_url('system/', $this->value, 'public');
        }
        return null;
    }

    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }

    protected static function boot()
    {
        parent::boot();
        static::saved(function ($model) {
            if($model->isDirty('image')){
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