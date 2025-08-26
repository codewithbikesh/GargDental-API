<?php 

namespace App\Exports;

use App\Models\Product;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class ImageTemplateExport implements FromCollection, WithHeadings
{    
    protected $category_id;

    public function __construct($category_id)
    {
        $this->category_id = $category_id;
    }

    public function collection()
    {
        return Product::select('product_code', 'product_name')
            ->when($this->category_id, function ($query) {
                $query->where('category_id', $this->category_id);
            })
            ->get()
            ->map(function ($product) {
                return [
                    'product_code' => $product->product_code,
                    'product_name' => mb_convert_encoding($product->product_name, 'UTF-8', 'auto'),
                    'image_path' => '',
                ];
            });
    }

    public function headings(): array
    {
        return [
            'product_code',
            'Product Name',
            'image_path',
        ];
    }
}
