import { Link } from '@inertiajs/react';
export default function ApplicationLogo({ url = '#', size = 'size-9', isTitle = true }) {
    return (
        <Link href={url} className="flex items-center gap-2">
            <img src="/storage/logo/logo.png" alt="Logo" className="h-12 w-12" />
            {isTitle && (
                <div className="flex flex-col">
                    <span className="font-bold leading-none text-foreground">SPARTA</span>
                    <span className="text-xs font-medium text-muted-foreground">SMP Negeri 1 Tarutung</span>
                </div>
            )}
        </Link>
    );
}
