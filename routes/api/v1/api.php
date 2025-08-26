<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\V1\RegistrationController;
use App\Http\Controllers\API\V1\AuthController;
use App\Http\Controllers\API\V1\SocialAuthController;
use App\Http\Controllers\API\V1\BannerController;
use App\Http\Controllers\API\V1\ProductController;
use App\Http\Controllers\API\V1\CategoryController;
use App\Http\Controllers\API\V1\BrandController;
use App\Http\Controllers\API\V1\CustomerController;
use App\Http\Controllers\API\V1\CartController;
use App\Http\Controllers\API\V1\WishlistController;
use App\Http\Controllers\API\V1\OrderController;
use App\Http\Controllers\API\V1\AddressController;
use App\Http\Controllers\API\V1\ComplianceController;
use App\Http\Controllers\API\V1\ReviewController;
use App\Http\Controllers\API\V1\SettingController;
use App\Http\Controllers\API\V1\ClinicController;

Route::group(['namespace' => 'API\V1'], function () {
    Route::post('/register', [RegistrationController::class, 'register']);
    Route::post('/verify-account', [RegistrationController::class, 'VerifyAccount']);
    Route::post('/resend-code', [RegistrationController::class, 'ResendCode']);
    Route::post('/newsletter-subscriber', [RegistrationController::class, 'NewsletterSubscriber']);
    Route::post('/contact-us', [RegistrationController::class, 'ContactForm']);
    Route::get('/compliances', [ComplianceController::class, 'get_compliances']);
    Route::get('/about-us', [ClinicController::class, 'getAboutPageDetails']);
    Route::get('/settings', [SettingController::class, 'get_settings']);

    Route::group(['prefix' => 'auth'], function () {
        Route::post('/forgot-password-code', [AuthController::class, 'forgot_password_code']);
        Route::post('/reset-password-verify', [AuthController::class, 'reset_password_verify']);
        Route::post('/login', [AuthController::class, 'login']);

        Route::group(['prefix' => 'social'], function () {
            Route::post('/google-register', [SocialAuthController::class, 'google_register']);
        });
    });

    Route::group(['prefix' => 'banners'], function () {
        Route::get('/', [BannerController::class, 'get_banners']);
        Route::get('/get-cards', [BannerController::class, 'get_cards']);
    });
    
    Route::group(['prefix'=>'clinic'], function() {
        Route::get('clinic-setup', [ClinicController::class, 'get_clinic_setup']);
        Route::post('clinic-setup/store', [ClinicController::class, 'clinic_setup_store']);
    });

    Route::group(['prefix' => 'products'], function () {
        Route::get('/all', [ProductController::class, 'get_all_products']);
        Route::get('/latest', [ProductController::class, 'get_latest_products']);
        Route::get('/search', [ProductController::class, 'get_searched_products']);
        Route::get('/details/{product_code}', [ProductController::class, 'get_product']);
        Route::get('/related-products/{product_code}', [ProductController::class, 'get_related_products']);
        Route::get('/category-wise-products', [ProductController::class, 'get_products_by_category']);
        Route::get('/brand-wise-products', [ProductController::class, 'get_products_by_brand']);
        Route::get('/flash-sale', [ProductController::class, 'get_flash_sale_products']);
    }); 
    
    Route::group(['prefix' => 'categories'], function () {
        Route::get('/', [CategoryController::class, 'get_categories']);
        Route::get('/top-categories', [CategoryController::class, 'get_top_categories']);
    });
    
    Route::group(['prefix' => 'brands'], function () {
        Route::get('/', [BrandController::class, 'get_brands']);
        Route::get('/top-brands', [BrandController::class, 'get_top_brands']);
    });

    Route::group(['prefix' => 'customer', 'middleware' => 'auth:api'], function () {
        Route::get('info', [CustomerController::class, 'get_info']);
        Route::post('update-profile', [CustomerController::class, 'update_profile']);
        Route::post('change-password', [CustomerController::class, 'change_password']);
        Route::delete('remove-account', [CustomerController::class, 'remove_account']);
        Route::post('/grievance', [CustomerController::class, 'GrievanceForm']);
        
        Route::group(['prefix'=>'address'], function() {
            Route::get('list', [AddressController::class, 'get_addresses']);
            Route::get('load-address-dropdowns', [AddressController::class, 'load_address_dropdowns']);
            Route::post('add', [AddressController::class, 'add_address']);
            Route::post('update/{id}', [AddressController::class, 'update_address']);
            Route::post('set-default-shipping/{id}', [AddressController::class, 'set_default_shipping']);
            Route::post('set-default-billing/{id}', [AddressController::class, 'set_default_billing']);
            Route::delete('remove/{id}', [AddressController::class, 'remove_address']);   
        });

        Route::group(['prefix'=>'cart'], function() {
            Route::get('list', [CartController::class, 'get_carts']);
            Route::post('add', [CartController::class, 'add_to_cart']);
            Route::post('update', [CartController::class, 'update_cart']);
            Route::delete('remove-item', [CartController::class, 'remove_cart_item']);
            Route::delete('remove', [CartController::class, 'remove_cart']);   
        });
        
        Route::group(['prefix'=>'wishlist'], function() {
            Route::get('list', [WishlistController::class, 'get_wishlist']);
            Route::post('add', [WishlistController::class, 'add_to_wishlist']);
            Route::delete('remove-item', [WishlistController::class, 'remove_wishlist_item']);
        });
        
        Route::group(['prefix'=>'reviews'], function() {
            Route::post('add', [ReviewController::class, 'addReview']);
            Route::get('list', [ReviewController::class, 'get_my_reviews']);
        });
        
        Route::group(['prefix'=>'products'], function() {
            Route::post('add-recommended/{product_code}', [ProductController::class, 'add_to_recommended']);
            Route::get('/recommended', [ProductController::class, 'get_recommended']);
        });
        
        Route::group(['prefix'=>'order'], function() {
            Route::post('buy-now', [OrderController::class, 'buy_now']);
            Route::post('add', [OrderController::class, 'add_to_order']);
            Route::get('reasons-list', [OrderController::class, 'get_order_cancel_reasons']);
            Route::post('cancel', [OrderController::class, 'add_to_cancel']);
            Route::get('list', [OrderController::class, 'get_orders']);
            Route::get('return-reasons-list', [OrderController::class, 'get_order_return_reasons']);
            Route::post('return', [OrderController::class, 'add_to_return']);
        });

    });

});
