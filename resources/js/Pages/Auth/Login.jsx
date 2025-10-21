import ApplicationLogo from '@/Components/ApplicationLogo';
import InputError from '@/Components/InputError';
import { Alert, AlertDescription } from '@/Components/ui/alert';
import { Button } from '@/Components/ui/button';
import { Checkbox } from '@/Components/ui/checkbox';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import GuestLayout from '@/Layouts/GuestLayout';
import { Link, useForm } from '@inertiajs/react';
import 'swiper/css';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import { Autoplay, Navigation, Pagination } from 'swiper/modules';
import { Swiper, SwiperSlide } from 'swiper/react';

export default function Login({ status, canResetPassword }) {
    const slides = [
        'https://picsum.photos/1080/720?random=1',
        'https://picsum.photos/1080/720?random=2',
        'https://picsum.photos/1080/720?random=3',
    ];
    const { data, setData, post, processing, errors, reset } = useForm({
        email: '',
        password: '',
        remember: false,
    });

    const onHandleSubmit = (e) => {
        e.preventDefault();

        post(route('login'), {
            onFinish: () => reset('password'),
        });
    };

    return (
        <div className="w-full lg:grid lg:h-screen lg:grid-cols-2">
            <div className="flex flex-col px-6 py-4">
                <ApplicationLogo size="12" />
                <div className="flex flex-col items-center justify-center py-12 lg:py-48">
                    <div className="mx-auto flex w-full flex-col gap-6 lg:w-1/2">
                        <div className="grid gap-2 text-center">
                            {status && (
                                <Alert variant="success">
                                    <AlertDescription>{status}</AlertDescription>
                                </Alert>
                            )}
                            <h1 className="text-3xl font-bold">Masuk</h1>
                            <p className="text-balance text-muted-foreground">Masukkan email anda untuk masuk.</p>
                        </div>
                        <form onSubmit={onHandleSubmit}>
                            <div className="grid gap-4">
                                <div className="grid gap-2">
                                    <Label htmlFor="email">Email</Label>

                                    <Input
                                        id="email"
                                        type="email"
                                        name="email"
                                        value={data.email}
                                        className="mt-1 block w-full"
                                        autoComplete="username"
                                        isFocused={true}
                                        placeholder="adi@gmail.com"
                                        onChange={(e) => setData(e.target.name, e.target.value)}
                                    />

                                    {errors.email && <InputError message={errors.email} />}
                                </div>

                                <div className="grid gap-2 ">
                                    <div className="flex items-center">
                                        <Label htmlFor="password">Password</Label>
                                        {canResetPassword && (
                                            <Link
                                                href={route('password.request')}
                                                className="ml-auto inline-block text-sm underline"
                                            >
                                                Lupa password?
                                            </Link>
                                        )}
                                    </div>
                                    <Input
                                        id="password"
                                        type="password"
                                        name="password"
                                        value={data.password}
                                        autoComplete="new-password"
                                        onChange={(e) => setData(e.target.name, e.target.value)}
                                    />
                                    {errors.password && <InputError message={errors.password} />}
                                </div>

                                <div className="grid gap-2">
                                    <div className="flex items-top space-x-2">
                                        <Checkbox
                                            id="remember"
                                            name="remember"
                                            checked={data.remember}
                                            onCheckedChange={(checked) => setData('remember', checked)}
                                        />
                                        <div className="grid gap-1.5 leading-none">
                                            <Label htmlFor="remember">Ingat saya</Label>
                                        </div>
                                    </div>

                                    {errors.remember && <InputError message={errors.remember} />}
                                </div>
                            </div>
                            <div>
                                <Button
                                    type="submit"
                                    variant="skyblue"
                                    size="xl"
                                    className="w-full mt-2"
                                    disabled={processing}
                                >
                                    Masuk
                                </Button>
                            </div>
                        </form>
                        <div className="mt-4 text-center text-sm">
                            Belum punya akun?
                            <Link href={route('register')} className="underline">
                                Daftar
                            </Link>
                        </div>
                    </div>
                </div>
            </div>
            <div className="hidden lg:block">
                <Swiper
                    modules={[Autoplay, Pagination, Navigation]}
                    spaceBetween={30}
                    centeredSlides={true}
                    autoplay={{
                        delay: 3000,
                        disableOnInteraction: false,
                    }}
                    pagination={{
                        clickable: false,
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

            {status && <div className="mb-4 text-sm font-medium text-green-600">{status}</div>}
        </div>
    );
}

Login.layout = (page) => <GuestLayout children={page} title="Login" />;
