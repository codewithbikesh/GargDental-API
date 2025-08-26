@extends('backend.layout.master')
@section('content')
<style>
    .ck-editor__editable {
        min-height: 300px !important;
    }
</style>

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-12 col-md-6 d-flex flex-column align-items-center justify-content-center">

          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add About Us</center></h5>
                   
              <form class="row g-3" method="post" action="{{ route('backend.compliance.about-us-page-store') }}" enctype="multipart/form-data">
              @csrf

                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Introduction Video</label>
                  <input type="hidden" class="form-control" name="old_introduction_video" value="{{ $about['introduction_video']->value ?? '' }}">
                  <input type="file" class="form-control" name="introduction_video">
                  @if (isset($introVideoUrl) && !empty($introVideoUrl))
                    <video width="100%" controls>
                      <source src="{{ $introVideoUrl }}" type="video/mp4">
                      Your browser does not support the video tag.
                    </video>
                  @endif
                </div>

                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Title</label>
                  <input type="text" class="form-control" placeholder="Write Title here..." name="about_us_title" value="{{ $about['about_us_title']->value ?? '' }}">
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Youtube Video Link</label>
                  <input class="form-control" placeholder="https://" name="youtube_video" value="{{ $about['youtube_video']->value ?? '' }}">
                </div>

                <div class="col-md-12">
                  <label for="inputName5" class="form-label">About Us</label>
                  <textarea class="form-control ckeditor" placeholder="Write description here..." name="about_us_page">{!! $about['about_us']->value ?? '' !!}</textarea>
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Our story title</label>
                  <input class="form-control" placeholder="title" name="story_title" value="{{ $about['story_title']->value ?? '' }}">
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 1 Image</label>
                  <input type="hidden" class="form-control" name="old_story_1_image" value="{{ $about['story_1_image']->value ?? '' }}">
                  <input type="file" class="form-control" name="story_1_image">
                  @if ($story1ImageUrl)
                    <img src="{{ $story1ImageUrl }}" alt="Story Image" width="50%">
                  @endif
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 1 Name</label>
                  <input class="form-control" placeholder="Tanmay" name="story_1_name" value="{{ $about['story_1_name']->value ?? '' }}">
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 1 Designation</label>
                  <input class="form-control" placeholder="CEO" name="story_1_designation" value="{{ $about['story_1_designation']->value ?? '' }}">
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Story 1 Description</label>
                  <textarea class="form-control ckeditor" placeholder="Write description here..." name="story_1_description">{!! $about['story_1_description']->value ?? '' !!}</textarea>
                </div>
                                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 2 Image</label>
                  <input type="hidden" class="form-control" name="old_story_2_image" value="{{ $about['story_2_image']->value ?? '' }}">
                  <input type="file" class="form-control" name="story_2_image">                  
                  @if ($story2ImageUrl)
                    <img src="{{ $story2ImageUrl }}" alt="Story Image" width="50%">
                  @endif
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 2 Name</label>
                  <input class="form-control" placeholder="Tanmay" name="story_2_name" value="{{ $about['story_2_name']->value ?? '' }}">
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Story 2 Designation</label>
                  <input class="form-control" placeholder="CEO" name="story_2_designation" value="{{ $about['story_2_designation']->value ?? '' }}">
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Story 2 Description</label>
                  <textarea class="form-control ckeditor" placeholder="Write description here..." name="story_2_description">{!! $about['story_2_description']->value ?? '' !!}</textarea>
                </div>
                            
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Submit About Us Details</button>
                </div>
              
              </form>
            </div>
          </div>

        </div>


            </div>
          </div>
        </div>
    </section>

@endsection

