<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use ZipArchive;
use Illuminate\Support\Facades\Log;

class ImageFolderController extends Controller
{

    public function index()
    {
        // Fetch all categories (including subcategories) with recursive relationship
        $categories = Category::with('children')->whereNull('parent_id')->get();
    
        // Path to the image folder (no need to include 'public/' since public_path() already points to the public folder)
        $imageFolder = public_path('images/uploads/');
        
        // Organize files for each category (including subcategories)
        $organizedFiles = [];
        foreach ($categories as $category) {
            // Start recursive function for each category
            $this->organizeFilesForCategory($category, $imageFolder, $organizedFiles);
        }

        // Pass the organized files and categories to the view
        return view('backend.uploadimagefolder.index', compact('organizedFiles', 'categories'));
    }

    private function organizeFilesForCategory($category, $imageFolder, &$organizedFiles)
    {
        $categoryFolder = $imageFolder . $category->category_name;

        // Check if the folder exists
        if (File::exists($categoryFolder)) {
            // Fetch all files recursively from the category folder, including subfolders
            try {
                $files = $this->getFilesRecursively($categoryFolder);
                
                // Ensure the result is always an array
                if (!is_array($files)) {
                    $files = [];
                }

                foreach ($files as $file) {
                    // Store the file path relative to the image folder
                    $relativePath = str_replace($imageFolder, '', $file);
                    $organizedFiles[$category->category_name][] = $relativePath; // Store relative file path
                }
            } catch (\Exception $e) {
                // Log the error if there is an issue
                Log::error('Error fetching files for category: ' . $category->category_name . '. Error: ' . $e->getMessage());
                $organizedFiles[$category->category_name] = ['Error fetching files'];
            }
        }

        // Check for subcategories and recursively organize their files
        if ($category->children) {
            foreach ($category->children as $subcategory) {
                $this->organizeFilesForCategory($subcategory, $imageFolder, $organizedFiles);
            }
        }
    }
    
    /**
     * Recursively get all files in a directory and its subdirectories.
     */
    private function getFilesRecursively($directory)
    {
        $files = [];
    
        // Check if the directory exists before proceeding
        if (!File::exists($directory)) {
            throw new \Exception("Directory does not exist: " . $directory);
        }
    
        // Get all files and directories in the current directory and its subdirectories
        $items = File::allFiles($directory); // This already gets files from subdirectories
    
        foreach ($items as $item) {
            // If it's a file, add it to the list
            if ($item->isFile()) {
                $files[] = $item->getPathname(); // Get full path of the file
            }
        }
    
        return $files;
    }

    public function upload(Request $request)
    {
        // Get the uploaded ZIP file
        $zipFile = $request->file('zip_file');
        $folder_name = $request->folder_name;
        
        // Generate a unique name for the ZIP file
        $zipFileName = time() . '.' . $zipFile->getClientOriginalExtension();
    
        // Store the ZIP file temporarily
        $zipFile->storeAs('public/uploads', $zipFileName);
    
        // Extract the ZIP file
        $zip = new ZipArchive;
        $zipPath = storage_path('app/public/uploads/' . $zipFileName);
        
        if ($zip->open($zipPath) === TRUE) {
            // Define the destination folder in the public directory
            $destinationPath = public_path('images/uploads/' . $folder_name);
            
            // Create the destination folder if it doesn't exist
            if (!File::exists($destinationPath)) {
                // Create the destination folder if it doesn't exist
                File::makeDirectory($destinationPath, 0775, true);
            }
    
            // Extract the files to the destination folder
            $zip->extractTo($destinationPath);
            $zip->close();
    
            // Optionally, delete the ZIP file after extraction
            File::delete($zipPath);
    
            // Return success message
            return back()->with('success', 'Files uploaded and extracted successfully!');
        } else {
            return back()->with('error', 'Failed to extract the ZIP file.');
        }
    }

}
