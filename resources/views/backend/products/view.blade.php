@extends('backend.layout.master')
@section('content')

<section class="section profile">
  <div class="container">
    <div class="row justify-content-center">

      <div class="col-xl-10">

        <div class="card mb-4">
          <div class="card-body pt-3">

            <div class="mb-4">
              <h5 class="card-title">Product Details</h5>
              <p><strong>Product Code:</strong> {{ $product->product_code }}</p>
              <p><strong>Product Name:</strong> {{ $product->product_name }}</p>
            </div>

            {{-- Upload Images --}}
            <form action="{{ route('backend.products.uploadimages') }}" method="POST" enctype="multipart/form-data" id="imageUploadForm">
              @csrf
              <input type="hidden" name="product_code" value="{{ $product->product_code }}">

              <div id="dropArea" class="mb-3 p-4 text-center" style="border: 2px dashed #ccc; cursor: pointer;">
                <p>Drag & drop multiple images here or click to select</p>
                <input type="file" id="images" name="images[]" multiple hidden>
                <button type="button" class="btn btn-outline-primary btn-sm" onclick="document.getElementById('images').click()">Select Images</button>
              </div>

              <div id="imagePreview" class="row mt-3"></div>

              <div class="text-center mb-3">
                <button type="submit" class="btn btn-success">Upload Images</button>
              </div>
            </form>

            {{-- Image List --}}
            <h5 class="card-title mt-4">Uploaded Images</h5>
            <div class="row">
              @forelse($product->productimages as $key => $image)
                @php
                  $imgUrl = $product->files_full_url[$key] ?? '';
                @endphp
                <div class="col-md-3 mb-3">
                  <div class="card">
                    <img src="{{ $imgUrl }}" class="card-img-top" style="height: 150px; object-fit: cover;">
                    <div class="card-body text-center">
                      <form action="{{ route('backend.products.imagedelete', ['id' => $image->id, 'product_code' => $image->product_code]) }}" method="POST" onsubmit="return confirm('Are you sure?');">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                      </form>
                    </div>
                  </div>
                </div>
              @empty
                <div class="col-12">
                  <p>No images uploaded.</p>
                </div>
              @endforelse
            </div>

            {{-- Back Button --}}
            <div class="text-center mt-4">
              <a href="{{ route('backend.products.index') }}" class="btn btn-secondary">Back</a>
            </div>

          </div>
        </div>

      </div>
    </div>
  </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
  const dropArea = document.getElementById('dropArea');
  const input = document.getElementById('images');
  const form = document.getElementById('imageUploadForm');
  const previewContainer = document.getElementById('imagePreview');
  let filesArray = [];

  // Initialize with any existing files (if editing)
  if (input.files.length > 0) {
    filesArray = Array.from(input.files);
    updatePreview();
  }

  // Prevent default drag behaviors
  ['dragenter', 'dragover', 'dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, preventDefaults, false);
    document.body.addEventListener(eventName, preventDefaults, false);
  });

  function preventDefaults(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  // Highlight drop area
  ['dragenter', 'dragover'].forEach(eventName => {
    dropArea.addEventListener(eventName, highlight, false);
  });

  ['dragleave', 'drop'].forEach(eventName => {
    dropArea.addEventListener(eventName, unhighlight, false);
  });

  function highlight() {
    dropArea.classList.add('bg-light');
    dropArea.style.borderColor = '#0d6efd';
  }

  function unhighlight() {
    dropArea.classList.remove('bg-light');
    dropArea.style.borderColor = '#ccc';
  }

  // Handle drop
  dropArea.addEventListener('drop', handleDrop, false);

  function handleDrop(e) {
    const dt = e.dataTransfer;
    const files = dt.files;
    handleFiles(files);
  }

  // Handle file selection
  input.addEventListener('change', function() {
    if (this.files.length > 0) {
      handleFiles(this.files);
    }
  });

  // Process files and add to array
  function handleFiles(files) {
    const newFiles = Array.from(files);
    
    // Filter out duplicates by name
    newFiles.forEach(newFile => {
      const isDuplicate = filesArray.some(
        existingFile => existingFile.name === newFile.name && 
                       existingFile.size === newFile.size
      );
      if (!isDuplicate) {
        filesArray.push(newFile);
      }
    });

    updateInput();
    updatePreview();
  }

  // Update the actual file input (though we'll mainly use filesArray)
  function updateInput() {
    const dataTransfer = new DataTransfer();
    filesArray.forEach(file => dataTransfer.items.add(file));
    input.files = dataTransfer.files;
  }

  // Create image previews
  function updatePreview() {
    previewContainer.innerHTML = '';
    
    if (filesArray.length === 0) {
      previewContainer.innerHTML = '<div class="col-12 text-muted">No images selected</div>';
      return;
    }

    filesArray.forEach((file, index) => {
      const reader = new FileReader();
      reader.onload = function(e) {
        const col = document.createElement('div');
        col.className = 'col-md-3 mb-3';
        
        col.innerHTML = `
          <div class="card">
            <img src="${e.target.result}" class="card-img-top" style="height: 150px; object-fit: cover;">
            <div class="card-body p-2 text-center">
              <button type="button" class="btn btn-sm btn-danger remove-image" data-index="${index}">
                <i class="bi bi-trash"></i> Remove
              </button>
            </div>
          </div>
        `;
        
        previewContainer.appendChild(col);
        
        // Add remove event listener
        col.querySelector('.remove-image').addEventListener('click', () => {
          filesArray.splice(index, 1);
          updateInput();
          updatePreview();
        });
      };
      reader.readAsDataURL(file);
    });
  }

  // Form submission handling
  form.addEventListener('submit', function(e) {
    if (filesArray.length === 0) {
      e.preventDefault();
      alert('Please select at least one image to upload');
      return;
    }
    
    // You could show upload progress here if needed
  });
});
</script>


@endsection
