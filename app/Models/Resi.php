<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Resi extends Model
{
    use HasFactory;

    protected $fillable = [
        'no_resi',
        'alamat',
        'id_legalisir',
        'id_asuransi'
    ];
}
