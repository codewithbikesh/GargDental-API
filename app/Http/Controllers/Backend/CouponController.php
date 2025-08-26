<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Coupon;
use Yajra\DataTables\Facades\DataTables;

class CouponController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = Coupon::select('coupons.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('status', function($row) {
                    $status = route('backend.coupons.status',[$row['id'],$row->status?0:1]);
                    return view('backend.coupons.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.coupons.view');
                    $edit = route('backend.coupons.edit');
                    return view('backend.coupons.partials.actions', compact('row', 'view', 'edit'))->render();
                })
                ->rawColumns(['status','action'])
                ->make(true);
        }
        return view('backend.coupons.index');
    }

    public function new(Request $request)
    {
        return view('backend.coupons.new');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'code' => 'required'
        ]);

        $coupon = new Coupon();
        $coupon->title = $request->title;
        $coupon->code = $request->code;
        $coupon->start_date = $request->start_date;
        $coupon->expire_date = $request->expire_date;
        $coupon->minimum_purchase = $request->minimum_purchase;
        $coupon->discount = $request->discount;
        $coupon->status = 0;
        $coupon->save();

        return redirect()->route('backend.coupons.index')->with('success', 'Coupon Added Successfully.');
    }

    public function view(Request $request)
    {
        $coupon = Coupon::where('id', $request->coupon_id)->first();
        if (!$coupon) {
            abort(404, 'Coupon not found');
        }

        return view('backend.coupons.view', compact('coupon'));
    }
    
    public function edit(Request $request)
    {
        $coupon_id = $request->coupon_id;
        $coupon = Coupon::where('id', $coupon_id)->first();
        
        if (!$coupon) {
            abort(404, 'Coupon not found');
        }

        return view('backend.coupons.edit', compact('coupon_id','coupon'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'code' => 'required'
        ]);
        $coupon = Coupon::where('id', $id)->first();
        $coupon->title = $request->title;
        $coupon->code = $request->code;
        $coupon->start_date = $request->start_date;
        $coupon->expire_date = $request->expire_date;
        $coupon->minimum_purchase = $request->minimum_purchase;
        $coupon->discount = $request->discount;
        $coupon->save();
        
        return redirect()->route('backend.coupons.index')->with('success', 'Coupon Updated Successfully.');
    }
    
    public function status(Request $request)
    {
        $coupon = Coupon::findOrFail($request->id);
        $coupon->status = $request->status;
        $coupon->save();

        return back()->with('Coupon status updated.');
    }

}
