<?php

namespace Database\Factories;

use App\Models\Book;
use App\Models\Category;
use App\Models\Publisher;
use App\Models\Stock;
use Illuminate\Database\Eloquent\Factories\Factory;

class BookFactory extends Factory
{
    protected $model = Book::class;

    public function definition(): array
    {
        $categoryIds = Category::pluck('id')->toArray();
        $publisherIds = Publisher::pluck('id')->toArray();
        $covers = ['samplecover.jpg'];

        return [
            'judul' => $this->faker->sentence(3),
            'slug' => $this->faker->slug(),
            'tahun_terbit' => $this->faker->numberBetween(1990, 2025),
            'isbn' => $this->faker->isbn13(),
            'deskripsi' => $this->faker->paragraph(),
            'kondisi' => 'Tersedia',
            'cover' => 'storage/covers/' . $this->faker->randomElement($covers),
            'category_id' => $this->faker->randomElement($categoryIds),
            'publisher_id' => $this->faker->randomElement($publisherIds),
        ];
    }
}
