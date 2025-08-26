<?php

namespace App\Http\Middleware;

use App\CentralLogics\Helpers;
use Closure;

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
    public function handle($request, Closure $next, $module)
    {
        if (auth('admin')->check() && Helpers::module_permission_check($module)) {
            return $next($request);
        }

        // Option 1: Abort with 403 Forbidden
        abort(403, 'Access denied');

        // Option 2: Or redirect back (uncomment if preferred)
        // return redirect()->back();
    }
}
