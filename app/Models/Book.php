<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use App\Enums\BookStatus;
use Illuminate\Contracts\Database\Eloquent\Builder;

class Book extends Model
{
    protected $fillable = [
        'judul',
        'slug',
        'tahun_terbit',
        'isbn',
        'deskripsi',
        'publisher_id',
        'kondisi',
        'category_id',
        'stok'
    ];
    
    protected $casts = [
        'kondisi' => BookStatus::class,
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
    public function stock()
    {
        return $this->hasOne(Stock::class);
    }
    public function publisher()
    {
        return $this->belongsTo(Publisher::class);
    }
    public function borrowed()
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
                    'kondisi',
                ], 'REGEXP', $search);
            });
        });
    }

    public function scopeSorting(Builder $query, array $sorts) : void
    {
        $query->when($sorts['field']?? null, $sorts['direction'] ?? null, function($query) use($sorts) {
            $query->orderBy($sorts['field'], $sorts['direction']);
        });
    }

}
