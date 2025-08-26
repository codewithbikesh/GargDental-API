@extends('backend.layout.master')
@section('content')
<section class="section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Edit Product</h4>
                        <a href="{{ route('backend.products.index') }}" class="btn btn-sm btn-secondary float-end">
                            <i class="fa fa-arrow-left"></i> Back to Products
                        </a>
                    </div>
                    <div class="card-body">
                        <form id="productForm" method="post" action="{{ route('backend.products.uploadFiles', $product->id) }}" enctype="multipart/form-data">
                            @csrf
                            @method('POST')
                            
                            <div class="row">
                                <!-- Left Column - Basic Info -->
                                <div class="col-md-6">
                                    <div class="card mb-4">
                                        <div class="card-header bg-light">
                                            <h5 class="mb-0">Basic Information</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label required">Product Code</label>
                                                <input type="text" class="form-control" name="product_code" value="{{ $product->product_code }}" readonly>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label required">Product Name</label>
                                                <input type="text" class="form-control" name="product_name" value="{{ $product->product_name }}" required>
                                            </div>
                                                                                        
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label required">Category</label>
                                                    <select name="category_id" class="form-select" required>
                                                        <option value="" disabled>Select Category</option>
                                                        @include('backend.categories.partials.category-options', [
                                                            'categories' => $categories,
                                                            'level' => 0,
                                                            'selected' => $product->category_id
                                                        ])
                                                    </select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label required">Brand</label>
                                                    <select class="form-select" name="brand_id" required>
                                                        <option value="" disabled>Select Brand</option>
                                                        @foreach ($brands as $brand)
                                                        <option value="{{ $brand->id }}" {{ $product->brand_id == $brand->id ? 'selected' : '' }}>{{ $brand->brand_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Delivery Target Days</label>
                                                    <input type="number" class="form-control" name="delivery_target_days" min="1" value="{{ $product->delivery_target_days ?? 3 }}">
                                                </div>
                                                
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Flash sale</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="flashSale" name="flash_sale" value="1" {{ $product->flash_sale ? 'checked' : '' }}>
                                                        <label class="form-check-label" for="flashSale">Flash Sale Product</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                   <div class="col-md-6 mb-3">
                                                    <label class="form-label">Weekly Product</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="WeeklyOffer" name="weekly_offer" value="1" {{ $product->weekly_offer ? 'checked' : '' }}>
                                                        <label class="form-check-label" for="WeeklyOffer">Weekly Product</label>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Special Product</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="SpecialProduct" name="special_offer" value="1" {{ $product->special_offer ? 'checked' : '' }}>
                                                        <label class="form-check-label" for="SpecialProduct">Special Product</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label required">Product Description</label>
                                                <textarea class="form-control ckeditor" name="product_description" rows="3">{{ $product->product_description }}</textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Key Specifications</label>
                                                <textarea class="form-control ckeditor" name="key_specifications" rows="3">{{ $product->key_specifications }}</textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Packaging</label>
                                                <textarea class="form-control ckeditor" name="packaging" rows="3">{{ $product->packaging }}</textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Warranty</label>
                                                <textarea class="form-control ckeditor" name="warranty" rows="3">{{ $product->warranty }}</textarea>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    
                                    <!-- Images Section -->
                                    <div class="card mb-4">
                                        <div class="card-header bg-light">
                                            <h5 class="mb-0">Product Image & Catalogue</h5>
                                        </div>
                                        <div class="card-body">
                                            <div class="mb-3">
                                                <label class="form-label">Product Catalogue</label>
                                                @if($product->product_catalogue)
                                                <div class="mb-2">
                                                    <a href="{{ $product['catalogue_full_url'] }}" target="_blank">View Current Catalogue</a>
                                                    <span class="ms-2">
                                                        <input type="checkbox" name="remove_catalogue" id="remove_catalogue" value="1">
                                                        <label for="remove_catalogue">Remove</label>
                                                    </span>
                                                </div>
                                                @endif
                                                <input type="file" class="form-control" name="product_catalogue">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Main Image</label>
                                                @if($product->main_image)
                                                <div class="mb-2">
                                                    <img src="{{ $product['main_image_full_Url'] }}" alt="Main Image" style="max-height: 100px;">
                                                    <span class="ms-2">
                                                        <input type="checkbox" name="remove_main_image" id="remove_main_image" value="1">
                                                        <label for="remove_main_image">Remove</label>
                                                    </span>
                                                </div>
                                                @endif
                                                <input type="file" class="form-control" name="main_image" accept="image/*">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Right Column - Pricing & Variations -->
                                <div class="col-md-6">
                                    <div class="card mb-4">
                                        <div class="card-header bg-light">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <h5 class="mb-0">Pricing & Inventory</h5>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" id="hasVariations" name="has_variations" value="1" {{ $product->has_variations ? 'checked' : '' }}>
                                                    <label class="form-check-label" for="hasVariations">Enable Variations</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <!-- Regular Product Fields -->
                                            <div id="regularProductFields" style="{{ $product->has_variations ? 'display: none;' : '' }}">
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Actual Price</label>
                                                        <div class="input-group">
                                                            <span class="input-group-text">Rs.</span>
                                                            <input type="number" class="form-control" id="regularActualPrice" name="actual_price" value="{{ $product->actual_price }}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Selling Price</label>
                                                        <div class="input-group">
                                                            <span class="input-group-text">Rs.</span>
                                                            <input type="number" class="form-control" id="regularSellPrice" name="sell_price" value="{{ $product->sell_price }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Available Quantity</label>
                                                        <input type="number" class="form-control" id="regularAvailableQuantity" name="available_quantity" value="{{ $product->available_quantity }}">
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Stock Quantity</label>
                                                        <input type="number" class="form-control" id="regularStockQuantity" name="stock_quantity" value="{{ $product->stock_quantity }}">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Variations Section -->
                                            <div id="variationsSection" style="{{ $product->has_variations ? '' : 'display: none;' }}">
                                                <div class="variation-container">
                                                    @if($product->has_variations)
                                                        @foreach($product->variations as $index => $variation)
                                                        <div class="variation-item mb-4 p-3 border rounded">
                                                            <input type="hidden" name="existing_variations[{{ $index }}][id]" value="{{ $variation->id }}">
                                                            <div class="d-flex justify-content-between mb-2">
                                                                <h6>Variation #{{ $index + 1 }}</h6>
                                                                <a href="{{ route('backend.products.variationdelete', ['product_code' => $variation->product_code]) }}" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></a>
                                                            </div>
                                                            
                                                            <div class="row mb-2">
                                                                <div class="col-md-12">
                                                                    <label class="form-label">Variation Image </label>
                                                                    @if($variation->main_image)
                                                                    <div class="mb-2">
                                                                        <img src="{{ $variation->main_image_full_url }}" alt="Main Image" style="max-height: 100px;">
                                                                    </div>
                                                                    @endif
                                                                    <input type="file" class="form-control variation-image" name="existing_variations[{{ $index }}][image]">
                                                                </div>
                                                            </div>

                                                            <div class="row mb-2">
                                                                <div class="col-md-12">
                                                                    <label class="form-label">Variation Name (Include Name, Size, Color, etc.)</label>
                                                                    <input type="text" class="form-control variation-name" name="existing_variations[{{ $index }}][name]" value="{{ $variation->product_name }}">
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-md-6 mb-2">
                                                                    <label class="form-label">Actual Price</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text">Rs.</span>
                                                                        <input type="number" class="form-control variation-actual-price" name="existing_variations[{{ $index }}][actual_price]" value="{{ $variation->actual_price }}">
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6 mb-2">
                                                                    <label class="form-label">Selling Price</label>
                                                                    <div class="input-group">
                                                                        <span class="input-group-text">Rs.</span>
                                                                        <input type="number" class="form-control variation-sell-price" name="existing_variations[{{ $index }}][sell_price]" value="{{ $variation->sell_price }}">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            
                                                            <div class="row">
                                                                <div class="col-md-6 mb-2">
                                                                    <label class="form-label">Available Qty</label>
                                                                    <input type="number" class="form-control variation-available-qty" name="existing_variations[{{ $index }}][available_quantity]" value="{{ $variation->available_quantity }}">
                                                                </div>
                                                                <div class="col-md-6 mb-2">
                                                                    <label class="form-label">Stock Qty</label>
                                                                    <input type="number" class="form-control variation-stock-qty" name="existing_variations[{{ $index }}][stock_quantity]" value="{{ $variation->stock_quantity }}">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        @endforeach
                                                    @endif

<!-- Template for New Variation (Hidden) -->
<div class="variation-item new-variation-template d-none mb-4 p-3 border rounded">
    <div class="d-flex justify-content-between mb-2">
        <h6>Variation #</h6>
        <button type="button" class="btn btn-sm btn-danger remove-variation">
            <i class="fa fa-times"></i>
        </button>
    </div>

    <div class="row mb-2">
        <div class="col-md-12">
            <label class="form-label">Variation Image</label>
            <input type="file" class="form-control variation-image" name="variation_image">
        </div>
    </div>

    <div class="row mb-2">
        <div class="col-md-12">
            <label class="form-label">Variation Name (Include Name, Size, Color, etc.)</label>
            <input type="text" class="form-control variation-name" name="variation_name">
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-2">
            <label class="form-label">Actual Price</label>
            <div class="input-group">
                <span class="input-group-text">Rs.</span>
                <input type="number" class="form-control variation-actual-price" name="variation_actual_price">
            </div>
        </div>
        <div class="col-md-6 mb-2">
            <label class="form-label">Selling Price</label>
            <div class="input-group">
                <span class="input-group-text">Rs.</span>
                <input type="number" class="form-control variation-sell-price" name="variation_sell_price">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-2">
            <label class="form-label">Available Qty</label>
            <input type="number" class="form-control variation-available-qty" name="variation_available_quantity">
        </div>
        <div class="col-md-6 mb-2">
            <label class="form-label">Stock Qty</label>
            <input type="number" class="form-control variation-stock-qty" name="variation_stock_quantity">
        </div>
    </div>
</div>
                                                        
                                                </div>
                                                
                                                <button type="button" id="addVariationBtn" class="btn btn-sm btn-outline-primary">
                                                    <i class="fa fa-plus"></i> Add Another Variation
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="mt-4 text-center">
                                <button type="submit" class="btn btn-primary btn-lg px-5">
                                    <i class="fa fa-save"></i> Update Product
                                </button>
                                <a href="{{ route('backend.products.index') }}" type="reset" class="btn btn-outline-secondary btn-lg px-5 ms-2">
                                    <i class="fa fa-undo"></i> Cancel
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Include necessary JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
$(document).ready(function() {
    // Initialize Select2
    $('select[name="category_id"], select[name="brand_id"]').select2({
        placeholder: "Select an option",
        allowClear: true
    });
    
    // Toggle variations section
$('#hasVariations').change(function () {
    if ($(this).is(':checked')) {
        $('#regularProductFields').hide();
        $('#variationsSection').show();

        // Automatically add one variation if none exists
        if ($('.variation-container .variation-item:not(.new-variation-template)').length === 0) {
            $('#addVariationBtn').click();
        }

    } else {
        $('#regularProductFields').show();
        $('#variationsSection').hide();
    }
});

    
    // Add new variation
// Add new variation
$('#addVariationBtn').click(function () {
    const container = $('.variation-container');
    const newCount = container.find('.new-variation').length;
    const existingCount = container.find('.variation-item:not(.new-variation-template)').length;
    const totalCount = existingCount + newCount;

    const $template = container.find('.new-variation-template');

    if ($template.length === 0) {
        alert("Variation template is missing.");
        return;
    }

    const $newItem = $template.clone().removeClass('new-variation-template d-none').addClass('new-variation');

    $newItem.find('h6').text('Variation #' + (totalCount + 1));

    // Update name attributes for new variation
    $newItem.find('[name]').each(function () {
        const originalName = $(this).attr('name');
        const fieldName = originalName.split('variation_')[1];
        const newName = `variations[new_${newCount}][${fieldName}]`;
        $(this).attr('name', newName);
    });

    // Clear inputs
    $newItem.find('input[type="text"], input[type="number"], input[type="file"]').val('');
    $newItem.find('img').remove();
    $newItem.find('.remove-variation').show();

    container.append($newItem);
});

    
    // Remove variation
    $(document).on('click', '.remove-variation', function() {
        const $variationItem = $(this).closest('.variation-item');
        const isExisting = $variationItem.find('input[name*="existing_variations"]').length > 0;
        
        // Don't allow removing the last variation if it's an existing one
        if (isExisting && $('.variation-item:not(.new-variation-template)').length <= 1) {
            alert('You must keep at least one variation');
            return;
        }
        
        $variationItem.remove();
        
        // Renumber only new variations
        $('.new-variation').each(function(index) {
            const variationNum = $('.variation-item:not(.new-variation-template)').length + index + 1;
            $(this).find('h6').text('Variation #' + variationNum);
            
            // Update name attributes
            $(this).find('[name*="variations[new_"]').each(function() {
                const name = $(this).attr('name').replace(/variations\[new_\d+\]/, 'variations[new_' + index + ']');
                $(this).attr('name', name);
            });
        });
    });
    
    // Form validation
    $('#productForm').submit(function(e) {
        if($('#hasVariations').is(':checked')) {
            let valid = true;
            $('.variation-item:not(.new-variation-template)').each(function() {
                const sellPrice = $(this).find('[name*="sell_price"]').val();
                const actualPrice = $(this).find('[name*="actual_price"]').val();
                const qty = $(this).find('[name*="available_quantity"]').val();
                
                if(!sellPrice || !actualPrice || !qty) {
                    valid = false;
                    $(this).addClass('border-danger');
                } else {
                    $(this).removeClass('border-danger');
                }
            });
            
            if(!valid) {
                e.preventDefault();
                alert('Please fill all required fields for each variation');
                return false;
            }
        }
    });
});
</script>

<style>
    .required:after {
        content: " *";
        color: red;
    }
    .card-header.bg-light {
        background-color: #f8f9fa !important;
    }
    .variation-item {
        background-color: #f8fafc;
        transition: all 0.3s;
    }
    .variation-item:hover {
        background-color: #fff;
        box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
    }
    .border-danger {
        border-color: #dc3545 !important;
    }
    .form-label {
        font-weight: 500;
    }
    .ck-editor__editable {
        min-height: 200px !important;
    }
</style>
@endsection