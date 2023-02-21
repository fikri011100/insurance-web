<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requests', function (Blueprint $table) {
            $table->id();
            $table->string('request_name');
            $table->string('request_email');
            $table->string('request_patient');
            $table->string('request_phone');
            $table->date('birthday');
            $table->date('date_medicine');
            $table->string('insurance');
            $table->string('episode');
            $table->integer('insurance_set');
            $table->integer('total_price');
            $table->string('status');
            $table->string('status_payment');
            $table->integer('price_medicine');
            $table->string('photo_payment')->nullable();
            $table->string('photo_taker')->nullable();
            $table->string('photo_ktp')->nullable();
            $table->string('photo_kk')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
};
