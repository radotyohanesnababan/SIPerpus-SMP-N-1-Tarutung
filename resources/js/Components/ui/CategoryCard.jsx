import { Card, CardContent, CardHeader, CardTitle } from '@/Components/ui/card';
import { cn } from '@/lib/utils';
import { Link } from '@inertiajs/react';
export default function CategoryCard({ item, className }) {
    return (
        <Link href={route('front.categories.show', [item.slug])} className="hover:opacity-80 transition">
            <Card className={cn('h-40 flex flex-col justify-between bg-gray-300', className)}>
                <CardHeader className="flex flex-row items-center justify-between pb-2">
                    <CardTitle className="text-base font-semibold">{item.name}</CardTitle>
                </CardHeader>

                <CardContent className="text-sm text-muted-foreground">
                    <div className="h-2 py-2 font-bold text-black">Total {item.books_count} buku</div>
                </CardContent>
            </Card>
        </Link>
    );
}
