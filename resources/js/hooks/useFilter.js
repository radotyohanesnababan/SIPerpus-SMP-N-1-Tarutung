import { router } from '@inertiajs/react';
import { debounce, pickBy } from 'lodash';
import { useCallback, useEffect } from 'react';

export function useFilter({ route, values, only, wait = 300 }) {
    const reload = useCallback(
        debounce((query) => {
            router.get(route, pickBy(query), {
                only: only,
                preserveState: true,
                preserveScroll: true,
            });
        }, wait),
        [route, only, wait],
    );

    useEffect(() => {
        reload(values);
    }, [values, reload]);

    return { values };
}
