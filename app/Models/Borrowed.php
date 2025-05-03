<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Borrowed extends Model
{
    protected $fillable = [
        'user_id',
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
    public function ReturnBook()
    {
        return $this->hasOne(ReturnBook::class);
    }
}
