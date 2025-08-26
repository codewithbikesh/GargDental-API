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
        Schema::create('coupons', function (Blueprint $table) {
            $table->id();
            $table->string('title', 255);
            $table->string('code', 255);
            $table->date('start_date')->nullable();
            $table->date('expire_date')->nullable();
            $table->decimal('minimum_purchase', 24, 2)->default(0);
            $table->decimal('discount', 24, 2)->default(0);
            $table->string('coupon_type', 191)->nullable();
            $table->integer('limit')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->bigInteger('total_uses')->default(0);
            $table->json('customer_id')->nullable()->default(json_encode(['all']));
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('coupons');
    }
};
