@if ($shoplistproducts->isNotEmpty())
@foreach ($shoplistproducts as $shoplistproduct)
<div class="col-lg-3 col-md-4 col-sm-6 singleProduct cursor_pointer_filter_item" data-href="{{ route('frontend.product-detail', $shoplistproduct->product_code) }}">
    @auth('customer')
    <div class="wishlist-btn-container">
        <form method="post" action="{{ $shoplistproduct->wishlistedByUser ? route('wishlist.remove', ['product_code' => $shoplistproduct->product_code]) : route('wishlist.add', ['product_code' => $shoplistproduct->product_code]) }}">
            @csrf
            <button type="submit" class="wishlist-btn" data-tooltip="tooltip" title="{{ $shoplistproduct->wishlistedByUser ? 'Remove from Wishlist' : 'Add to Wishlist' }}">
                <i class="{{ $shoplistproduct->wishlistedByUser ? 'fas' : 'far' }} fa-heart"></i>
            </button>
        </form>
    </div>
    @endauth
    <div class="product-m__thumb">
        <a class="aspect aspect--bg-grey aspect--square u-d-block" href="{{ route('frontend.product-detail', $shoplistproduct->slug) }}">
            @if ($shoplistproduct->image_full_url)
            <img class="aspect__img" src="{{ $shoplistproduct->image_full_url }}" alt="{{ $shoplistproduct->product_name }}">
            @else
            <img class="aspect__img" src="{{ dynamicAsset('public/client-side/images/no-image.png') }}" alt="{{ $shoplistproduct->product_name }}">
            @endif
        </a>
    </div>
    <div class="product-m__content d-flex justify-content-evenly flex-column">
        <div class="product-o__category text-center">
            <a href="{{ route('frontend.shop-list-full', ['category_id' => $shoplistproduct->category->getTopLevelParent()->id]) }}">{{ $shoplistproduct->category ? $shoplistproduct->category->getTopLevelParent()->category_name : '' }}</a>
        </div>
        <div class="product-m__name text-center product-o__name productName">
            <a href="{{ route('frontend.product-detail', $shoplistproduct->slug) }}">{{ $shoplistproduct->product_name }}</a>
        </div>
        <div class="text-center product-m__rating gl-rating-style">
            @for ($i = 1; $i <= 5; $i++)
                @if ($i <=floor($shoplistproduct->average_rating))
                <i class="fas fa-star"></i>
                @elseif ($i == ceil($shoplistproduct->average_rating) && $shoplistproduct->average_rating - floor($shoplistproduct->average_rating) >= 0.5)
                <i class="fas fa-star-half-alt"></i>
                @else
                <i class="far fa-star"></i>
                @endif
                @endfor

                <span class="product-m__review">({{ $shoplistproduct->review_count }})</span>
        </div>
        <div class="text-center">
            {{ $shoplistproduct->brand->brand_name ?? "Brand Not Available" }}
        </div>

        <div class="product-m__hover"></div>
    </div>

    <div class="prevQuickAddCart d-flex justify-content-evenly">
        <div class="price-section">
            <span class="product-o__price">Rs. {{(int)$shoplistproduct->sell_price }}</span>
            <span class="product-o__discount">Rs. {{(int)$shoplistproduct->mr_price }}</span>
        </div>
        @if((int)$shoplistproduct->available_quantity >= 0)
        <form method="post" action="{{ route('cart.add') }}">
            @csrf
            <input type="hidden" name="product_code" value="{{ $shoplistproduct->product_code }}" />
            <button type="submit" class="Productoption addtoCartBtnHompepage getAddToCartModal" data-tooltip="tooltip" data-placement="top" title="Add to Cart">ADD</button>
        </form>
        @else
        <span class="out_of_stock">Out of stock</span>
        @endif
    </div>
</div>
@endforeach
@else
<div style="width: 1000px;">
    <div class="container d-flex flex-column justify-content-center align-items-center">
        <h4>Search No Result</h4>
        <p>We're sorry. We cannot find any matches for your search term.</p>
        <span><i class="fas fa-search" style="font-size: 50px;"></i></span>
    </div>
</div>
@endif

<div style="padding: 10px; float:right;">
    {{ $shoplistproducts->links('pagination::bootstrap-5') }}
</div>