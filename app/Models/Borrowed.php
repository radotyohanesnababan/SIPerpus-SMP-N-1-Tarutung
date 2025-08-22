<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Borrowed extends Model
{
    protected $fillable = [
        'user_nisn',
        'book_id',
        'borrowed_at',
        'returned_at',
    ];
    protected $casts = [
        'borrowed_at' => 'date',
        'returned_at' => 'date',
    ];
    public function user() 
    {
        return $this->belongsTo(User::class);
    }
    public function book()
    {
        return $this->belongsTo(Book::class);
    }
    public function returnBook()
    {
        return $this->hasOne(ReturnBook::class);
    }

    public function scopeFilter(Builder $query, array $filters): void
    {
        $query->when($filters['search'] ?? null, function ($query, $search) {
            $query->where(function ($query) use ($search) {
                $query->whereAny([
                    'id',
                    'user_nisn',
                    'book_id',
                    'returned_at',
                    'borrowed_at',
                ], 'REGEXP', $search);
            });
        });
    }
    public function scopeSorting(Builder $query, array $sorts): void
    {
        $query->when($sorts['field'] ?? null && $sorts['direction'] ?? null, function ($query) use ($sorts) {
            $query->orderBy($sorts['field'], $sorts['direction']);
        });
    }

    public static function checkBorrowedBook(int $user_nisn, int $book_id): bool
    {
        return self::query()
            ->where('user_nisn', $user_nisn)
            ->where('book_id', $book_id)
            ->whereDoesntHave('returnBook', fn($query)=> $query->where('book_id', $book_id)->where('user_nisn', $user_nisn))
            ->exists();
    }
}
