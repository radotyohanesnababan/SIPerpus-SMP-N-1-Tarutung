<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Book;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        
        Book::factory()->count(12)->create();
    }
}
