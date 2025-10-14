import { cn } from '@/lib/utils';
import { Link } from '@inertiajs/react';

export default function NavLink({ active = false, url = '#', title, icon: Icon, ...props }) {
    return (
        <Link
            {...props}
            href={url}
            className={cn(
                active
                    ? 'bg-gradient-to-r from-blue-300 via-blue-400 to-blue-300 font-semibold text-gray-900 hover:text-gray-900'
                    : 'text-muted-foreground hover:text-blue-400',
                'flex items-center gap-3 rounded-lg p-2 font-medium transition-all',
            )}
        >
            <Icon className="h-4 w-4" />
            {title}
        </Link>
    );
}
