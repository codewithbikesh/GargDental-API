<form method="post" action="{{ $view }}" style="margin-right: 10px;">
    @csrf
    <input type="hidden" name="id" value="{{ $row->id }}">
    <button style="background-color: transparent; border: none;">
        <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
    </button>
</form>
