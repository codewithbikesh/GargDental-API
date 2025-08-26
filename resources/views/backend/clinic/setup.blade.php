@extends('backend.layout.master')
@section('content')

<section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-10 col-md-12">

                {{-- Cover Image Setup --}}
                <div class="card mb-4 shadow-sm">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0">Setup Cover Image</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('backend.clinic.store-cover') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">
                                <label for="cover_image" class="form-label">Choose Cover Image</label>
                                <input type="file" name="clinic_cover_image" class="form-control" accept="image/*" required>
                            </div>
                            @if(isset($clinic['clinic_cover_image']->value))
                                <input type="hidden" name="old_clinic_cover_image" value="{{ $clinic['clinic_cover_image']->value }}">
                                <div class="mb-3">
                                    <img src="{{ $clinic['clinic_cover_image']->clinic_cover_image_full_url }}" class="img-fluid rounded" style="max-height: 200px;" alt="Current Cover Image">
                                </div>
                            @endif
                            <button type="submit" class="btn btn-primary">Upload Cover Image</button>
                        </form>
                    </div>
                </div>

                {{-- YouTube Video Setup --}}
                <div class="card shadow-sm">
                    <div class="card-header bg-success text-white">
                        <h5 class="mb-0">Setup YouTube Video</h5>
                    </div>
                    <div class="card-body">
                        <form action="{{ route('backend.clinic.store-video') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="video_title" class="form-label">Video Title</label>
                                <input type="text" name="clinic_video_title" class="form-control" value="{{ old('clinic_video_title', $clinic['clinic_video_title']->value ?? '') }}">
                            </div>

                            <div class="mb-3">
                                <label for="video_description" class="form-label">Video Description</label>
                                <textarea name="clinic_video_description" class="form-control" rows="3">{{ old('clinic_video_description', $clinic['clinic_video_description']->value ?? '') }}</textarea>
                            </div>

                            <div class="mb-3">
                                <label for="youtube_link" class="form-label">YouTube Video Link</label>
                                <input type="url" name="clinic_video_link" class="form-control" value="{{ old('clinic_video_link', $clinic['clinic_video_link']->value ?? '') }}" placeholder="https://www.youtube.com/watch?v=...">
                            </div>

                            @if(!empty($clinic['clinic_video_link']->value))
                                <div class="mb-3">
                                    <label class="form-label">Preview</label>
                                    <div class="ratio ratio-16x9">
                                        <iframe src="https://www.youtube.com/embed/{{ \Illuminate\Support\Str::after($clinic['clinic_video_link']->value, 'v=') }}" allowfullscreen></iframe>
                                    </div>
                                </div>
                            @endif

                            <button type="submit" class="btn btn-success">Save Video</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>

@endsection
