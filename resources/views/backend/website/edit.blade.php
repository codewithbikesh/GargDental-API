@extends('backend.layout.master')
@section('content')

<section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">

        <div class="card mb-6">
          <div class="card-body">
            <h5 class="card-title">
              <center>Update Carousel Details</center>
            </h5>

            <!-- Multi Columns Form -->
            <form class="row g-3" method="post" action="{{ route('backend.website.carousel_update', $carousel->id) }}" enctype="multipart/form-data">
              @csrf

              <div class="col-md-6">
                <label for="upload" class="form-label"><b>File (png, gif, jpeg, mp4, webm, ogg)</b></label>
                <div id="preview-container" class="mb-3">
                  <!-- Show stored file preview if exists -->
                  @if(in_array(pathinfo($carousel->file_path, PATHINFO_EXTENSION), ['mp4', 'webm', 'ogg']))
                  <video autoplay controls loop width="40%" class="crousalUpper-slider_img">
                    <source src="{{ dynamicAsset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" type="video/{{ pathinfo($carousel->file_path, PATHINFO_EXTENSION) }}">
                    Your browser does not support the video tag.
                  </video>
                  @else
                  <img class="crousalUpper-slider_img" src="{{ dynamicAsset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" alt="Carousel Image" style="max-width: 40%;">
                  @endif
                </div>
                <input type="file" id="upload" name="file_path" accept="image/png, image/gif, image/jpeg, video/mp4, video/webm, video/ogg" onchange="previewFile()" />
              </div>

              <div class="col-md-6">
                <label for="product" class="form-label"><b>Product</b></label>
                <select class="form-select" name="product_code" aria-label="Product">
                  <option value="" selected disabled>Select</option>
                  @foreach($products as $product)
                  <option value="{{ $product->product_code }}"
                    {{ $product->product_code == $carousel->product_code ? 'selected' : '' }}>
                    {{ $product->product_name }}
                  </option>
                  @endforeach
                </select>
              </div>

              <table>
                <tr>
                  <th>

                    <div class="text-center">
                      <button type="submit" class="btn btn-success">Update Carousel Details</button>

            </form><!-- End Multi Columns Form -->
            </th>
            <th>
              <form method="get" action="{{ route('backend.website.carousel') }}">
                <div class="text-center">
                  <button type="submit" class="btn btn-secondary">Cancel </button>
                </div>
              </form>
          </div>

          </th>
          </tr>
          </table>

        </div>
      </div>

    </div>


  </div>
  </div>
  </div>
</section>

<script>
  function previewFile() {
    const file = document.getElementById('upload').files[0];
    const previewContainer = document.getElementById('preview-container');
    previewContainer.innerHTML = ''; // Clear previous preview

    if (file) {
      const fileType = file.type;
      const fileURL = URL.createObjectURL(file);

      if (fileType.startsWith('image/')) {
        const imgPreview = document.createElement('img');
        imgPreview.src = fileURL;
        imgPreview.alt = 'Image Preview';
        imgPreview.style.width = '150px';
        imgPreview.style.height = 'auto';
        imgPreview.style.border = '1px solid #ddd';
        imgPreview.style.borderRadius = '5px';
        imgPreview.style.padding = '5px';
        previewContainer.appendChild(imgPreview);
      } else if (fileType.startsWith('video/')) {
        const videoPreview = document.createElement('video');
        videoPreview.src = fileURL;
        videoPreview.controls = true;
        videoPreview.style.width = '100%';
        previewContainer.appendChild(videoPreview);
      } else {
        const unsupportedMsg = document.createElement('p');
        unsupportedMsg.textContent = 'Unsupported file type selected.';
        previewContainer.appendChild(unsupportedMsg);
      }
    }
  }
</script>

@endsection