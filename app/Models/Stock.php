<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Book;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Stock extends Model
{
    use HasFactory;

    protected $fillable = [
        'book_id',
        'total',
        'available',
        'borrowed',
        'damaged',
        'lost',
        ];
    public function book(): BelongsTo
    {
        return $this->belongsTo(Book::class);
    }

    public function scopeFilter(Builder $query, array $filters): void {
        $query->when($filters['search']?? null, function($query, $search){
           $query->where(function($query) use ($search) {
               $query->whereHas('book', fn($query) =>
               $query->where('judul', 'REGEXP', $search)
               );
           }) ;
        });
    }
    public function scopeSorting(Builder $query, array $sorts):void{
        $query->when($sorts['field'] ?? null && $sorts['direction'] ?? null, function ($query) use ($sorts) {
            match($sorts['field']) {
                'book_id'=>$query->join('books', 'stocks.book_id', '=', 'books.id')
                    ->orderBy('books.judul', $sorts['direction']),
            default => $query->orderBy($sorts['field'], $sorts['direction'])
            };
        });
    }
}
