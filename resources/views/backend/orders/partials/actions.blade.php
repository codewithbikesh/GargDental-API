<div style="display: flex; align-items: center;">
    <form method="get" action="{{ route('backend.orders.view', $row->id) }}" style="margin-right: 10px;">
        @csrf
        <button style="background-color: transparent; border: none;" type="submit">
            <i title="View Details" class="fa fa-info-circle" style="font-size:35px;color:#24a0ed"></i>
        </button>
    </form>
</div>
