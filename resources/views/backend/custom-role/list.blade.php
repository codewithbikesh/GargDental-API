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
        </h1>
    </div>

    <div class="card mb-3">
        <div class="card-body">
            <form action="{{route('backend.custom-role.store')}}" method="post">
                @csrf
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group" id="default-form">
                            <label class="form-label input-label" for="name">Group Name</label>
                            <input type="text" name="name" class="form-control" placeholder="Role Name Example" maxlength="191">
                        </div>
                    </div>
                </div>

                <div class="d-flex">
                    <h5 class="input-label m-0 text-capitalize">Module Permission:</h5>
                </div>
                <div class="check--item-wrapper">
                    <div class="check-item">
                        <div class="form-group form-check form--check">
                            <input type="checkbox" name="modules[]" value="product-add" class="form-check-input" id="employee">
                            <label class="form-check-label ml-2 ml-sm-3 text-dark" for="employee">Product-Add</label>
                        </div>
                    </div>
                    
                    <div class="check-item">
                        <div class="form-group form-check form--check">
                            <input type="checkbox" name="modules[]" value="product-edit" class="form-check-input" id="attendance">
                            <label class="form-check-label ml-2 ml-sm-3 text-dark" for="attendance">Product-Edit</label>
                        </div>
                    </div>
                    
                    <div class="check-item">
                        <div class="form-group form-check form--check">
                            <input type="checkbox" name="modules[]" value="product-view" class="form-check-input" id="hospitalappointment">
                            <label class="form-check-label ml-2 ml-sm-3 text-dark" for="hospitalappointment">Product-View</label>
                        </div>
                    </div>
                    
                    <div class="check-item">
                        <div class="form-group form-check form--check">
                            <input type="checkbox" name="modules[]" value="product-delete" class="form-check-input" id="studentregistration">
                            <label class="form-check-label ml-2 ml-sm-3 text-dark" for="studentregistration">Product-Delete</label>
                        </div>
                    </div>
                </div>

                <div class="mt-4 pb-3">
                    <div class="btn--container justify-content-end">
                        <button type="reset" id="reset_btn" class="btn btn--reset">Reset</button>
                        <button type="submit" class="btn btn--primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="card">
        <div class="card-header py-2 border-0">
            <div class="search--button-wrapper">
                <h5 class="card-title">
                    User Group Table
                    <span class="badge badge-soft-dark ml-2" id="itemCount">{{$rl->total()}}</span>
                </h5>

                <form action="javascript:" id="search-form">
                    @csrf
                    <div class="input--group input-group input-group-merge input-group-flush">
                        <input id="datatableSearch_" type="search" name="search" class="form-control" placeholder="Search by Name" aria-label="Search">
                        <button type="submit" class="btn btn--secondary">
                            <i class="tio-search"></i>
                        </button>
                    </div>
                </form>

            </div>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive datatable-custom">
                <table id="columnSearchDatatable"
                        class="table table-bordered table-thead-bordered table-align-middle card-table"
                        data-hs-datatables-options='{
                            "order": [],
                            "orderCellsTop": true,
                            "paging":false
                        }'>
                    <thead class="thead-light">
                    <tr>
                        <th scope="col" class="w-50px">SL</th>
                        <th scope="col" class="w-50px">Group Name</th>
                        <th scope="col" class="w-200px">Modules Permission</th>
                        <th scope="col" class="w-50px">Created At</th>
                        <th scope="col" class="text-center w-50px">Action</th>
                    </tr>
                    </thead>
                    <tbody id="set-rows">
                    @foreach($rl as $k=>$r)
                        <tr>
                            <td>{{$k+$rl->firstItem()}}</td>
                            <td>{{Str::limit($r['name'],25,'...')}}</td>
                            <td>
                                <div class="text-capitalize" data-toggle="tooltip" data-placement="right" title="@if($r['modules']!=null)
                                @foreach((array)json_decode($r['modules']) as $key=>$m)
                                {{str_replace('_',' ',$m) }}{{ !$loop->last ? ',' : '.'}}
                                @endforeach
                            @endif" >
                                    @if($r['modules']!=null)
                                        @foreach((array)json_decode($r['modules']) as $key=>$m)
                                            {{str_replace('_',' ',$m) }}{{ !$loop->last ? ',' : '.'}}
                                        @endforeach
                                    @endif
                                </div>
                            </td>
                            <td>
                                {{ \App\CentralLogics\Helpers::date_format($r['created_at']) }}
                            </td>
                            <td>
                                <div class="btn--container justify-content-center">
                                    <a class="btn btn--primary btn-outline-primary action-btn"
                                        href="{{route('backend.custom-role.edit',[$r['id']])}}" title="Edit Role"><i class="tio-edit"></i>
                                    </a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
                @if(count($rl) === 0)
                <div class="empty--data">
                    <img src="{{dynamicAsset('/public/assets/admin/img/empty.png')}}" alt="public">
                    <h5>No Data Found</h5>
                </div>
                @endif
                <div class="page-area px-4 pb-3">
                    <div class="d-flex align-items-center justify-content-end">
                        <div>
                            {!! $rl->links() !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
@endsection

@push('script_2')
<script>
"use strict";
$('#search-form').on('submit', function (e) {
    e.preventDefault();
    let formData = new FormData(this);
    $.ajaxSetup({
        headers: {'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')}
    });
    $.post({
        url: '{{route('backend.custom-role.search')}}',
        data: formData,
        cache: false,
        contentType: false,
        processData: false,
        beforeSend: function () { $('#loading').show(); },
        success: function (data) {
            $('#set-rows').html(data.view);
            $('#itemCount').html(data.count);
            $('.page-area').hide();
        },
        complete: function () { $('#loading').hide(); },
    });
});

$(document).ready(function() {
    let datatable = $.HSCore.components.HSDatatables.init($('#columnSearchDatatable'));
});

$('#reset_btn').click(function(){ location.reload(true); });

$('#select-all').on('change', function(){
    $('.check--item-wrapper .check-item .form-check-input').prop('checked', this.checked);
});

$('.check--item-wrapper .check-item .form-check-input').on('change', function(){
    $(this).prop('checked', this.checked);
});
</script>
@endpush
