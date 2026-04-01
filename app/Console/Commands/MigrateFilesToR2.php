<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Storage;

class MigrateFilesToR2 extends Command
{
    
    protected $signature = 'storage:migrate-r2';
    protected $description = 'Migrasi file dari lokal ke Cloudflare R2';

    public function handle()
    {
        $sourceDisk = 'public'; 
        $targetDisk = 'r2';     

      
        $files = Storage::disk($sourceDisk)->allFiles();
        $count = count($files);

        $this->info("Ditemukan $count file. Memulai migrasi...");
        $bar = $this->output->createProgressBar($count);
        $bar->start();

        foreach ($files as $file) {
        
            if (!Storage::disk($targetDisk)->exists($file)) {
               
                $stream = Storage::disk($sourceDisk)->readStream($file);
                Storage::disk($targetDisk)->writeStream($file, $stream);
            }
            
            $bar->advance();
        }

        $bar->finish();
        $this->info("\nMigrasi selesai!");
    }
}