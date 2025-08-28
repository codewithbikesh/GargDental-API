<?php

namespace App\Http\Middleware;

use App\CentralLogics\Helpers;
use Closure;
use Illuminate\Support\Facades\Auth;
class ModulePermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @param string $module
     * @return mixed
     */
    // public function handle($request, Closure $next, $module)
    // {
    //     if (auth('admin')->check() && Helpers::module_permission_check($module)) {
    //         return $next($request);
    //     }

    //     abort(403, 'Access denied');
    // }

    public function handle($request, Closure $next, $module)
    {
        // check admin guard
        if (Auth::guard('admin')->check()) {
            if (Helpers::module_permission_check($module)) {
                return $next($request);
            }
        }

        // Forbidden
        abort(403, 'Access denied to module: ' . $module);
    }
}
