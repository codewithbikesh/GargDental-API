<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\DB;

class PosterCard extends Model
{
    use HasFactory;
    protected $table = 'poster_cards';
    protected $fillable = ['card_1', 'card_2', 'card_3'];

    protected $appends = ['card1_full_url', 'card2_full_url', 'card3_full_url'];

    public function getCard1FullUrlAttribute(){
        $value = $this->card_1;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'card_1') {
                    return Helpers::get_full_url('backend/poster_cards',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/poster_cards',$value,'public');
    }

    public function getCard2FullUrlAttribute(){
        $value = $this->card_2;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'card_2') {
                    return Helpers::get_full_url('backend/poster_cards',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/poster_cards',$value,'public');
    }
    
    public function getCard3FullUrlAttribute(){
        $value = $this->card_3;
        if (count($this->storage) > 0) {
            foreach ($this->storage as $storage) {
                if ($storage['key'] == 'card_3') {
                    return Helpers::get_full_url('backend/poster_cards',$value,$storage['value']);
                }
            }
        }

        return Helpers::get_full_url('backend/poster_cards',$value,'public');
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

        static::saved(function ($model) {
            $fields = ['card_1', 'card_2', 'card_3'];
    
            foreach ($fields as $field) {
                if ($model->isDirty($field)) {
                    $value = Helpers::getDisk();
    
                    DB::table('storages')->updateOrInsert([
                        'data_type' => get_class($model),
                        'data_id' => $model->id,
                        'key' => $field,
                    ], [
                        'value' => $value,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            }
        });
    }
}
