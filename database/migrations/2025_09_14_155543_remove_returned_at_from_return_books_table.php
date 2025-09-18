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
    Schema::table('return_books', function (Blueprint $table) {
        $table->dropColumn('returned_at');
    });
}

public function down()
{
    Schema::table('return_books', function (Blueprint $table) {
        $table->date('returned_at')->nullable();
    });
}

};
