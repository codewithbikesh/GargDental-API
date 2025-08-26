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
                                    <h5 class="card-title">Edit Category Details</h5>
                                </div>

                                <form action="{{ route('backend.categories.update', $category['id']) }}" method="POST" enctype="multipart/form-data">
                                    @csrf

                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Category Name</label>
                                        <input type="text" class="form-control" value="{{ $category->category_name }}" placeholder="Category Name" name="category_name" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Parent Category</label>
                                        <select name="parent_id" class="form-control">
                                            <option value="">None (Main Category)</option>
                                            @include('backend.categories.partials.category-options', [
                                                'categories' => $categories,
                                                'level' => 0,
                                                'selected' => $category->parent_id,
                                                'excludeId' => $category->id
                                            ])
                                        </select>
                                    </div>

                                    <br>
                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Uploaded Image</label>
                                        <img src="{{ $category['image_full_url'] }}" height="100px" width="100px" />
                                    </div>

                                    <div class="col-md-6">
                                        <label for="inputName5" class="form-label">Image</label>
                                        <input type="file" class="form-control" name="image">
                                    </div>

                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Update Category</button>
                                        <a href="{{ route('backend.categories.index') }}" class="btn btn-secondary">Back</a>
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