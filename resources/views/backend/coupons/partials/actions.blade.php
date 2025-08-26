<div style="display: flex; align-items: center;">
    <form method="post" action="{{ $view }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="coupon_id" value="{{ $row->id }}">
        <button style="background-color: transparent; border: none;">
            <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
        </button>
    </form>
    &nbsp;

    <form method="get" action="{{ $edit }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="coupon_id" value="{{ $row->id }}">
        <button style="background-color: transparent; border: none;">
            <i title="Edit Details" class="fa fa-edit" style="font-size:35px;color:blue"></i>
        </button>
    </form>
    &nbsp;
</div>
