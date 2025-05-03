<?php

namespace App\Models;

use App\Enums\ReturnBookCondition;
use App\Enums\ReturnBookStatus;
use Illuminate\Database\Eloquent\Model;

class ReturnBook extends Model
{
    protected $fillable = [
        'user_id',
        'book_id',
        'returned_at',
        'kondisi',
        'keterangan',

    ];
    protected $casts = [
        'returned_at' => 'date',
        'status'=> ReturnBookStatus::class,
        'kondisi'=>ReturnBookCondition::class,
    ];

    public function Borrowed()
    {
        return $this->belongsTo(Borrowed::class);
    }
    public function book()
    {
        return $this->belongsTo(Book::class);
    }
}
