<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="description" content="SPARTA - Sistem Perpustakaan SMP Negeri 1 Tarutung. Koleksi buku lengkap, kemudahan akses, dan layanan terbaik untuk mendukung pembelajaran Anda.">
        <meta name="keywords" content="Perpustakaan, SMP Negeri 1 Tarutung, Buku, Koleksi Buku, Layanan Perpustakaan, Pendidikan, Sumber Belajar, SPARTA, Buku Online, Sekolah, Tarutung">
        <meta name="author" content="SMP Negeri 1 Tarutung">

        <link rel="icon" type="image/png" href="{{ asset('storage/logo/favicon.png') }}" sizes="48x48">
        <link rel="sitemap" type="application/xml" href="https://sparta.my.id/sitemap.xml">

        {{-- <title inertia>{{ config('app.name', 'SPARTA') }}</title> --}}

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link rel="preload" href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" as="style" />
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" media="print" onload="this.media='all'" />
        <noscript>
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
        </noscript>

        <!-- Scripts -->
         <script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "EducationalOrganization",
  "name": "SMP Negeri 1 Tarutung",
  "alternateName": "SPARTA - Perpustakaan SMP Negeri 1 Tarutung",
  "url": "https://sparta.my.id",
  "logo": "https://sparta.my.id/storage/logo/logo.webp",
  "sameAs": ["https://www.smpnegeri1tarutung.sch.id"],
  "description": "Sistem Perpustakaan Digital SMP Negeri 1 Tarutung untuk mendukung literasi dan pembelajaran siswa.",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "Jl. Nahum Situmorang No. 1, Hutatoruan V",
    "addressLocality": "Tarutung",
    "addressRegion": "Sumatera Utara",
    "postalCode": "22413",
    "addressCountry": "ID"
  }
}
</script>
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
