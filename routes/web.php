<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Frontend\QueueController;
use App\Http\Controllers\Backend\InquiryController;
use App\Http\Controllers\Backend\GrievanceController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\ClinicController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\WebsiteController;
use App\Http\Controllers\Backend\ProductController;
use App\Http\Controllers\Backend\CategoryController;
use App\Http\Controllers\Backend\CarrierController;
use App\Http\Controllers\Backend\BrandController;
use App\Http\Controllers\Backend\CouponController;
use App\Http\Controllers\Backend\ComplianceController;
use App\Http\Controllers\Backend\CustomerController;
use App\Http\Controllers\Backend\LoadProductsAPIController;
use App\Http\Controllers\Backend\OrderController;
use App\Http\Controllers\Backend\ReviewRatingController;
use App\Http\Controllers\Backend\NewsletterController;
use App\Http\Controllers\Backend\SetAPIController;
use App\Http\Controllers\Backend\ShippingController;
use App\Http\Controllers\Backend\ProvinceController;
use App\Http\Controllers\Backend\ProductImagesController;
use App\Http\Controllers\Backend\OrderCancelController;
use App\Http\Controllers\Backend\AddressZoneController;
use App\Http\Controllers\Backend\OptimizationController;
use App\Http\Controllers\Backend\AdminDashboardController;
use App\Http\Controllers\Backend\ImageFolderController;
use App\Http\Controllers\Backend\CustomRoleController;

// cron job tasks
Route::get('/optimize-clear-cron', [OptimizationController::class, 'optimizeClearCron']);
Route::get('/jobs-queue-cron', [QueueController::class, 'jobsqueueCron']);

Route::middleware(['auth', 'verified'])->prefix('admin')->group(function () {
    Route::get('/dashboard', [AdminDashboardController::class, 'index'])->name('backend.dashboard');
    
    //Optimization clear
    Route::get('/optimize-clear', [OptimizationController::class, 'optimizeClear'])->name('backend.optimization');
    
    //Profile
    Route::get('/profile', [ProfileController::class, 'edit'])->name('backend.profile.profile');
    Route::post('/profile/update', [ProfileController::class, 'update'])->name('backend.profile.update');
    Route::post('/profile/change-password', [ProfileController::class, 'changepassword'])->name('backend.profile.change-password');

    //SET API
    Route::get('/set-api', [SetAPIController::class, 'index'])->name('backend.setapi.index');
    Route::get('/set-api/add', [SetAPIController::class, 'add'])->name('backend.setapi.add');
    Route::post('/set-api', [SetAPIController::class, 'store'])->name('backend.setapi.store');
    Route::post('/set-api/edit', [SetAPIController::class, 'edit'])->name('backend.setapi.edit');
    Route::post('/set-api/{id}', [SetAPIController::class, 'update'])->name('backend.setapi.update');
    Route::delete('/set-api/{id}', [SetAPIController::class, 'delete'])->name('backend.setapi.delete');

    //Products
    Route::post('/products/toggle-status', [ProductController::class, 'toggleStatus'])->name('backend.products.toggle-status')->middleware(['module:product-edit']);
    Route::post('/products/bulk-toggle-status', [ProductController::class, 'bulkToggleStatus'])->name('backend.products.bulk-toggle-status')->middleware(['module:product-edit']);
    Route::get('/products', [ProductController::class, 'index'])->name('backend.products.index')->middleware(['module:product-view']);
    Route::get('/products/new', [ProductController::class, 'new'])->name('backend.products.new')->middleware(['module:product-add']);
    Route::post('/products/store', [ProductController::class, 'store'])->name('backend.products.store')->middleware(['module:product-add']);
    Route::get('/products/view', [ProductController::class, 'view'])->name('backend.products.view')->middleware(['module:product-view']);
    Route::get('/products/edit', [ProductController::class, 'edit'])->name('backend.products.edit')->middleware(['module:product-edit']);
    Route::post('/products/files/{product_code}', [ProductController::class, 'update'])->name('backend.products.uploadFiles')->middleware(['module:product-edit']);
    Route::get('/products/delete-variation/{product_code}', [ProductController::class, 'deleteVariation'])->name('backend.products.variationdelete')->middleware(['module:product-delete']);
    Route::get('/products/{id}/{status}', [ProductController::class, 'status'])->name('backend.products.status')->middleware(['module:product-edit']);
    Route::post('/products/upload-images', [ProductController::class, 'upload_images'])->name('backend.products.uploadimages')->middleware(['module:product-edit']);
    Route::delete('/products/delete-image/{id}/{product_code}', [ProductController::class, 'deleteImage'])->name('backend.products.imagedelete')->middleware(['module:product-delete']);

    //Categories
    Route::get('/categories', [CategoryController::class, 'index'])->name('backend.categories.index');
    Route::get('/categories/subcategories/{id}', [CategoryController::class, 'getSubcategories']);
    Route::get('/categories/new', [CategoryController::class, 'new'])->name('backend.categories.new');
    Route::post('/categories/store', [CategoryController::class, 'store'])->name('backend.categories.store');
    Route::post('/categories/view', [CategoryController::class, 'view'])->name('backend.categories.view');
    Route::get('/categories/edit', [CategoryController::class, 'edit'])->name('backend.categories.edit');
    Route::post('/categories/update/{id}', [CategoryController::class, 'update'])->name('backend.categories.update');
    Route::get('/categories/{id}/{status}', [CategoryController::class, 'status'])->name('backend.categories.status');
    Route::get('/set-top-categories/{id}/{top}', [CategoryController::class, 'top'])->name('backend.categories.top');
    
    //Carriers
    Route::get('/carriers', [CarrierController::class, 'index'])->name('backend.carriers.index');
    Route::get('/carriers/new', [CarrierController::class, 'new'])->name('backend.carriers.new');
    Route::post('/carriers/store', [CarrierController::class, 'store'])->name('backend.carriers.store');
    Route::post('/carriers/view', [CarrierController::class, 'view'])->name('backend.carriers.view');
    Route::get('/carriers/edit', [CarrierController::class, 'edit'])->name('backend.carriers.edit');
    Route::post('/carriers/update/{id}', [CarrierController::class, 'update'])->name('backend.carriers.update');
    Route::get('/carriers/{id}/{status}', [CarrierController::class, 'status'])->name('backend.carriers.status');

    //Brands
    Route::get('/brands', [BrandController::class, 'index'])->name('backend.brands.index');
    Route::get('/brands/new', [BrandController::class, 'new'])->name('backend.brands.new');
    Route::post('/brands/store', [BrandController::class, 'store'])->name('backend.brands.store');
    Route::post('/brands/view', [BrandController::class, 'view'])->name('backend.brands.view');
    Route::get('/brands/edit', [BrandController::class, 'edit'])->name('backend.brands.edit');
    Route::post('/brands/update/{id}', [BrandController::class, 'update'])->name('backend.brands.update');
    Route::get('/brands/{id}/{status}', [BrandController::class, 'status'])->name('backend.brands.status');
    Route::get('/set-top-brands/{id}/{top}', [BrandController::class, 'top'])->name('backend.brands.top');
    
    //Coupons
    Route::get('/coupons', [CouponController::class, 'index'])->name('backend.coupons.index');
    Route::get('/coupons/new', [CouponController::class, 'new'])->name('backend.coupons.new');
    Route::post('/coupons/store', [CouponController::class, 'store'])->name('backend.coupons.store');
    Route::post('/coupons/view', [CouponController::class, 'view'])->name('backend.coupons.view');
    Route::get('/coupons/edit', [CouponController::class, 'edit'])->name('backend.coupons.edit');
    Route::post('/coupons/update/{id}', [CouponController::class, 'update'])->name('backend.coupons.update');
    Route::get('/coupons/{id}/{status}', [CouponController::class, 'status'])->name('backend.coupons.status');

    //Customers
    Route::get('/customers', [CustomerController::class, 'index'])->name('backend.customers.index');
    Route::post('/customers/view', [CustomerController::class, 'view'])->name('backend.customers.view');

    //Orders
    Route::get('/orders/{status}', [OrderController::class, 'byStatus'])->name('backend.orders.byStatus');
    Route::get('/order/{id}', [OrderController::class, 'show'])->name('backend.orders.view');
    Route::post('/order', [OrderController::class, 'changestatus'])->name('backend.orders.changestatus');
    Route::post('/order/clear-dues', [OrderController::class, 'cleardues'])->name('backend.orders.cleardues');

    //Order Cancel
    Route::get('/set-cancel-reasons', [OrderCancelController::class, 'index'])->name('backend.cancelreasons.index');
    Route::get('/set-cancel-reasons/add', [OrderCancelController::class, 'add'])->name('backend.cancelreasons.add');
    Route::post('/set-cancel-reasons', [OrderCancelController::class, 'store'])->name('backend.cancelreasons.store');
    Route::delete('/set-cancel-reasons/{id}', [OrderCancelController::class, 'delete'])->name('backend.cancelreasons.delete');
    Route::post('/set-cancel-reasons/edit', [OrderCancelController::class, 'edit'])->name('backend.cancelreasons.edit');
    Route::post('/set-cancel-reasons/{id}', [OrderCancelController::class, 'update'])->name('backend.cancelreasons.update');
    Route::get('/set-cancel-reasons/{id}/{status}', [OrderCancelController::class, 'status'])->name('backend.cancelreasons.status');

    //Reviews and Ratings
    Route::get('/reviews-ratings', [ReviewRatingController::class, 'index'])->name('backend.ratings.index');
    Route::delete('/reviews-ratings/{id}', [ReviewRatingController::class, 'delete'])->name('backend.ratings.delete');

    //Set Shipping
    Route::get('/set-shipping', [ShippingController::class, 'index'])->name('backend.setshipping.index');
    Route::post('/set-shipping/view', [ShippingController::class, 'view'])->name('backend.setshipping.view');
    Route::get('/set-shipping/add', [ShippingController::class, 'add'])->name('backend.setshipping.add');
    Route::post('/set-shipping', [ShippingController::class, 'store'])->name('backend.setshipping.store');
    Route::post('/set-shipping/edit', [ShippingController::class, 'edit'])->name('backend.setshipping.edit');
    Route::post('/set-shipping/{id}', [ShippingController::class, 'update'])->name('backend.setshipping.update');
    Route::delete('/set-shipping/{id}', [ShippingController::class, 'delete'])->name('backend.setshipping.delete');
    Route::get('/apply/shipping-cost/{id}/{set_shipping}', [ShippingController::class, 'apply_shipping'])->name('backend.setshipping.apply-shipping');

    //Set Address City Zone
    Route::get('/address-zone', [AddressZoneController::class, 'index'])->name('backend.addresszone.index');
    Route::post('/address-zone', [AddressZoneController::class, 'store'])->name('backend.addresszone.store');
    Route::post('/address-zone/view', [AddressZoneController::class, 'view'])->name('backend.addresszone.view');
    Route::post('/address-zone/edit', [AddressZoneController::class, 'edit'])->name('backend.addresszone.edit');
    Route::post('/address-zone/{id}', [AddressZoneController::class, 'update'])->name('backend.addresszone.update');
    Route::delete('/address-zone/{id}', [AddressZoneController::class, 'delete'])->name('backend.addresszone.delete');

    //Load Products from OMS API
    Route::get('/load-products-api', [LoadProductsAPIController::class, 'index'])->name('backend.loadproductsapi.index');

    //Upload product image from local system or url
    Route::get('/upload-product-images', [ProductImagesController::class, 'index'])->name('backend.uploadproductimages.index');
    Route::post('/upload-now', [ProductImagesController::class, 'import_image'])->name('backend.uploadnow.index');
    Route::get('/download-template/images/{category_id}', [ProductImagesController::class, 'downloadTemplate'])->name('backend.downloadTemplate');
    Route::get('/download-product-template', [ProductImagesController::class, 'downloadProductTemplate'])->name('backend.downloadProductTemplate');
    Route::post('/upload-products', [ProductImagesController::class, 'upload_products'])->name('backend.uploadnow.products');
    Route::get('/download-categories-template', [ProductImagesController::class, 'downloadCategoriesTemplate'])->name('backend.downloadCategoriesTemplate');
    Route::get('/download-brands-template', [ProductImagesController::class, 'downloadBrandsTemplate'])->name('backend.downloadBrandsTemplate');

    //Upload Image Folder
    Route::get('/upload-image-folder', [ImageFolderController::class, 'index'])->name('backend.uploadimagefolder.index');
    Route::post('/upload-image-folder/upload', [ImageFolderController::class, 'upload'])->name('backend.uploadimagefolder.upload');
    
    //Inquiries
    Route::get('/inquiries', [InquiryController::class, 'index'])->name('backend.inquiries.index');
    Route::post('/inquiries/view', [InquiryController::class, 'view'])->name('backend.inquiries.view');
    Route::delete('/inquiries/{id}', [InquiryController::class, 'delete'])->name('backend.inquiries.delete');
    
    //Grievances
    Route::get('/grievances', [GrievanceController::class, 'index'])->name('backend.grievances.index');
    Route::post('/grievances/view', [GrievanceController::class, 'view'])->name('backend.grievances.view');
    Route::delete('/grievances/{id}', [GrievanceController::class, 'delete'])->name('backend.grievances.delete');

    //Newsletter Subscribers
    Route::get('/newsletter-subscribers', [NewsletterController::class, 'index'])->name('backend.newsletters.index');
    Route::post('/newsletter-subscriber/view', [NewsletterController::class, 'view'])->name('backend.newsletters.view');
    Route::delete('/newsletter-subscriber/{id}', [NewsletterController::class, 'delete'])->name('backend.newsletters.delete');

    //Provinces
    Route::get('/provinces', [ProvinceController::class, 'index'])->name('backend.provinces.index');
    Route::get('/provinces/add', [ProvinceController::class, 'add'])->name('backend.provinces.add');
    Route::post('/provinces', [ProvinceController::class, 'store'])->name('backend.provinces.store');
    Route::post('/provinces/view', [ProvinceController::class, 'view'])->name('backend.provinces.view');
    Route::post('/provinces/edit', [ProvinceController::class, 'edit'])->name('backend.provinces.edit');
    Route::post('/provinces/{id}', [ProvinceController::class, 'update'])->name('backend.provinces.update');
    Route::delete('/provinces/{id}', [ProvinceController::class, 'delete'])->name('backend.provinces.delete');
    
    //Clinic Setup
    Route::get('/clinic/requests', [ClinicController::class, 'index'])->name('backend.clinic.requests');
    Route::get('/clinic/setup', [ClinicController::class, 'setup'])->name('backend.clinic.setup');
    Route::post('/clinic/setup/add/cover', [ClinicController::class, 'store_cover'])->name('backend.clinic.store-cover');
    Route::post('/clinic/setup/add/video', [ClinicController::class, 'store_video'])->name('backend.clinic.store-video');

    //Compliance & Legitimacy
    Route::get('/compliance/business-registration', [ComplianceController::class, 'business_registration'])->name('backend.compliance.business-registration');
    Route::post('/compliance/business-registration/store', [ComplianceController::class, 'storeBusinessRegistration'])->name('backend.compliance.business-registration-store');
    Route::get('/compliance/medical-certifications', [ComplianceController::class, 'medical_certifications'])->name('backend.compliance.medical-certifications');
    Route::post('/compliance/medical-certifications/store', [ComplianceController::class, 'storeMedicalCertifications'])->name('backend.compliance.medical-certifications-store');
    Route::get('/compliance/return-refund-policy', [ComplianceController::class, 'return_refund_policy'])->name('backend.compliance.return-refund-policy');
    Route::post('/compliance/return-refund-policy/store', [ComplianceController::class, 'storeReturnRefundPolicy'])->name('backend.compliance.return-refund-policy-store');
    Route::get('/compliance/privacy-policy', [ComplianceController::class, 'privacy_policy'])->name('backend.compliance.privacy-policy');
    Route::post('/compliance/privacy-policy/store', [ComplianceController::class, 'storePrivacyPolicy'])->name('backend.compliance.privacy-policy-store');
    Route::get('/compliance/compliance-doc/delete/{id}', [ComplianceController::class, 'deleteComplianceDoc'])->name('backend.compliance.compliance-doc-delete');
    Route::get('/compliance/about-company', [ComplianceController::class, 'about_company'])->name('backend.compliance.about-company');
    Route::post('/compliance/about-company/store', [ComplianceController::class, 'storeAboutCompany'])->name('backend.compliance.about-company-store');
    Route::get('/compliance/about-us', [ComplianceController::class, 'about_us_page'])->name('backend.compliance.about-us-page');
    Route::post('/compliance/about-us/store', [ComplianceController::class, 'storeAboutUsPage'])->name('backend.compliance.about-us-page-store');
    Route::get('/compliance/terms-conditions', [ComplianceController::class, 'terms_conditions'])->name('backend.compliance.terms-conditions');
    Route::post('/compliance/terms-conditions/store', [ComplianceController::class, 'storeTermsConditions'])->name('backend.compliance.terms-conditions-store');

    //Users
    Route::get('/users', [UserController::class, 'index'])->name('backend.users.index');
    Route::get('/users/add', [UserController::class, 'add'])->name('backend.users.add');
    Route::post('/users', [UserController::class, 'store'])->name('backend.users.store');
    Route::post('/users/view', [UserController::class, 'view'])->name('backend.users.view');
    Route::post('/users/edit', [UserController::class, 'edit'])->name('backend.users.edit');
    Route::post('/users/{id}', [UserController::class, 'update'])->name('backend.users.update');
    Route::delete('/users/{id}', [UserController::class, 'delete'])->name('backend.users.delete');

    //  Custom Role 
    Route::get('/custom-role', [CustomRoleController::class, 'list'])->name('backend.custom-role.list');
    Route::get('/custom-role/create', [CustomRoleController::class, 'create'])->name('backend.custom-role.create');
    Route::post('/custom-role', [CustomRoleController::class, 'store'])->name('backend.custom-role.store');
    Route::get('/custom-role/{id}/edit', [CustomRoleController::class, 'edit'])->name('backend.custom-role.edit');
    Route::post('/custom-role/{id}', [CustomRoleController::class, 'update'])->name('backend.custom-role.update');
    Route::post('/custom-role/search', [CustomRoleController::class, 'search'])->name('backend.custom-role.search');
    Route::delete('/custom-role/{id}', [CustomRoleController::class, 'destroy'])->name('backend.custom-role.delete');


    //Website and Carousel Images Data
    Route::get('/website', [WebsiteController::class, 'data'])->name('backend.website.setting');
    Route::post('/website/update', [WebsiteController::class, 'update'])->name('backend.website.update');
    Route::get('/website-carousel', [WebsiteController::class, 'carousel_data'])->name('backend.website.carousel');
    Route::post('/website-carousel', [WebsiteController::class, 'carousel_add'])->name('backend.website.carousel_add');
    Route::post('/website-carousel/view', [WebsiteController::class, 'carousel_view'])->name('backend.website.carousel_view');
    Route::get('/website-carousel/edit/{id}', [WebsiteController::class, 'carousel_edit'])->name('backend.website.carousel_edit');
    Route::post('/website-carousel/{id}', [WebsiteController::class, 'carousel_update'])->name('backend.website.carousel_update');
    Route::delete('/website-carousel/{id}', [WebsiteController::class, 'carousel_delete'])->name('backend.website.carousel_delete');
    Route::get('/website-carousel/{id}/{status}', [WebsiteController::class, 'carousel_status'])->name('backend.website.carousel_status');
    Route::get('/website-carousel-offer/{id}/{is_offer}', [WebsiteController::class, 'carousel_offer'])->name('backend.website.carousel_offer');
    
    Route::get('/poster-card', [WebsiteController::class, 'poster_card'])->name('backend.website.poster_card');
    Route::post('/poster-card/{id}', [WebsiteController::class, 'poster_card_update'])->name('backend.website.poster_card_update');

});

Route::get('/', function () {
    return view('welcome');
});

Route::fallback(function () {
    return view('welcome');
});

require __DIR__ . '/auth.php';
