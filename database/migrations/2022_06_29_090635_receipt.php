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
        //
        Schema::create('receipts', function (Blueprint $table) {
            $table->id();
            $table->string('no_receipt');
            $table->string('medical_record');
            $table->string('episode');
            $table->string('nama_pasien');
            $table->bigInteger('price');
            $table->integer('discount');
            $table->string('user_name');
            $table->string('penjamin');
            $table->date('date_pengobatan');
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
