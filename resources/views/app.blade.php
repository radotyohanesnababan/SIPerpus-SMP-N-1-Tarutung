<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="SPARTA - Sistem Perpustakaan SMP Negeri 1 Tarutung. Koleksi buku lengkap, kemudahan akses, dan layanan terbaik untuk mendukung pembelajaran Anda.">
        <meta name="keywords" content="Perpustakaan, SMP Negeri 1 Tarutung, Buku, Koleksi Buku, Layanan Perpustakaan, Pendidikan, Sumber Belajar, SPARTA, Buku Online, Sekolah, Tarutung">
        <meta name="author" content="SMP Negeri 1 Tarutung">

        <link rel="icon" type="image/png" href="{{ asset('storage/logo/favicon.png') }}" sizes="48x48">
        

        {{-- <title inertia>{{ config('app.name', 'SPARTA') }}</title> --}}

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link rel="preload" href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" as="style" />
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" media="print" onload="this.media='all'" />
        <noscript>
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
        </noscript>

        <!-- Scripts -->
        @routes
        @viteReactRefresh
        @vite(['resources/js/app.jsx', "resources/js/Pages/{$page['component']}.jsx"])
        @inertiaHead
        <script src="/storage/js/theme.js" defer></script>
    </head>
    <body class="font-sans antialiased max-h-screen">
        @inertia
    </body>
</html>
