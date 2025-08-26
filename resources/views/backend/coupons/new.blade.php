@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">

          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add Coupon</center></h5>
                   
              <form class="row g-3" method="post" action="{{ route('backend.coupons.store') }}" enctype="multipart/form-data">
              @csrf

                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Title</label>
                  <input type="text" class="form-control" placeholder="Title" name="title" required>
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Coupon Code</label>
                  <input type="text" class="form-control" placeholder="Coupon Code" name="code" required>
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Start Date</label>
                  <input type="date" class="form-control" name="start_date">
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Expiry Date</label>
                  <input type="date" class="form-control" name="expire_date">
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Minimum Purchase</label>
                  <input type="text" class="form-control" placeholder="Minimum Purchase" name="minimum_purchase">
                </div>
                
                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Discount</label>
                  <input type="text" class="form-control" placeholder="Discount" name="discount">
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add Coupon</button>
                
              </form>
              </th>
              <th>
              <form method="get" action="{{ route('backend.coupons.index') }}">
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

@endsection

