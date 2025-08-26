@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Orders</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">{{ ucfirst($status) }} Orders</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">{{ ucfirst($status) }} Orders</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">

    <table class="table table-bordered" id="ordersTable" data-url="{{ route('backend.orders.byStatus', ['status' => $status ?? 'processing']) }}" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th>S.N.</th>
          <th>Order ID</th>
          <th>Customer</th>
          <th>Shipping Address</th>
          <th>Total Items</th>
          <th>Total Amount</th>
          <th>Order Status</th>
          <th>Payment Status</th>
          <th>Created</th>
          <th>Action</th>
        </tr>
      </thead>
    </table>

    </div>
  </div>
</div>

@endsection
