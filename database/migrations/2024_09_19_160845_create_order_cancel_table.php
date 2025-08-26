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
        Schema::create('order_cancel', function (Blueprint $table) {
            $table->bigInteger('id')->primary()->autoIncrement();
            $table->bigInteger('order_item_id');
            $table->bigInteger('cancel_reason');
            $table->string('reason_description');
            $table->string('policy_checked')->nullable();
            $table->string('cancelled_by')->nullable();
            $table->timestamps();
            
            // Defining the foreign key constraint
            $table->foreign('order_item_id')
                  ->references('id')
                  ->on('order_items');
                  
            // Defining the foreign key constraint
            $table->foreign('cacel_reason')
                  ->references('id')
                  ->on('order_cancel_reasons');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_cancel');
    }
};
