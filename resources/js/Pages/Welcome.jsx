import WelcomeLayout from '@/Layouts/WelcomeLayout';
import { Link } from '@inertiajs/react';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { Autoplay, Navigation, Pagination } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/react';

export default function Welcome(props) {
    const auth = props.auth.user;
    const categories = props.page_data.categories || [];
    const slides = [
        '/storage/libfront1(1).webp',
        '/storage/libfront1(2).webp',
        '/storage/libfront1(3).webp',
    ];

    return (
        <div className="flex flex-col w-full ">
            <div className="flex flex-col items-center justify-center gap-y-4 lg:flex-row lg:items-center lg:justify-center"></div>
            <section
                id="beranda"
                className="relative flex flex-col md:flex-row items-center justify-between px-6 py-20 container mx-auto gap-10 overflow-hidden"
            >
                <div className="absolute inset-0 -z-10 opacity-40">
                    <Swiper
                        modules={[Autoplay, Pagination, Navigation]}
                        spaceBetween={30}
                        centeredSlides={true}
                        autoplay={{
                            delay: 3000,
                            disableOnInteraction: false,
                        }}
                        pagination={{
                            clickable: true,
                        }}
                        navigation={false}
                        className="w-full h-full"
                    >
                        {slides.map((src, index) => (
                            <SwiperSlide key={index}>
                                <img src={src} alt={`Slide ${index + 1}`} className="w-full h-full object-cover" />
                            </SwiperSlide>
                        ))}
                    </Swiper>
                </div>

                <div className="flex justify-center md:w-1/2">
                    <img
                        src="/storage/logo/logo.webp"
                        alt="Perpustakaan"
                        className="w-72 md:w-[420px] rounded-2xl shadow-xl ring-4 ring-sky-100 bg-black/50 backdrop-blur-sm "
                    />
                </div>

                <div className="text-center md:text-left md:w-1/2 space-y-4 text-black drop-shadow-lg">
                    <h1 className="text-3xl md:text-4xl font-bold text-sky-600">
                        Selamat Datang di SPARTA
                    </h1>
                    <h1 className="text-2xl md:text-2xl font-bold text-sky-800">
                       Sistem Perpustakaan SMP Negeri 1 Tarutung
                    </h1>
                    <p className="leading-relaxed dark:text-gray-200">
                        Temukan berbagai koleksi buku digital dan cetak dari Perpustakaan SMP Negeri 1 Tarutung. Pengguna dapat meminjam, membaca, dan mencari buku dengan mudah.
                    </p>
                    <Link
                        href={route('register')}
                        className="inline-block mt-4 px-6 py-3 bg-sky-500 text-black font-semibold rounded-lg hover:bg-sky-600 transition-all duration-300"
                    >
                        Daftar Sekarang
                    </Link>
                </div>
            </section>

            <section id="kategori" className="bg-sky-100/60 py-20 px-6 opacity-0 animate-fadeIn delay-150">
                <div className="container mx-auto text-center">
                    <h2 className="text-3xl font-bold text-sky-500 mb-10">Kategori Buku</h2>

                    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-8 m-20">
                        {categories.slice(0, 6).map((item) => (
                            <div
                                key={item.id}
                                className="bg-white rounded-xl shadow-md hover:shadow-lg transition overflow-hidden transform hover:-translate-y-1 duration-300"
                            >
                                <div className="p-4">
                                    <h3 className="text-xl font-semibold text-sky-700">{item.name}</h3>
                                    <p className="text-gray-600 text-sm mt-2">
                                        Jelajahi koleksi buku {item.name.toLowerCase()} untuk memperluas wawasanmu.
                                    </p>
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            </section>

            <section id="tentang" className=" px-6 py-6 bg-white opacity-0 animate-fadeIn delay-300 overflow-hidden">
                <div className="container mx-auto flex flex-col md:flex-row items-center gap-10">
                    <div className="md:w-1/2">
                        <Swiper
                            modules={[Autoplay, Pagination, Navigation]}
                            spaceBetween={30}
                            centeredSlides={true}
                            autoplay={{
                                delay: 3000,
                                disableOnInteraction: false,
                            }}
                            pagination={{
                                clickable: true,
                            }}
                            navigation={true}
                            className="mySwiper"
                        >
                            {slides.map((src, index) => (
                                <SwiperSlide key={index}>
                                    <img
                                        src={src}
                                        alt={`Slide ${index + 1}`}
                                        className="w-full h-64 sm:h-80 md:h-96 object-cover"
                                    />
                                </SwiperSlide>
                            ))}
                        </Swiper>
                    </div>
                    <div className="md:w-1/2 space-y-4">
                        <h2 className="text-3xl font-bold text-sky-700">Tentang Perpustakaan</h2>
                        <p className="text-gray-600 leading-relaxed">
                            Perpustakaan SMP Negeri 1 Tarutung hadir untuk mendukung kegiatan belajar mengajar dengan
                            menyediakan berbagai koleksi buku pelajaran, referensi, dan literatur umum. Kami terus
                            berinovasi dengan sistem digital agar siswa dan guru dapat mengakses informasi dengan cepat.
                        </p>
                        <p className="text-gray-600 leading-relaxed">
                            Kami percaya bahwa membaca adalah jendela dunia, dan melalui SIPERPUS, setiap siswa dapat
                            memperluas wawasan di mana pun dan kapan pun.
                        </p>
                    </div>
                </div>
            </section>
        </div>
    );
}

Welcome.layout = (page) => <WelcomeLayout children={page} title="Welcome" />;
