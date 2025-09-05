<?php

use App\Enums\ReturnBookCondition;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Enums\ReturnBookStatus;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('return_books', function (Blueprint $table) {
            $table->id();
            $table->foreignId('borrowed_id')->constrained('borroweds')->cascadeOnDelete();
            $table->foreignId('book_id')->constrained('books')->cascadeOnDelete();
            $table->bigInteger('user_nisn');
            $table->foreign('user_nisn')->references('nisn')->on('users')->cascadeOnDelete();
            $table->date('returned_at');
            $table->string('status')->default(ReturnBookStatus::CHECKED);
            $table->string('kondisi')->default(ReturnBookCondition::GOOD);
            $table->string('keterangan')->nullable();
            $table->timestamps(); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('return_books');
    }
};
