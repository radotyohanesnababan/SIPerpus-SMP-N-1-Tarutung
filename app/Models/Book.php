<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use App\Enums\BookStatus;

class Book extends Model
{
    protected $fillable = [
        'judul',
        'slug',
        'tahun_terbit',
        'isbn',
        'deskripsi',
        'penerbit',
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
    public function Borrwoed()
    {
        return $this->hasMany(Borrowed::class);
    }

}
