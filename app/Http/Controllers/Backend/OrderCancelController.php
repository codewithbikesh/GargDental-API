<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\OrderCancelReasons;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class OrderCancelController extends Controller
{ 
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = OrderCancelReasons::select('order_cancel_reasons.*')->latest();
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->addColumn('status', function($row) {
                    $status = route('backend.cancelreasons.status',[$row['id'],$row->status?0:1]);
                    return view('backend.cancelreasons.partials.status', compact('row', 'status'))->render();
                })
                ->addColumn('action', function($row) {
                    $edit = route('backend.cancelreasons.edit');
                    $delete = route('backend.cancelreasons.delete', $row->id);
                    return view('backend.cancelreasons.partials.actions', compact('row', 'edit', 'delete'))->render();
                })
                ->rawColumns(['status','action'])
                ->make(true);
        }

        return view('backend.cancelreasons.index');
    }
    
    public function add()
    {
        return view('backend.cancelreasons.add');
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'reason_name' => 'required',
        ]);
        $cancelreason = new OrderCancelReasons();
        $cancelreason->reason_name = $request->reason_name;
        $cancelreason->reason_type = $request->reason_type;
        $cancelreason->reason_for = $request->reason_for;
        if ($cancelreason->save()) {
            session()->flash('success', 'Reason Added Successfully !');
        } else {
            session()->flash('error', 'Error occured while adding reason!');
        }
        return redirect()->route('backend.cancelreasons.index');
    }

    
    public function edit(Request $request)
    {
        $cancelreason = OrderCancelReasons::findOrFail($request->id);
        return view('backend.cancelreasons.edit', compact('cancelreason'));
    }

    public function update(Request $request, $id)
    {
        $cancelreason = OrderCancelReasons::findOrFail($id);
        $cancelreason->reason_name = $request->reason_name;
        $cancelreason->reason_type = $request->reason_type;
        $cancelreason->reason_for = $request->reason_for;
        $cancelreason->save();
        return redirect()->route('backend.cancelreasons.index')->with('success', 'Reason Detail updated successfully');
    }

    public function status(Request $request)
    {
        $cancelreason = OrderCancelReasons::findOrFail($request->id);
        $cancelreason->status = $request->status;
        $cancelreason->save();

        return back()->with('success' , 'Cancel reason status updated.');
    }
    
    public function delete($id)
    {
        $cancelreason = OrderCancelReasons::findOrFail($id);
        $cancelreason->delete();
        return redirect()->route('backend.cancelreasons.index')->with('success', 'Reason deleted successfully');
    }

}
