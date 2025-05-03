<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        

        User::factory()->create([
            'nisn' => '1234567890',
            'nama' => 'User1',
            'email' => 'user1@example.com',
        ]);
    }
}
