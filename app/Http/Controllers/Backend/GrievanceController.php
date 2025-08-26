<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\CentralLogics\Helpers;
use App\Models\Grievance;

class GrievanceController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = Grievance::select('grievances.*')->latest();
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->editColumn('email', function ($row) {
                    return '<a href="mailto:' . e($row->email) . '">' . e($row->email) . '</a>';
                })
                ->editColumn('created_at', function ($row) {
                    return \Carbon\Carbon::parse($row->created_at)->format('Y-m-d');
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.grievances.view');
                    $delete = route('backend.grievances.delete', $row->id);
                    return view('backend.grievances.partials.actions', compact('row', 'view', 'delete'))->render();
                })
                ->rawColumns(['email', 'action'])
                ->make(true);
        }

        return view('backend.grievances.index');
    }

    public function view(Request $request)
    {
        $grievance = Grievance::findOrFail($request->id);
        return view('backend.grievances.view', compact('grievance'));
    }

    public function delete($id)
    {
        $grievance = Grievance::findOrFail($id);
        $grievance->delete();
        return redirect()->route('backend.grievances.index')->with('success', 'Grievance deleted successfully');
    }

}
