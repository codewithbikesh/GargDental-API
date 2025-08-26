<?php

namespace App\Models;

use App\CentralLogics\Helpers;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Compliance extends Model
{
    protected $fillable = ['key', 'value'];
    protected $appends = ['files_full_url'];
        
    public function getClinicCoverImageFullUrlAttribute(){
        $cover = $this->where('key', 'clinic_cover_image')->first();

        if (!$cover) {
            return null;
        }

        $value = $cover->value;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'clinic_cover_image') {
                    return Helpers::get_full_url('backend/clinic',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/clinic',$value,'public');
    }

    public function compliancefiles()
    {
        return $this->hasMany(CompliancesDoc::class, 'compliance_id');
    }

    public function getFilesFullUrlAttribute()
    {
        $compliancefiles = $this->compliancefiles()->with('storage')->get();
    
        if ($compliancefiles->count() > 0) {
            $urls = [];
    
            foreach ($compliancefiles as $compliancefile) {
                $value = $compliancefile->filename;

                if (count($compliancefile->storage) > 0) {
                    foreach ($compliancefile->storage as $storage) {
                        if ($storage['key'] == 'file') {
                            $urls[] = Helpers::get_full_url('backend/compliances', $value, $storage['value']);
                        }
                    }
                } else {
                    $urls[] = Helpers::get_full_url('backend/compliances', $value, 'public');
                }
            }
            return $urls;
        }
    
        return [];
    }

    public function getAboutVideoFullUrlAttribute(){
        $cover = $this->where('key', 'introduction_video')->first();
        $value = $cover->value;
        return Helpers::get_full_url('backend/about',$value,'public');
    }
        
    public function getStoryFirstImageFullUrlAttribute(){
        $cover = $this->where('key', 'story_1_image')->first();
        $value = $cover->value;
        return Helpers::get_full_url('backend/about',$value,'public');
    }
        
    public function getStorySecondImageFullUrlAttribute(){
        $cover = $this->where('key', 'story_2_image')->first();
        $value = $cover->value;
        return Helpers::get_full_url('backend/about',$value,'public');
    }
    
    public function storage()
    {
        return $this->morphMany(Storage::class, 'data');
    } 

    protected static function boot()
    {
        parent::boot();

        static::saved(function ($model) {
            $trackedKeys = ['clinic_cover_image'];

            if (in_array($model->key, $trackedKeys)) {
                $disk = Helpers::getDisk();

                DB::table('storages')->updateOrInsert([
                    'data_type' => get_class($model),
                    'data_id' => $model->id,
                    'key' => $model->key,
                ], [
                    'value' => $disk,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);
            }
        });
    }

    protected static function booted()
    {
        static::retrieved(function ($model) {
            if ($model->key === 'clinic_cover_image') {
                $model->append('clinic_cover_image_full_url');
            }
        });
    }

}
