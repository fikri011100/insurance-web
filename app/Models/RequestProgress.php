<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RequestProgress extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'detail_progress',
        'id_request',
        'name_user',
    ];
}
