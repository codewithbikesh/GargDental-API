{{-- <div style="display: flex; align-items: center;">
    <form method="get" action="{{ $view }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="product_code" value="{{ $row->product_code }}">
        <button style="background-color: transparent; border: none;">
            <i title="Upload images and files" class="fa fa-upload" style="font-size:20px;color:#24a0ed"></i>
        </button>
    </form>

    <form method="get" action="{{ $edit }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="product_code" value="{{ $row->product_code }}">
        <button style="background-color: transparent; border: none;">
            <i title="Edit Details" class="fa fa-edit" style="font-size:20px;color:blue"></i>
        </button>
    </form>
</div> --}}

@if(\App\CentralLogics\Helpers::module_permission_check('product-edit'))
    <form method="get" action="{{ $view }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="product_code" value="{{ $row->product_code }}">
        <button style="background-color: transparent; border: none;">
            <i title="Upload images and files" class="fa fa-upload" style="font-size:20px;color:#24a0ed"></i>
        </button>
    </form>
@endif

@if(\App\CentralLogics\Helpers::module_permission_check('product-edit'))
    <form method="get" action="{{ $edit }}" style="margin-right: 10px;">
        @csrf
        <input type="hidden" name="product_code" value="{{ $row->product_code }}">
        <button style="background-color: transparent; border: none;">
            <i title="Edit Details" class="fa fa-edit" style="font-size:20px;color:blue"></i>
        </button>
    </form>
@endif

