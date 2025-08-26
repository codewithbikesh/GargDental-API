<?php

namespace App\Http\Controllers\Backend;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\Compliance;
use App\Models\CompliancesDoc;
use Illuminate\Http\Request; 

class ComplianceController extends Controller
{
    public function business_registration(Request $request)
    {
        $business_registration = Compliance::with('compliancefiles')->where('key', 'business_registration')->first();
        return view('backend.compliance.business-registration', compact('business_registration'));
    }
    
    public function storeBusinessRegistration(Request $request)
    {
        $request->validate([
            'business_registration' => 'nullable|string',
            'documents' => 'nullable|array',
            'documents.*.title' => 'nullable|string',
            'documents.*.file' => 'nullable|mimes:pdf,jpg,jpeg,png,webp|max:10240',
        ]);

        $compliance = Compliance::updateOrCreate(
            ['key' => 'business_registration'],
            ['value' => $request->business_registration]
        );

        if ($request->has('documents')) {
            foreach ($request->documents as $document) {
                if (!empty($document['file']) && !empty($document['title'])) {
                    $filename = Helpers::upload_file(dir: 'backend/compliances/', file: $document['file']);

                    CompliancesDoc::create([
                        'compliance_id' => $compliance->id,
                        'title' => $document['title'],
                        'filename' => $filename,
                    ]);
                }
            }
        }

        return redirect()->back()->with('success', 'Business Registration Details updated successfully!');
    }
    
    public function medical_certifications(Request $request)
    {
        $medical_certifications = Compliance::with('compliancefiles')->where('key', 'medical_certifications')->first();
        return view('backend.compliance.medical-certifications', compact('medical_certifications'));
    }
    
    public function storeMedicalCertifications(Request $request)
    {
        $request->validate([
            'medical_certifications' => 'nullable|string',
            'certifications' => 'nullable|array',
            'certifications.*.title' => 'nullable|string',
            'certifications.*.file' => 'nullable|mimes:pdf,jpg,jpeg,png,webp|max:10240',
        ]);

        $compliance = Compliance::updateOrCreate(
            ['key' => 'medical_certifications'],
            ['value' => $request->medical_certifications]
        );

        if ($request->has('certifications')) {
            foreach ($request->certifications as $certification) {
                if (!empty($certification['file']) && !empty($certification['title'])) {
                    $filename = Helpers::upload_file(dir: 'backend/compliances/', file: $certification['file']);

                    CompliancesDoc::create([
                        'compliance_id' => $compliance->id,
                        'title' => $certification['title'],
                        'filename' => $filename,
                    ]);
                }
            }
        }

        return redirect()->back()->with('success', 'Medical Certifications updated successfully!');
    }
    
    public function deleteComplianceDoc($id)
    {
        $compliance = CompliancesDoc::findOrFail($id);
        Helpers::check_and_delete_file(
                    dir: 'backend/compliances/',
                    old_file: $compliance->filename
                );
        $compliance->delete();

        return back()->with('success', 'Doc deleted successfully.');
    }
    
    public function return_refund_policy(Request $request)
    {
        $return_refund_policy = Compliance::where('key', 'return_refund_policy')->first();
        return view('backend.compliance.return-refund-policy', compact('return_refund_policy'));
    }
    
    public function storeReturnRefundPolicy(Request $request)
    {
        $request->validate([
            'return_refund_policy' => 'required|string'
        ]);

        Compliance::updateOrCreate(
            ['key' => 'return_refund_policy'],
            ['value' => $request->return_refund_policy]
        );

        return redirect()->back()->with('success', 'Return Refund Policy updated successfully!');
    }
    
    public function privacy_policy(Request $request)
    {
        $privacy_policy = Compliance::where('key', 'privacy_policy')->first();
        return view('backend.compliance.privacy-policy', compact('privacy_policy'));
    }
    
    public function storePrivacyPolicy(Request $request)
    {
        $request->validate([
            'privacy_policy' => 'required|string'
        ]);

        Compliance::updateOrCreate(
            ['key' => 'privacy_policy'],
            ['value' => $request->privacy_policy]
        );

        return redirect()->back()->with('success', 'Privacy Policy updated successfully!');
    }
    
    public function about_company(Request $request)
    {
        $about_company = Compliance::where('key', 'about_company')->first();
        return view('backend.compliance.about-company', compact('about_company'));
    }
    
    public function storeAboutCompany(Request $request)
    {
        $request->validate([
            'about_company' => 'required|string'
        ]);

        Compliance::updateOrCreate(
            ['key' => 'about_company'],
            ['value' => $request->about_company]
        );

        return redirect()->back()->with('success', 'Company Information updated successfully!');
    }

    public function about_us_page(Request $request)
    {
        $about = Compliance::whereIn('key', ['introduction_video', 'about_us_title', 'youtube_video', 'about_us', 'story_title', 'story_1_image', 'story_1_name', 'story_1_designation', 'story_1_description', 'story_2_image', 'story_2_name', 'story_2_designation', 'story_2_description'])->get()->keyBy('key');
        $introVideoUrl = $about['introduction_video']
            ? Helpers::get_full_url('backend/about', $about['introduction_video']->value, 'public')
            : null;

        $story1ImageUrl = $about['story_1_image']
            ? Helpers::get_full_url('backend/about', $about['story_1_image']->value, 'public')
            : null;
            
        $story2ImageUrl = $about['story_2_image']
            ? Helpers::get_full_url('backend/about', $about['story_2_image']->value, 'public')
            : null;

        return view('backend.compliance.about-us', compact('about', 'introVideoUrl', 'story1ImageUrl', 'story2ImageUrl'));
    }
    
    public function storeAboutUsPage(Request $request)
    {
        $request->validate([
            'about_us_page' => 'required|string'
        ]);

        Compliance::updateOrCreate(
            ['key' => 'about_us'],
            ['value' => $request->about_us_page]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'introduction_video'],
            ['value' => Helpers::update_file(dir: 'backend/about/', old_file: $request->old_introduction_video, file: $request->introduction_video)]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'about_us_title'],
            ['value' => $request->about_us_title]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'youtube_video'],
            ['value' => $request->youtube_video]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_title'],
            ['value' => $request->story_title]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_1_image'],
            ['value' =>  Helpers::update_file(dir: 'backend/about/', old_file: $request->old_story_1_image, file: $request->story_1_image)]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_1_name'],
            ['value' => $request->story_1_name]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_1_designation'],
            ['value' => $request->story_1_designation]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_1_description'],
            ['value' => $request->story_1_description]
        );
                
        Compliance::updateOrCreate(
            ['key' => 'story_2_image'],
            ['value' =>  Helpers::update_file(dir: 'backend/about/', old_file: $request->old_story_2_image, file: $request->story_2_image)]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_2_name'],
            ['value' => $request->story_2_name]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_2_designation'],
            ['value' => $request->story_2_designation]
        );
        
        Compliance::updateOrCreate(
            ['key' => 'story_2_description'],
            ['value' => $request->story_2_description]
        );

        return redirect()->back()->with('success', 'About Us Page updated successfully!');
    }

    public function terms_conditions(Request $request)
    {
        $terms_conditions = Compliance::where('key', 'terms_conditions')->first();
        return view('backend.compliance.terms-conditions', compact('terms_conditions'));
    }
    
    public function storeTermsConditions(Request $request)
    {
        $request->validate([
            'terms_conditions' => 'required|string'
        ]);

        Compliance::updateOrCreate(
            ['key' => 'terms_conditions'],
            ['value' => $request->terms_conditions]
        );

        return redirect()->back()->with('success', 'Terms & Conditions updated successfully!');
    }

}
