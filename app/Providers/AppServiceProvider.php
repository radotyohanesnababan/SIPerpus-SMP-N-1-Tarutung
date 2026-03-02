<?php

namespace App\Providers;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Vite;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;

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
        $host = request()->getHost();

        // 1. Cek jika user sedang di server backup
        if ($host === 'server2.sparta.my.id') {
            URL::forceRootUrl('https://server2.sparta.my.id');
        } 
        // 2. Cek jika user masuk lewat www
        else if (str_contains($host, 'www.')) {
            URL::forceRootUrl('https://www.sparta.my.id');
        } 
        // 3. Default ke domain utama
        else {
            URL::forceRootUrl('https://sparta.my.id');
        }

        URL::forceScheme('https');
    }
}
}
