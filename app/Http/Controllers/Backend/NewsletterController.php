<?php

namespace App\Http\Controllers\Backend;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Newsletter;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class NewsletterController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = Newsletter::select('newsletter_subscribers_list.*');
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->editColumn('email', function ($row) {
                    return '<a href="mailto:' . e($row->email) . '">' . e($row->email) . '</a>';
                })
                ->editColumn('created_at', function ($row) {
                    return \Carbon\Carbon::parse($row->created_at)->format('Y-m-d');
                })
                ->addColumn('action', function($row) {
                    $view = route('backend.newsletters.view');
                    $delete = route('backend.newsletters.delete', $row->id);
                    return view('backend.newsletters.partials.actions', compact('row', 'view', 'delete'))->render();
                })
                ->rawColumns(['email', 'action'])
                ->make(true);
        }

        return view('backend.newsletters.index');
    }

    public function view(Request $request)
    {
        $newsletter = Newsletter::findOrFail($request->id);
        return view('backend.newsletters.view', compact('newsletter'));
    }

    public function delete($id)
    {
        $newsletter = Newsletter::findOrFail($id);
        $newsletter->delete();
        return redirect()->route('backend.newsletters.index')->with('success', 'Newsletter Subscriber deleted successfully');
    }
}
