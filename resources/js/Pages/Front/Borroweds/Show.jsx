import HeaderTitle from '@/Components/HeaderTitle';

import { Button } from '@/Components/ui/button';
import { Card, CardContent, CardFooter, CardHeader } from '@/Components/ui/card';
import AppLayout from '@/Layouts/AppLayout';
import { Link, router } from '@inertiajs/react';

import { IconCircleCheck, IconCreditCardPay } from '@tabler/icons-react';
import { useEffect } from 'react';
import { toast } from 'sonner';

export default function Show(props) {
    useEffect(() => {
        if (props.flash_message?.message) {
            toast[props.flash_message.type || 'success'](props.flash_message.message);
        }
    }, [props.flash_message]);

    return (
        <div className="flex flex-col w-full pb-32">
            <div className="flex flex-col items-start justify-between mb-8 gap-y-4 lg:flex-row lg:items-center">
                <HeaderTitle
                    title={props.page_settings.title}
                    subtitle={props.page_settings.subtitle}
                    icon={IconCreditCardPay}
                />
            </div>
            <Card>
                <CardHeader className="flex flex-col gap-6 text-sm border-b border-muted lg:flex-row lg:items-center lg:justify-between lg:px-6">
                    <div>
                        <dt className="font-medum text-foreground">ID Peminjaman</dt>
                        <dd className="mt-1 text-muted-foreground">{props.borrowed.id}</dd>
                    </div>
                    <div>
                        <dt className="font-medum text-foreground">Peminjam</dt>
                        <dd className="mt-1 text-muted-foreground">{props.borrowed.user.nama}</dd>
                    </div>
                    <div>
                        <dt className="font-medum text-foreground">Tanggal Peminjaman</dt>
                        <dd className="mt-1 text-muted-foreground">{props.borrowed.borrowed_at}</dd>
                    </div>
                </CardHeader>
                <CardContent className="py-6 divide-y divide-gray-200">
                    <div className="flex items-center lg:items-start">
                        <div className="flex-shrink-0 w-20 h-10 overflow-hidden bg-gray-200 rounded-lg lg:h-40 lg:w-40">
                            <img
                                src={props.borrowed.book.cover}
                                alt={props.borrowed.book.judul}
                                className="object-cover obect-center w-full h-full"
                            />
                        </div>
                        <div className="flex-1 ml-6 text-sm">
                            <h5 className="text-lg font-bold leading-relaxed">{props.borrowed.book.judul}</h5>
                            <p className="hidden text-muted-foreground lg:mt-2 lg:block">
                                {props.borrowed.book.deskripsi}
                            </p>
                        </div>
                    </div>
                </CardContent>
                <CardFooter className="flex flex-col lg:flex-row lg:items-center lg:justify-between">
                    <div className="flex items-center">
                        <IconCircleCheck className="text-green-500 size-5" />
                        <p className="ml-2 text-sm font-medium text-muted-foreground">
                            Kembalikan sebelum tanggal{' '}
                            <time dateTime={props.borrowed.returned_at}>{props.borrowed.returned_at}</time>
                        </p>
                    </div>

                    <div className="flex pt-6 text-sm font-medium lg:items-center lg:border-none lg:pt-0">
                        <div className="flex justify-between flex-1">
                            <Button variant="link">
                                <Link href={route('front.books.show', [props.borrowed.book.slug])}>Lihat Buku</Link>
                            </Button>
                            {!props.borrowed.return_book && (
                                <Button
                                    variant="orange"
                                    onClick={() =>
                                        router.post(
                                            route('front.return-books.store', [
                                                props.borrowed.book.slug,
                                                props.borrowed.id,
                                            ]),
                                        )
                                    }
                                >
                                    Kembalikan
                                </Button>
                            )}
                        </div>
                    </div>
                </CardFooter>
            </Card>
        </div>
    );
}

Show.layout = (page) => (
    <AppLayout title={page.props.page_settings.title} subtitle={page.props.page_settings.subtitle}>
        {page}
    </AppLayout>
);
