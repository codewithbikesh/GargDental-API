<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Symfony\Component\Routing\Exception\RouteNotFoundException;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {

        // $middleware->group('api', [
        //     \App\Http\Middleware\RequireJsonHeader::class,
        //     \Illuminate\Routing\Middleware\ThrottleRequests::class.':api',
        // ]);
        
         $middleware->alias([
            'admin.auth' =>  \App\Http\Middleware\RedirectIfAuthenticated::class,
            'admin.guest' => \App\Http\Middleware\RedirectIfNotAuthenticate::class,
            'module' => \App\Http\Middleware\ModulePermissionMiddleware::class,
          ]);

        $middleware->redirectTo(
            guests: 'admin-login',
            users: '/admin/dashboard'
           );  
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Handle authentication exceptions first
        $exceptions->render(function (AuthenticationException $e, Request $request) {
            if ($request->is('api/*')) {
                return response()->json([
                    'error' => 'Unauthenticated',
                    'message' => 'Valid authentication token required',
                ], 401);
            }
            return null;
        });

        // Then handle route not found exceptions
        // $exceptions->render(function (RouteNotFoundException $e, Request $request) {
        //     if ($request->is('api/*')) {
        //         return response()->json([
        //             'error' => 'Endpoint not found',
        //             'message' => 'The requested API endpoint does not exist.',
        //             'status' => 404
        //         ], 404);
        //     }
        //     return null;
        // });

        // General error handler
        // $exceptions->render(function (Throwable $e, Request $request) {
        //     if ($request->is('api/*')) {
        //         $status = method_exists($e, 'getStatusCode') 
        //             ? $e->getStatusCode() 
        //             : 500;
                
        //         return response()->json([
        //             'error' => class_basename($e),
        //             'message' => $e->getMessage(),
        //             'status' => $status,
        //         ], $status);
        //     }
        //     return null;
        // });
    })->create();
