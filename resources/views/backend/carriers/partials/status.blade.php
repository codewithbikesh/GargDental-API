<div class="form-check form-switch">
    <input class="form-check-input redirect-url" type="checkbox" data-url="{{ $status }}" id="statusCheckbox{{$row->id}}" {{$row->status ? 'checked' : ''}}>
    <label class="form-check-label" for="statusCheckbox{{$row->id}}"></label>
</div>