<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;

class Receipt extends Model
{
    use HasFactory;
    use Sortable;

    protected $table = 'receipts';

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

    protected $sortable = [
        'penjamin',
        'created_at',
        'no_receipt'
    ];
}
