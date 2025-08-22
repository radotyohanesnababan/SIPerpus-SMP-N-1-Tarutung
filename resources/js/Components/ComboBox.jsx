import { Button } from '@/components/ui/button';
import { Command, CommandEmpty, CommandGroup, CommandInput, CommandItem, CommandList } from '@/components/ui/command';
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover';
import { cn } from '@/lib/utils';
import { IconCaretLeft, IconCheck } from '@tabler/icons-react';
import { useState } from 'react';

export default function ComboBox({ items, selectedItem, onSelect, placeholder = 'Pilih item...' }, ...props) {
    const [open, setOpen] = useState(false);

    const handleSelect = (value) => {
        onSelect(parseInt(value, 10));
        setOpen(false);
    };

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant="outline"
                    type="button"
                    role="combobox"
                    aria-expanded={open}
                    className="w-full justify-between"
                    {...props}
                >
                    {items.find((item) => item.value == selectedItem)?.label ?? 'Pilih item'}
                    <IconCaretLeft className="ml-2 h-4 w-4 shrink-0 opacity-50" />
                </Button>
            </PopoverTrigger>
            <PopoverContent
                className="max-h-[--radix-popover-content-available-height] w-[--radix-popover-trigger-width] p-0"
                align="start"
            >
                <Command>
                    <CommandInput placeholder={placeholder} className="h-9" />
                    <CommandList>
                        <CommandEmpty>Item tidak ditemukan</CommandEmpty>
                        <CommandGroup>
                            {items.map((item, index) => (
                                <CommandItem key={index} value={item.value} onSelect={(value) => handleSelect(value)}>
                                    {item.label}
                                    <IconCheck
                                        className={cn(
                                            'ml-auto h-4 w-4',
                                            selectedItem === item.label ? 'opacity-100' : 'opacity-0',
                                        )}
                                    />
                                </CommandItem>
                            ))}
                        </CommandGroup>
                    </CommandList>
                </Command>
            </PopoverContent>
        </Popover>
    );
}
