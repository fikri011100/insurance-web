<?php

namespace App\Charts;

use ArielMejiaDev\LarapexCharts\LarapexChart;
use DB;
use App\Models\Requests;
use PostScripton\Money\Currency;
use PostScripton\Money\Money;

class MonthlyRequestChart
{
    protected $chart;

    public function __construct(LarapexChart $chart)
    {
        $this->chart = $chart;
    }

    public function build(): \ArielMejiaDev\LarapexCharts\AreaChart
    {
        $data = Requests::select(DB::raw("(SUM(total_price)) as total_price"), DB::raw("MONTHNAME(created_at) as name"))
            ->whereYear('created_at', date('Y'))->orderBy('created_at', 'ASC')->groupBy('name')->get();
        $arrPrice = array();
        $arrMonth = array();
        $settings = settings()->setThousandsSeparator('.')
        ->setDecimalSeparator(',')
        ->setHasSpaceBetween(false)
        ->setEndsWith0(false);
        Money::set($settings);

        for ($i = 0; $i < sizeof($data); $i++) {
            // $arrPrice[] = number_format($data[$i]->total_price, 3, ',', '.');
            $arrPrice[] = Money::correctInput($data[$i]->total_price);
            $arrMonth[] = $data[$i]->name;
        }

        return $this->chart->areaChart()
            ->addData('Request Asuransi', $arrPrice)
            ->setXAxis($arrMonth);
    }
}