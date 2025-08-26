<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shipping;
use App\Models\Province;
use Yajra\DataTables\DataTables;
use App\CentralLogics\Helpers;

class ShippingController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = Shipping::with('province')->select('set_shipping.*');
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->addColumn('province', fn($row) => $row->province->province_name ?? '-')
                ->addColumn('apply_shipping', function($row) {
                    $apply_shipping = route('backend.setshipping.apply-shipping',[$row['id'],$row->apply_shipping?0:1]);
                    return view('backend.setshipping.partials.apply-shipping', compact('row', 'apply_shipping'))->render();
                })
                ->editColumn('created_at', function($row) {
                    return Helpers::time_date_format($row->created_at);
                })
                ->addColumn('action', function($row){
                    $view = route('backend.setshipping.view');
                    $edit = route('backend.setshipping.edit');
                    $delete = route('backend.setshipping.delete', $row->id);
                    return view('backend.setshipping.partials.actions', compact('row', 'view', 'edit', 'delete'))->render();
                })
                ->rawColumns(['apply_shipping', 'action'])
                ->make(true);
        }
        
        return view('backend.setshipping.index');
    }

    public function add()
    {
        $provinces = Province::all();
        return view('backend.setshipping.add', compact('provinces'));
    }

    public function view(Request $request)
    {
        $shipping = Shipping::with('province')->findOrFail($request->id);
        return view('backend.setshipping.view', compact('shipping'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'province' => 'required',
            'city' => 'required',
            'shipping_cost' => 'required'
        ]);
        $shipping = new Shipping();
        $shipping->province_id = $request->province;
        $shipping->city = $request->city;
        $shipping->shipping_cost = $request->shipping_cost;
        $shipping->apply_shipping = 1;
        $shipping->remarks = $request->remarks;
        if ($shipping->save()) {
            session()->flash('success', 'Shipping cost Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding shipping cost!');
        }
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost added successfully');
    }

    public function edit(Request $request)
    {
        $provinces = Province::all()->pluck('province_name', 'id');
        $shipping = Shipping::with('province')->findOrFail($request->id);
        return view('backend.setshipping.edit', compact('shipping', 'provinces'));
    }

    public function update(Request $request, $id)
    {
        $shipping = Shipping::findOrFail($id);
        $shipping->update($request->all());
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost updated successfully');
    }

    public function delete($id)
    {
        $shipping = Shipping::findOrFail($id);
        $shipping->delete();
        return redirect()->route('backend.setshipping.index')->with('success', 'Shipping Cost deleted successfully');
    }
    
    public function apply_shipping(Request $request, $id, $apply_shipping)
    {
        $shipping = Shipping::findOrFail($id);
        $shipping->apply_shipping = $apply_shipping;
        $shipping->save();

        return back()->with('Shipping applied.');
    }

}
