<?php

namespace App\Imports;

use App\Models\Product;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Illuminate\Support\Str;

class ProductsImport implements ToCollection, WithHeadingRow, WithChunkReading
{
    use Importable;

    public function collection(Collection $rows)
    {
        $lastCode = Product::orderBy('id', 'desc')->value('product_code');
        $lastNumber = $lastCode ? (int)substr($lastCode, 1) : 0;

        foreach ($rows as $row) {
            
            $lastNumber++;
            $product_code = 'P' . str_pad($lastNumber, 5, '0', STR_PAD_LEFT);

            $product_name = $row['product_name'];
            $slug = Str::slug($row['product_name']);
            $category_id = $row['category_id'];
            $delivery_target_days = $row['delivery_target_days'];
            $discount = $row['actual_price'] - $row['sell_price'];
            $actual_price = $row['actual_price'];
            $sell_price = $row['sell_price'];
            $available_quantity = $row['available_quantity'];
            $stock_quantity = $row['stock_quantity'];
            $brand_id = $row['brand_id'];

            Product::updateOrCreate(
                ['product_code' => $product_code],
                [
                    'product_name' => $product_name,
                    'slug' => $slug,
                    'category_id' => $category_id,
                    'delivery_target_days' => $delivery_target_days,
                    'discount' => $discount,
                    'actual_price' => $actual_price,
                    'sell_price' => $sell_price,
                    'available_quantity' => $available_quantity,
                    'stock_quantity' => $stock_quantity,
                    'brand_id' => $brand_id,
                    'has_variations' => 0,
                    'flash_sale' => 0,
                    'status' => 1
                ]
            );
        }
    }

    public function chunkSize(): int
    {
        return 1000;
    }
}
