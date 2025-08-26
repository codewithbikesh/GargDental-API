@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Order Cancel Reasons</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span> Dashboard</span></a>
      </li>
      <li class="breadcrumb-item active">Cancel Reasons</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Order Cancel Reasons
      <form method="get" action="{{ route('backend.cancelreasons.add') }}" enctype="multipart/form-data" style="display: inline-block;">
        <button class="btn btn-primary"><span style="color:white;">Add Reason</span></button>
      </form>
    </h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="cancelreasonsTable" data-url="{{ route('backend.cancelreasons.index') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Reason</th>
            <th>Type</th>
            <th>For</th>
            <th>Publish</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>

    </div>
  </div>
</div>

@endsection