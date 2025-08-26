@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center>Add Category</center></h5>
                    
              <form class="row g-3" method="post" action="{{ route('backend.categories.store') }}" enctype="multipart/form-data">
              @csrf
                  
                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Name</label>
                  <input type="text" class="form-control" placeholder="Category Name" name="category_name" required>
                </div>

                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Parent Category</label>
                  <select name="parent_id" class="form-control">
                      <option value="">None (Main Category)</option>
                      @include('backend.categories.partials.category-options', ['categories' => $categories, 'level' => 0])
                  </select>
                </div>

                <div class="col-md-6">
                  <label for="inputName5" class="form-label">Image</label>
                  <input type="file" class="form-control" name="image" required>
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Add Category</button>
                
              </form>
              </th>
              <th>
              <form method="get" action="{{ route('backend.categories.index') }}">
                <div class="text-center">
                  <button type="submit" class="btn btn-secondary">Cancel </button>
                </div>
              </form>
              </div>
              
              </th>
              </tr>
              </table>
              
            </div>
          </div>

        </div>


            </div>
          </div>
        </div>
    </section>

@endsection