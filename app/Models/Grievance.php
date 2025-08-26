<?php

namespace App\Models;

use App\CentralLogics\Helpers;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Grievance extends Model
{
        
    protected $appends = ['image_full_url'];

    public function getImageFullUrlAttribute(){
        $value = $this->document;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'image') {
                    return Helpers::get_full_url('backend/grievances',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/grievances',$value,'public');
    }

    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }

    protected static function boot()
    {
        parent::boot();
        static::saved(function ($model) {
            if($model->isDirty('document')){
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
