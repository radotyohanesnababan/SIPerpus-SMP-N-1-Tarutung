<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->text('deskripsi')->change(); // ubah dari VARCHAR(255) ke TEXT
        });
    }

    public function down()
    {
        Schema::table('books', function (Blueprint $table) {
            $table->string('deskripsi', 255)->change(); // kembalikan ke varchar 255
        });
    }
};

