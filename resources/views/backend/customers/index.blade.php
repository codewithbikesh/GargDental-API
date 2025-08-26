@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Customers</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Customers</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Customers</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">

      <table class="table table-bordered" id="customersTable" data-url="{{ route('backend.customers.index') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>

    </div>
  </div>
</div>

@endsection
