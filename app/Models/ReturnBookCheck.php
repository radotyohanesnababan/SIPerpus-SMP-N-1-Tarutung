<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Enums\ReturnBookCondition;


class ReturnBookCheck extends Model
{
    protected $fillable = [
        'return_book_id',
        'condition',
        'notes',
        'book_id',
        
        
    ];

    public function returnBook()
    {
        return $this->belongsTo(ReturnBook::class);
    }
     public function book()
    {
        return $this->belongsTo(Book::class);
    }

    protected function casts(): array
    {
        return [
            'condition' => ReturnBookCondition::class,
        ];
    }
}
