<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class Product extends Model
{
    use HasFactory;
    
    protected $guarded = [];
    protected $appends = ['files_full_url', 'main_image_full_url', 'image_full_url', 'catalogue_full_url', 'average_rating', 'review_count', 'reviews'];
    protected $hidden = ['storage', 'ownReviews', 'variationReviews'];
    
    public function productimages()
    {
        return $this->hasMany(ProductImages::class, 'product_code', 'product_code');
    }

    public function getFilesFullUrlAttribute()
    {
        $productimages = $this->productimages()->with('storage')->get();
    
        if ($productimages->count() > 0) {
            $urls = [];
    
            foreach ($productimages as $productimage) {
                $value = $productimage->image_path;

                if (count($productimage->storage) > 0) {
                    foreach ($productimage->storage as $storage) {
                        if ($storage['key'] == 'file') {
                            $urls[] = Helpers::get_full_url('backend/productimages/' . $this->product_code, $value, $storage['value']);
                        }
                    }
                } else {
                    $urls[] = Helpers::get_full_url('backend/productimages/' . $this->product_code, $value, 'public');
                }
            }
            return $urls;
        }
    
        return [];
    }

    public function getImageFullUrlAttribute(){
        $productimage = $this->productimages()->with('storage')->first();
        if (!$productimage || !$productimage->image_path) {
            return null;
        }

        if ($productimage->count() > 0) {
            $value = $productimage->image_path;
            if (count($productimage->storage) > 0) {
                foreach ($productimage->storage as $storage) {
                    if ($storage['key'] == 'file') {
                        return Helpers::get_full_url('backend/productimages/' . $this->product_code,$value,$storage['value']);
                    }
                }
            }
        }

        return Helpers::get_full_url('backend/productimages/' . $this->product_code,$value,'public');
    }

    public function getMainImageFullUrlAttribute(){
        $value = $this->main_image;
        
        $productCode = $this->parent_id ? optional($this->parent)->product_code : $this->product_code;

        if (!$productCode || !$value) return null;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'image') {
                    return Helpers::get_full_url('backend/productimages/' . $productCode,$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/productimages/' . $productCode,$value,'public');
    }
    
    public function getCatalogueFullUrlAttribute(){
        $value = $this->product_catalogue;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'file') {
                    return Helpers::get_full_url('backend/productcatalogue/' . $this->product_code,$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/productcatalogue/' . $this->product_code,$value,'public');
    }

    public function scopeActive($query)
    {
        return $query->where('status', 1);
    }
    
    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id', 'id');
    }

    public function subcategory()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }

    public function images()
    {
        return $this->hasMany(ProductImages::class, 'product_code', 'product_code');
    }

    public function ownReviews()
    {
        return $this->hasMany(Reviews::class, 'product_code', 'product_code')->with('customer');
    }

    public function variationReviews()
    {
        return $this->hasManyThrough(
            Reviews::class,
            Product::class,
            'parent_id',     // Foreign key on variations table (child)
            'product_code',  // Foreign key on reviews table
            'id',  // Local key on parent product
            'product_code'   // Local key on variations table
        )->with('customer');
    }

    public function getReviewsAttribute()
    {
        if ($this->parent_id !== null) {
            return collect();
        }

        if ($this->variations()->exists()) {
            return $this->variationReviews;
        }

        return $this->ownReviews;
    }

    public function getMergedReviewsAttribute()
    {
        if ($this->parent_id !== null) {
            return collect();
        }

        $variationCodes = $this->variations()->pluck('product_code')->toArray();

        if (!empty($variationCodes)) {
            return Reviews::whereIn('product_code', $variationCodes)->get();
        }

        return $this->reviews;
    }

    public function getAverageRatingAttribute()
    {
        return number_format($this->merged_reviews->avg('rating') ?? 0, 2, '.', '');
    }

    public function getReviewCountAttribute()
    {
        return $this->merged_reviews->count();
    }

    public function wishlist()
    {
        return $this->hasMany(Wishlist::class, 'product_code', 'product_code');
    }

    public function variations()
    {
        return $this->hasMany(Product::class, 'parent_id');
    }

    public function parent()
    {
        return $this->belongsTo(Product::class, 'parent_id');
    }

    public function wishlistedByUser()
    {
        if (!auth('customer')->check()) {
            return false;
        }
        
        return $this->hasOne(Wishlist::class, 'product_code', 'product_code')
                    ->where('customer_id', auth('customer')->id());
    }
    
    public function getIsWishlistedByUserAttribute()
    {
        return $this->relationLoaded('wishlistedByUser') && $this->wishlistedByUser !== null;
    }
    
    public function relatedProducts()
    {
        return self::with('images', 'category', 'brand')
        ->where('category_id', $this->category_id)
        ->where('product_code', '!=', $this->product_code)
        ->inRandomOrder()
        ->take(6)
        ->get();
    }

     public function storage()
     {
         return $this->morphMany(Storage::class, 'data');
     } 
 

    protected static function boot()
    {
        parent::boot();
        static::saved(function ($model) {
            if($model->isDirty('main_image')){
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
            
            if($model->isDirty('product_catalogue')){
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
