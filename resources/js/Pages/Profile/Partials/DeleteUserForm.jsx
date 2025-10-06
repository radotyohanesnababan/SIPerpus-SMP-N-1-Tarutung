import InputError from '@/Components/InputError';
import Modal from '@/Components/Modal';
import { Button } from '@/Components/ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/Components/ui/card';
import { Input } from '@/Components/ui/input';
import { Label } from '@/Components/ui/label';
import { useForm } from '@inertiajs/react';
import { useRef, useState } from 'react';

export default function DeleteUserForm({ className = '' }) {
    const [confirmingUserDeletion, setConfirmingUserDeletion] = useState(false);
    const passwordInput = useRef();

    const {
        data,
        setData,
        delete: destroy,
        processing,
        reset,
        errors,
        clearErrors,
    } = useForm({
        password: '',
    });

    const confirmUserDeletion = () => {
        setConfirmingUserDeletion(true);
    };

    const deleteUser = (e) => {
        e.preventDefault();

        destroy(route('profile.destroy'), {
            preserveScroll: true,
            onSuccess: () => closeModal(),
            onError: () => passwordInput.current.focus(),
            onFinish: () => reset(),
        });
    };

    const closeModal = () => {
        setConfirmingUserDeletion(false);

        clearErrors();
        reset();
    };

    return (
        <Card className={`space-y-6 ${className}`}>
            <CardHeader>
                <CardTitle>Hapus Akun</CardTitle>

                <CardDescription>
                    Setelah akun Anda dihapus, semua sumber daya dan data yang ada di dalamnya akan dihapus secara
                    permanen. Sebelum menghapus akun Anda, silakan unduh data atau informasi yang ingin Anda simpan.
                </CardDescription>
            </CardHeader>

            <CardContent>
                <Button variant="red" onClick={confirmUserDeletion}>
                    Hapus Akun
                </Button>

                <Modal show={confirmingUserDeletion} onClose={closeModal}>
                    <form onSubmit={deleteUser} className="p-6">
                        <h2 className="text-lg font-medium text-foreground-900">
                            Apakah Anda yakin ingin menghapus akun Anda?
                        </h2>

                        <p className="mt-1 text-sm text-muted-foreground">
                            Setelah akun Anda dihapus, semua sumber daya dan data yang ada di dalamnya akan dihapus
                            secara permanen. Silakan masukkan kata sandi Anda untuk mengonfirmasi bahwa Anda ingin
                            menghapus akun Anda secara permanen.
                        </p>

                        <div className="mt-6">
                            <Label htmlFor="password" value="Password" className="sr-only"></Label>

                            <Input
                                id="password"
                                type="password"
                                name="password"
                                ref={passwordInput}
                                value={data.password}
                                onChange={(e) => setData('password', e.target.value)}
                                className="mt-1 block w-3/4"
                                placeholder="Password"
                            />

                            {errors.password && <InputError message={errors.password} className="mt-2" />}
                        </div>

                        <div className="mt-6 flex justify-end">
                            <Button variant="ghost" size="lg" onClick={closeModal}>
                                Batal
                            </Button>

                            <Button variant="red" size="lg" className="ms-3" disabled={processing}>
                                Hapus Akun
                            </Button>
                        </div>
                    </form>
                </Modal>
            </CardContent>
        </Card>
    );
}
