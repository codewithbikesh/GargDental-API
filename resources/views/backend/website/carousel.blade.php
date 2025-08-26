@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Carousel</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span>Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Carousel</li>
    </ol>
  </nav>
</div><!-- End Page Title -->

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Carousel
      <button data-bs-toggle="modal" data-bs-target="#addcarouselModal" class="btn btn-primary"><span style="color:white;">Add File</span></button>
    </h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th scope="col">S.N.</th>
            <th scope="col">Product</th>
            <th scope="col">File</th>
            <th scope="col">Is Offer</th>
            <th scope="col">Publish</th>
            <th scope="col">Action</th>
          </tr>
        </thead>
        <tbody>
          @foreach ($carouseldata as $index => $carousel)
          <tr>
            <td scope="row">{{ $index + 1 }}</td>
            <td>{{ $carousel->product_code }}</td>
            <td>
              @if(in_array(pathinfo($carousel->file_path, PATHINFO_EXTENSION), ['mp4', 'webm', 'ogg']))
              <video autoplay controls loop width="30%" class="crousalUpper-slider_img">
                <source src="{{ dynamicAsset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" type="video/{{ pathinfo($carousel->file_path, PATHINFO_EXTENSION) }}">
                Your browser does not support the video tag.
              </video>
              @else
              <img src="{{ dynamicAsset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" alt="Carousel Image" style="max-width: 30%;">
              @endif
            </td>
            <td>
                <div class="form-check form-switch">
                    <input class="form-check-input redirect-url" type="checkbox" data-url="{{route('backend.website.carousel_offer',[$carousel['id'],$carousel->is_offer?0:1])}}" id="offerCheckbox{{$carousel->id}}" {{$carousel->is_offer ? 'checked' : ''}}>
                    <label class="form-check-label" for="offerCheckbox{{$carousel->id}}"></label>
                </div>
            </td>
            <td>
                <div class="form-check form-switch">
                    <input class="form-check-input redirect-url" type="checkbox" data-url="{{route('backend.website.carousel_status',[$carousel['id'],$carousel->status?0:1])}}" id="statusCheckbox{{$carousel->id}}" {{$carousel->status ? 'checked' : ''}}>
                    <label class="form-check-label" for="statusCheckbox{{$carousel->id}}"></label>
                </div>
            </td>

            <td>
              <div style="display: flex; align-items: center;">
                <form method="post" action="{{ route('backend.website.carousel_view') }}" style="margin-right: 10px;">
                  @csrf
                  <input type="hidden" name="id" value="{{ $carousel->id }}"></button>
                  <button style="background-color: transparent; border: none;">
                    <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
                  </button>
                </form>
                &nbsp;

                <form method="get" action="{{ route('backend.website.carousel_edit', $carousel->id) }}" style="margin-right: 10px;">
                  @csrf
                  <button style="background-color: transparent; border: none;">
                    <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
                  </button>
                </form>
                &nbsp;

                <button data-bs-toggle="modal" data-bs-target="#deletecarouselModal{{ $carousel->id }}" style="background-color: transparent; border: none;">
                  <i title="Delete" class="fa fa-trash" style="font-size:35px;color:red"></i>
                </button>
              </div>
            </td>
          </tr>

          <!-- Delete Modal -->
          <div class="modal fade" id="deletecarouselModal{{ $carousel->id }}" tabindex="-1">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Delete Carousel</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <b>Are you sure you want to delete this File?</b>
                </div>
                <div class="modal-footer">
                  <form method="post" action="{{ route('backend.website.carousel_delete', $carousel->id) }}">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger">Delete</button>
                  </form>
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
              </div>
            </div>
          </div><!-- End Delete Modal -->
          @endforeach
        </tbody>
      </table>
    </div>
  </div>
</div>

<div class="modal fade" id="addcarouselModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Carousel File</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="row g-3" method="post" action="{{ route('backend.website.carousel_add') }}" enctype="multipart/form-data">
        @csrf
        <div class="modal-body">
          <div class="col-md-12">
            <label for="upload" class="form-label"><b>File (png, gif, jpeg, mp4, webm, ogg)</b></label>
            <div id="preview-container" class="mb-3"></div>
            <input type="file" id="upload" name="file_path" accept="image/png, image/gif, image/jpeg, video/mp4, video/webm, video/ogg" onchange="previewFile()" />
          </div>
          </br>
          <div class="col-md-12">
            <label for="product" class="form-label"><b>Product</b></label>
            <select class="form-select" name="product_code" aria-label="Product">
              <option value="" selected disabled>Select</option>
              @foreach($products as $product)
              <option value="{{ $product->product_code }}">{{ $product->product_name }}</option>
              @endforeach
            </select>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-success">Add Carousel</button>
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>


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
        imgPreview.style.width = '150px'; // Set a small width
        imgPreview.style.height = 'auto'; // Maintain aspect ratio
        imgPreview.style.border = '1px solid #ddd'; // Optional styling
        imgPreview.style.borderRadius = '5px'; // Optional styling
        imgPreview.style.padding = '5px'; // Optional styling
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