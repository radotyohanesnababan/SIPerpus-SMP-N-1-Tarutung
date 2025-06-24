import * as React from 'react';

import { cn } from '@/lib/utils';

const Input = React.forwardRef(({ className, type, size = 'h-12', ...props }, ref) => {
    return (
        <input
            type={type}
            className={cn(
                'flex  w-full rounded-md border border-input bg-transparent p-3 py-1 text-base shadow-none transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium file:text-foreground placeholder:text-muted-foreground focus-visible:ring-2 outline-none focus-visible:ring-orange-500 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50 md:text-sm',
                size,
                className,
            )}
            ref={ref}
            {...props}
        />
    );
});
Input.displayName = 'Input';

export { Input };
