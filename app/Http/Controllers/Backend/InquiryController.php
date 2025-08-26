<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Inquiry;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\CentralLogics\Helpers;

class InquiryController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = Inquiry::select('inquiries.*')->latest();
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->editColumn('email', function ($row) {
                    return '<a href="mailto:' . e($row->email) . '">' . e($row->email) . '</a>';
                })
                ->editColumn('created_at', function ($row) {
                    return \Carbon\Carbon::parse($row->created_at)->format('Y-m-d');
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.inquiries.view');
                    $delete = route('backend.inquiries.delete', $row->id);
                    return view('backend.inquiries.partials.actions', compact('row', 'view', 'delete'))->render();
                })
                ->rawColumns(['email', 'action'])
                ->make(true);
        }

        return view('backend.inquiries.index');
    }

    public function view(Request $request)
    {
        $inquiry = Inquiry::findOrFail($request->id);
        return view('backend.inquiries.view', compact('inquiry'));
    }

    public function delete($id)
    {
        $inquiry = Inquiry::findOrFail($id);
        $inquiry->delete();
        return redirect()->route('backend.inquiries.index')->with('success', 'Inquiry deleted successfully');
    }

}
