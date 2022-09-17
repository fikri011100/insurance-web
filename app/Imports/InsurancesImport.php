<?php

namespace App\Imports;

use App\Models\Insurances;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class InsurancesImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Insurances([
            //
            'no_va' => $row['no_va'],
            'name' => $row['name'],
            'status' => '0',
        ]);
    }
}
