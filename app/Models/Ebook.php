<?php

namespace App\Models;

use App\Enums\BookStatus;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class Ebook extends Model
{
    protected $fillable = [
        'judul',
        'slug',
        'tahun_terbit',
        'isbn',
        'deskripsi',
        'cover',
        'file_path',
        'category_id',
        'publisher_id',
    ];
    protected $casts = [
        'kondisi' => BookStatus::class,
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }
    public function borroweds()
    {
        return $this->hasMany(Borrowed::class);
    }

    public function scopeFilter(Builder $query, array $filters) : void
    {
        $query->when($filters['search']?? null, function($query, $search){

            $query->where(function($query) use ($search) {
                $query->whereAny([
                    'id',
                    'judul',
                    'slug',
                    'tahun_terbit',
                    'isbn',
                ], 'REGEXP', $search);
            });
        });
    }

    public function scopeSorting(Builder $query, array $sorts): void
    {
        $query->when($sort['field'] ?? null && $sorts['direction'] ?? null, function ($query) use ($sorts) {
            $query->orderBy($sorts['field'], $sort['direction'] ?? 'asc');
        });
    }

}
