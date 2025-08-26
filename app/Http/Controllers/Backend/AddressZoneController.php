<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AddressZone;
use App\Models\Shipping;
use Yajra\DataTables\Facades\DataTables;
use App\CentralLogics\Helpers;

class AddressZoneController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = AddressZone::with('city')->select('address_zone.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->addColumn('city', fn($row) => $row->city->city ?? '-')
                ->editColumn('created_at', function($row) {
                    return Helpers::time_date_format($row->created_at);
                })
                ->addColumn('action', function($row){
                    $view = route('backend.addresszone.view');
                    $edit = route('backend.addresszone.edit');
                    $delete = route('backend.addresszone.delete', $row->id);
                    return view('backend.addresszone.partials.actions', compact('row', 'view', 'edit', 'delete'))->render();
                })
                ->rawColumns(['action'])
                ->make(true);
        }
    
        $cities = Shipping::all();
        return view('backend.addresszone.index', compact('cities'));
    }

    public function view(Request $request)
    {
        $zone = AddressZone::with('city')->findOrFail($request->id);
        return view('backend.addresszone.view', compact('zone'));
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'city_id' => 'required',
            'zone_name' => 'required'
        ]);
        $addresszone = new AddressZone();
        $addresszone->city_id = $request->city_id;
        $addresszone->zone_name = $request->zone_name;
        if ($addresszone->save()) {
            session()->flash('success', 'Address Zone Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding address zone!');
        }
        return redirect()->route('backend.addresszone.index')->with('success', 'Address Zone added successfully');
    }
    
    public function edit(Request $request)
    {
        $cities = Shipping::all()->pluck('city', 'id');
        $zone = AddressZone::with('city')->findOrFail($request->id);
        return view('backend.addresszone.edit', compact('cities', 'zone'));
    }
    
    public function update(Request $request, $id)
    {
        $zone = AddressZone::findOrFail($id);
        $zone->update($request->all());
        return redirect()->route('backend.addresszone.index')->with('success', 'Address Zone updated successfully');
    }
    
    public function delete($id)
    {
        $zone = AddressZone::findOrFail($id);
        $zone->delete();
        return redirect()->route('backend.addresszone.index')->with('success', 'Address Zone deleted successfully');
    }

}
