import { Head } from '@inertiajs/react';

export default function GuestLayout({ title, children }) {
    return (
        <>
            <Head title={title} />
            {children}
        </>
    );
}