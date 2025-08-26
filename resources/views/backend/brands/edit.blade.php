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
                                    <h5 class="card-title">Edit Brand Details</h5>
                                </div>

                                <form action="{{ route('backend.brands.update', $brand['id']) }}" method="POST" enctype="multipart/form-data">
                                    @csrf

                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Brand Name</label>
                                        <input type="text" class="form-control" value="{{ $brand->brand_name }}" placeholder="Brand Name" name="brand_name" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Uploaded Image</label>
                                        <img src="{{ $brand['image_full_url'] }}" height="100px" width="100px" />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Image</label>
                                        <input type="file" class="form-control" name="image">
                                    </div>

                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Update Brand</button>
                                        <a href="{{ route('backend.brands.index') }}" class="btn btn-secondary">Back</a>
                                    </div>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection