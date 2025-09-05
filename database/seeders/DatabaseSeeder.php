<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        

        User::factory()->create([
            'nisn' => '1370198567',
            'nama' => 'Test Admin',
            'email' => 'admin@example.com',
            'password' => 'password',
        ])->assignRole(Role::create(['name' => 'admin']));

        
        User::factory()->create([
            'nisn' => '2167284722',
            'nama' => 'Test Member',
            'email' => 'member@example.com',
            'password' => 'password',
        ])->assignRole(Role::create(['name' => 'member']));

        
    }
}
