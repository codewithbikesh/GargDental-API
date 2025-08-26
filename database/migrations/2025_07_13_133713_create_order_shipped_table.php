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
        Schema::create('order_shipped', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id')->index();
            $table->string('tracking_number', 255)->nullable();
            $table->integer('shipping_carrier')->nullable();
            $table->date('estimated_delivery_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_shipped');
    }
};
