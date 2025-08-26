<?php 

namespace App\Exports;

use App\Models\Category;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;

class CategoriesTemplateExport implements FromCollection, WithHeadings
{
    public function collection()
    {
        return Category::select('id', 'category_name')->get()->map(function ($category) {
            return [
                'id' => $category->id,
                'category_name' => mb_convert_encoding($category->category_name, 'UTF-8', 'auto'),
            ];
        });
    }

    public function headings(): array
    {
        return [
            'id',
            'Category Name',
        ];
    }
}
