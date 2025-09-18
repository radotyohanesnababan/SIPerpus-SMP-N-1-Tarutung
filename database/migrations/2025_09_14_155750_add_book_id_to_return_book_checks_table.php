<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::table('return_book_checks', function (Blueprint $table) {
        $table->unsignedBigInteger('book_id')->after('return_book_id');
    });
}

public function down()
{
    Schema::table('return_book_checks', function (Blueprint $table) {
        $table->dropColumn('book_id');
    });
}

};
