<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
   
    public function up(): void
    {
        Schema::table('ebooks', function (Blueprint $table) {
            if (Schema::hasColumn('ebooks', 'kondisi')) {
                $table->dropColumn('kondisi');
            }
        });
    }

    public function down(): void
    {
        Schema::table('ebooks', function (Blueprint $table) {
            $table->string('kondisi')->nullable();
        });
    }
};
