<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;
use App\CentralLogics\Helpers;

class ProfileController extends Controller
{
    public function edit()
    {
        $admin_user = Auth::user();
        return view('backend.profile.profile', compact('admin_user'));
    }

    public function update(Request $request)
    {
        $admin_user = Admin::findOrFail($request->id);
        $admin_user->name = $request->input('name');
        $admin_user->email = $request->input('email');
        $admin_user->address = $request->input('address');
        $admin_user->phone = $request->input('phone');
        $admin_user->country = $request->input('country');
        $admin_user->account_type = $request->input('account_type');

        if ($request->has('profile_photo_path')) {
            $image_name =Helpers::update(dir:'profile/', old_image: $admin_user->profile_photo_path, format: 'png', image: $request->file('profile_photo_path'));
        } else {
            $image_name = $admin_user['profile_photo_path'];
        }
        $admin_user->profile_photo_path = $image_name;
        $admin_user->save();

        return redirect()->route('backend.profile.profile')->with('success', 'Profile updated successfully')->with('tab', 'profile-edit');
    }

    public function changepassword(Request $request)
    {
        $request->validate([
            'password' => 'required',
            'newpassword' => 'required|min:8',
            'renewpassword' => 'required|same:newpassword',
        ]);

        $admin_user = Auth::user();
        if (!Hash::check($request->password, $admin_user->password)) {
            return redirect()->route('backend.profile.profile')->with('error', 'Current password is incorrect')->with('tab', 'profile-change-password');
        } else {
            $admin = Admin::findOrFail($admin_user->id);
            $admin->password = Hash::make($request->newpassword);
            $admin->save();
            return redirect()->route('backend.profile.profile')->with('success', 'Password changed successfully')->with('tab', 'profile-change-password');
        }
    }

}
