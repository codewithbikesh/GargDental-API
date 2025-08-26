<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\Compliance;
use Illuminate\Support\Facades\Log;

class ComplianceController extends Controller
{
    public function get_compliances()
    {
        $compliances = Compliance::whereIn('key', ['about_company', 'privacy_policy', 'return_refund_policy', 'medical_certifications', 'business_registration', 'about_us', 'terms_conditions'])->with('compliancefiles')->get();
        
        try {
            return response()->json(['success' => true, 'message' => 'Compliances fetched successfully.', 'compliances' => $compliances], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching compliances', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get compliances',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}