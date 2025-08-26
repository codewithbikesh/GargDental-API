<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\VerificationCodeMail;
use Illuminate\Support\Facades\Validator;
use App\Mail\RegistrationSuccessMail;
use App\Mail\ResendVerificationCodeMail;
use App\Models\Inquiry;
use App\Models\Newsletter;

class RegistrationController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'password' => 'required|string',
            'phone' => 'required|unique:users,phone',
            'email' => 'required|email|unique:users,email'
        ], [
            'email.unique' => 'This email is already registered. Please use a different one.',
            'phone.unique' => 'This phone is already used. Please use a different one.',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $landing_data = Helpers::get_landing_data();
        $user = new User();
        $firstname = $request->first_name;
        $lastname = $request->last_name;
        $customer_name = $firstname . $lastname;
        $user->full_name = $customer_name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password = Hash::make($request->password);
        $user->login_medium = 'manual';
        $user->save();

        $code = rand(100000, 999999);
        DB::table('email_verifications')->updateOrInsert(['email' => $request['email']],
        [
            'token' => $code,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        try {
            Mail::to($request->email)->queue(new VerificationCodeMail($customer_name, $request->email, $code, $landing_data));
            return response()->json(['success' => true, 'message' => 'Verification code sent to your email.', 'code' => $code, 'email' => $request->email], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while sending code', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to send verification code.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function VerifyAccount(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'user_verification_code' => 'required|string'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $landing_data = Helpers::get_landing_data();
        $user = User::where('email', $request->email)->first();
    
        if (isset($user)) {
            if ($user->is_email_verified === 1) {
                return response()->json([
                    'success' => true,
                    'message' => 'Email already verified.'
                ], 200);
            }
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Email not found.'
            ], 404);
        }
    
        $data = DB::table('email_verifications')->where([
            'email' => $request->email,
            'token' => $request->user_verification_code,
        ])->first();
    
        if (!$data) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid or expired verification code. Please try resending the code.'
            ], 400);
        }
    
        DB::table('email_verifications')->where([
            'email' => $request->email,
            'token' => $request->user_verification_code,
        ])->delete();
    
        $user->is_email_verified = 1;
        $user->email_verified_at = now();
        $user->save();
    
        try {
            Mail::to($request->email)->queue(new RegistrationSuccessMail($landing_data));
        } catch (\Exception $e) {
            Log::error('Verification succeeded but email failed', ['error' => $e->getMessage()]);
        }
    
        return response()->json([
            'success' => true,
            'message' => 'Thank you for verifying your email.'
        ], 200);
    }
    
    public function ResendCode(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $user = User::where('email', $request->email)->first();
    
        if (isset($user)) {
            if ($user->is_email_verified === 1) {
                return response()->json([
                    'success' => true,
                    'message' => 'Email already verified.'
                ], 200);
            }
        }

        $landing_data = Helpers::get_landing_data();
        $code = rand(100000, 999999);
    
        DB::table('email_verifications')->updateOrInsert(
            ['email' => $request->email],
            [
                'token' => $code,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );
    
        try {
            Mail::to($request->email)->queue(new ResendVerificationCodeMail($request->email, $code, $landing_data));
    
            return response()->json([
                'success' => true,
                'message' => 'Verification code sent successfully.',
                'email' => $request->email,
                'code' => $code
            ], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while sending code', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to send verification code.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function NewsletterSubscriber(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:newsletter_subscribers_list,email'
        ], [
            'email.required' => 'Please enter your email address.',
            'email.email' => 'Please provide a valid email address.',
            'email.unique' => 'This email is already subscribed.',
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {    
            $newsletter = new Newsletter();
            $newsletter->email = $request->email;

            if ($newsletter->save()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Thank you for your subscription.'
                ], 200);
            }
        } catch (\Exception $e) {
            Log::error('Exception occurred while subscribing newsletter', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to subscribe newsletter.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function ContactForm(Request $request) 
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required'
        ]);
        
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        try {    
            $inquiry = new Inquiry();
            $inquiry->name = $request->name;
            $inquiry->email = $request->email;
            $inquiry->message = $request->message;

            if ($inquiry->save()) {
                return response()->json([
                    'success' => true,
                    'message' => 'Thank you for contacting us. We will respond you shortly.'
                ], 200);
            }
        } catch (\Exception $e) {
            Log::error('Exception occurred while submitting inquiry', ['error' => $e->getMessage()]);
            return response()->json([
                'success' => false,
                'message' => 'Failed to submit inquiry.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

}