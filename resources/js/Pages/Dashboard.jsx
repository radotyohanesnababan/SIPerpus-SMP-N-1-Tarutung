import CardStat from '@/Components/CardStat';
import HeaderTitle from '@/Components/HeaderTitle';
import { Button } from '@/Components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/Components/ui/card';
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from '@/Components/ui/table';
import AppLayout from '@/Layouts/AppLayout';
import { Link } from '@inertiajs/react';
import {
    IconArrowUpRight,
    IconBooks,
    IconCreditCardPay,
    IconCreditCardRefund,
    IconDashboard,
    IconUsersGroup,
} from '@tabler/icons-react';

export default function Dashboard(props) {
    const auth = props.auth.user;
    return (
        <div className="flex flex-col w-full pb-32 space-y-4">
            <div className="flex flex-col items-start justify-between gap-y-4 lg:flex-row lg:items-center">
                <HeaderTitle
                    title={props.page_settings.title}
                    subtitle={props.page_settings.subtitle}
                    icon={IconDashboard}
                ></HeaderTitle>
            </div>
            {auth.role.some((role) => ['admin'].includes(role)) && (
                <div className="grid gap-4 md:grid-cols-2 md:gap-8 lg:grid-cols-4">
                    <CardStat
                        data={{
                            title: 'Total Buku',
                            icon: IconBooks,
                            background: 'text-white bg-gradient-to-tr from-blue-400 via-blue-500 to-blue-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_books}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Pengguna',
                            icon: IconUsersGroup,
                            background: 'text-white bg-gradient-to-tr from-purple-400 via-purple-500 to-purple-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_users}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Peminjaman',
                            icon: IconCreditCardPay,
                            background: 'text-white bg-gradient-to-tr from-rose-400 via-rose-500 to-rose-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_borrowed}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Pengembalian',
                            icon: IconCreditCardRefund,
                            background: 'text-white bg-gradient-to-tr from-lime-400 via-lime-500 to-lime-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_returned}</div>
                    </CardStat>
                </div>
            )}
            {auth.role.some((role) => ['member'].includes(role)) && (
                <div className="grid gap-4 md:grid-cols-2 md:gap-8 lg:grid-cols-4">
                    <CardStat
                        data={{
                            title: 'Total Buku Tersedia',
                            icon: IconBooks,
                            background: 'text-white bg-gradient-to-tr from-blue-400 via-blue-500 to-blue-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_books}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Kategori Buku',
                            icon: IconBooks,
                            background: 'text-white bg-gradient-to-tr from-rose-400 via-rose-500 to-rose-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_books}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Peminjaman',
                            icon: IconCreditCardPay,
                            background: 'text-white bg-gradient-to-tr from-green-400 via-green-500 to-green-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_borrowed}</div>
                    </CardStat>
                    <CardStat
                        data={{
                            title: 'Total Pengembalian',
                            icon: IconCreditCardRefund,
                            background: 'text-white bg-gradient-to-tr from-purple-400 via-purple-500 to-purple-600',
                            iconClassName: 'text-white',
                        }}
                    >
                        <div className="text-2xl font-bold">{props.page_data.total_returned}</div>
                    </CardStat>
                </div>
            )}

            <div className="flex flex-col justify-between w-full gap-2 lg:flex-row">
                <Card className="w-full lg:w-1/2">
                    <CardHeader>
                        <div className="flex flex-col justify-between gap-y-4 lg:flex-row lg:items-center">
                            <div className="flex flex-col gap-y-2">
                                <CardTitle> Transaksi Peminjaman</CardTitle>
                                <CardDescription>Data Peminjaman Terbaru</CardDescription>
                            </div>
                            <Button variant="orange" asChild>
                                {auth.role.some((role) => ['admin'].includes(role)) ? (
                                    <Link href={route('admin.borroweds.index')}>
                                        Lihat Semua
                                        <IconArrowUpRight className="size-4" />
                                    </Link>
                                ) : (
                                    <Link href="#">
                                        Lihat Semua
                                        <IconArrowUpRight className="size-4" />
                                    </Link>
                                )}
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent className="p-0 [&_td:whitespace-nowrap] [&_td]:px-6 [&_th]:px-6">
                        <Table className="w-full">
                            <TableHeader>
                                <TableRow>
                                    <TableHead>#</TableHead>
                                    <TableHead>ID Pinjam</TableHead>
                                    <TableHead>Buku</TableHead>
                                    <TableHead>Peminjam</TableHead>
                                </TableRow>
                            </TableHeader>
                            {props.page_data.borroweds.map((borroweds, index) => (
                                <TableRow key={index}>
                                    <TableCell>{index + 1}</TableCell>
                                    <TableCell>{borroweds.id}</TableCell>
                                    <TableCell>{borroweds.book.judul}</TableCell>
                                    <TableCell>{borroweds.user.nama}</TableCell>
                                </TableRow>
                            ))}
                        </Table>
                    </CardContent>
                </Card>
                <Card className="w-full lg:w-1/2">
                    <CardHeader>
                        <div className="flex flex-col justify-between gap-y-4 lg:flex-row lg:items-center">
                            <div className="flex flex-col gap-y-2">
                                <CardTitle> Transaksi Pengembalian</CardTitle>
                                <CardDescription>Data Pengembalian Terbaru</CardDescription>
                            </div>
                            <Button variant="orange" asChild>
                                {auth.role.some((role) => ['admin'].includes(role)) ? (
                                    <Link href={route('admin.return-books.index')}>
                                        Lihat Semua
                                        <IconArrowUpRight className="size-4" />
                                    </Link>
                                ) : (
                                    <Link href="#">
                                        Lihat Semua
                                        <IconArrowUpRight className="size-4" />
                                    </Link>
                                )}
                            </Button>
                        </div>
                    </CardHeader>
                    <CardContent className="p-0 [&_td:whitespace-nowrap] [&_td]:px-6 [&_th]:px-6">
                        <Table className="w-full">
                            <TableHeader>
                                <TableRow>
                                    <TableHead>#</TableHead>
                                    <TableHead>ID Pinjam</TableHead>
                                    <TableHead>Buku</TableHead>
                                    <TableHead>Peminjam</TableHead>
                                </TableRow>
                            </TableHeader>
                            <TableBody>
                                {props.page_data.return_books.map((return_books, index) => (
                                    <TableRow key={index}>
                                        <TableCell>{index + 1}</TableCell>
                                        <TableCell>{return_books.id}</TableCell>
                                        <TableCell>{return_books.book.judul}</TableCell>
                                        <TableCell>{return_books.user.nama}</TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </CardContent>
                </Card>
            </div>
        </div>
    );
}

Dashboard.layout = (page) => <AppLayout children={page} title="Dashboard" />;
