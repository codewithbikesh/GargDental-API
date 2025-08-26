<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Carousel;
use App\Models\PosterCard;
use Illuminate\Support\Facades\Log;

class BannerController extends Controller
{
    public function get_banners()
    {
        $banners = Carousel::active()->with('product')->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Banners fetched successfully.', 'banners' => $banners], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching banners', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get banners',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function get_cards()
    {
        $poster_cards = PosterCard::get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Poster Cards fetched successfully.', 'poster_cards' => $poster_cards], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching poster_cards', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get poster_cards',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}