<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Services\ProductApiDataService;
use Illuminate\Support\Facades\Log;

class LoadProductsAPIController extends Controller
{

    protected $productApiDataService;

    public function __construct(ProductApiDataService $productApiDataService)
    {
        $this->productApiDataService = $productApiDataService;
    }

    public function index()
    {
        $this->productApiDataService->fetchDataAndStore();
        return redirect()->route('backend.products.index')->with('success', 'Products Fetched successfully');
    }
    
    public function loadProductsCron()
    {
        
        // Check for the token in the request
        if (request()->input('token') !== env('CRON_JOB_TOKEN')) {
            Log::error('Unauthorized access attempt to loadproductscron.');
            abort(403); // Forbidden response if the token doesn't match
        }
        
        $this->productApiDataService->fetchDataAndStore();
        Log::info('Products Fetched successfully.');
        return redirect()->route('backend.products.index')->with('success', 'Products Fetched successfully');
    }
    
}
