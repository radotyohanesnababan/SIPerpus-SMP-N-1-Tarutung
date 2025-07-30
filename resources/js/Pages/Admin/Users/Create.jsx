import HeaderTitle from '@/Components/HeaderTitle';
import InputError from '@/Components/InputError';
import { Button } from '@/Components/ui/button';
import { Card, CardContent } from '@/Components/ui/card';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { Textarea } from '@/Components/ui/textarea';
import AppLayout from '@/Layouts/AppLayout';
import { Link, useForm } from '@inertiajs/react';
import { IconArrowLeft, IconCategory, IconUsersGroup } from '@tabler/icons-react';

export default function Create(props) {
    const { data, setData, reset, post, processing, errors } = useForm({
        nisn : '',
        nama: '',
        email: '',
        password: '',
        password_confirmation: '',
        _method: props.page_settings.method,
    });
    const onHandleChange = (e) => {
        setData(e.target.name, e.target.value);
    };
    const onHandleSubmit = (e) => {
        e.preventDefault();

        post(props.page_settings.action);
    };
    return (
        <div className="flex w-full flex-col pb-32">
            <div className="mb-8 flex flex-col items-start justify-between gap-y-4 lg:flex-row lg:items-center">
                <HeaderTitle
                    title={props.page_settings.title}
                    subtitle={props.page_settings.subtitle}
                    icon={IconUsersGroup}
                />
                <Button variant="orange" size="lg" asChild>
                    <Link href={route('admin.users.index')}>
                        <IconArrowLeft className="size-4"></IconArrowLeft>Kembali
                    </Link>
                </Button>
            </div>
            <Card>
                <CardContent className="p-6">
                    <form className="space-y-4" onSubmit={onHandleSubmit}>
                        <div className="grid w-full items-center gap-1.5">
                            <Label htmlFor="nisn">NISN</Label>
                            <Input
                                id="nisn"
                                name="nisn"
                                placeholder="Masukkan nisn pengguna"
                                value={data.nisn}
                                onChange={onHandleChange}
                            />
                            {errors.nisn && <InputError message={errors.nisn} />}
                        </div>
                        <div className="grid w-full items-center gap-1.5">
                            <Label htmlFor="nama">Nama</Label>
                            <Input
                                id="nama"
                                name="nama"
                                placeholder="Masukkan nama pengguna"
                                value={data.nama}
                                onChange={onHandleChange}
                            />
                            {errors.nama && <InputError message={errors.nama} />}
                        </div>
                        <div className="grid w-full items-center gap-1.5">
                            <Label htmlFor="email">Email</Label>
                            <Input
                                id="email"
                                name="email"
                                placeholder="Masukkan email pengguna"
                                value={data.email}
                                type="email"
                                onChange={onHandleChange}
                            />
                            {errors.email && <InputError message={errors.email} />}
                        </div>
                        <div className="grid w-full items-center gap-1.5">
                            <Label htmlFor="password">Password</Label>
                            <Input
                                id="password"
                                name="password"
                                placeholder="Masukkan password pengguna"
                                value={data.password}
                                type="password"
                                onChange={onHandleChange}
                            />
                            {errors.password && <InputError message={errors.password} />}
                        </div>
                        <div className="grid w-full items-center gap-1.5">
                            <Label htmlFor="password_confirmation">Konfirmasi Password</Label>
                            <Input
                                id="password_confirmation"
                                name="password_confirmation"
                                placeholder="Konfirmasi password pengguna"
                                value={data.password_confirmation}
                                type="password"
                                onChange={onHandleChange}
                            />
                            {errors.password_confirmation && <InputError message={errors.password_confirmation} />}

                        </div>
                        <div className="flex justify-end gap-x-2">
                            <Button type="button" variant="ghost" onClick={() => reset()} size="lg">
                                Reset
                            </Button>
                            <Button variant="orange" type="submit" size="lg">
                                Simpan
                            </Button>
                        </div>
                    </form>
                </CardContent>
            </Card>
        </div>
    );
}

Create.layout = (page) => (
    <AppLayout children={page} title={page.props.page_settings.title} subtitle={page.props.page_settings.subtitle} />
);
