@extends('backend.layout.master')
@section('content')
<section class="section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Add New Product</h4>
                        <a href="{{ route('backend.products.index') }}" class="btn btn-sm btn-secondary float-end">
                            <i class="fa fa-arrow-left"></i> Back to Products
                        </a>
                    </div>
                    <div class="card-body">
                        <form id="productForm" method="post" action="{{ route('backend.products.store') }}" enctype="multipart/form-data">
                            @csrf
                            
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
                                                <input type="text" class="form-control" name="product_code" value="{{ $newProductCode }}" readonly>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label required">Product Name</label>
                                                <input type="text" class="form-control" name="product_name" required>
                                            </div>
                                                                                        
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label required">Category</label>
                                                    <select name="category_id" class="form-select" required>
                                                        <option value="" selected disabled>Select Category</option>
                                                        @include('backend.categories.partials.category-options', ['categories' => $categories, 'level' => 0])
                                                    </select>
                                                </div>
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label required">Brand</label>
                                                    <select class="form-select" name="brand_id" required>
                                                        <option value="" selected disabled>Select Brand</option>
                                                        @foreach ($brands as $brand)
                                                        <option value="{{ $brand->id }}">{{ $brand->brand_name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="row">
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Delivery Target Days</label>
                                                    <input type="number" class="form-control" name="delivery_target_days" min="1" value="3">
                                                </div>
                                                
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Flash sale</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="flashSale" name="flash_sale" value="1">
                                                        <label class="form-check-label" for="flashSale">Flash Sale Product</label>
                                                    </div>
                                                </div>
                                            </div>
                                                
                                            <div class="row">
                                                   <div class="col-md-6 mb-3">
                                                    <label class="form-label">Weekly Product</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="WeeklyOffer" name="weekly_offer" value="1">
                                                        <label class="form-check-label" for="WeeklyOffer">Weekly Product</label>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-md-6 mb-3">
                                                    <label class="form-label">Special Product</label>
                                                    <div class="form-check form-switch">
                                                        <input class="form-check-input" type="checkbox" id="SpecialProduct" name="special_offer" value="1">
                                                        <label class="form-check-label" for="SpecialProduct">Special Product</label>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label required">Product Description</label>
                                                <textarea class="form-control ckeditor" name="product_description" rows="3"></textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Key Specifications</label>
                                                <textarea class="form-control ckeditor" name="key_specifications" rows="3"></textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Packaging</label>
                                                <textarea class="form-control ckeditor" name="packaging" rows="3"></textarea>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="form-label">Warranty</label>
                                                <textarea class="form-control ckeditor" name="warranty" rows="3"></textarea>
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
                                                <input type="file" class="form-control" name="product_catalogue">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Main Image</label>
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
                                                    <input class="form-check-input" type="checkbox" id="hasVariations" name="has_variations" value="1">
                                                    <label class="form-check-label" for="hasVariations">Enable Variations</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <!-- Regular Product Fields -->
                                            <div id="regularProductFields">
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Actual Price</label>
                                                        <div class="input-group">
                                                            <span class="input-group-text">Rs.</span>
                                                            <input type="number" class="form-control" id="regularActualPrice" name="actual_price">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Selling Price</label>
                                                        <div class="input-group">
                                                            <span class="input-group-text">Rs.</span>
                                                            <input type="number" class="form-control" id="regularSellPrice" name="sell_price">
                                                        </div>
                                                    </div>
                                                </div>
                                                
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Available Quantity</label>
                                                        <input type="number" class="form-control" id="regularAvailableQuantity" name="available_quantity">
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label class="form-label">Stock Quantity</label>
                                                        <input type="number" class="form-control" id="regularStockQuantity" name="stock_quantity">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Variations Section (Hidden by default) -->
                                            <div id="variationsSection" style="display: none;">
                                                <div class="variation-container">
                                                    <div class="variation-item mb-4 p-3 border rounded">
                                                        <div class="d-flex justify-content-between mb-2">
                                                            <h6>Variation #1</h6>
                                                            <button type="button" class="btn btn-sm btn-danger remove-variation" style="display: none;">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                        
                                                        <div class="row mb-2">
                                                            <div class="col-md-12">
                                                                <label class="form-label">Variation Image </label>
                                                                <input type="file" class="form-control variation-image" name="variations[0][image]">
                                                            </div>
                                                        </div>

                                                        <div class="row mb-2">
                                                            <div class="col-md-12">
                                                                <label class="form-label">Variation Name (Include Name, Size, Color, etc.)</label>
                                                                <input type="text" class="form-control variation-name" name="variations[0][name]">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="row">
                                                            <div class="col-md-6 mb-2">
                                                                <label class="form-label">Actual Price</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Rs.</span>
                                                                    <input type="number" class="form-control variation-actual-price" name="variations[0][actual_price]">
                                                                </div>
                                                            </div>
                                                            <div class="col-md-6 mb-2">
                                                                <label class="form-label">Selling Price</label>
                                                                <div class="input-group">
                                                                    <span class="input-group-text">Rs.</span>
                                                                    <input type="number" class="form-control variation-sell-price" name="variations[0][sell_price]">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="row">
                                                            <div class="col-md-6 mb-2">
                                                                <label class="form-label">Available Qty</label>
                                                                <input type="number" class="form-control variation-available-qty" name="variations[0][available_quantity]">
                                                            </div>
                                                            <div class="col-md-6 mb-2">
                                                                <label class="form-label">Stock Qty</label>
                                                                <input type="number" class="form-control variation-stock-qty" name="variations[0][stock_quantity]">
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
                                    <i class="fa fa-save"></i> Save Product
                                </button>
                                <button type="reset" class="btn btn-outline-secondary btn-lg px-5 ms-2">
                                    <i class="fa fa-undo"></i> Reset
                                </button>
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
    $('#hasVariations').change(function() {
        if($(this).is(':checked')) {
            $('#regularProductFields').hide();
            $('#variationsSection').show();
            $('.remove-variation').first().hide(); // Hide remove button for first variation
        } else {
            $('#regularProductFields').show();
            $('#variationsSection').hide();
        }
    });
    
    // Add new variation
    $('#addVariationBtn').click(function() {
        const container = $('.variation-container');
        const count = container.children().length;
        const newItem = container.children().first().clone();
        
        // Update indexes and clear values
        newItem.find('h6').text('Variation #' + (count + 1));
        newItem.find('input').val('');
        newItem.find('input[type="file"]').val('');
        
        // Update name attributes
        newItem.find('[name]').each(function() {
            const name = $(this).attr('name').replace(/\[\d+\]/, '[' + count + ']');
            $(this).attr('name', name);
        });
        
        // Show remove button
        newItem.find('.remove-variation').show();
        
        // Append to container
        container.append(newItem);
    });
    
    // Remove variation
    $(document).on('click', '.remove-variation', function() {
        if($('.variation-item').length > 1) {
            $(this).closest('.variation-item').remove();
            
            // Renumber remaining variations
            $('.variation-item').each(function(index) {
                $(this).find('h6').text('Variation #' + (index + 1));
                
                // Update name attributes
                $(this).find('[name]').each(function() {
                    const name = $(this).attr('name').replace(/variations\[\d+\]/, 'variations[' + index + ']');
                    $(this).attr('name', name);
                });
            });
        }
    });
    
    // Form validation
    $('#productForm').submit(function(e) {
        if($('#hasVariations').is(':checked')) {
            let valid = true;
            $('.variation-item').each(function() {
                const sellPrice = $(this).find('.variation-sell-price').val();
                const mrPrice = $(this).find('.variation-actual-price').val();
                const qty = $(this).find('.variation-available-qty').val();
                
                if(!sellPrice || !mrPrice || !qty) {
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