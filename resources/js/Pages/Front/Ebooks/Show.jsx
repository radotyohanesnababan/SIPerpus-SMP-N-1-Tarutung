import { Button } from '@/Components/ui/button';
import AppLayout from '@/Layouts/AppLayout';
import { router } from '@inertiajs/react';

export default function Show(props) {
    return (
        <div className="flex flex-col w-full pb-32 space-y-12">
            <div className="lg:grid lg:grid-cols-12 lg:grid-rows-1 lg:gap-x-8 lg:gap-y-10">
                <div className="lg:col-span-4 lg:row-end-1">
                    <div className="overflow-hidden bg-gray-100 rounded-lg aspect-h-3 aspect-w-4 max-w-sm">
                        <img src={props.ebook.cover} alt={props.ebook.judul} />
                    </div>
                </div>

                <div className="mt-14 lg:col-span-8 lg:row-span-2 lg:row-end-2 lg:mt-0 lg:max-w-none">
                    <div className="flex flex-col-reverse">
                        <div className="mt-4">
                            <h2 className="text-xl font-bold tracking-tighter text-foreground">{props.ebook.judul}</h2>

                            <p className="mt-2 text-sm text-muted-foreground">{props.ebook.created_at}</p>
                        </div>
                    </div>
                    <p className="mt-2 text-sm leading-relaxed text-muted-foreground">{props.ebook.deskripsi}</p>
                    <div className="flex mt-10">
                        <Button
                            size="lg"
                            onClick={() => {
                                router.post(route('front.borroweds.store', { ebook: props.ebook.slug }));
                            }}
                        >
                            <a
                                href={route('front.ebooks.download', [props.ebook.id])}
                                target="_blank"
                                rel="noopener noreferrer"
                            >
                                Download PDF
                            </a>
                        </Button>
                    </div>

                    <div className="flex flex-col justify-start gap-10 pt-10 mt-10 border-t border-gray-200 lg:flex-row">
                        <div>
                            <h3 className="text-sm font-medium text-foreground">Tahun Publikasi</h3>
                            <p className="mt-4 text-sm text-muted-foreground">{props.ebook.tahun_terbit}</p>
                        </div>
                    </div>
                    <div className="flex flex-col justify-start gap-10 pt-10 mt-10 border-t border-gray-200 lg:flex-row">
                        <div>
                            <h3 className="text-sm font-medium text-foreground">ISBN</h3>
                            <p className="mt-4 text-sm text-muted-foreground">{props.ebook.isbn}</p>
                        </div>
                    </div>
                    <div className="flex flex-col justify-start gap-10 pt-10 mt-10 border-t border-gray-200 lg:flex-row">
                        <div>
                            <h3 className="text-sm font-medium text-foreground">Penerbit</h3>
                            <p className="mt-4 text-sm text-muted-foreground">{props.ebook.publisher_id.name}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

Show.layout = (page) => <AppLayout children={page} title={page.props.page_settings.title} />;
