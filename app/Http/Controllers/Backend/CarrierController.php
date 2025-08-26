<?php

namespace App\Http\Controllers\Backend;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use App\Models\ShippingCarrier;
use Yajra\DataTables\Facades\DataTables;

class CarrierController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = ShippingCarrier::select('shipping_carriers.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('status', function($row) {
                    $status = route('backend.carriers.status',[$row['id'],$row->status?0:1]);
                    return view('backend.carriers.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.carriers.view');
                    $edit = route('backend.carriers.edit');
                    return view('backend.carriers.partials.actions', compact('row', 'view', 'edit'))->render();
                })
                ->rawColumns(['status','action'])
                ->make(true);
        }
        return view('backend.carriers.index');
    }

    public function new(Request $request)
    {
        return view('backend.carriers.new');
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'type' => 'required'
        ]);

        $carrier = new ShippingCarrier();
        $carrier->name = $request->name;
        $carrier->address = $request->address;
        $carrier->phone = $request->phone;
        $carrier->type = $request->type;
        $carrier->status = 1;
        $carrier->save();

        return redirect()->route('backend.carriers.index')->with('success', 'Carrier Added Successfully.');
    }

    public function view(Request $request)
    {
        $carrier = ShippingCarrier::where('id', $request->input('carrier_id'))->first();
        if (!$carrier) {
            abort(404, 'Carrier not found');
        }

        return view('backend.carriers.view', compact('carrier'));
    }
    
    public function edit(Request $request)
    {
        $carrier_id = $request->input('carrier_id');
        $carrier = ShippingCarrier::where('id', $carrier_id)->first();
        
        if (!$carrier) {
            abort(404, 'Carrier not found');
        }

        return view('backend.carriers.edit', compact('carrier_id','carrier'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'address' => 'required',
            'phone' => 'required',
            'type' => 'required'
        ]);
        $carrier = ShippingCarrier::where('id', $id)->first();
        $carrier->name = $request->name;
        $carrier->address = $request->address;
        $carrier->phone = $request->phone;
        $carrier->type = $request->type;
        $carrier->save();
        
        return redirect()->route('backend.carriers.index')->with('success', 'Carrier Updated Successfully.');
    }
    
    public function status(Request $request)
    {
        $carrier = ShippingCarrier::findOrFail($request->id);
        $carrier->status = $request->status;
        $carrier->save();

        return back()->with('Carrier status updated.');
    }

}
