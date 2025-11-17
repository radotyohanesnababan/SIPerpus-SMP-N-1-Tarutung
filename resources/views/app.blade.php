<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="canonical" href="https://sparta.my.id" />

        <meta name="description" content="SPARTA - Sistem Perpustakaan SMP Negeri 1 Tarutung. Koleksi buku lengkap, kemudahan akses, dan layanan terbaik untuk mendukung pembelajaran Anda.">
        <meta name="keywords" content="Perpustakaan, SMP Negeri 1 Tarutung, Buku, Koleksi Buku, Layanan Perpustakaan, Pendidikan, Sumber Belajar, SPARTA, Buku Online, Sekolah, Tarutung">
        <meta name="author" content="SMP Negeri 1 Tarutung">

        <link rel="icon" type="image/png" href="{{ asset('storage/logo/favicon.png') }}" sizes="48x48">
        <link rel="sitemap" type="application/xml" href="https://sparta.my.id/sitemap.xml">

       

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link rel="preload" href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" as="style" />
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" media="print" onload="this.media='all'" />
        <noscript>
        <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
        </noscript>
        

        <!-- Title -->
        <title inertia>
    @if(request()->is('/'))
         SPARTA | Sistem Perpustakaan SMP Negeri 1 Tarutung
    @else
        SPARTA | Sistem Perpustakaan SMP Negeri 1 Tarutung
    @endif
    </title>
        <!-- <title>Perpustakaan SPARTA - SMP Negeri 1 Tarutung</title> -->
        <meta property="og:title" content="Perpustakaan SPARTA - SMP Negeri 1 Tarutung">
        <meta property="og:description" content="Koleksi buku lengkap dan e-book pendidikan di SPARTA, perpustakaan digital SMP Negeri 1 Tarutung.">
        <meta property="og:image" content="https://sparta.my.id/storage/logo/logo.webp">
        <meta property="og:url" content="https://sparta.my.id">
        <!-- Scripts -->
        @routes
        @viteReactRefresh
        @vite(['resources/js/app.jsx', "resources/js/Pages/{$page['component']}.jsx"])
        @inertiaHead
            @verbatim
            <script type="application/ld+json">
            {
            "@context": "https://schema.org",
            "@type": ["EducationalOrganization", "Library"],
            "name": "SMP Negeri 1 Tarutung - Perpustakaan SPARTA",
            "url": "https://sparta.my.id",
            "logo": "https://sparta.my.id/storage/logo/logo.webp",
            "sameAs": ["https://www.smpnegeri1tarutung.sch.id"],
            "description": "Perpustakaan digital SMP Negeri 1 Tarutung dengan koleksi buku dan e-book pendidikan.",
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
            @endverbatim

            @verbatim
            <script type="application/ld+json">
            {
            "@context": "https://schema.org",
            "@type": "Library",
            "name": "Perpustakaan SPARTA SMP Negeri 1 Tarutung",
            "image": "https://sparta.my.id/storage/logo/logo.webp",
            "url": "https://sparta.my.id",
            "address": {
                "@type": "PostalAddress",
                "streetAddress": "Jl. Nahum Situmorang No. 1, Hutatoruan V",
                "addressLocality": "Tarutung",
                "addressRegion": "Sumatera Utara",
                "postalCode": "22413",
                "addressCountry": "ID"
            },
            "geo": {
                "@type": "GeoCoordinates",
                "latitude": 2.0161576,
                "longitude": 98.9594118
            },
            "openingHours": "Mo-Fr 07:30-15:00",
            "sameAs": [
                "https://www.smpnegeri1tarutung.sch.id",
                "https://maps.google.com/?cid=XXXXXXXXXXXX"
            ]
            }
            </script>
            @endverbatim

        <script src="/storage/js/theme.js" defer></script>
        
    </head>
    <body class="font-sans antialiased max-h-screen">
        @inertia
    </body>
</html>
