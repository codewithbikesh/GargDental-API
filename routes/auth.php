<?php

use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Backend\AdminDashboardController;
use Illuminate\Support\Facades\Route;

Route::middleware('guest')->group(function () {

    Route::get('admin-login', [AuthenticatedSessionController::class, 'create'])
                ->name('admin-login');
    
    Route::get('forgot-password', [AuthenticatedSessionController::class, 'forgot_password'])
                ->name('forgot-password');

    Route::post('admin-login', [AuthenticatedSessionController::class, 'store']);
                
});



Route::middleware('auth')->group(function () {
    Route::get('/admin/dashboard', [AdminDashboardController::class, 'index'])
    ->name('backend.dashboard');
    
    Route::post('admin-logout', [AuthenticatedSessionController::class, 'destroy'])
                ->name('admin.log.out');

});


Route::fallback(function () {
    abort(404); 
});

