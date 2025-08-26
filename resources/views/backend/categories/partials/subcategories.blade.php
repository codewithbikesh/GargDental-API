<div class="subcategories-wrapper">
    <table class="table table-sm table-bordered mb-0" style="width: calc(100% - 50px); margin-left: 50px;">
        <tbody>
            @foreach($subcategories as $item)
                <tr class="subcategory-row" data-id="{{ $item->id }}">
                    <!-- Remove the first column for subcategories -->
                    <td style="padding-left: {{ 20 * ($level - 1) }}px;">
                        @if($item->children_count > 0)
                            <button class="btn toggle-subcategory p-0" data-id="{{ $item->id }}">
                                <i class="fa fa-chevron-right"></i> {{ $item->category_name }}
                            </button>
                        @else
                            {{ $item->category_name }}
                        @endif
                    </td>
                    <td>@include('backend.categories.partials.status', ['row' => $item, 'status' => route('backend.categories.status',[$item['id'],$item->status?0:1])])</td>
                    <td>@include('backend.categories.partials.actions', ['row' => $item, 'view' => route('backend.categories.view'), 'edit' => route('backend.categories.edit')])</td>
                </tr>
            @endforeach
        </tbody>
    </table>
</div>