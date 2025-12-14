import { Link } from '@inertiajs/react';

export default function BookCard({ item }) {
    console.log(item.cover);

    return (
        
        <div className="relative group">
            <div className="relative overflow-hidden rounded-lg bg-muted/40 h-80">
                <img src={item.cover} alt={item.judul} className="object-cover object-center w-full h-full" />
                <div className="absolute inset-0 flex items-end p-4 opacity-0 group-hover:opacity-100">
                    <div className="w-full px-4 py-2 text-sm font-medium text-center text-foreground bg-white dark:bg-slate-600 bg-opacity-75 rounded-md backdrop-blur backdrop-filter transition">
                        Lihat Buku
                    </div>
                </div>
            </div>

            <div className="flex items-center justify-between mt-4 text-base font-medium leading-relaxed text-foreground">
                <h3 className="line-clamp-1">
                    <Link href={route('front.books.show', {book: item.slug})}>
                        {item.judul}
                        <span className="absolute inset-0" />
                    </Link>
                </h3>
            </div>
            <p className="mt-1 text-sm leading-relaxed tracking-tighter line-clamp-2 text-muted-foreground">
                {item.deskripsi}
            </p>
        </div>
    );
}
