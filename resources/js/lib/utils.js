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
        title: 'Service Unavailable',
        description: 'Sorry, we are doing some maintenance. Please check back later.',
        status: 503,
    },
    500: {
        title: 'Server Error',
        description: 'Sorry, something went wrong. Please try again later.',
        status: 500,
    },
    404: {
        title: 'Page Not Found',
        description: "Sorry, we couldn't find the page you were looking for.",
        status: 404,
    },
    403: {
        title: 'Forbidden',
        description: "Sorry, you don't have permission to access this page.",
        status: 403,
    },
    401: {
        title: 'Unauthorized',
        description: 'Sorry, you need to authorized to access this page.',
        status: 401,
    },
    429: {
        title: 'Too Many Requests',
        description: 'Sorry, you are being rate limited. Please try again later.',
        status: 429,
    },
};
