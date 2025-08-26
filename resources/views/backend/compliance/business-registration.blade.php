@extends('backend.layout.master')
@section('content')
<style>
  .ck-editor__editable {
    min-height: 300px !important;
  }
</style>

<section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-lg-8 col-md-6 d-flex flex-column align-items-center justify-content-center">

        <div class="card mb-6">
          <div class="card-body">
            <h5 class="card-title">
              <center>Add Business Registration Details</Details>
              </center>
            </h5>

            <form class="row g-3" method="post" action="{{ route('backend.compliance.business-registration-store') }}" enctype="multipart/form-data">
              @csrf

              <div class="col-md-12">
                <label for="inputName5" class="form-label">Business Registration Details</label>
                <textarea type="text" class="form-control ckeditor" placeholder="Write description here..." name="business_registration">{!! $business_registration->value ?? '' !!}</textarea>
              </div>

              {{-- Section 2: Multiple Additional Documents --}}
              <h5 class="card-title text-center">Documents</h5>

              <div id="certifications-wrapper">
                <div class="certification-group row g-3">
                  <div class="col-md-6">
                    <label class="form-label">Document Title</label>
                    <input type="text" class="form-control" name="documents[0][title]" placeholder="Enter document title">
                  </div>
                  <div class="col-md-6">
                    <label class="form-label">Document</label>
                    <input type="file" class="form-control" name="documents[0][file]">
                  </div>
                </div>
              </div>

              <div class="text-end mt-3">
                <button type="button" class="btn btn-primary" id="add-certification">+ Add Another Certification</button>
              </div>

              {{-- Documents List --}}
              <h5 class="card-title mt-4">Uploaded Documents</h5>
              <div class="row">
                @forelse($business_registration->compliancefiles as $key => $file)
                @php
                $fileUrl = $business_registration->files_full_url[$key] ?? '';
                $extension = pathinfo($fileUrl, PATHINFO_EXTENSION);
                @endphp
                <div class="col-md-3 mb-3">
                  <div class="card">
                    @if(strtolower($extension) === 'pdf')
                    <iframe src="{{ $fileUrl }}" width="100%" height="150px" style="border: none;"></iframe>
                    @else
                    <img src="{{ $fileUrl }}" class="card-img-top" style="height: 150px; object-fit: cover;">
                    @endif
                    <div class="card-body text-center">
                      <p class="mb-1">{{ $file->title }}</p>
                      <a href="{{ route('backend.compliance.compliance-doc-delete', ['id' => $file->id]) }}"
                        class="btn btn-sm btn-danger delete-cert"
                        onclick="return confirm('Are you sure you want to delete this document?');">
                        Delete
                      </a>
                    </div>
                  </div>
                </div>
                @empty
                <div class="col-12">
                  <p>No documents uploaded.</p>
                </div>
                @endforelse
              </div>

              <div class="text-center">
                <button type="submit" class="btn btn-success">Submit Business Registration Details</button>
              </div>

            </form>

          </div>
        </div>

      </div>


    </div>
  </div>
  </div>
</section>

<!-- JavaScript for dynamic certification addition -->
<script>
    let certIndex = 1;

    document.getElementById('add-certification').addEventListener('click', function () {
        const wrapper = document.getElementById('certifications-wrapper');

        const newGroup = document.createElement('div');
        newGroup.classList.add('certification-group', 'row', 'g-3', 'mt-3');

        newGroup.innerHTML = `
            <div class="col-md-6">
                <label class="form-label">Document Title</label>
                <input type="text" class="form-control" name="documents[${certIndex}][title]" placeholder="Enter document title">
            </div>
            <div class="col-md-5">
                <label class="form-label">Document</label>
                <input type="file" class="form-control" name="documents[${certIndex}][file]">
            </div>
            <div class="col-md-1 d-flex align-items-end">
                <button type="button" class="btn btn-danger remove-btn">X</button>
            </div>
        `;

        wrapper.appendChild(newGroup);

        ClassicEditor
            .create(newGroup.querySelector('.ckeditor'))
            .catch(error => {
                console.error(error);
            });

        certIndex++;
    });

    // Remove certification group
    document.getElementById('certifications-wrapper').addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-btn')) {
            e.target.closest('.certification-group').remove();
        }
    });
</script>

@endsection