<?php

namespace App\Http\Controllers\API\V1;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use App\Models\CustomerAddressBook;
use App\Models\User;
use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class SocialAuthController extends Controller
{
    public function google_register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required',
            'unique_id' => 'required',
            'access_token' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $client = new Client();

        try {
            if($request->access_token == 1){
                $res = $client->get('https://www.googleapis.com/oauth2/v3/userinfo?access_token=' . $request->token);
            } else {
                $res = $client->get('https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=' . $request->token);
            }

            $googleData = json_decode($res->getBody()->getContents(), true);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'error' => 'Invalid Google token', 'message' => $e->getMessage()], 403);
        }

        $name = $googleData['name'] ?? 'Google User';

        $existingUser = User::where('email', $googleData['email'])->first();
        $social_id = $googleData['kid'] ?? $googleData['sub'];
        if (!$existingUser) {
            $existingUser = User::create([
                'full_name' => $name,
                'email' => $googleData['email'],
                'is_email_verified' => 1,
                'email_verified_at' => now(),
                'phone' => $request->phone,
                'password' => bcrypt($social_id),
                'login_medium' => 'google',
                'social_id' => $social_id,
            ]);
        } else {
            $existingUser->update([
                'social_id' => $social_id,
            ]);
        }

        Auth::guard('customer')->login($existingUser);
        $user = Auth::guard('customer')->user();
        if ($user) {
            $token = $user->createToken('UserAuth')->accessToken;
            
            $addressExists = CustomerAddressBook::where('customer_id', $user->id)->exists();

            return response()->json([
                'success' => true,
                'message' => 'Login successful',
                'requires_address' => !$addressExists,
                'token' => $token,
                'user' => [
                    'id' => $user->id,
                    'name' => $user->full_name,
                    'email' => $user->email
                ]
            ], 200);
        } else {
            return response()->json([
                'errors' => [
                    ['code' => 'auth-001', 'data' => $existingUser, 'message' => 'Unauthorized.']
                ]
            ], 401);
        }
    }

}