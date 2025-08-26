<div style="display: flex; align-items: center;">
  <form method="post" action="{{ $view }}" style="margin-right: 10px;">
    @csrf
    <input type="hidden" name="id" value="{{ $row->id }}">
    <button style="background-color: transparent; border: none;">
      <i title="View" class="fa fa-info-circle" style="font-size: 20px; color: #24a0ed;"></i>
    </button>
  </form>

  <button data-bs-toggle="modal" data-bs-target="#deleteModal{{ $row->id }}" style="background-color: transparent; border: none;">
    <i title="Delete" class="fa fa-trash" style="font-size: 20px; color: red;"></i>
  </button>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal{{ $row->id }}" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Grievance</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <b>Are you sure you want to delete this grievance of {{ $row->full_name }}?</b>
                </div>
                <div class="modal-footer">
                    <form method="post" action="{{ $delete }}">
                    @csrf
                    @method('DELETE')
                    <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

</div>
