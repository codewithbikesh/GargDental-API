<?php 

namespace App\Exports;

use App\Models\Product;
use Illuminate\Support\Facades\Schema;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ProductTemplateExport implements FromArray, WithHeadings
{
    protected $columns;

    public function __construct()
    {
        // $allColumns = Schema::getColumnListing((new Product)->getTable());
        // $this->columns = array_values(array_diff($allColumns, [
        //     'id', 'product_code', 'created_at', 'updated_at'
        // ]));
                
        $this->columns = [
            'product_name',
            'category_id',
            'delivery_target_days',
            'brand_id',
            'actual_price',
            'sell_price',
            'available_quantity',
            'stock_quantity'
        ];
    }

    public function array(): array
    {
        return [];
    }

    public function headings(): array
    {
        return $this->columns;
    }
}
