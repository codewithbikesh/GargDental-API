@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Set Shipping Cost</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Set Shipping Cost</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Set Shipping Cost
      <form method="get" action="{{ route('backend.setshipping.add') }}" enctype="multipart/form-data" style="display: inline-block;">
          <button class="btn btn-primary"><span style="color:white;">Add Cost</span></button>
      </form>
    </h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="citiesTable" data-url="{{ route('backend.setshipping.index') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Province</th>
            <th>City</th>
            <th>Shipping Cost</th>
            <th>Apply Shipping</th>
            <th>Created At</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>

    </div>
  </div>
</div>

@endsection
