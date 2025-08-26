@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Products</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Products</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3 d-flex justify-content-between align-items-center">
    <h4 class="card-title mb-0">Products</h4>
    
       
    <div class="form-check form-switch p-0">
    <input class="form-check-input" type="checkbox" id="bulkSwitch">
    <label class="form-check-label card-title p-0" for="bulkSwitch">Bulk Publish (This Page Only)</label>
    </div>

    
  <select id="categoryFilter" class="form-select">
    <option value="">All Categories</option>
    @php
        function renderCategoryOptions($categories, $prefix = '') {
            foreach ($categories as $category) {
                echo '<option value="'. $category->id .'">'. $prefix . $category->category_name .'</option>';

                if ($category->children->count()) {
                    renderCategoryOptions($category->children, $prefix . '— ');
                }
            }
        }
        renderCategoryOptions($categories);
    @endphp
</select> </div>&nbsp;

  <div class="card-body">
    <div class="table-responsive">
      <table class="table table-bordered" id="productsTable"  data-url="{{ route('backend.products.index') }}" width="100%" cellspacing="0">
        <thead>
          <tr>
            <th>S.N.</th>
            <th>Product Code</th>
            <th>Product Name</th>
            <th>Category</th>
            <th>has Variations</th>
            <th>Created</th>
            <th>Publish</th>
            <th>Action</th>
          </tr>
        </thead>
      </table>
    </div>
  </div>
</div>
<script>
    window.bulkToggleUrl = "{{ route('backend.products.bulk-toggle-status') }}";
    window.singleToggleUrl = "{{ route('backend.products.toggle-status') }}";
    window.csrfToken = "{{ csrf_token() }}";
</script>
@endsection
