<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\Helpers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\CustomerResource;
use App\Models\Grievance;

class CustomerController extends Controller
{
    public function get_info()
    {
        try {            
            $customer = Auth::user()->load(['addresses.province', 'addresses.city', 'addresses.zone']);
            $shippingAddress = $customer->addresses->firstWhere('default_shipping', 'Y');
            $shippingCost = $shippingAddress->city->shipping_cost ?? 0.00;
            return (new CustomerResource($customer))
                ->additional([
                    'success' => true,
                    'message' => 'Customer details retrieved successfully',
                    'shipping_cost' => $shippingCost,
                    'addresses' => $customer->addresses,
                ]);
        } catch (\Exception $e) {
            Log::error('Exception occurred while fetching customer details', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to get customer details',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function update_profile(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required',
            'phone' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }
        
        $customerId = Auth::user()->id;
        try {
            $customer = User::where(['id' => $customerId])->first();
            $customer->profile_photo_path = Helpers::update(dir: 'profile', old_image: $customer->profile_photo_path, format: 'png', image: $request->profile_photo_path);
            $customer->full_name = $request->full_name;
            $customer->phone = $request->phone;
            $customer->save();

            return response()->json(['success' => true,'message' => 'Profile successfully updated.', 'data' => new CustomerResource($customer)], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update profile.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function change_password(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'new_password' => 'required|string|min:8|confirmed',
            'new_password_confirmation' => 'required'
        ]);
 
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $customerId = Auth::user()->id;
        try {
            $customer = User::where(['id' => $customerId])->first();
            $customer->password = Hash::make($request->new_password);
            $customer->save();
             
            return response()->json(['success' => true,'message' => 'Password successfully updated.'], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to change password.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function remove_account()
    {
        $customer = Auth::user();
        $customerId = $customer->id;
        if (Order::where('customer_id', $customerId)->whereIn('order_status', ['processing', 'shipped'])->count()) {
            return response()->json(['errors' => [['code' => 'on-going', 'message' => 'Account delete warning']]], 403);
        }
        $customer->tokens()->delete();
        $customer->delete();
        
        return response()->json(['success' => true,'message' => 'Account removed.'], 200);
    }

    public function GrievanceForm(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'phone' => 'required',
            'city' => 'required',
            'remarks' => 'required',
            'document' => 'nullable|mimes:jpg,jpeg,png,webp|max:2048'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $customer = Auth::user();
        $customerId = $customer->id;
        try {    
            $grievance = new Grievance();
            $grievance->customer_id = $customerId;
            $grievance->full_name = $request->name;
            $grievance->email = $request->email;
            $grievance->phone = $request->phone;
            $grievance->city = $request->city;
            $grievance->remarks = $request->remarks;
            $grievance->document = Helpers::upload_file(dir: 'backend/grievances/', file: $request->document);

            if ($grievance->save()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Thank you for submitting grievance. We will respond you shortly.'
                ], 200);
            }
        } catch (\Exception $e) {
            Log::error('Exception occurred while submitting grievance', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to submit grievance.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}