@extends('backend.layout.master')
@section('content')

<section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-10 col-md-6 d-flex flex-column align-items-center justify-content-center">

        <div class="card mb-6">
          <div class="card-body">
            <h5 class="card-title">
              <center><strong>E-commerce Website Data</strong></center>
            </h5>

            <!-- Multi Columns Form -->
            <form class="row g-3" method="post" action="{{ route('backend.website.update') }}" enctype="multipart/form-data">
              @csrf

              @php($name = \App\Models\SystemSetting::where('key', 'company_name')->first())
              <div class="col-md-6">
                <label for="inputName5" class="form-label">Company Name <span style="color:red;">*</span></label>
                <input type="text" class="form-control" name="company_name" value="{{ $name->value ?? '' }}" required>
              </div>

              @php($company_logo_header = \App\Models\SystemSetting::where('key', 'company_logo_header')->first())
              <div class="col-md-6">
                <label for="inputName5" class="form-label">Company Logo Header</label>
                <img src="{{\App\CentralLogics\Helpers::get_full_url('system', $company_logo_header?->value?? '', $company_logo_header?->storage[0]?->value ?? 'public','upload_image')}}" alt="Logo Header" width="100">
                <div class="pt-2">
                  <input type="file" id="upload" name="company_logo_header" accept="image/png, image/gif, image/jpeg" />
                </div>
              </div>

              @php($company_logo_footer = \App\Models\SystemSetting::where('key', 'company_logo_footer')->first())
              <div class="col-md-6">
                <label for="inputName5" class="form-label">Company Logo Footer</label>
                <img src="{{\App\CentralLogics\Helpers::get_full_url('system', $company_logo_footer?->value?? '', $company_logo_footer?->storage[0]?->value ?? 'public','upload_image')}}" alt="Logo Footer" width="100">
                <div class="pt-2">
                  <input type="file" id="upload" name="company_logo_footer" accept="image/png, image/gif, image/jpeg" />
                </div>
              </div>

              @php($primary_email = \App\Models\SystemSetting::where('key', 'primary_email')->first())
              <div class="col-md-6">
                <label for="inputEmail5" class="form-label">Primary Email <span style="color:red;">*</span></label>
                <input type="email" class="form-control" name="primary_email" value="{{ $primary_email->value ?? '' }}" required>
              </div>

              @php($secondary_email = \App\Models\SystemSetting::where('key', 'secondary_email')->first())
              <div class="col-md-6">
                <label for="inputEmail5" class="form-label">Secondary Email</label>
                <input type="email" class="form-control" name="secondary_email" value="{{ $secondary_email->value ?? '' }}">
              </div>

              @php($whatsapp = \App\Models\SystemSetting::where('key', 'whatsapp')->first())
              <div class="col-md-6">
                <label for="inputPassword5" class="form-label">Whatsapp Number <span style="color:red;">*</span></label>
                <input type="phone" class="form-control" value="{{ $whatsapp->value ?? '' }}" name="whatsapp" required>
              </div>

              @php($primary_phone = \App\Models\SystemSetting::where('key', 'primary_phone')->first())
              <div class="col-md-6">
                <label for="inputPassword5" class="form-label">Primary Phone <span style="color:red;">*</span></label>
                <input type="phone" class="form-control" value="{{ $primary_phone->value ?? '' }}" name="primary_phone" required>
              </div>

              @php($secondary_phone = \App\Models\SystemSetting::where('key', 'secondary_phone')->first())
              <div class="col-md-6">
                <label for="inputPassword5" class="form-label">Secondary Phone</label>
                <input type="phone" class="form-control" value="{{ $secondary_phone->value ?? '' }}" name="secondary_phone">
              </div>

              @php($address = \App\Models\SystemSetting::where('key', 'address')->first())
              <div class="col-md-6">
                <label for="inputZip" class="form-label">Company Address <span style="color:red;">*</span></label>
                <input type="text" class="form-control" value="{{ $address->value ?? '' }}" name="address" required>
              </div>

              @php($website_link = \App\Models\SystemSetting::where('key', 'website_link')->first())
              <div class="col-md-6">
                <label for="inputZip" class="form-label">Website Link <span style="color:red;">*</span></label>
                <input type="text" class="form-control" value="{{ $website_link->value ?? '' }}" name="website_link" required>
              </div>

              @php($free_shipping_option = \App\Models\SystemSetting::where('key', 'free_shipping_option')->first())
              @php($shipping_option = \App\Models\SystemSetting::where('key', 'shipping_option')->first())
              @php($no_free_shipping_threshold = \App\Models\SystemSetting::where('key', 'no_free_shipping_threshold')->first())
              @php($free_shipping_threshold = \App\Models\SystemSetting::where('key', 'free_shipping_threshold')->first())

              <div class="col-md-6">
                <label class="form-label">
                  Free Shipping options <span style="color:red;">*</span>
                </label>
                
                <div>
                  <label>
                    <input type="radio" name="free_shipping_option" value="no_free_threshold"
                      {{ optional($free_shipping_option)->value === 'no_free_threshold' ? 'checked' : '' }}>
                    Don't Apply Free Shipping Threshold
                  </label>
                </div>

                <div>
                  <label>
                    <input type="radio" name="free_shipping_option" value="free_threshold" 
                      {{ optional($free_shipping_option)->value === 'free_threshold' ? 'checked' : '' }}>
                    Apply Free Shipping Threshold
                  </label>
                </div>
              </div>

              <!-- <div id="shipping-option-section" class="col-md-6">
                <label class="form-label">
                  Shipping cost options <span style="color:red;">*</span>
                </label>
                <div>
                  <label>
                    <input type="radio" name="shipping_option" value="citywisecost"
                      {{ optional($shipping_option)->value === 'citywisecost' ? 'checked' : '' }}>
                    Calculate Shipping cost once regardless of items
                  </label>
                </div>
                <div>
                  <label>
                    <input type="radio" name="shipping_option" value="itemwisecost"
                      {{ optional($shipping_option)->value === 'itemwisecost' ? 'checked' : '' }}>
                    Calculate shipping cost to each item selected
                  </label>
                </div>
              </div> -->

              <div id="threshold-section" class="col-md-6" style="display:none;">
                <label class="form-label">
                  Free Shipping Minimum Amount <span style="color:red;">*</span>
                </label>
                <input type="number" name="free_shipping_threshold" class="form-control"
                  value="{{ optional($free_shipping_threshold)->value }}">
              </div>

              @php($no_category_display = \App\Models\SystemSetting::where('key', 'no_category_display')->first())
              <div class="col-md-6">
                <label for="inputZip" class="form-label">No of Category display <span style="color:red;">*</span></label>
                <input type="number" class="form-control" value="{{ $no_category_display->value ?? '' }}" name="no_category_display" min="0" required>
              </div>

              @php($map_url = \App\Models\SystemSetting::where('key', 'map_url')->first())
              <div class="col-md-6">
                <label for="inputZip" class="form-label">Map URL <span style="color:red;">*</span></label>
                <input type="text" class="form-control" value="{{ $map_url->value ?? '' }}" name="map_url" required>
              </div>

              <table>
                <tr>
                  <th>

                    <div class="text-center">
                      <button type="submit" class="btn btn-success">Update Website Details</button>

            </form><!-- End Multi Columns Form -->
            </th>
            <th>
              <form method="get" action="{{ route('backend.website.setting') }}">
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

<script>
  function toggleShippingOptions() {
    const selectedOption = document.querySelector('input[name="free_shipping_option"]:checked')?.value;
    const shippingSection = document.getElementById('shipping-option-section');
    const thresholdSection = document.getElementById('threshold-section');

    if (selectedOption === 'no_free_threshold') {
      // shippingSection.style.display = 'none';
      thresholdSection.style.display = 'none';
    } else if (selectedOption === 'free_threshold') {
      // shippingSection.style.display = 'block';
      thresholdSection.style.display = 'block';
    }
  }

  document.addEventListener('DOMContentLoaded', function () {
    toggleShippingOptions();

    const radios = document.querySelectorAll('input[name="free_shipping_option"]');
    radios.forEach(radio => {
      radio.addEventListener('change', toggleShippingOptions);
    });
  });
</script>