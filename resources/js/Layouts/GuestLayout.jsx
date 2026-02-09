import { Head } from '@inertiajs/react';
import { Toaster } from 'sonner';

export default function GuestLayout({ title, children }) {
    return (
        <>
            <Head title={title}>    
                <meta name="robots" content="index, follow" />
                <meta property="og:title" content={title} />
                <meta property="og:site_name" content="Perpustakaan SMPN 1 Tarutung" />
                <meta name="author" content="Tim Perpustakaan SMP Negeri 1 Tarutung" />
                <meta
                    name="keywords"
                    content="perpustakaan, SMPN 1 Tarutung, SPARTA, buku digital, sekolah, smp, tarutung, buku"
                />
                <meta
                    name="description"
                    content="SPARTA | Sistem Perpustakaan SMP N 1 Tarutung — jelajahi koleksi buku dan sumber belajar."
                />
                <meta property="og:description" content="Akses koleksi buku SMP Negeri 1 Tarutung secara online." />
                <meta property="og:type" content="website" />
                <meta property="og:url" content="https://sparta.my.id" />
                <meta property="og:image" content="/storage/logo/logo.webp" />
            </Head>
            <Toaster position="top-center" richColors closeButton />
            {children}
        </>
    );
}
