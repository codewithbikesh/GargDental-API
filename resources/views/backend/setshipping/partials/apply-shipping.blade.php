<div class="form-check form-switch">
    <input class="form-check-input redirect-url" type="checkbox" data-url="{{ $apply_shipping }}" id="statusCheckbox{{$row->id}}" {{$row->apply_shipping ? 'checked' : ''}}>
    <label class="form-check-label" for="statusCheckbox{{$row->id}}"></label>
</div>