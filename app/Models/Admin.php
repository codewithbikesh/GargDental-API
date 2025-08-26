<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class Admin extends Authenticatable
{
    use HasFactory;
  protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'address',
        'profile_photo_path',
    ];
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
    
public function role()
{
    return $this->belongsTo(AdminRole::class, 'role_id');
}

}
