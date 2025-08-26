@extends('backend.layout.master')
@section('title','User Group')
@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid">

    <!-- Page Heading -->
    <div class="page-header">
        <h1 class="page-header-title mb-2 text-capitalize">
            <div class="card-header-icon d-inline-flex mr-2 img">
                <img src="{{dynamicAsset('/public/assets/admin/img/role.png')}}" alt="public">
            </div>
            <span>
                User Role Permission Management
            </span>
        </h1>
    </div>

    <!-- Content Row -->
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <form action="{{route('backend.custom-role.update',[$role['id']])}}" method="post">
                    @csrf
                        <label class="input-label " for="name">Module Permission : </label>
                        <hr>
                        <div class="row">
                            
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="product-add" class="form-check-input"
                                           id="cms"  {{in_array('product-add',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label  text-dark" for="cms">Product-Add</label>
                                </div>
                            </div>
                            
                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="product-edit" class="form-check-input"
                                           id="hospitalappointment"  {{in_array('product-edit',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label  text-dark" for="hospitalappointment">Product-Edit</label>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="product-view" class="form-check-input"
                                           id="studentregistration"  {{in_array('product-view',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label  text-dark" for="studentregistration">Product-View</label>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <div class="form-group form-check">
                                    <input type="checkbox" name="modules[]" value="product-delete" class="form-check-input"
                                           id="settings"  {{in_array('product-delete',(array)json_decode($role['modules']))?'checked':''}}>
                                    <label class="form-check-label  text-dark" for="settings">Product-Delete</label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
@endpush
