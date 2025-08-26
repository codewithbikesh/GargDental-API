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
        Schema::create('products', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->string('product_code')->index;
            $table->string('product_name', 255);
            $table->string('slug', 255)->unique();
            $table->string('product_description', 512)->nullable();
            $table->integer('category_id')->nullable();
            $table->string('delivery_target_days')->nullable();
            $table->decimal('discount', 8, 2)->nullable();
            $table->decimal('actual_price', 8, 2)->default(0);
            $table->decimal('sell_price', 8, 2)->default(0);
            $table->decimal('mr_price', 8, 2)->default(0);
            $table->string('unit_info')->nullable();
            $table->decimal('available_quantity', 8, 2)->nullable();
            $table->decimal('stock_quantity', 8, 2)->nullable();
            $table->integer('brand_id')->nullable();
            $table->string('product_location')->nullable();
            $table->integer('has_variations');
            $table->char('flash_sale', 1)->nullable();
            $table->char('weekly_offer', 1)->nullable();
            $table->char('special_offer', 1)->nullable();
            $table->integer('status');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
