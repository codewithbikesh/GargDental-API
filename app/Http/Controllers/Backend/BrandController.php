<?php

namespace App\Http\Controllers\Backend;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use Yajra\DataTables\Facades\DataTables;

class BrandController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Brand::select('brands.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('top', function($row) {
                    $top = route('backend.brands.top',[$row['id'],$row->top?0:1]);
                    return view('backend.brands.partials.top', compact('row', 'top'))->render();
                })
                ->addColumn('status', function($row) {
                    $status = route('backend.brands.status',[$row['id'],$row->status?0:1]);
                    return view('backend.brands.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.brands.view');
                    $edit = route('backend.brands.edit');
                    return view('backend.brands.partials.actions', compact('row', 'view', 'edit'))->render();
                })
                ->rawColumns(['top','status','action'])
                ->make(true);
        }
        return view('backend.brands.index');
    }

    public function new(Request $request)
    {
        return view('backend.brands.new');
    }

    public function store(Request $request)
    {
        $request->validate([
            'brand_name' => 'required',
            'image' => 'mimes:jpg,jpeg,png',
        ]);

        $brand = new Brand();
        $brand->brand_name = $request->brand_name;
        $brand->image = Helpers::upload_file(dir: 'backend/brands/', file: $request->image);
        $brand->status = 1;
        $brand->save();

        return redirect()->route('backend.brands.index')->with('success', 'Brand Added Successfully.');
    }

    public function view(Request $request)
    {
        $brand = Brand::where('id', $request->input('brand_id'))->first();
        if (!$brand) {
            abort(404, 'Brand not found');
        }

        return view('backend.brands.view', compact('brand'));
    }
    
    public function edit(Request $request)
    {
        $brand_id = $request->input('brand_id');
        $brand = Brand::where('id', $brand_id)->first();
        
        if (!$brand) {
            abort(404, 'Brand not found');
        }

        return view('backend.brands.edit', compact('brand_id','brand'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'brand_name' => 'required'
        ]);
        $brand = Brand::where('id', $id)->first();
        $brand->brand_name = $request->brand_name;
        if ($request->has('image')) {
            $image_name =Helpers::update(dir:'backend/brands', old_image: $brand->image, format: 'png', image: $request->file('image'));
        } else {
            $image_name = $brand['image'];
        }
        $brand->image = $image_name;
        $brand->save();
        
        return redirect()->route('backend.brands.index')->with('success', 'Brand Updated Successfully.');
    }
    
    public function status(Request $request)
    {
        $brand = Brand::findOrFail($request->id);
        $brand->status = $request->status;
        $brand->save();

        return back()->with('Brand status updated.');
    }
    
    public function top(Request $request)
    {
        $brand = Brand::findOrFail($request->id);
        $brand->top = $request->top;
        $brand->save();

        return back()->with('Brand set to top.');
    }

}
