@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add Carrier</center></h5>
                    
              <form class="row g-3" method="post" action="{{ route('backend.carriers.store') }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Name</label>
                  <input type="text" class="form-control" placeholder="Carrier Name" name="name" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Address</label>
                  <input type="text" class="form-control" placeholder="Address" name="address" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Phone</label>
                  <input type="text" class="form-control" placeholder="Phone" name="phone" required>
                </div>
                
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Type</label>
                  <select name="type" class="form-select" required>
                    <option value="" selected disabled>Select Carrier Type</option>
                    <option value="staff">Staff</option>
                    <option value="company">Company</option>
                  </select>
                </div>

                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add Carrier</button>
                
              </form>
              </th>
              <th>
              <form method="get" action="{{ route('backend.carriers.index') }}">
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