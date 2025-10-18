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
    Schema::create('ebook_downloads', function (Blueprint $table) {
    $table->id();
    $table->foreignId('ebook_id')->constrained()->onDelete('cascade');


    $table->bigInteger('user_nisn')->nullable();

  
    $table->foreign('user_nisn')
          ->references('nisn')   
          ->on('users')
          ->onDelete('set null');

    $table->timestamp('downloaded_at')->useCurrent();
});

}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ebook_downloads');
    }
};
