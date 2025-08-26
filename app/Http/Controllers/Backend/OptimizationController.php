<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Log;

class OptimizationController extends Controller
{    
    public function optimizeClear()
    {
        Artisan::call('optimize:clear');
        return redirect()->route('backend.dashboard')->with('success', 'Optimizations cleared successfully.');
    }
    
    public function optimizeClearCron()
    {
        if (request()->input('token') !== env('CRON_JOB_TOKEN')) {
            Log::error('Unauthorized access attempt to optimizeClearCron.');
            abort(403);
        }
    
        Artisan::call('optimize:clear');
        Log::info('Optimizations cleared successfully.');
        return response()->json(['success' => 'Optimizations cleared successfully.']);
    }
    
}
