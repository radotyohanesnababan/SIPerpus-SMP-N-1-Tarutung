import { Button } from '@/Components/ui/button';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/Components/ui/select';
import { Head, router, useForm } from '@inertiajs/react';
import { useEffect } from 'react';

import HeaderTitle from '@/Components/HeaderTitle';
import { Card, CardContent, CardFooter } from '@/Components/ui/card';
import { Label } from '@/Components/ui/label';
import { Pagination, PaginationContent, PaginationItem, PaginationLink } from '@/Components/ui/pagination';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/Components/ui/table';
import AppLayout from '@/Layouts/AppLayout';
import { IconSchool } from '@tabler/icons-react';
import { toast } from 'sonner';

export default function Upgrade({ kelas, status, ...props }) {
    const { meta } = props;
    useEffect(() => {
        if (props.flash_message?.message) {
            toast[props.flash_message.type || 'success'](props.flash_message.message);
        }
    }, [props.flash_message]);

    const { data, setData, post, processing, errors, reset } = useForm({
        kelas_asal: '',
    });

    const submit = (e) => {
        e.preventDefault();
        post(route('admin.kelas.upgrade.post'), {
            preserveScroll: true,
            onSuccess: () => reset(),
        });
    };

    return (
        <>
            <Head title="Kenaikan Kelas" />
            <HeaderTitle title={props.page_settings.title} subtitle={props.page_settings.subtitle} icon={IconSchool} />
            <div className="max-w-2xl mx-auto py-10">
                <Card className="shadow-lg">
                    <CardContent className="space-y-6 p-6">
                        <h2 className="text-2xl font-semibold text-center">Kenaikan Kelas Siswa</h2>

                        <form onSubmit={submit} className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="kelas_asal">Pilih Kelas Asal</Label>
                                <Select
                                    value={data.kelas_asal || ''}
                                    onValueChange={(value) => {
                                        setData('kelas_asal', value);

                                        if (value) {
                                            router.visit(route('admin.kelas.index'), {
                                                method: 'get',
                                                data: { kelas_asal: value },
                                                preserveScroll: true,
                                                preserveState: true,
                                            });
                                        }
                                    }}
                                >
                                    <SelectTrigger>
                                        <SelectValue placeholder="Pilih Kelas Asal" />
                                    </SelectTrigger>
                                    <SelectContent>
                                        {kelas.map((k) => (
                                            <SelectItem key={k.id} value={String(k.id)}>
                                                {k.tingkat}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                                {errors.kelas_asal && <p className="text-sm text-red-600">{errors.kelas_asal}</p>}
                            </div>
                            {props.users?.data?.length > 0 && (
                                <div className="mt-6 border rounded-lg">
                                    <h3 className="text-lg font-semibold text-center py-2 bg-gray-100">
                                        Daftar Siswa di Kelas Ini ({props.users?.data?.length})
                                    </h3>
                                    <Table className="w-full text-sm">
                                        <TableHeader>
                                            <TableRow className="bg-gray-200 text-left">
                                                <TableHead className="px-4 py-2">Nama</TableHead>
                                                <TableHead className="px-4 py-2">NISN</TableHead>
                                            </TableRow>
                                        </TableHeader>
                                        <TableBody>
                                            {props.users.data.map((u) => (
                                                <TableRow key={u.nisn} className="border-t">
                                                    <TableCell className="px-4 py-2">{u.nama}</TableCell>
                                                    <TableCell className="px-4 py-2">{u.nisn}</TableCell>
                                                </TableRow>
                                            ))}
                                        </TableBody>
                                    </Table>
                                </div>
                            )}

                            <Button
                                type="submit"
                                disabled={processing || !data.kelas_asal}
                                className="w-full bg-sky-400 hover:bg-sky-500 text-white font-semibold"
                            >
                                {processing ? 'Memproses...' : 'Naikkan Kelas'}
                            </Button>
                        </form>

                        {status && <div className="mt-4 text-green-600 font-semibold text-center">{status}</div>}
                    </CardContent>
                    <CardFooter className="flex flex-col items-center justify-between w-full py-2 border-t lg:flex-row">
                        <p className="mb-2 text-sm text-muted-foreground">
                            Menampilkan{' '}
                            <span className="font-medium text-orange-500">{props.users?.meta?.from ?? 0}</span> dari{' '}
                            {props.users?.meta?.total} total siswa.
                        </p>
                        <div className="overflow-x-auto">
                            {props.users?.meta?.has_pages && (
                                <Pagination>
                                    <PaginationContent className="flex flex-wrap justify-center lg:justify-end">
                                        {meta.links.map((link, index) => (
                                            <PaginationItem key={index} className="mx-1 mb1 lb:mb-0">
                                                <PaginationLink href={link.url} isActive={link.active}>
                                                    {link.label}
                                                </PaginationLink>
                                            </PaginationItem>
                                        ))}
                                    </PaginationContent>
                                </Pagination>
                            )}
                        </div>
                    </CardFooter>
                </Card>
            </div>
        </>
    );
}

Upgrade.layout = (page) => (
    <AppLayout title={page.props.page_settings.title} subtitle={page.props.page_settings.subtitle}>
        {page}
    </AppLayout>
);
