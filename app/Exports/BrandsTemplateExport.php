<?php 

namespace App\Exports;

use App\Models\Brand;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class BrandsTemplateExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Brand::select('id', 'brand_name')->get()->map(function ($brand) {
            return [
                'id' => $brand->id,
                'brand_name' => mb_convert_encoding($brand->brand_name, 'UTF-8', 'auto'),
            ];
        });
    }

    public function headings(): array
    {
        return [
            'id',
            'Brand Name',
        ];
    }
}
