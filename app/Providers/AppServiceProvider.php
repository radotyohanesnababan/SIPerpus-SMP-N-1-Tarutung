<?php

namespace App\Providers;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Vite;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
   public function boot(): void
{
    Vite::prefetch(concurrency: 3);
    JsonResource::withoutWrapping();

    if (config('app.env') === 'production') {
        // 1. Ambil host yang sedang diakses user secara otomatis
        $host = request()->getHost();

        // 2. Paksa root URL sesuai host yang diakses user
        if ($host) {
            \Illuminate\Support\Facades\URL::forceRootUrl("https://{$host}");
        }

        // 3. Paksa protokol HTTPS (Wajib untuk Cloudflare)
        \Illuminate\Support\Facades\URL::forceScheme('https');
    }

    // if (app()->environment('production')) {
    //     DB::listen(function ($query) {
    //         Log::info('[QUERY] ' . $query->sql, [
    //             'bindings' => $query->bindings,
    //             'time' => $query->time . 'ms',
    //         ]);
    //     });
    // }
}
}
