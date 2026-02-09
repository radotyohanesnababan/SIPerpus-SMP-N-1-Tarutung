<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Http\Request;
use Spatie\Permission\Middleware\RoleMiddleware;
use Inertia\Inertia;
use Symfony\Component\HttpFoundation\Response;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        
        $middleware->web(append: [
            \App\Http\Middleware\HandleInertiaRequests::class,
            \Illuminate\Http\Middleware\AddLinkHeadersForPreloadedAssets::class,
        ])->alias(aliases:[
            'role' => RoleMiddleware::class
        ]);

        //
    })
    ->withExceptions(function (Exceptions $exceptions) {
        // Menangani user yang belum login (AuthenticationException)
   $exceptions->render(function (AuthenticationException $e, Request $request) {
        return redirect()->guest(route('login'))
            ->with('message', 'Anda harus login terlebih dahulu.') // Key: message
            ->with('type', 'error'); // Key: type
    });
        $exceptions->respond(function (Response $response, Throwable $exception, Request $request) {
            
            // Cek status code error (403, 404, 500, dll)
            $status = $response->getStatusCode();
            if ($request->is('build/*') || $request->wantsJson()) {
            return $response;
        }

           
            if (in_array($status, [403, 404, 500, 503])) {
                return Inertia::render('ErrorHandling', [
                    'status' => $status, 
                ])
                ->toResponse($request)
                ->setStatusCode($status);
            }

            return $response;
        });
    })->create();
