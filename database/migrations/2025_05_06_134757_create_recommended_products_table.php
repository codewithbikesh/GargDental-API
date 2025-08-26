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
        Schema::create('recommended_products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('customer_id')->index();
            $table->string('product_code', 255);
            $table->timestamps();
            $table->unique(['customer_id', 'product_code']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('recommended_products');
    }
};
