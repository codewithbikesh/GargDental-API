@extends('backend.layout.master')
@section('content')

      <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-10 col-md-6 d-flex flex-column align-items-center justify-content-center">


          <div class="card mb-6">
            <div class="card-body">
              <h5 class="card-title"><center><strong>Poster Cards</strong></center></h5>
                    
              <!-- Multi Columns Form -->
              <form class="row g-3" method="post" action="{{ route('backend.website.poster_card_update', $postercarddata->id) }}" enctype="multipart/form-data">
              @csrf
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Card 1</label>
                          <img src="{{ dynamicAsset('public/storage/backend/poster_cards/' . $postercarddata->card_1) }}" alt="Card 1" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="card_1"  accept="image/png, image/gif, image/jpeg, image/avif" />
                          </div>
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Card 2</label>
                          <img src="{{ dynamicAsset('public/storage/backend/poster_cards/' . $postercarddata->card_2) }}" alt="Card 2" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="card_2"  accept="image/png, image/gif, image/jpeg, image/avif" />
                          </div>
                </div>
                
                <div class="col-md-4">
                  <label for="inputName5" class="form-label">Card 3</label>
                          <img src="{{ dynamicAsset('public/storage/backend/poster_cards/' . $postercarddata->card_3) }}" alt="Card 3" width="100">
                          <div class="pt-2">
			                    <input type="file" id="upload" name="card_3"  accept="image/png, image/gif, image/jpeg, image/avif" />
                          </div>
                </div>
                
                <table>
                <tr>
                <th>
                    
                <div class="text-center">
                  <button type="submit" class="btn btn-success">Update Card</button>
                
              </form><!-- End Multi Columns Form -->
              </th>
              <th>
              <form method="get" action="{{ route('backend.website.poster_card') }}">
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