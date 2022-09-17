<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use SortAndFilter;
use Kyslik\ColumnSortable\Sortable;

class Requests extends Model
{
    use HasFactory;
    use Sortable;

    protected $table = 'requests';

    protected $fillable = [
        'request_name',
        'request_email',
        'request_patient',
        'request_phone',
        'birthday',
        'date_medicine',
        'insurance',
        'episode',
        'insurance_set',
        'total_price',
        'status',
        'status_payment',
        'photo_payment',
        'photo_taker',
        'photo_ktp',
        'photo_kk'
    ];

    protected $sortable = [
        'created_at',
        'birthday',
        'date_medicine'

    ];
}
