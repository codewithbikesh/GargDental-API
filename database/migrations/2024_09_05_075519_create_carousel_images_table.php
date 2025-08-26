<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('carousel_images', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->string('product_code')->nullable();
            $table->string('file_path')->nullable();
            $table->integer('status', 1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('carousel_images');
    }
};
