<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\CentralLogics\Helpers;
use Yajra\DataTables\Facades\DataTables;

class CategoryController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Category::select('categories.*')->withCount('children')->whereNull('parent_id');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('category_name', function($row) {
                    if ($row->children_count > 0) {
                        return '<span class="toggle-subcategory" data-id="' . $row->id . '" style="cursor:pointer;">
                                    <i class="fa fa-chevron-right"></i> ' . e($row->category_name) . '
                                </span>';
                    }
                    return e($row->category_name);
                })
                ->addColumn('top', function($row) {
                    $top = route('backend.categories.top',[$row['id'],$row->top?0:1]);
                    return view('backend.categories.partials.top', compact('row', 'top'))->render();
                })
                ->addColumn('status', function($row) {
                    $status = route('backend.categories.status',[$row['id'],$row->status?0:1]);
                    return view('backend.categories.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.categories.view');
                    $edit = route('backend.categories.edit');
                    return view('backend.categories.partials.actions', compact('row', 'view', 'edit'))->render();
                })
                ->rawColumns(['category_name','top','status','action'])
                ->make(true);
        }
        return view('backend.categories.index');
    }

    public function getSubcategories($id)
    {
        $subcategories = Category::where('parent_id', $id)
            ->withCount('children')
            ->get();
    
        return response()->json([
            'html' => view('backend.categories.partials.subcategories', [
                'subcategories' => $subcategories,
                'level' => 1
            ])->render()
        ]);
    }

    public function new(Request $request)
    {
        $categories = Category::whereNull('parent_id')->get();
        return view('backend.categories.new', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'category_name' => 'required',
            'image' => 'mimes:jpg,jpeg,png',
            'parent_id' => 'nullable|exists:categories,id'
        ]);

        $category = new Category();
        $category->category_name = $request->category_name;
        $category->parent_id = $request->parent_id;
        $category->image = Helpers::upload_file(dir: 'backend/categories/', file: $request->image);
        $category->status = 1;
        $category->save();

        return redirect()->route('backend.categories.index')->with('success', 'Category Added Successfully.');
    }

    public function view(Request $request)
    {
        $category = Category::where('id', $request->input('category_id'))->first();
        if (!$category) {
            abort(404, 'Category not found');
        }

        return view('backend.categories.view', compact('category'));
    }
    
    public function edit(Request $request)
    {
        $category_id = $request->input('category_id');
        $category = Category::where('id', $request->input('category_id'))->first();
        
        $categories = Category::with('children')
            ->whereNull('parent_id')
            ->where('id', '!=', $category_id)
            ->get();

        if (!$category) {
            abort(404, 'Category not found');
        }

        return view('backend.categories.edit', compact('category_id','category', 'categories'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'category_name' => 'required'
        ]);
        $category = Category::where('id', $id)->first();
        $category->category_name = $request->category_name;
        $category->parent_id = $request->parent_id;
        if ($request->has('image')) {
            $image_name =Helpers::update(dir:'backend/categories', old_image: $category->image, format: 'png', image: $request->file('image'));
        } else {
            $image_name = $category['image'];
        }
        $category->image = $image_name;
        $category->save();
        
        return redirect()->route('backend.categories.index')->with('success', 'Category Updated Successfully.');
    }
    
    public function status(Request $request)
    {
        $category = Category::findOrFail($request->id);
        $category->status = $request->status;
        $category->save();

        return back()->with('Category status updated.');
    }
    
    public function top(Request $request)
    {
        $category = Category::findOrFail($request->id);
        $category->top = $request->top;
        $category->save();

        return back()->with('Category set to top.');
    }
    
}
