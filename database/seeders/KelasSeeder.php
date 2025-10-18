<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Kelas;

class KelasSeeder extends Seeder
{
    public function run(): void
    {
        $kelasList = ['VII', 'VIII', 'IX'];

        foreach ($kelasList as $tingkat) {
            Kelas::firstOrCreate(['tingkat' => $tingkat]);
        }
    }
}
