<?php

namespace Database\Factories;

use Faker\Guesser\Name;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $name = $this->faker->unique()->randomElement([
                'Novel',
                'Komik',
                'Majalah',
                'Ensiklopedia',
                'Buku Pelajaran/Paket',
                'Buku Referensi',
                'Buku Fiksi',
                'Buku Non-Fiksi',
                
            ]),
            'slug'=> str()->lower(str()->slug($name)) . str()->random(4),
        ];
    }
}
