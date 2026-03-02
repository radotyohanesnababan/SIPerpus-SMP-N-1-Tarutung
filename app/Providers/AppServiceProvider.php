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
        // Mendeteksi jika user masuk lewat www, maka gunakan www sebagai root
        if (str_contains(request()->getHost(), 'www.')) {
            URL::forceRootUrl('https://www.sparta.my.id');
        } else {
            URL::forceRootUrl('https://sparta.my.id');
        }
        URL::forceScheme('https');
    }
    }
}
