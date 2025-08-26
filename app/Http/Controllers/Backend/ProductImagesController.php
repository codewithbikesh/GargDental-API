<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Imports\ProductImagesImport;
use App\Imports\ProductsImport;
use App\Exports\ImageTemplateExport;
use App\Exports\CategoriesTemplateExport;
use App\Exports\BrandsTemplateExport;
use App\Exports\ProductTemplateExport;
use App\Models\Category;
use Maatwebsite\Excel\Facades\Excel;

class ProductImagesController extends Controller
{

    public function index()
    {
        $categories = Category::active()->where('parent_id', null)->get();
        return view('backend.uploadproductimages.index', compact('categories'));
    }

    public function import_image(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv'
        ]);

        Excel::import(new ProductImagesImport, $request->file('file'));

        return redirect()->back()->with('success', 'Import successful!');
    }
    
    public function upload_products(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv'
        ]);

        Excel::import(new ProductsImport, $request->file('file'));

        return redirect()->back()->with('success', 'Products upload successful!');
    }
    
    public function downloadTemplate($category_id)
    {
        return Excel::download(new ImageTemplateExport($category_id), 'image_template.xlsx');
    }
    
    public function downloadCategoriesTemplate()
    {
        return Excel::download(new CategoriesTemplateExport(), 'categories.xlsx');
    }
    
    public function downloadBrandsTemplate()
    {
        return Excel::download(new BrandsTemplateExport(), 'brands.xlsx');
    }

    public function downloadProductTemplate()
    {
        return Excel::download(new ProductTemplateExport(), 'product_template.xlsx');
    }
    
}
