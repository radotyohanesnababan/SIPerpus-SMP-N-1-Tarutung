import { Button } from '@/Components/ui/button';
import { Calendar } from '@/Components/ui/calendar';
import { Popover, PopoverContent, PopoverTrigger } from '@/Components/ui/popover';
import { cn } from '@/lib/utils';
import { format } from 'date-fns';
import { Calendar as CalendarIcon } from 'lucide-react';
import * as React from 'react';

export function DatePickerWithRange({ value, onChange }) {
    const [date, setDate] = React.useState(value || { from: null, to: null });

    const handleSelect = (selected) => {
        setDate(selected);
        if (onChange) onChange(selected);
    };

    return (
        <div className={cn('grid gap-2')}>
            <Popover>
                <PopoverTrigger asChild>
                    <Button
                        variant={'outline'}
                        className={cn(
                            'w-full justify-start text-left font-normal',
                            !date.from && 'text-muted-foreground',
                        )}
                    >
                        <CalendarIcon className="mr-2 h-4 w-4" />
                        {date.from ? (
                            date.to ? (
                                <>
                                    {format(date.from, 'dd MMM yyyy')} - {format(date.to, 'dd MMM yyyy')}
                                </>
                            ) : (
                                format(date.from, 'dd MMM yyyy')
                            )
                        ) : (
                            <span>Pilih Periode</span>
                        )}
                    </Button>
                </PopoverTrigger>
                <PopoverContent className="w-auto p-0" align="start">
                    <Calendar
                        initialFocus
                        mode="range"
                        defaultMonth={date.from}
                        selected={date}
                        onSelect={handleSelect}
                        numberOfMonths={2}
                    />
                </PopoverContent>
            </Popover>
        </div>
    );
}
