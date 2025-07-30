<?php

namespace App\Observers;
use App\Models\Book;


class BookObserver
{
    public function created( Book $book)
    {
      $book->stock()->create([
                'total' => $total = request()->stok,
                'available' => $total,
            ]);
    }
}
