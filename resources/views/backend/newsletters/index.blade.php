@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Newsletter Subscribers</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Newsletters Subscribers</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3">
    <h4 class="card-title" style="display: inline-block;">Newsletter Subscribers</h4>
  </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">

    <table class="table table-bordered" id="newslettersTable" data-url="{{ route('backend.newsletters.index') }}" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th>S.N.</th>
          <th>Email</th>
          <th>Date</th>
          <th>Action</th>
        </tr>
      </thead>
    </table>

    </div>
  </div>
</div>

@endsection
