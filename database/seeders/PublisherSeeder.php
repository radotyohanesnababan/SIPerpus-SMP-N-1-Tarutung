<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Publisher;
use Illuminate\Support\Str;

class PublisherSeeder extends Seeder
{
    public function run(): void
    {
         Publisher::factory()->count(11)->create();
    }
}
