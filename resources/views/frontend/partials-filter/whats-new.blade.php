@if ($whatsnewproducts->isNotEmpty())
@foreach ($whatsnewproducts as $whatsnewproduct)
<div class="col-xl-2 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item cursor_pointer_filter_item" data-href="{{ route('frontend.product-detail', $whatsnewproduct->product_code) }}">
    @auth('customer')
    <div class="wishlist-btn-container">
        <form method="post" action="{{ $whatsnewproduct->wishlistedByUser ? route('wishlist.remove', ['product_code' => $whatsnewproduct->product_code]) : route('wishlist.add', ['product_code' => $whatsnewproduct->product_code]) }}">
            @csrf
            <button type="submit" class="wishlist-btn" data-tooltip="tooltip" title="{{ $whatsnewproduct->wishlistedByUser ? 'Remove from Wishlist' : 'Add to Wishlist' }}">
                <i class="{{ $whatsnewproduct->wishlistedByUser ? 'fas' : 'far' }} fa-heart"></i>
            </button>
        </form>
    </div>
    @endauth
    <div class="product-o product-o--hover-on product-o--radius">
        <a class="product-o__wrap" href="{{ route('frontend.product-detail', $whatsnewproduct->slug) }}">
            <div class="aspect aspect--bg-grey aspect--square u-d-block">
                @if ($whatsnewproduct->image_full_url)
                <img class="aspect__img"
                    src="{{ $whatsnewproduct->image_full_url }}"
                    alt="{{ $whatsnewproduct->product_name }}">
                @else
                <img class="aspect__img"
                    src="{{ dynamicAsset('public/client-side/images/no-image.png') }}"
                    alt="{{ $whatsnewproduct->product_name }}">
                @endif
            </div>
        </a>

        <span class="product-o__category"><a href="{{ route('frontend.shop-list-full', ['category_id' => $whatsnewproduct->category->getTopLevelParent()->id]) }}">{{ $whatsnewproduct->category ? $whatsnewproduct->category->getTopLevelParent()->category_name : '' }}</a></span>
        <span class="product-o__name"><a href="{{ route('frontend.product-detail', $whatsnewproduct->slug) }}">{{ Str::limit($whatsnewproduct->product_name, 29, '...') }}</a></span>

        <div class="product-o__rating gl-rating-style">
            @for ($i = 1; $i <= 5; $i++)
                @if ($i <=floor($whatsnewproduct->average_rating))
                <i class="fas fa-star"></i>
                @elseif ($i == ceil($whatsnewproduct->average_rating) && $whatsnewproduct->average_rating - floor($whatsnewproduct->average_rating) >= 0.5)
                <i class="fas fa-star-half-alt"></i>
                @else
                <i class="far fa-star"></i>
                @endif
                @endfor
                <span class="product-o__review">({{ $whatsnewproduct->review_count }})</span>
        </div>{{ $whatsnewproduct->brand->brand_name ?? "Brand Not Available" }}
        @php
        $mrPrice = $whatsnewproduct->mr_price;
        $sellPrice = $whatsnewproduct->sell_price;
        $discountPercentage = $mrPrice > 0 ? round(((($mrPrice - $sellPrice) / $mrPrice) * 100), 2) : 0;
        @endphp
        <div class="quickvewandAddtocart">
            <div class="price-section">
                <span class="product-o__price">Rs. {{(int)$whatsnewproduct->sell_price }}</span>
                <span class="product-o__discount">Rs. {{(int)$whatsnewproduct->mr_price }}</span>
            </div>
            @if((int)$whatsnewproduct->available_quantity > 0)
            <form method="post" action="{{ route('cart.add') }}">
                @csrf
                <input type="hidden" name="product_code" value="{{ $whatsnewproduct->product_code }}" />
                <button type="submit" class="Productoption addtoCartBtnHompepage getAddToCartModal no-navigation" data-tooltip="tooltip" data-placement="top" title="Add to Cart">ADD</button>
            </form>
            @else
            <span class="out_of_stock">Out of stock</span>
            @endif
        </div>
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

<div style="padding: 10px;">
    {{ $whatsnewproducts->links('pagination::bootstrap-5') }}
</div>