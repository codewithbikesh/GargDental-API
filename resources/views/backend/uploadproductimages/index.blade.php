@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
  <h1>Upload Product & Images</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Upload Product & Images</li>
    </ol>
  </nav>
</div>

<div class="card shadow mb-4">
  <div class="card-header py-3 d-flex justify-content-between align-items-center">
      <h4 class="card-title mb-0">Upload through Excel</h4>
        
      <div class="dropdown">
          <button class="btn btn-secondary dropdown-toggle" type="button" id="imageTemplateDropdown" data-bs-toggle="dropdown" aria-expanded="false">
              Image Templates by Category
          </button>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="imageTemplateDropdown">
              <!--@foreach($categories as $category)-->
              <!--    <li>-->
              <!--        <a class="dropdown-item" href="{{ route('backend.downloadTemplate', ['category_id' => $category->id]) }}">-->
              <!--            {{ $category->category_name }}-->
              <!--        </a>-->
              <!--    </li>-->
              <!--@endforeach-->
              
               @php
        function renderCategoryOptions($categories, $prefix = '') {
            foreach ($categories as $category) {
                echo '<li><a class="dropdown-item" href="'. route('backend.downloadTemplate', ['category_id' => $category->id]) .'">'. $prefix . $category->category_name .'</a></li>';
                if ($category->children->count()) {
                    renderCategoryOptions($category->children, $prefix . '— ');
                }
            }
        }

        renderCategoryOptions($categories);
    @endphp
          </ul>
      </div>

      <div class="dropdown">
          <button class="btn btn-success dropdown-toggle" type="button" id="downloadDropdown" data-bs-toggle="dropdown" aria-expanded="false">
              Download Templates
          </button>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="downloadDropdown">
              <li><a class="dropdown-item" href="{{ route('backend.downloadCategoriesTemplate', ['type' => 'categories']) }}">Categories List</a></li>
              <li><a class="dropdown-item" href="{{ route('backend.downloadBrandsTemplate', ['type' => 'brands']) }}">Brands List</a></li>
              <li><a class="dropdown-item" href="{{ route('backend.downloadProductTemplate') }}">Product Template</a></li>
          </ul>
      </div>
  </div>

  <div class="card-body">
    <div class="table-responsive">
      
    <form action="{{ route('backend.uploadnow.index') }}" method="POST" enctype="multipart/form-data">
      @csrf
      <input type="file" name="file" accept=".xls,.xlsx,.csv" required>
      <button class="btn btn-primary" type="submit">Import Images</button>
    </form>

    <br/>
    <br/>
    <form action="{{ route('backend.uploadnow.products') }}" method="POST" enctype="multipart/form-data">
      @csrf
      <input type="file" name="file" accept=".xls,.xlsx,.csv" required>
      <button class="btn btn-primary" type="submit">Import Products</button>
    </form>


    </div>
  </div>
</div>

@endsection
