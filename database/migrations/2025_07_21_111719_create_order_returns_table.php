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
        Schema::create('order_returns', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('return_id');
            $table->bigInteger('order_id');
            $table->decimal('return_amount', 12, 2)->default(0);
            $table->integer('return_reason')->nullable();
            $table->string('return_description', 255)->nullable();
            $table->integer('return_initiated_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_returns');
    }
};
