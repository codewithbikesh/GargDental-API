<?php

namespace App\Models;

use App\CentralLogics\Helpers;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class CompliancesDoc extends Model
{
    protected $fillable = ['compliance_id', 'title', 'filename'];
    
    protected $appends = ['file_url'];
    
    public function getFileUrlAttribute(){
        $value = $this->filename;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'file') {
                    return Helpers::get_full_url('backend/compliances',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/compliances',$value,'public');
    }

    public function compliance()
    {
        return $this->belongsTo(Compliance::class, 'id', 'compliance_id');
    }

    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    }
    
    protected static function boot()
    {
        parent::boot();

        static::saved(function ($model) {
            
            if($model->isDirty('filename')){
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
