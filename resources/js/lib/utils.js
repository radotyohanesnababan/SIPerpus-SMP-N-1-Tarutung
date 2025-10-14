import { usePage } from '@inertiajs/react';
import { clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs) {
    return twMerge(clsx(inputs));
}

export default function flashMessage(params) {
    const { props } = usePage().props;
    return flashMessage ?? null;
}

export const messages = {
    503: {
        title: 'Layanan Tidak Tersedia',
        description: 'Maaf, kami sedang melakukan pemeliharaan sistem. Silakan coba lagi nanti.',
        status: 503,
    },
    500: {
        title: 'Kesalahan Server',
        description: 'Maaf, terjadi kesalahan pada server. Silakan coba lagi beberapa saat.',
        status: 500,
    },
    404: {
        title: 'Halaman Tidak Ditemukan',
        description: 'Maaf, halaman yang Anda cari tidak ditemukan atau sudah dihapus.',
        status: 404,
    },
    403: {
        title: 'Akses Ditolak',
        description: 'Maaf, Anda tidak memiliki izin untuk mengakses halaman ini.',
        status: 403,
    },
    401: {
        title: 'Tidak Diizinkan',
        description: 'Maaf, Anda harus masuk terlebih dahulu untuk mengakses halaman ini.',
        status: 401,
    },
    429: {
        title: 'Terlalu Banyak Permintaan',
        description: 'Maaf, Anda mengirim terlalu banyak permintaan. Silakan coba lagi nanti.',
        status: 429,
    },
    419: {
        title: 'Sesi Berakhir',
        description: 'Sesi Anda telah berakhir. Silakan muat ulang halaman atau masuk kembali.',
        status: 419,
    },
};
