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
        Schema::create('order_items', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('order_id')->index();
            $table->string('product_code')->index();
            $table->bigInteger('quantity')->default(0);
            $table->decimal('price', 10, 2)->default(0);
            $table->decimal('mr_price', 10, 2)->default(0);
            $table->decimal('subtotal', 10, 2)->default(0);
            $table->decimal('shipping_cost', 10, 2)->default(0);
            $table->timestamps();
            
            // Defining the foreign key constraint
            $table->foreign('product_code')
                  ->references('product_code')
                  ->on('products');
                  
            // Defining the foreign key constraint
            $table->foreign('order_id')
                  ->references('order_id')
                  ->on('orders');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_items');
    }
};
