<?php

namespace App\Models;

use App\Enums\ReturnBookCondition;
use App\Enums\ReturnBookStatus;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class ReturnBook extends Model
{
    protected $fillable = [
        'user_nisn',
        'book_id',
        'return_date',
        'kondisi',
        'keterangan',

    ];
    protected $casts = [
        'returned_at' => 'date',
        'status'=> ReturnBookStatus::class,
        'kondisi'=>ReturnBookCondition::class,
    ];

    public function borrowed()
    {
        return $this->belongsTo(Borrowed::class);
    }
    public function book()
    {
        return $this->belongsTo(Book::class);
    }
     public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function returnBookCheck()
    {
        return $this->hasOne(ReturnBookCheck::class);
    }

    public function scopeFilter(Builder $query, array $filters): void
    {
        $query->when($filters['search'] ?? null, function (Builder $query, string $search) {
            $query->where(function ($query) use ($search) {

                $query->whereAny([
                    'id',
                    'status'
                ],'REGEXP', $search);
            })
            ->orWhereHas('borrowed', fn($query) => $query->where('id', 'REGEXP', $search))
            ->orWhereHas('user', fn($query) => $query->where('nama', 'REGEXP', $search))
            ->orWhereHas('book', fn($query) => $query->where('judul', 'REGEXP', $search));
        });
    }

    public function scopeSorting(Builder $query, array $sorts): void
    {
        $query->when($sorts['field'] ?? null && $sorts['direction'] ?? null, function ($query) use ($sorts) {
            match($sorts['field']) {
                'id' => $query->whereHas('borrowed', fn($query) => $query->orderBy('id', $sorts['direction'])),
                'status' => $query->orderBy('status', $sorts['direction']),
                default => $query->orderBy($sorts['field'], $sorts['direction']),

                
            };
        });
    }

    public function scopeReturned(Builder $query): Builder
    {
        return $query->where('status', ReturnBookStatus::RETURNED->value);
    }

    public function scopeChecked(Builder $query): Builder
    {
        return $query->where('status', ReturnBookStatus::CHECKED->value);
    }

     public function scopeMember(Builder $query, string $user_nisn): Builder
    {
        return $query->where('user_nisn', $user_nisn);
    }
}
