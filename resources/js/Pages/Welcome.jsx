import WelcomeLayout from '@/Layouts/WelcomeLayout';
import { Link } from '@inertiajs/react';
import { Card, CardHeader, CardContent, CardTitle, CardDescription } from '@/Components/ui/card';
import { Button } from '@/Components/ui/button';
import { Badge } from '@/Components/ui/badge';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { Autoplay, Navigation, Pagination } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/react';


export default function Welcome(props) {
    const auth = props.auth.user;
    const categories = props.page_data.categories || [];
    const slides = ['/storage/libfront1(1).webp', '/storage/libfront1(2).webp', '/storage/libfront1(3).webp'];

    return (
        <div className="flex flex-col w-full min-h-screen">
            <section
                id="beranda"
                className="relative flex flex-col items-center justify-center pt-24 pb-32 overflow-hidden bg-sky-50/50"
            >
                <div className="absolute inset-0 -z-10 opacity-30">
                    <Swiper
                        modules={[Autoplay, Pagination, Navigation]}
                        spaceBetween={0}
                        centeredSlides={true}
                        autoplay={{
                            delay: 4000,
                            disableOnInteraction: false,
                        }}
                        pagination={{ clickable: false }}
                        navigation={false}
                        loop={true}
                        className="w-full h-full"
                    >
                        {slides.map((src, index) => (
                            <SwiperSlide key={index}>
                                <img
                                    src={src}
                                    alt={`Slide ${index + 1}`}
                                    className="w-full h-full object-cover"
                                    loading="lazy"
                                />
                            </SwiperSlide>
                        ))}
                    </Swiper>
                </div>
                
                <div className="container mx-auto px-6 grid md:grid-cols-2 gap-12 items-center relative z-10">
                    
                    <div className="text-center md:text-left space-y-6">
                        <Badge className="bg-sky-600 text-white">Sistem Informasi Perpustakaan</Badge>
                        <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-sky-800 drop-shadow-md leading-tight">
                            Selamat Datang di <span className="text-sky-600">SPARTA</span>
                        </h1>
                        <p className="text-lg text-gray-700 leading-relaxed max-w-lg mx-auto md:mx-0">
                            Temukan berbagai koleksi buku digital dan cetak dari Perpustakaan SMP Negeri 1 Tarutung. Pengguna dapat meminjam, membaca, dan mencari buku dengan mudah dan efisien.
                        </p>
                        <div className="flex justify-center md:justify-start space-x-4 pt-2">
                            <Link href={route('register')} className="inline-flex items-center justify-center whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50 bg-sky-600 text-white shadow hover:bg-sky-600/90 h-10 px-4 py-2">
                                Daftar Sekarang
                            </Link>
                        </div>
                    </div>
                    <div className="flex justify-center md:justify-end">
                        <img
                            src="/storage/logo/logo.webp"
                            alt="Logo SPARTA"
                            className="w-full max-w-sm rounded-3xl shadow-2xl ring-4 ring-sky-200 bg-white/50 backdrop-blur-sm transition-all duration-500 hover:scale-[1.02]"
                        />
                    </div>
                </div>
            </section>

            
            <section id="kategori" className="bg-white py-20 px-6">
                <div className="container mx-auto text-center">
                    <h2 className="text-3xl font-bold text-sky-800 mb-4">Jelajahi Kategori Buku</h2>
                    <p className="text-gray-600 mb-12">Temukan bacaan favorit Anda dari berbagai kategori yang tersedia.</p>

                    <div className="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-6">
                        {categories.slice(0, 6).map((item) => (
                            <Card key={item.id} className="text-left overflow-hidden transform hover:shadow-lg hover:border-sky-400 transition duration-300">
                                <CardHeader className="bg-sky-50 flex flex-col items-center justify-center h-24">
                                    
                                    <svg className="w-8 h-8 text-sky-600 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 6.253v13m0-13C10.832 5.477 9.206 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.523 5.794 18 7.5 18s3.332.477 4.5 1.247m0-13C13.168 5.477 14.794 5 16.5 5s3.332.477 4.5 1.253v13C19.832 18.523 18.206 18 16.5 18s-3.332.477-4.5 1.247" /></svg>
                                    <CardTitle className="text-sky-700 text-center">{item.name}</CardTitle>
                                </CardHeader>
                            </Card>
                        ))}
                    </div>
                </div>
            </section>

            <section id="tentang" className="bg-sky-50 py-20 px-6 overflow-hidden">
                <div className="container mx-auto grid md:grid-cols-2 items-center gap-12">
                    
                    <div className="w-full h-full rounded-2xl shadow-2xl overflow-hidden ring-4 ring-sky-200">
                        <Swiper
                            modules={[Autoplay, Pagination, Navigation]}
                            spaceBetween={0}
                            centeredSlides={true}
                            autoplay={{
                                delay: 3500,
                                disableOnInteraction: false,
                            }}
                            pagination={{ clickable: true }}
                            navigation={true}
                            loop={true}
                            className="w-full h-80 md:h-[400px]"
                        >
                            {slides.map((src, index) => (
                        <SwiperSlide key={index}>
                            <img
                                src={src}
                                alt={`Slide ${index + 1}`}
                                className="w-full h-full object-cover"
                                loading={index === 0 ? "eager" : "lazy"} 
                                fetchpriority={index === 0 ? "high" : "low"}
                            />
                        </SwiperSlide>
                    ))}
                        </Swiper>
                    </div>

                    <div className="space-y-6">
                        <h2 className="text-3xl font-bold text-sky-700 border-b pb-2 border-sky-200">Tentang Perpustakaan SPARTA</h2>
                        <p className="text-gray-700 leading-relaxed">
                            Perpustakaan SMP Negeri 1 Tarutung hadir untuk mendukung kegiatan belajar mengajar dengan menyediakan berbagai koleksi buku pelajaran, referensi, dan literatur umum. Kami terus berinovasi dengan sistem digital agar siswa dan guru dapat mengakses informasi dengan cepat.
                        </p>
                        <p className="text-gray-700 leading-relaxed">
                            Kami percaya bahwa membaca adalah jendela dunia, dan melalui SPARTA, setiap siswa dapat memperluas wawasan di mana pun dan kapan pun.
                        </p>
                        <ul className="list-disc list-inside text-gray-700 space-y-2 pt-4">
                            <li className="flex items-start"><svg className="w-5 h-5 text-sky-600 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" /></svg>Koleksi digital dan cetak terintegrasi.</li>
                            <li className="flex items-start"><svg className="w-5 h-5 text-sky-600 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" /></svg>Akses  24/7 untuk siswa dan guru.</li>
                            <li className="flex items-start"><svg className="w-5 h-5 text-sky-600 mr-2 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M5 13l4 4L19 7" /></svg>Sistem peminjaman dan pengembalian yang efisien.</li>
                        </ul>
                    </div>
                </div>
            </section>

        </div>
    );
}

Welcome.layout = (page) => <WelcomeLayout children={page} title="SPARTA | Perpustakaan SMP Negeri 1 Tarutung" description="SPARTA | Sistem Perpustakaan SMP Negeri 1 Tarutung,  koleksi buku lengkap, kemudahan akses, dan layanan terbaik untuk mendukung pembelajaran." />;