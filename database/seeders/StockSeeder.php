<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Book;
use App\Models\Stock;

class StockSeeder extends Seeder
{
    public function run(): void
    {
        $books = Book::all();

        foreach ($books as $book) {
            Stock::create([
                'book_id' => $book->id,
                'total' => rand(5, 10),
                'available' => rand(1, 10),
                'borrowed' => 0,
                'damaged' => 0,
                'lost' => 0,
            ]);
        }
    }
}
