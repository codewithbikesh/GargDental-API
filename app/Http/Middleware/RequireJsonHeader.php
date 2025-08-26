<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RequireJsonHeader
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->is('api/*') && !$request->expectsJson()) {
            return response()->json(
                [
                    'error' => 'Invalid Header',
                    'message' => 'The "Accept: application/json" header is required.',
                ],
                406 // HTTP 406 Not Acceptable
            )->header('Content-Type', 'application/json');
        }
        return $next($request);
    }
}
