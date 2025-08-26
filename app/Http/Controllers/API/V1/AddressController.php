<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use App\Models\CustomerAddressBook;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\CentralLogics\Helpers;
use App\Models\AddressZone;
use App\Models\Province;
use App\Models\Shipping;

class AddressController extends Controller
{
    
    public function get_addresses(Request $request)
    {
        try {
            $customerId = Auth::user()->id;
            $addresses = CustomerAddressBook::with(['province', 'city', 'zone'])->where('customer_id', $customerId)->get();
            
            if ($addresses) {
                return response()->json([
                    'success' => true,
                    'message' => 'Addresses fetched successfully!',
                    'addresses' => $addresses,
                ], 201);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Address not found!',
                    'addresses' => $addresses,
                ], 201);
            }
        
        } catch (\Exception $e) {
            Log::error('Error fetching addresses', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch addresses',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function add_address(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'province' => 'required|integer|exists:provinces,id',
            'city' => 'required|integer|exists:set_shipping,id',
            'zone' => 'required|integer|exists:address_zone,id',
            'address' => 'required|string',
            'landmark' => 'nullable|string',
            'address_type' => 'nullable|string|in:H,O',
            'default_shipping' => 'nullable|in:Y,N',
            'default_billing' => 'nullable|in:Y,N',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {
            $customerId = Auth::user()->id;

            $addressbook = new CustomerAddressBook();
            $addressbook->customer_id = $customerId;
            $addressbook->full_name = $request->full_name;
            $addressbook->phone = $request->phone;
            $addressbook->province_id = $request->province;
            $addressbook->city_id = $request->city;
            $addressbook->zone_id = $request->zone;
            $addressbook->landmark = $request->landmark;
            $addressbook->address = $request->address;
            $addressbook->address_type = $request->address_type;
            $addressbook->default_shipping = $request->default_shipping;
            $addressbook->default_billing = $request->default_billing;
            $addressbook->save();

            return response()->json([
                'success' => true,
                'message' => 'Address saved successfully!',
                'data' => $addressbook->load(['province', 'city', 'zone']),
            ], 201);

        } catch (\Exception $e) {
            Log::error('Error saving customer address', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to save address',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function load_address_dropdowns(Request $request)
    {
        try {
            // Get all provinces
            $provinces = Province::select('id', 'province_name')->get();

            $data = $provinces->map(function ($province) {
                // Get cities related to this province from set_shipping
                $cities = Shipping::with('province')->where('province_id', $province->id)
                    ->get()
                    ->map(function ($city) {
                        // Get zones for this city
                        $zones = AddressZone::with('city.province')->where('city_id', $city->id)
                            ->get();

                        $city->zones = $zones;
                        return $city;
                    });

                return [
                    'id' => $province->id,
                    'name' => $province->province_name,
                    'cities' => $cities
                ];
            });

            return response()->json([
                'success' => true,
                'message' => 'Address dropdown data loaded successfully',
                'data' => $data
            ]);

        } catch (\Exception $e) {
            Log::error('Failed to load address hierarchy', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to load address data',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function update_address(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'full_name' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'province' => 'required|integer|exists:provinces,id',
            'city' => 'required|integer|exists:set_shipping,id',
            'zone' => 'required|integer|exists:address_zone,id',
            'address' => 'required|string|max:255',
            'landmark' => 'nullable|string|max:255',
            'address_type' => 'nullable|string|in:H,O'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {
            $customerId = Auth::user()->id;
            $address = CustomerAddressBook::where('customer_id', $customerId)
                ->where('id', $id)
                ->firstOrFail();

            $address->full_name = $request->full_name;
            $address->phone = $request->phone;
            $address->province_id = $request->province;
            $address->city_id = $request->city;
            $address->zone_id = $request->zone;
            $address->address = $request->address;
            $address->landmark = $request->landmark;
            $address->address_type = $request->address_type;
            $address->save();

            return response()->json([
                'success' => true,
                'message' => 'Address updated successfully',
                'data' => $address->load(['province', 'city', 'zone'])
            ]);
        } catch (\Exception $e) {
            Log::error('Error updating customer address', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to update address',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function set_default_shipping($id)
    {
        try {
            $customerId = Auth::user()->id;

            // Reset current default shipping
            CustomerAddressBook::where('customer_id', $customerId)
                ->where('default_shipping', 'Y')
                ->update(['default_shipping' => null]);

            // Set new default
            $address = CustomerAddressBook::where('customer_id', $customerId)
                ->findOrFail($id);

            $address->default_shipping = 'Y';
            $address->save();

            return response()->json([
                'success' => true,
                'message' => 'Default shipping address updated successfully.',
                'data' => $address->only(['id', 'default_shipping'])
            ]);

        } catch (\Exception $e) {
            Log::error('Error updating default shipping address', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to update default shipping address.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function set_default_billing($id)
    {
        try {
            $customerId = Auth::user()->id;

            // Reset current default billing
            CustomerAddressBook::where('customer_id', $customerId)
                ->where('default_billing', 'Y')
                ->update(['default_billing' => null]);

            // Set new default
            $address = CustomerAddressBook::where('customer_id', $customerId)
                ->findOrFail($id);

            $address->default_billing = 'Y';
            $address->save();

            return response()->json([
                'success' => true,
                'message' => 'Default billing address updated successfully.',
                'data' => $address->only(['id', 'default_billing'])
            ]);

        } catch (\Exception $e) {
            Log::error('Error updating default billing address', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to update default billing address.',
                'error' => $e->getMessage()
            ], 500);
        }
    }
        
    public function remove_address($id)
    {
        try {
            $customerId = Auth::user()->id;
            $address = CustomerAddressBook::where('customer_id', $customerId)
                ->findOrFail($id);
            $address->delete();

            return response()->json([
                'success' => true,
                'message' => 'Address removed successfully.'
            ]);

        } catch (\Exception $e) {
            Log::error('Error removing address', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to remove address.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}