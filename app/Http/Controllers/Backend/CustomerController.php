<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Yajra\DataTables\DataTables;

class CustomerController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {    
        if ($request->ajax()) {
            $data = User::where('is_email_verified', 1);
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $view = route('backend.customers.view');
                    return view('backend.customers.partials.actions', compact('row', 'view'))->render();
                })
                ->rawColumns(['action'])
                ->make(true);
        }
        return view('backend.customers.index');
    }

    public function view(Request $request)
    {
        $customer = User::with(['addresses' => function($query) {
            $query->where('address_type', 'H')
                ->orWhere(function($subQuery) {
                    $subQuery->where('address_type', '<>', 'H')
                                ->limit(1);
                });
        }, 'addresses.province', 'addresses.city', 'addresses.zone'])->findOrFail($request->id);    
        $orderCount = $customer->orders()->count();

        return view('backend.customers.view', compact('customer', 'orderCount'));
    }

}
