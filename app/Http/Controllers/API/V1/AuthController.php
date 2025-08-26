<?php

namespace App\Http\Controllers\API\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\CentralLogics\Helpers;
use App\Models\User;
use App\Models\CustomerAddressBook;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use App\Mail\ForgotPasswordCodeMail;
use Illuminate\Support\Facades\Validator;
use App\Mail\PasswordResetSuccessMail;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        if (Auth::guard('customer')->attempt(['email' => $request->email, 'password' => $request->password])) {
            $user = Auth::guard('customer')->user();
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
        }

        return response()->json([
            'success' => false,
            'message' => 'Invalid credentials'
        ], 401);
    }

    public function forgot_password_code(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $landing_data = Helpers::get_landing_data();
        $user = User::where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Email not found.'
            ], 404);
        }

        $code = rand(100000, 999999);
        DB::table('password_reset_tokens')->updateOrInsert(
            ['email' => $user->email],
            [
                'token' => $code,
                'created_at' => now(),
            ]
        );

        try {
            Mail::to($user->email)->queue(new ForgotPasswordCodeMail($code, $landing_data));

            return response()->json([
                'success' => true,
                'message' => 'Password reset code sent successfully.',
                'email' => $user->email,
                'code' => $code
            ], 200);
        } catch (\Exception $e) {
            Log::error('Exception occurred while sending code', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => false,
                'message' => 'Failed to send password reset code.',
                'error' => $e->getMessage()
            ], 500);
        }
    }

    public function reset_password_verify(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|exists:users,email',
            'reset_code' => 'required',
            'new_password' => 'required|min:6',
            'confirm_new_password' => 'required|same:new_password',
        ]);

        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => 'Validation errors', 'errors' => Helpers::error_processor($validator)], 403);
        }

        $tokenData = DB::table('password_reset_tokens')->where([
            'token' => $request->reset_code,
            'email' => $request->email
        ])->first();

        if (!$tokenData) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid or expired reset code.'
            ], 400);
        }

        $user = User::where('email', $request->email)->first();
        $user->password = bcrypt($request->new_password);
        $user->save();

        DB::table('password_reset_tokens')->where([
            'token' => $request->reset_code,
            'email' => $request->email
        ])->delete();

        try {
            $landing_data = Helpers::get_landing_data();
            Mail::to($request->email)->queue(new PasswordResetSuccessMail($landing_data));

            return response()->json([
                'success' => true,
                'message' => 'Password reset successful.'
            ], 200);
        } catch (\Exception $e) {
            Log::error('Password reset mail failed', ['error' => $e->getMessage()]);

            return response()->json([
                'success' => true,
                'message' => 'Password reset successful, but failed to send confirmation email.',
                'email_error' => $e->getMessage()
            ], 200);
        }
    }

}