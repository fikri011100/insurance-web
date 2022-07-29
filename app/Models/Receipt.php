<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Receipt extends Model
{
    use HasFactory;

    protected $fillable = [
        'no_receipt',
        'medical_record',
        'episode',
        'nama_pasien',
        'price',
        'discount',
        'user_name',
        'penjamin',
        'date_pengobatan'
    ];
}
