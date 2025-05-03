<?php

namespace App\Enums;

enum ReturnBookCondition: string
{
    case GOOD = 'Baik';
    case LOST = 'Hilang';

    public static function options(): array
    {
        return collect(self::cases())->map(fn($item) => [
            'value' => $item->value,
            'label' => $item->name,
        ])->values()->toArray();
    }
}