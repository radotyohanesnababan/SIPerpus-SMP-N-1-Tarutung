<?php

namespace Database\Factories;

use App\Models\Stock;
use Illuminate\Database\Eloquent\Factories\Factory;

class StockFactory extends Factory
{
    protected $model = Stock::class;

    public function definition(): array
    {
        $total = $this->faker->numberBetween(5, 10);

        return [
            'book_id' => null, 
            'total' => $total,
            'available' => $total,
            'borrowed' => 0,
            'damaged' => 0,
            'lost' => 0,
        ];
    }
}
