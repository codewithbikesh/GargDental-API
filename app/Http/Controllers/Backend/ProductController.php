<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductImages;
use App\CentralLogics\Helpers;
use App\Models\Brand;
use App\Models\Category;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Str;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Product::with('category')->whereNull('parent_id')->select('products.*')->orderBy('id', 'desc');
            if ($request->has('category_id') && $request->category_id != '') {
                $data->where('category_id', $request->category_id);
            }
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('category', function($row) {
                    return $row->category->category_name ?? '-';
                })    
                ->addColumn('has_variations', function($row) {
                    return $row->has_variations ? 'Yes' : 'No';
                })
                ->addColumn('status', function($row) {
                    $status = route('backend.products.status',[$row['id'],$row->status?0:1]);
                    return view('backend.products.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.products.view');
                    $edit = route('backend.products.edit');
                    return view('backend.products.partials.actions', compact('row', 'view', 'edit'))->render();
                })
                ->editColumn('created_at', function($row) {
                    return $row->created_at ? $row->created_at->format('Y-m-d') : '-';
                })
                ->rawColumns(['status','action'])
                ->make(true);
        }
        $categories = Category::whereNull('parent_id')->get(); 
        return view('backend.products.index', compact('categories'));
    }
    
          // Single toggle
     public function toggleStatus(Request $request)
     {
         $product = Product::find($request->id);
         if ($product) {
             $product->status = $request->status;
             $product->save();
         }
         return response()->json(['success' => true]);
     }
     
     // Bulk toggle (only current page ids)
     public function bulkToggleStatus(Request $request)
     {
         if ($request->ids && is_array($request->ids)) {
             Product::whereIn('id', $request->ids)->update(['status' => $request->status]);
         }
         return response()->json(['success' => true]);
     }


    public function new(Request $request)
    {
        $lastProductCode = Product::latest('id')->value('product_code');
        $newProductCode = $this->generateProductCode($lastProductCode);
        $categories = Category::with('children')
            ->whereNull('parent_id')
            ->get();
        $brands = Brand::get();

        return view('backend.products.new', compact('categories', 'brands', 'newProductCode'));
    }

    private function generateProductCode($lastProductCode)
    {
        if (!$lastProductCode) {
            return 'P00001';
        }

        $lastNumber = (int)substr($lastProductCode, 1);
        $newNumber = $lastNumber + 1;
        return 'P' . str_pad($newNumber, 5, '0', STR_PAD_LEFT);
    }

    public function store(Request $request)
    {
        $request->validate([
            'product_code' => 'required',
            'product_name' => 'required',
            'product_description' => 'required',
            'category_id' => 'required',
            'brand_id' => 'required',
            'actual_price' => 'required_unless:has_variations,1|nullable',
            'sell_price' => 'required_unless:has_variations,1|nullable',
            'available_quantity' => 'required_unless:has_variations,1|nullable',
            'stock_quantity' => 'required_unless:has_variations,1|nullable',
            'main_image' => 'nullable|file|mimes:jpeg,jpg,png,gif',
            'product_catalogue' => 'nullable|file|mimes:pdf,jpeg,jpg,png,gif'
        ]);

        $has_variations = 0;
        $flash_sale = 0;
        $weekly_offer = 0;
        $special_offer = 0;
        try {
            DB::beginTransaction();

            $product = new Product();        
            $product->product_code = $request->product_code;
            $product->product_name = $request->product_name;
            $product->slug = Str::slug($request->product_name) . '-' . $request->product_code;
            $product->category_id = $request->category_id;
            $product->brand_id = $request->brand_id;
            $product->delivery_target_days = $request->delivery_target_days;
            $product->flash_sale = $request->flash_sale ?? $flash_sale;
            $product->weekly_offer = $request->weekly_offer ?? $weekly_offer;
            $product->special_offer = $request->special_offer ?? $special_offer;
            $product->has_variations = $request->has_variations ?? $has_variations;
            $product->product_description = $request->product_description;
            $product->key_specifications = $request->key_specifications;
            $product->packaging = $request->packaging;
            $product->warranty = $request->warranty;                    
            $product->main_image = Helpers::upload(dir: 'backend/productimages/' . $request->product_code . '/', format: 'png', image: $request->main_image);
            $product->product_catalogue = Helpers::upload_file(dir: 'backend/productcatalogue/' . $request->product_code . '/', file: $request->product_catalogue);

            $product->status = 1;
                    
            if ($request->has_variations == 1) {
                $product->actual_price = 0;
                $product->sell_price = 0;
                $product->available_quantity = 0;
                $product->stock_quantity = 0;
                $product->discount = 0;
            } else {
                $product->actual_price = $request->actual_price;
                $product->sell_price = $request->sell_price;
                $product->available_quantity = $request->available_quantity;
                $product->stock_quantity = $request->stock_quantity;
                $product->discount = $request->actual_price - $request->sell_price;
            }

            $product->save();
            
            if ($request->has_variations == 1 && $request->has('variations')) {
                foreach ($request->variations as $variation) {
                    $variant = new Product();
                    $lastProductCode = Product::latest('id')->value('product_code');
                    $newProductCode = $this->generateProductCode($lastProductCode);
                    $variant->product_code = $newProductCode;
                    $variant->parent_id = $product->id;
                    
                    if (!empty($variation['image']) && $variation['image'] instanceof \Illuminate\Http\UploadedFile) {
                        $variant->main_image = Helpers::update(
                            dir: 'backend/productimages/' . $product->product_code . '/',
                            old_image: $variant->main_image,
                            format: 'png',
                            image: $variation['image']
                        );
                    }

                    $variant->product_name = $variation['name'];
                    $variant->slug = Str::slug($variation['name']);
                    $variant->discount = $variation['actual_price'] - $variation['sell_price'];
                    $variant->actual_price = $variation['actual_price'];
                    $variant->sell_price = $variation['sell_price'];
                    $variant->available_quantity = $variation['available_quantity'];
                    $variant->stock_quantity = $variation['stock_quantity'];
                    $variant->status = 1;
                    $variant->save();
                }
            };

            DB::commit();

            return redirect()->route('backend.products.index')->with('success', 'Product Added Successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->withInput()->with('error', 'Failed to add product: ' . $e->getMessage());
        }
    }

    public function view(Request $request)
    {
        $product = Product::with('productimages')->where('product_code', $request->input('product_code'))->first();
        if (!$product) {
            abort(404, 'Product not found');
        }

        return view('backend.products.view', compact('product'));
    }
    
    public function edit(Request $request)
    {
        $product_code = $request->product_code;
        $categories = Category::with('children')
            ->whereNull('parent_id')
            ->get();
        $brands = Brand::get();
        $product = Product::with('variations')->where('product_code', $request->product_code)->first();
        $images = ProductImages::where('product_code', $request->product_code)->get();
        
        if (!$product) {
            abort(404, 'Product not found');
        }

        return view('backend.products.edit', compact('product_code','product', 'images', 'categories', 'brands'));
    }
    
    public function update(Request $request, $id)
    {
        $request->validate([
            'product_name' => 'required',
            'product_description' => 'required',
            'category_id' => 'required',
            'actual_price' => 'required_unless:has_variations,1|nullable|decimal:0,2',
            'sell_price' => 'required_unless:has_variations,1|nullable|decimal:0,2',
            'available_quantity' => 'required_unless:has_variations,1|nullable|decimal:0,2',
            'stock_quantity' => 'required_unless:has_variations,1|nullable|decimal:0,2',
            'main_image' => 'nullable|file|mimes:jpeg,jpg,png,gif',
            'product_catalogue' => 'nullable|file|mimes:pdf,jpeg,jpg,png,gif'
        ]);

        $has_variations = 0;
        $flash_sale = 0;
        $weekly_offer = 0;
        $special_offer = 0;
        try {
            DB::beginTransaction();

            $product = Product::findOrFail($id);
            
            // Update main product details
            $product->product_name = $request->product_name;
            $product->slug = Str::slug($request->product_name) . '-' . $request->product_code;
            $product->category_id = $request->category_id;
            $product->brand_id = $request->brand_id;
            $product->delivery_target_days = $request->delivery_target_days;
            $product->flash_sale = $request->flash_sale ?? $flash_sale;
            $product->weekly_offer = $request->weekly_offer ?? $weekly_offer;
            $product->special_offer = $request->special_offer ?? $special_offer;
            $product->has_variations = $request->has_variations ?? $has_variations;
            $product->product_description = $request->product_description;
            $product->key_specifications = $request->key_specifications;
            $product->packaging = $request->packaging;
            $product->warranty = $request->warranty;

            if ($request->remove_main_image) {
                $response = Helpers::check_and_delete(dir:'backend/productimages/' . $request->product_code, old_image: $product->main_image);
                if ($response) {
                    $product->main_image = null;
                }
            }

            if ($request->remove_catalogue) {
                $response = Helpers::check_and_delete_file(dir:'backend/productcatalogue/' . $request->product_code, old_file: $product->product_catalogue);
                if ($response) {
                    $product->product_catalogue = null;
                }
            }

            // Handle product images
            if ($request->hasFile('main_image')) {
                $product->main_image =Helpers::update(dir:'backend/productimages/' . $request->product_code, old_image: $product->main_image, format: 'png', image: $request->file('main_image'));
            }

            if ($request->hasFile('product_catalogue')) {                
                $product->product_catalogue =Helpers::update_file(dir:'backend/productcatalogue/' . $request->product_code, old_file: $product->product_catalogue, file: $request->file('product_catalogue'));
            }

            // Handle regular product fields
            if ($request->has_variations == 1) {
                $product->actual_price = 0;
                $product->sell_price = 0;
                $product->available_quantity = 0;
                $product->stock_quantity = 0;
                $product->discount = 0;
            } else {
                $product->actual_price = $request->actual_price;
                $product->sell_price = $request->sell_price;
                $product->available_quantity = $request->available_quantity;
                $product->stock_quantity = $request->stock_quantity;
                $product->discount = $request->actual_price - $request->sell_price;
                
                // Delete all variations if switching from variations to simple products
                Product::where('parent_id', $product->id)->delete();
            }

            $product->save();

            // Handle variations if enabled
            if ($request->has_variations == 1) {

                // Update existing variations
                if ($request->has('existing_variations')) {
                    foreach ($request->existing_variations as $variation) {
                        $variant = Product::find($variation['id']);
                        if ($variant) {          
                            $variant->product_name = $variation['name'];
                            $variant->slug = Str::slug($variation['name']) . '-' . $variant['product_code'];
                            $variant->actual_price = $variation['actual_price'];
                            $variant->sell_price = $variation['sell_price'];
                            $variant->available_quantity = $variation['available_quantity'];
                            $variant->stock_quantity = $variation['stock_quantity'];
                            $variant->discount = $variation['actual_price'] - $variation['sell_price'];
                            
                            if (!empty($variation['image']) && $variation['image'] instanceof \Illuminate\Http\UploadedFile) {
                                $variant->main_image = Helpers::update(
                                    dir: 'backend/productimages/' . $product->product_code . '/',
                                    old_image: $variant->main_image,
                                    format: 'png',
                                    image: $variation['image']
                                );
                            }
                            $variant->save();
                        }
                    }
                }

                // Add new variations
                if ($request->has('variations')) {
                    foreach ($request->variations as $variation) {
                        $variant = new Product();
                        $lastProductCode = Product::latest('id')->value('product_code');
                        $newProductCode = $this->generateProductCode($lastProductCode);
                        $variant->product_code = $newProductCode;
                        $variant->parent_id = $product->id;    
                        
                        if (!empty($variation['image']) && $variation['image'] instanceof \Illuminate\Http\UploadedFile) {
                            $variant->main_image = Helpers::upload(
                                dir: 'backend/productimages/' . $product->product_code . '/',
                                format: 'png',
                                image: $variation['image']
                            );
                        }                

                        $variant->product_name = $variation['name'];
                        $variant->slug = Str::slug($variation['name']) . '-' . $newProductCode;
                        $variant->actual_price = $variation['actual_price'];
                        $variant->sell_price = $variation['sell_price'];
                        $variant->available_quantity = $variation['available_quantity'];
                        $variant->stock_quantity = $variation['stock_quantity'];
                        $variant->discount = $variation['actual_price'] - $variation['sell_price'];
                        $variant->status = 1;
                        $variant->save();
                    }
                }
            }

            DB::commit();

            return redirect()->route('backend.products.index')->with('success', 'Product Updated Successfully.');
        } catch (\Exception $e) {
            DB::rollBack();

            return redirect()->back()
                ->withInput()
                ->with('error', 'Failed to update product: ' . $e->getMessage());
        }
    }

    public function upload_images(Request $request)
    {
        $request->validate([
            'product_code' => 'required|string',
            'images.*' => 'required|image|mimes:jpeg,png,jpg,gif,webp|max:2048'
        ]);

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $uploadedFile) {
                $storedPath = Helpers::upload_file(
                    dir: 'backend/productimages/' . $request->product_code . '/',
                    file: $uploadedFile
                );

                $newImage = new ProductImages();
                $newImage->product_code = $request->product_code;
                $newImage->image_path = $storedPath;
                $newImage->save();
            }
        }

        return back()->with('success', 'Images uploaded successfully.');
    }

    public function deleteImage($id, $product_code)
    {
        $image = ProductImages::findOrFail($id);
        Helpers::check_and_delete_file(
                    dir: 'backend/productimages/' . $product_code . '/',
                    old_file: $image->image_path
                );
        $image->delete();

        return back()->with('success', 'Image deleted successfully.');
    }

    public function deleteVariation($product_code)
    {
        $variation = Product::where('product_code', $product_code)->first();
        $parent = Product::findOrFail($variation->parent_id);
        Helpers::check_and_delete_file(
                    dir: 'backend/productimages/' . $parent->product_code . '/',
                    old_file: $variation->main_image
                );
        $variation->delete();

        return back()->with('success', 'Variation deleted successfully.');
    }

    public function uploadFiles(Request $request, $product_code)
    {
        $request->validate([
            'product_code' => 'required',
            'product_name' => 'required',
            'product_description' => 'required',
            'category_id' => 'required'
        ]);

        $product = Product::where('product_code', $product_code)->first();
        $product->product_code = $request->product_code;
        $product->product_name = $request->product_name;
        $product->slug = Str::slug($request->product_name);
        $product->product_description = $request->product_description;
        $product->category_id = $request->category_id;
        $product->brand_id = $request->brand_id;
        $product->delivery_target_days = $request->delivery_target_days;
        $product->discount = $request->discount;
        $product->sell_price = $request->sell_price;
        $product->mr_price = $request->mr_price;
        $product->available_quantity = $request->available_quantity;
        $product->stock_quantity = $request->stock_quantity;
        $product->unit_info = $request->unit_info;
        $product->flash_sale = $request->flash_sale;
        $product->save();
        
        // if ($request->has('has_variations')) {
        //     // Handle variations update
        //     if ($request->has('variation_ids')) {
        //         // Update existing variations
        //         foreach ($request->variation_ids as $index => $variationId) {
        //             $variation = ProductVariation::find($variationId);
        //             if ($variation) {
        //                 $variation->update([
        //                     'price' => $request->variation_prices[$index],
        //                     'stock' => $request->variation_stocks[$index],
        //                     'sku' => $request->variation_skus[$index],
        //                 ]);
        //             }
        //         }
        //     }
            
        //     // Handle new variations
        //     if ($request->has('variation_values')) {
        //         foreach ($request->variation_values as $index => $variation) {
        //             if (!isset($request->variation_ids[$index])) {
        //                 $product->variations()->create([
        //                     'attributes' => json_encode($variation),
        //                     'price' => $request->variation_prices[$index],
        //                     'stock' => $request->variation_stocks[$index],
        //                     'sku' => $request->variation_skus[$index],
        //                 ]);
        //             }
        //         }
        //     }
                    
        //     $product->update([
        //         'sell_price' => 0,
        //         'mr_price' => 0,
        //         'available_quantity' => 0,
        //         'stock_quantity' => 0,
        //     ]);
        // } else {
        //     $product->update([
        //         'sell_price' => $request->sell_price,
        //         'mr_price' => $request->mr_price,
        //         'available_quantity' => $request->available_quantity,
        //         'stock_quantity' => $request->stock_quantity,
        //     ]);
            
        //     $product->variations()->delete();
        // }

        $deleteFiles = $request->input('delete_files', []);
        if(!empty($deleteFiles)) {
            foreach ($deleteFiles as $fileId) {
                $image = ProductImages::where('id', $fileId)->where('product_code', $request->product_code)->first();
                Helpers::check_and_delete_file(dir: 'backend/productimages/' . $request->product_code, old_file: $image->image_path);
                $image->storage()->delete();
                $image->delete();
            }
        }

        if ($request->hasFile('product_files')) {
            $fileIds = $request->input('file_ids', []);
            
            foreach ($request->file('product_files') as $index => $uploadedFile) {
                $isReplacement = isset($fileIds[$index]) && !empty($fileIds[$index]);
                
                if ($isReplacement) {
                    $existingImage = ProductImages::where('id', $fileIds[$index])
                                        ->where('product_code', $request->product_code)
                                        ->first();
                    
                    if ($existingImage) {
                        $existingImage->product_code = $request->product_code ?? null;
                        $existingImage->image_path = Helpers::update_file(dir: 'backend/productimages/' . $request->product_code . '/', old_file: $existingImage->image_path, file: $uploadedFile);
                        $existingImage->save();
                    }
                } else {
                    $newImage = new ProductImages();
                    $newImage->product_code = $request->product_code ?? null;
                    $newImage->image_path = Helpers::upload_file(dir: 'backend/productimages/' . $request->product_code . '/', file: $uploadedFile);
                    $newImage->save();
                }
            }
        }

        return redirect()->route('backend.products.edit', ['product_code' => $request->product_code])->with('success', 'Product updated successfully!');
    }

    public function status(Request $request)
    {
        $product = Product::findOrFail($request->id);
        $product->status = $request->status;
        $product->save();

        return back()->with('Product status updated.');
    }

}
