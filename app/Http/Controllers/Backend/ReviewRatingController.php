<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reviews;
use Yajra\DataTables\Facades\DataTables;

class ReviewRatingController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Reviews::with('product')->select('product_reviews.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('product', fn($row) => $row->product->product_name ?? '-')
                ->addColumn('action', function($row){
                    $delete = route('backend.ratings.delete', $row->id);
                    return view('backend.ratings.partials.actions', compact('row', 'delete'))->render();
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('backend.ratings.index');
    }

    public function delete($id)
    {
        $review = Reviews::findOrFail($id);
        $review->delete();
        return redirect()->route('backend.ratings.index')->with('success', 'Review deleted successfully');
    }
    
}
