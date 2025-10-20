import { Toaster } from '@/Components/ui/sonner';
import { Head, Link, usePage } from '@inertiajs/react';

export default function AppLayout({ title, children }) {
    const auth = usePage().props.auth.user;
    const announcement = usePage().props.announcement;
    const { url } = usePage();

    return (
        <>
            <Head title={title} />
            <Toaster position="top-center" richColors />

            <div className="flex flex-col min-h-screen text-gray-800 scroll-smooth overflow-x-hidden">
                <header className="flex h-16 items-center justify-between border-b bg-white/70 backdrop-blur-md px-6 shadow-md sticky top-0 z-50">
                    <div className="flex items-center gap-3">
                        <img
                            src="/storage/logo/logosekolah.png"
                            alt="Logo"
                            className="h-12 w-12 rounded-full p-1 shadow-md object-contain"
                        />
                        <span className="text-xl font-bold text-sky-700">SIPERPUS</span>
                    </div>

                    <nav className="hidden md:flex items-center gap-4">
                        <a href="#beranda" className="hover:text-sky-600 font-medium transition-all duration-300">
                            Beranda
                        </a>
                        <a href="#kategori" className="hover:text-sky-600 font-medium transition-all duration-300">
                            Kategori
                        </a>
                        <a href="#tentang" className="hover:text-sky-600 font-medium transition-all duration-300">
                            Tentang
                        </a>
                    </nav>

                    <div className="flex items-center gap-3">
                        {auth ? (
                            <Link
                                href={route('dashboard')}
                                className="px-4 py-2 bg-sky-500 text-white rounded-lg hover:bg-sky-600 transition-all duration-300 shadow-md"
                            >
                                Dashboard
                            </Link>
                        ) : (
                            <Link
                                href={route('login')}
                                className="px-4 py-2 bg-sky-400 text-white rounded-lg hover:bg-sky-500 transition-all duration-300 shadow-md"
                            >
                                Masuk
                            </Link>
                        )}
                    </div>
                </header>

                <main className="flex-1">{children}</main>

                <footer className="bg-sky-400 text-gray-700 py-3 px-2">
                    <div className="container mx-auto flex flex-col md:flex-row justify-between items-start md:items-center gap-6">
                        <div className="space-y-1 text-sm md:text-base ml-4">
                            <p className="font-semibold">
                                &copy; {new Date().getFullYear()} Perpustakaan SMP Negeri 1 Tarutung
                            </p>
                            <p>Jl. Nahum Situmorang No. 1, Hutatoruan V, Tarutung 22413</p>
                            <p>Kabupaten Tapanuli Utara, Provinsi Sumatera Utara</p>
                        </div>

                        <div className="flex flex-col md:items-end space-y-2 text-sm md:text-base mr-4">
                            <a href="https://www.smpnegeri1tarutung.sch.id" className="hover:text-sky-200 transition">
                                Website Sekolah
                            </a>
                            <a href="mailto:smpn1tartung.taput@gmail.com" className="hover:text-sky-200 transition">
                                Hubungi Kami
                            </a>
                        </div>
                    </div>
                </footer>
            </div>
        </>
    );
}
