<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use App\CentralLogics\Helpers;

class AuthenticatedSessionController extends Controller
{
    public function create(): View
    {
         if (Auth::check()) {
       return redirect()->route('backend.dashboard');
      }
        
        $landing_data = Helpers::get_landing_data();
        return view('auth.login', compact('landing_data'));
    }
    
    public function forgot_password(): View
    {
        $landing_data = Helpers::get_landing_data();
        return view('auth.forgot-password', compact('landing_data'));
    }

    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();
        $request->session()->regenerate();

        return redirect()->intended(route('backend.dashboard'));
    }

    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('admin-login');
    }
}
