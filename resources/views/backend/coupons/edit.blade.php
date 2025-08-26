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
                                    <h5 class="card-title">Edit Coupon Details</h5>
                                </div>

                                <form action="{{ route('backend.coupons.update', $coupon['id']) }}" method="POST" enctype="multipart/form-data">
                                    @csrf

                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Title</label>
                                        <input type="text" class="form-control" value="{{ $coupon->title }}" placeholder="Title" name="title" required>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Coupon Code</label>
                                        <input type="text" class="form-control" value="{{ $coupon->code }}" placeholder="Coupon Code" name="code" required>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Start Date</label>
                                        <input type="date" class="form-control" value="{{ $coupon->start_date }}" name="start_date">
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Expiry Date</label>
                                        <input type="date" class="form-control" value="{{ $coupon->expire_date }}" name="expire_date">
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Minimum Purchase</label>
                                        <input type="text" class="form-control" value="{{ $coupon->minimum_purchase }}" placeholder="Minimum Purchase" name="minimum_Purchase">
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <label for="inputName5" class="form-label">Discount</label>
                                        <input type="text" class="form-control" value="{{ $coupon->discount }}" placeholder="Discount" name="discount">
                                    </div>

                                    <br>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-primary">Update Coupon</button>
                                        <a href="{{ route('backend.coupons.index') }}" class="btn btn-secondary">Back</a>
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