<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class Category extends Model
{
    use HasFactory;

    protected $appends = ['image_full_url'];

    public function getImageFullUrlAttribute(){
        $value = $this->image;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'image') {
                    return Helpers::get_full_url('backend/categories',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/categories',$value,'public');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id')->with('children');
    }

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id');
    }

    public function getTopLevelParent()
    {
        $category = $this;
        while ($category->parent) {
            $category = $category->parent;
        }
        return $category;
    }

    public function subcategories()
    {
        return $this->hasMany(Category::class, 'parent_id');
    }

    public static function getAllChildCategoryIds($parentId)
    {
        $ids = collect();

        $children = Category::active()->where('parent_id', $parentId)->get();

        foreach ($children as $child) {
            $ids->push($child->id);
            $ids = $ids->merge(self::getAllChildCategoryIds($child->id));
        }

        return $ids;
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }

    public function activeChildren()
    {
        return $this->hasMany(Category::class, 'parent_id')
                    ->active()
                    ->with('activeChildren');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    
    public function scopeTop($query)
    {
        return $query->where('top', 1);
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
