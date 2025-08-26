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
                                    <h5 class="card-title">Edit Carrier Details</h5>
                                </div>

                                <form action="{{ route('backend.carriers.update', $carrier['id']) }}" method="POST" enctype="multipart/form-data">
                                    @csrf

                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Carrier Name</label>
                                        <input type="text" class="form-control" value="{{ $carrier->name }}" placeholder="Carrier Name" name="name" required>
                                    </div>

                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Address</label>
                                        <input type="text" class="form-control" value="{{ $carrier->address }}" placeholder="Address" name="address" required>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Phone</label>
                                        <input type="text" class="form-control" value="{{ $carrier->phone }}" placeholder="Phone" name="phone" required>
                                    </div>
                
                                    <div class="col-md-12">
                                    <label for="inputName5" class="form-label">Type</label>
                                    <select name="type" class="form-select" required>
                                        <option value="" selected disabled>Select Carrier Type</option>
                                        <option value="staff" {{ $carrier->type == 'staff' ? 'selected' : '' }}>Staff</option>
                                        <option value="company" {{ $carrier->type == 'company' ? 'selected' : '' }}>Company</option>
                                    </select>
                                    </div>

                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Update Carrier</button>
                                        <a href="{{ route('backend.carriers.index') }}" class="btn btn-secondary">Back</a>
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