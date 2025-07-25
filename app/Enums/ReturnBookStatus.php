<?php

namespace App\Enums;

enum ReturnBookStatus: string{

    case RETURNED = 'Dikembalikan';
    case CHECKED = "Pengecekan";
    case DENIED = "Ditolak";

public static function options(): array
{
    return collect(self::cases())->map(fn($item) => [
        'value' => $item->value,
        'label' => $item->name,
    ])->values()->toArray();
}
}