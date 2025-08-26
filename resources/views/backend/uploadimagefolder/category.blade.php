@php
    $hasChildren = $category->children->isNotEmpty();
    $hasFiles = isset($organizedFiles[$category->category_name]);
@endphp

<div class="category-node" data-level="{{ $level }}">
    <div class="category-header" style="margin-left: {{ $level * 20 }}px;">
        @if($hasChildren)
            <button class="category-toggle" data-target="category-{{ $category->id }}">
                <i class="fa fa-folder-open"></i>
                <span class="category-name">{{ $category->category_name }}</span>
                <i class="toggle-icon fa fa-chevron-up"></i>
            </button>
        @else
            <div class="leaf-category">
                <i class="fa fa-folder"></i>
                <span class="category-name">{{ $category->category_name }}</span>
            </div>
        @endif
    </div>

    <div id="category-{{ $category->id }}" class="category-content" style="display: block; margin-left: {{ ($level + 1) * 20 }}px;">
        @if($isLeaf)
            <div class="upload-section">
                <form action="{{ route('backend.uploadimagefolder.upload') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="zip_file-{{ $category->id }}">Upload ZIP file:</label>
                        <input type="hidden" name="folder_name" value="{{ $category->category_name }}">
                        <div class="input-group">
                            <input type="file" name="zip_file" id="zip_file-{{ $category->id }}" class="form-control" accept=".zip" required>
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-primary">Upload</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        @endif

        @if($hasFiles)
            <ul class="file-list">
                @foreach($organizedFiles[$category->category_name] as $file)
                    @php
                        $normalizedFile = str_replace('\\', '/', $file);
                        $file = implode('/', 
                            array_map('rawurlencode', 
                                explode('/', $normalizedFile)
                            )
                        );
                    @endphp
                    <li class="file-item">
                        <i class="fa fa-link" aria-hidden="true"></i>
                        <a href="{{ asset('public/images/uploads/' . $file) }}" target="_blank" class="file-link" data-image="{{ asset('public/images/uploads/' . str_replace(' ', '%20', $file)) }}">
                            {{ rawurldecode(basename($file)) }}
                        </a>
                            <i class="fa fa-clone copy-icon" aria-hidden="true" 
                               onclick="copyToClipboard(this)" 
                               data-link="{{ asset('public/images/uploads/' . $file) }}"
                               title="Copy Link to Clipboard"></i>
                            <span class="copied-message" style="display: none;">Copied!</span>
                    </li>
                @endforeach
            </ul>
        @elseif($isLeaf)
            <div class="no-files">No files available in this folder.</div>
        @endif

        @if($hasChildren)
            <div class="subcategories">
                @foreach($category->children as $subcategory)
                    @include('backend.uploadimagefolder.category', [
                        'category' => $subcategory, 
                        'organizedFiles' => $organizedFiles,
                        'level' => $level + 1,
                        'isLeaf' => $subcategory->children->isEmpty()
                    ])
                @endforeach
            </div>
        @endif
    </div>
</div>

<style>
    .category-tree {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    }
    .category-node {
        margin-bottom: 5px;
    }
    .category-header {
        display: flex;
        align-items: center;
        padding: 5px 0;
    }
    .category-toggle {
        background: none;
        border: none;
        padding: 5px 8px;
        text-align: left;
        display: flex;
        align-items: center;
        width: 100%;
        cursor: pointer;
        border-radius: 4px;
        transition: background-color 0.2s;
    }
    .category-toggle:hover {
        background-color: #f0f0f0;
    }
    .leaf-category {
        padding: 5px 8px;
        display: flex;
        align-items: center;
    }
    .fa-folder, .fa-folder-open {
        color: #6c757d;
        margin-right: 8px;
        width: 16px;
    }
    .category-name {
        flex-grow: 1;
    }
    .toggle-icon {
        transition: transform 0.2s;
        margin-left: auto;
    }
    .category-content {
        border-left: 1px dashed #ddd;
        padding-left: 15px;
        margin-top: 5px;
    }
    .upload-section {
        margin: 10px 0;
        padding: 10px;
        background: #f8f9fa;
        border-radius: 4px;
    }
    .file-list {
        list-style: none;
        padding: 0;
        margin: 10px 0;
    }
    .file-item {
        padding: 4px 8px;
        display: flex;
        align-items: center;
        border-radius: 4px;
    }
    .file-item:hover {
        background-color: #f0f7ff;
    }
    .fa-file-alt {
        color: #6c757d;
        margin-right: 8px;
        width: 16px;
    }
    .file-link {
        color: #007bff;
        text-decoration: none;
    }
    .file-link:hover {
        text-decoration: underline;
    }
    .no-files {
        color: #6c757d;
        font-style: italic;
        padding: 8px;
    }
    .form-control {
        height: calc(1.5em + 0.75rem + 2px);
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Handle all category toggles
    document.querySelectorAll('.category-toggle').forEach(button => {
        button.addEventListener('click', function() {
            const targetId = this.getAttribute('data-target');
            const content = document.getElementById(targetId);
            const icon = this.querySelector('.toggle-icon');
            
            if (content.style.display === 'none') {
                content.style.display = 'block';
                icon.classList.remove('fa-chevron-down');
                icon.classList.add('fa-chevron-up');
                this.querySelector('.fa-folder').classList.replace('fa-folder', 'fa-folder-open');
            } else {
                content.style.display = 'none';
                icon.classList.remove('fa-chevron-up');
                icon.classList.add('fa-chevron-down');
                this.querySelector('.fa-folder-open').classList.replace('fa-folder-open', 'fa-folder');
            }
        });
    });
});
</script>