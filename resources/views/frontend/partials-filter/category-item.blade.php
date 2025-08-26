@foreach ($categories as $category)
    <a class="dropdown-item category-item forgetSession" 
       href="{{ route('frontend.shop-list-full', ['category_id' => $category->id]) }}">
        {!! str_repeat('&nbsp;&nbsp;', $depth) !!}{{ $category->category_name }}
    </a>

    @if ($category->children->isNotEmpty())
        @include('frontend.partials-filter.category-item', ['categories' => $category->children, 'depth' => $depth + 1])
    @endif
@endforeach
