@extends('backend.layout.master')
@section('content')

<section class="section profile">
    <div class="container">
      <div class="row justify-content-center">

        <div class="col-xl-6">

          <div class="card mb-6">
            <div class="card-body pt-3">
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">

                <div style="display: flex; justify-content: space-between; align-items: center;">
                  <h5 class="card-title">Carousel File Details</h5>
                </div>

                  <div class="row">
                    <div class="col-lg-6 col-md-6 label ">Product Code</div>
                    <div class="col-lg-6 col-md-6">{{ $carousel->product_code }}</div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Image/Video</div>
                    <div class="col-lg-6 col-md-6">
                        @if(in_array(pathinfo($carousel->file_path, PATHINFO_EXTENSION), ['mp4', 'webm', 'ogg']))
                            <video autoplay controls loop width="100%" class="crousalUpper-slider_img">
                            <source src="{{ asset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" type="video/{{ pathinfo($carousel->file_path, PATHINFO_EXTENSION) }}">
                            Your browser does not support the video tag.
                            </video>
                        @else
                            <img class="crousalUpper-slider_img" src="{{ asset('public/storage/backend/carousel_files/' . $carousel->file_path) }}" alt="Carousel Image" style="max-width: 100%;">
                        @endif
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-lg-6 col-md-6 label">Publish</div>
                    <div class="col-lg-6 col-md-6">{{ $carousel->status }}</div>
                  </div>
                  
                    <div class="text-center">
                    <form method="GET" action="{{ route('backend.website.carousel') }}">
                        <div class="text-center">
                        <button type="submit" class="btn btn-secondary">Back </button>
                        </div>
                    </form>
                    </div>

                </div>


              </div><!-- End Bordered Tabs -->

            </div>
          </div>

        </div>
      </div>
    </div>
    </section>


@endsection
