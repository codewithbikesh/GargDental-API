@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Update Address Zone Details</center></h5>
                    
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.addresszone.update', $zone->id) }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">City</label>
                  <select class="form-select" name="province" aria-label="Account Type">
                      <option value="" selected disabled>Select</option>
                      @foreach($cities as $id => $city)
                          <option value="{{ $id }}" {{ $zone->city_id == $id ? 'selected' : '' }}>
                              {{ $city }}
                          </option>
                      @endforeach
                  </select>
                </div>
                
                <div class="col-md-6">
                  <label for="inputEmail5" class="form-label">Zone Name</label>
                  <input type="text" class="form-control" value="{{ $zone->zone_name }}" name="zone_name" required>
                </div>

                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Update Address Zone Details</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.addresszone.index') }}">
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