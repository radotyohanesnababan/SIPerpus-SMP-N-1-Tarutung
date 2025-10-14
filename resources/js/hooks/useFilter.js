import { router } from '@inertiajs/react';
import { debounce, isEqual, pickBy } from 'lodash';
import { useEffect, useMemo, useRef } from 'react';

export function useFilter({ route, values, only, wait = 300 }) {
    const lastQuery = useRef(null);
    const reload = useMemo(
        () =>
            debounce((query) => {
                //console.log('[useFilter] reload dipanggil dengan:', query);
                if (!isEqual(lastQuery.current, query)) {
                    lastQuery.current = query;
                    router.get(route, pickBy(query), {
                        only,
                        preserveState: true,
                        preserveScroll: true,
                    });
                }
            }, wait),
        [route, only, wait],
    );

    useEffect(() => {
        //console.log('[useFilter] useEffect jalan, values:', values);
        reload(values);
    }, [values, reload]);

    return { values };
}
