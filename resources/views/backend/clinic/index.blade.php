@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Clinic Setup Requests</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Clinic Setup Requests</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Requests</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      
      <table class="table table-bordered" id="clinicTable" data-url="{{ route('backend.clinic.requests') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>City</th>
            <th>Budget</th>
            <th>Remarks</th>
            <th>Request Date</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>

    </div>
  </div>
</div>

@endsection
