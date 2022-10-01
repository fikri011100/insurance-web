<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;

class Insurances extends Model
{
    use HasFactory;
    use Sortable;

    protected $table = 'insurances';

    protected $fillable = [
        'id',
        'no_va',
        'name',
        'status',
        'alamat',
        'description'
    ];

    protected $sortable = [
        'name',
        'no_va'
    ];
}
