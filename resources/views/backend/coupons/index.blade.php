@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Coupons</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Coupons</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Coupons</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="couponsTable" data-url="{{ route('backend.coupons.index') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Title</th>
            <th>Coupon Code</th>
            <th>Start Date</th>
            <th>Expiry Date</th>
            <th>Minimum Purchase</th>
            <th>Discount</th>
            <th>Publish</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>

    </div>
  </div>
</div>

@endsection
