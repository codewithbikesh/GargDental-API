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
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">

          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add Return Refund Policy</center></h5>
                   
              <form class="row g-3" method="post" action="{{ route('backend.compliance.return-refund-policy-store') }}" enctype="multipart/form-data">
              @csrf

                <div class="col-md-12">
                  <label for="inputName5" class="form-label">Return & Refund Policy</label>
                  <textarea class="form-control ckeditor" placeholder="Write description here..." name="return_refund_policy">{!! $return_refund_policy->value ?? '' !!}</textarea>
                </div>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Submit Retun & Refund Policy</button>
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

