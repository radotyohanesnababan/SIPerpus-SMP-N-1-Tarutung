import { Toaster } from '@/Components/ui/sonner';
import { Head, Link, usePage } from '@inertiajs/react';
import { IconBrandFacebook, IconBrandInstagram, IconLink } from '@tabler/icons-react';

export default function WelcomeLayout({ title, children, description }) {
    const auth = usePage().props.auth.user;
    const defaultTitle = 'Perpustakaan SPARTA - SMP Negeri 1 Tarutung';
    const defaultDescription =
        'SPARTA | Sistem Perpustakaan SMP Negeri 1 Tarutung — koleksi buku lengkap, kemudahan akses, dan layanan terbaik untuk mendukung pembelajaran.';
    const pageTitle = title ? `${title} | SPARTA` : defaultTitle;
    const pageDescription = description || defaultDescription;

    return (
        <>
            <Head>
                <title>{pageTitle}</title>
                <meta name="description" content={pageDescription} />
                <meta name="robots" content="index, follow" />
                <meta name="author" content="Tim Perpustakaan SMP Negeri 1 Tarutung" />
                <meta
                    name="keywords"
                    content="perpustakaan, SMPN 1 Tarutung, SPARTA, buku digital, sekolah, smp, tarutung, buku, perpustakaan digital"
                />
                <meta property="og:type" content="website" />
                <meta property="og:title" content={pageTitle} />
                <meta property="og:description" content={pageDescription} />
                <meta property="og:url" content="https://sparta.my.id" />
                <meta
                    property="og:image"
                    content="https://sparta.my.id/storage/logo/logo.webp"
                />
                <meta property="og:site_name" content="Perpustakaan SMP Negeri 1 Tarutung" />
                <meta property="og:locale" content="id_ID" />
                <link rel="canonical" href="https://sparta.my.id" />
            </Head>

            <Toaster position="top-center" richColors />

            <div className="flex flex-col min-h-screen text-gray-800 scroll-smooth overflow-x-hidden">
                <header className="sticky top-0 z-50 w-full border-b border-gray-100 bg-white/80 backdrop-blur-sm shadow-lg shadow-sky-100/50">
    <div className="container mx-auto flex h-16 items-center justify-between px-6 lg:px-8">
        <div className="flex items-center gap-3">
            <img
                src="/storage/logo/logo.webp"
                alt="Logo SPARTA"
                className="h-10 w-10 rounded-full object-contain"
                loading="lazy"
            />
            <span className="text-xl font-extrabold text-sky-800 tracking-wider">SPARTA</span>
        </div>
        <nav className="hidden md:flex items-center gap-6">
            {
                [
                    { label: 'Beranda', href: '#beranda' },
                    { label: 'Kategori', href: '#kategori' },
                    { label: 'Tentang', href: '#tentang' }
                ].map((item, index) => (
                    <a 
                        key={index}
                        href={item.href} 
                        className="relative group text-gray-700 hover:text-sky-700 font-medium transition-colors duration-300 pt-1 pb-1"
                    >
                        {item.label}
                        <span className="absolute left-0 bottom-[-6px] h-[2px] w-full bg-sky-600 transition-transform duration-300 transform scale-x-0 origin-center group-hover:scale-x-100"></span>
                    </a>
                ))
            }
        </nav>
        <div className="flex items-center gap-3">
            {auth ? (
                <Link
                    href={route('dashboard')}
                    className="px-4 py-2 font-semibold rounded-lg transition-colors duration-300 shadow-md whitespace-nowrap bg-sky-600 text-white hover:bg-sky-700"
                >
                    Dashboard
                </Link>
            ) : (
                <>
                    <Link
                        href={route('login')}
                        className="px-4 py-2 font-semibold rounded-lg transition-colors duration-300 shadow-md whitespace-nowrap bg-sky-600 text-white hover:bg-sky-700"
                    >
                        Masuk
                    </Link>
                </>
            )}
        </div>
    </div>
</header>

                <main className="flex-1">{children}</main>

                <footer className="bg-gray-50 text-gray-700 pt-16 pb-0 border-t border-gray-200">
            <div className="container mx-auto px-6">
                
                <div className="grid grid-cols-1 md:grid-cols-4 lg:grid-cols-4 gap-12">
                    
                    <div className="md:col-span-2 space-y-4">
                        <div className="flex items-center space-x-2">
                            <span className="text-2xl font-extrabold text-sky-700">SPARTA</span>
                        </div>
                        <p className="text-gray-600 text-sm max-w-sm leading-relaxed">
                            Sistem Perpustakaan SMP Negeri 1 Tarutung.
                        </p>
                        <div className="flex items-start text-gray-500 text-sm">
                            <svg className="w-4 h-4 mr-2 mt-1 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M17.657 16.657L13.414 20.899a2 2 0 01-2.828 0L6.343 16.657a8 8 0 1111.314 0z" /><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" /></svg>
                            <div>
                                <p>Jl. Nahum Situmorang No. 1, Hutatoruan V, Tarutung 22413</p>
                                <p>Kabupaten Tapanuli Utara, Provinsi Sumatera Utara</p>
                            </div>
                        </div>
                    </div>
                    <div className="hidden md:block md:col-span-1"> 
                    </div>

                    <div className="md:col-span-1">
                        <h3 className="text-md font-bold text-gray-800 mb-4 border-b pb-2 border-gray-200">HUBUNGI KAMI</h3>
                        <a 
                            href="mailto:smpn1tartung.taput@gmail.com" 
                            className="inline-block hover:text-sky-600 font-semibold transition text-sm mb-6"
                        >
                            smpn1tarutung.taput@gmail.com
                        </a>

                        <h3 className="text-md font-bold text-gray-800 mb-4 border-b pb-2 border-gray-200">SOSIAL MEDIA</h3>
                        
                        <div className="flex space-x-3">
                            <a href="https://www.facebook.com/profile.php?id=100070072041930" aria-label="Facebook Sekolah" className="w-9 h-9 flex items-center justify-center rounded-full bg-white shadow-sm ring-1 ring-gray-200 hover:ring-sky-500 transition">
                                <IconBrandFacebook className="w-5 h-5 text-gray-600 hover:text-sky-600" />
                            </a>
                            <a href="https://www.smpnegeri1tarutung.sch.id" aria-label="Website Sekolah" className="w-9 h-9 flex items-center justify-center rounded-full bg-white shadow-sm ring-1 ring-gray-200 hover:ring-sky-500 transition">
                                <IconLink className="w-5 h-5 text-gray-600 hover:text-sky-600" />
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div className="bg-gray-200 mt-12 py-4">
                <div className="container mx-auto px-6 text-center text-sm text-gray-600">
                    &copy; {new Date().getFullYear()} Perpustakaan SMP Negeri 1 Tarutung. All rights reserved.
                </div>
            </div>
        </footer>
            </div>
        </>
    );
}
