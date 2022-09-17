<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discount extends Model
{
    use HasFactory;

    protected $fillable = [
        'insurance',
        'episode',
        'total_bill',
        'doctor',
        'medicine',
        'implant',
        'discount',
        'base_discount'
    ];
}
