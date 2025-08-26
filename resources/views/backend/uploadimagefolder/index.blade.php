@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
    <h1>Upload Image Folder</h1>
    <nav>
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
                    <i class="fa fa-dashboard"></i><span> Dashboard</span>
                </a>
            </li>
            <li class="breadcrumb-item active">Upload Image Folder</li>
        </ol>
    </nav>
</div>

<div class="card shadow mb-4">
    <div class="card-header py-3" style="padding-top: 0rem !important;padding-bottom: 0rem !important;">
        <h4 class="card-title" style="display: inline-block;">Upload Zipped Folder</h4>
    </div>&nbsp;

    <div class="card-body">
        <div class="table-responsive">

            <div class="card-body">
                <div class="category-tree">
                    @foreach($categories as $category)
                    @include('backend.uploadimagefolder.category', [
                    'category' => $category,
                    'organizedFiles' => $organizedFiles,
                    'level' => 0,
                    'isLeaf' => $category->children->isEmpty()
                    ])
                    @endforeach
                </div>
            </div>

            <div id="image-preview-container" style="
                display: none; 
                position: fixed; 
                top: 30%; 
                right: 200px; 
                border: 5px solid #444; 
                padding: 10px; 
                background-color: white; 
                width: 300px; 
                height: 300px; 
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2); 
                border-radius: 15px;">
            </div>

            <script>
                function toggleCollapse(folderId) {
                    const contents = document.querySelectorAll('.collapse-content');

                    contents.forEach(content => {
                        if (content.id === folderId) {
                            content.style.display = content.style.display === "none" ? "block" : "none";
                        } else {
                            content.style.display = "none";
                        }
                    });
                }

                function copyToClipboard(element) {
                    const link = element.getAttribute('data-link');
                    const tempInput = document.createElement('input');
                    document.body.appendChild(tempInput);
                    tempInput.value = link;
                    tempInput.select();
                    tempInput.setSelectionRange(0, 99999);
                    try {
                        document.execCommand('copy');
                        showCopiedMessage(element);
                    } catch (err) {
                        console.error('Failed to copy link: ', err);
                    }
                    document.body.removeChild(tempInput);
                }

                function showCopiedMessage(element) {
                    const copiedMessage = element.nextElementSibling;
                    copiedMessage.style.display = 'inline';
                    setTimeout(() => {
                        copiedMessage.style.display = 'none';
                    }, 2000);
                }

                document.addEventListener('DOMContentLoaded', function() {
                    const fileLinks = document.querySelectorAll('.file-link');
                    const previewContainer = document.getElementById('image-preview-container');

                    const preloadImages = () => {
                        const images = [];
                        fileLinks.forEach(link => {
                            const imageUrl = link.getAttribute('data-image');
                            const img = new Image();
                            img.src = imageUrl;
                            images.push(img);
                        });
                    };

                    preloadImages();

                    fileLinks.forEach(link => {
                        link.addEventListener('mouseenter', function(event) {
                            const imageUrl = event.target.getAttribute('data-image');
                            previewContainer.style.backgroundImage = `url('${imageUrl}')`;
                            previewContainer.style.display = 'block';
                        });

                        link.addEventListener('mouseleave', function() {
                            previewContainer.style.display = 'none';
                        });
                    });
                });
            </script>

            <style>
                .collapse-button {
                    background-color: #007bff;
                    color: white;
                    padding: 10px;
                    border: none;
                    cursor: pointer;
                    width: 100%;
                    text-align: left;
                    font-size: 16px;
                    margin-bottom: 5px;
                }

                .collapse-button:hover {
                    background-color: grey;
                }

                .collapse-content {
                    padding: 10px;
                    border: 1px solid #ddd;
                    margin-bottom: 10px;
                    background-color: #f9f9f9;
                }

                .file-list {
                    list-style-type: none;
                    padding: 0;
                    margin: 0;
                }

                .file-list li {
                    margin-bottom: 5px;
                    display: flex;
                    align-items: center;
                }

                .file-list li .fa-link {
                    margin-right: 8px;
                }

                .file-list li .copy-icon {
                    margin-left: 10px;
                    cursor: pointer;
                    color: #007bff;
                }

                .file-list li .copy-icon:hover {
                    color: #0056b3;
                }

                .copied-message {
                    margin-left: 10px;
                    color: green;
                    font-size: 14px;
                    font-weight: bold;
                    display: none;
                }

                .file-link:hover {
                    cursor: pointer;
                }

                #image-preview-container {
                    display: none;
                    background-size: contain;
                    background-repeat: no-repeat;
                    background-position: center;
                    width: 200px;
                    height: 200px;
                }

                #image-preview-container img {
                    max-width: 100%;
                    max-height: 100%;
                }
            </style>

        </div>
    </div>
</div>

@endsection