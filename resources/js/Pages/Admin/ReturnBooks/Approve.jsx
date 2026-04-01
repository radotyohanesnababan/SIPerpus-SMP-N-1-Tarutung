import InputError from '@/Components/InputError';
import { Button } from '@/Components/ui/button';
import { Label } from '@/Components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/Components/ui/select';
import { Sheet, SheetContent, SheetDescription, SheetHeader, SheetTitle, SheetTrigger } from '@/Components/ui/sheet';
import { Textarea } from '@/Components/ui/textarea';
import flashMessage from '@/lib/utils';
import { useForm } from '@inertiajs/react';
import { IconChecklist } from '@tabler/icons-react';
import { useState } from 'react';
import { createPortal } from 'react-dom';

export default function Approve({ conditions, action }) {
    const [open, setOpen] = useState(false);

    const { data, setData, put, processing, errors } = useForm({
        condition: null,
        notes: '',
        _method: 'PUT',
    });

    const onHandleSubmit = (e) => {
        e.preventDefault();
        put(action, {
            preserveScroll: true,
            preserveState: false,
            onSuccess: (success) => {
                const flash = flashMessage(success);
                if (flash) toast[flash.type](flash.message);
            },
        });
    };

    return (
        <>
            <Sheet open={open} onOpenChange={setOpen}>
                <SheetTrigger asChild>
                    <Button variant="green" size="sm">
                        <IconChecklist className="text-white size-4" />
                    </Button>
                </SheetTrigger>
                <SheetContent>
                    <SheetHeader>
                        <SheetTitle>Konfirmasi kondisi buku?</SheetTitle>
                        <SheetDescription>Periksa dengan baik kondisi buku yang dikembalikan member.</SheetDescription>
                        <form className="mt-6 space-y-4" onSubmit={onHandleSubmit}>
                            <div className="grid w-full items-center gap-1.5">
                                <Label htmlFor="condition">Kondisi Buku</Label>
                                <Select
                                    defaultValue={data.condition}
                                    onValueChange={(value) => setData('condition', value)}
                                >
                                    <SelectTrigger>
                                        <SelectValue>
                                            {conditions.find((item) => item.value == data.condition)?.label ??
                                                'Pilih kondisi buku'}
                                        </SelectValue>
                                    </SelectTrigger>
                                    <SelectContent>
                                        {conditions.map((condition, index) => (
                                            <SelectItem key={index} value={condition.value}>
                                                {condition.label}
                                            </SelectItem>
                                        ))}
                                    </SelectContent>
                                </Select>
                            </div>
                            <div className="grid w-full items-center gap-1.5">
                                <Label htmlFor="notes">Kondisi Buku</Label>
                                <Textarea
                                    name="notes"
                                    id="notes"
                                    type="text"
                                    value={data.notes}
                                    onChange={(e) => setData('notes', e.target.value)}
                                    placeholder="Catatan..."
                                />
                                {errors.notes && <InputError message={errors.notes} />}
                            </div>
                            <div>
                                <Button type="submit" variant="green" disabled={processing}>
                                    Simpan
                                </Button>
                            </div>
                        </form>
                    </SheetHeader>
                </SheetContent>
            </Sheet>

                    {/* Logo watermark di area overlay, di luar sheet */}
                    {open && createPortal(
                        <div style={{
            position: 'fixed',
            inset: 0,
            zIndex: 51,
            pointerEvents: 'none',
            display: 'flex',
            alignItems: 'center',
            justifyContent: 'center',
            paddingRight: '384px',
        }}>
            <img
                src="/storage/logosekolah-rbg.png"
                alt=""
                style={{
                    width: '700px',
                    height: '700px',
                    objectFit: 'contain',
                    filter: 'grayscale(80%) brightness(2)',
                    opacity: 0.25,
                }}
            />
        </div>,
                document.body
            )}
        </>
    );
}