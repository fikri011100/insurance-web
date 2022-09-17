<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    use HasFactory;

    protected $fillable = [
        'legalisir_price',
        'user_id',
        'date_started',
        'date_ended',
        'status'
    ];
}
