<?php

namespace App\Exports;

use App\Models\Insurances;
use Maatwebsite\Excel\Concerns\FromCollection;

class InsurancesExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Insurances::all();
    }
}
