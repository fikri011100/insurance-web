<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Requests extends Model
{
    use HasFactory;

    protected $fillable = [
        'request_name',
        'request_email',
        'request_patient',
        'request_phone',
        'date_birth',
        'date_medicine',
        'insurance',
        'episode',
        'insurance_set',
        'total_price',
        'status',
        'status_payment',
        'photo_payment',
        'photo_taker',
    ];
}
