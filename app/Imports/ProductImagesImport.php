<?php

namespace App\Imports;

use App\Models\ProductImages;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use App\CentralLogics\Helpers;

class ProductImagesImport implements ToCollection, WithHeadingRow
{
    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $productCode = trim($row['product_code']);
            $imagePath = trim($row['image_path']);

            if (empty($productCode) || empty($imagePath)) {
                continue;
            }

            $folderPath = public_path("storage/backend/productimages/{$productCode}");
            $originalImageName = basename($imagePath);
            $uploadDir = "backend/productimages/{$productCode}/";

            try {
                if (!File::exists($folderPath)) {
                    File::makeDirectory($folderPath, 0755, true);
                }

                if (str_contains($imagePath, request()->getHost())) {

                    // $localPath = str_replace(['http://garg.omsok.com', 'https://garg.omsok.com'], '/home/omsokcom/public_html', $imagePath);
                    $localPath = str_replace(['http://gargdental.omsok.com', 'https://gargdental.omsok.com'], '/home/omsokcom/gargdental.omsok.com', $imagePath);
                    $localPath = urldecode($localPath);
                    if (!file_exists($localPath)) {
                        Log::error("Local file does not exist (native check): {$localPath}");
                        continue;
                    }
                    $tempFilePath = $localPath;

                } else {
                    if (filter_var($imagePath, FILTER_VALIDATE_URL)) {
                        $imageContent = @file_get_contents($imagePath);
                        if ($imageContent === false) {
                            Log::error("Failed to fetch image from URL: {$imagePath}");
                            continue;
                        }

                        $tempFilePath = sys_get_temp_dir() . '/' . uniqid() . '_' . $originalImageName;
                        file_put_contents($tempFilePath, $imageContent);
                    } else {
                        Log::error("Invalid image URL: {$imagePath}");
                        continue;
                    }
                }

                $productimages = new ProductImages();
                $productimages->image_path = Helpers::upload_file(dir: $uploadDir, file: new \Illuminate\Http\File($tempFilePath));
                $productimages->product_code = $productCode;
                $productimages->save();

            } catch (\Exception $e) {
                Log::error("Error processing row with product_code {$productCode}: {$e->getMessage()}");
            }
        }
    }

    public function headingRow(): int
    {
        return 1;
    }
}
