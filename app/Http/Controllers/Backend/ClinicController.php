<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\CentralLogics\Helpers;
use App\Models\ClinicSetupRequest;
use App\Models\Compliance;
use Yajra\DataTables\Facades\DataTables;

class ClinicController extends Controller
{
    public function index(Request $request)
    {
        if ($request->ajax()) {
            $data = ClinicSetupRequest::select('clinic_setup_requests.*');
            return DataTables::eloquent($data)
                ->addIndexColumn()
                ->editColumn('created_at', function ($row) {
                    return $row->created_at ? $row->created_at->format('Y-m-d') : '';
                })
                ->make(true);
        }
        return view('backend.clinic.index');
    }

    public function setup(Request $request)
    {
        $clinic = Compliance::whereIn('key', ['clinic_cover_image', 'clinic_video_title', 'clinic_video_link', 'clinic_video_description'])->get()->keyBy('key');
        if (isset($clinic['clinic_cover_image'])) {
            $clinic['clinic_cover_image']->append('clinic_cover_image_full_url');
        }

        return view('backend.clinic.setup', compact('clinic'));
    }

    public function store_cover(Request $request)
    {
        $request->validate([
            'clinic_cover_image' => 'mimes:jpg,jpeg,png,webp',
        ]);

        Compliance::updateOrCreate(
            ['key' => 'clinic_cover_image'],
            ['value' => Helpers::update(dir: 'backend/clinic/', old_image: $request->old_clinic_cover_page, format: 'png', image: $request->clinic_cover_image)]
        );

        return redirect()->route('backend.clinic.setup')->with('success', 'Cover Image added successfully.');
    }


    public function store_video(Request $request)
    {
        Compliance::updateOrCreate(
            ['key' => 'clinic_video_title'],
            ['value' => $request->clinic_video_title]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'clinic_video_link'],
            ['value' => $request->clinic_video_link]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'clinic_video_description'],
            ['value' => $request->clinic_video_description]
        );

        return redirect()->route('backend.clinic.setup')->with('success', 'Clinic Video Details updated successfully.');
    }
}
