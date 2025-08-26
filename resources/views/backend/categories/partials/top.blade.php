<div class="form-check form-switch">
    <input class="form-check-input redirect-url" type="checkbox" data-url="{{ $top }}" id="topCheckbox{{$row->id}}" {{$row->top ? 'checked' : ''}}>
    <label class="form-check-label" for="topCheckbox{{$row->id}}"></label>
</div>