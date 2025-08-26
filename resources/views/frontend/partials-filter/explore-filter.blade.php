@if ($explores->isNotEmpty())
@foreach ($explores as $explore)
<div class="col-xl-2 col-lg-4 col-md-6 col-sm-6 u-s-m-b-30 filter__item cursor_pointer_filter_item" data-href="{{ route('frontend.product-detail', $explore->product_code) }}">
    @auth('customer')
    <div class="wishlist-btn-container">
        <form method="post" action="{{ $explore->wishlistedByUser ? route('wishlist.remove', ['product_code' => $explore->product_code]) : route('wishlist.add', ['product_code' => $explore->product_code]) }}">
            @csrf
            <button type="submit" class="wishlist-btn" data-tooltip="tooltip" title="{{ $explore->wishlistedByUser ? 'Remove from Wishlist' : 'Add to Wishlist' }}">
                <i class="{{ $explore->wishlistedByUser ? 'fas' : 'far' }} fa-heart"></i>
            </button>
        </form>
    </div>
    @endauth
    <div class="product-o product-o--hover-on product-o--radius">
        <a class="product-o__wrap" href="{{ route('frontend.product-detail', $explore->slug) }}">
            <div class="aspect aspect--bg-grey aspect--square u-d-block">
                @if ($explore->image_full_url)
                <img class="aspect__img" src="{{ $explore->image_full_url }}" alt="{{ $explore->product_name }}">
                @else
                <img class="aspect__img" src="{{  dynamicAsset('public/client-side/images/no-image.png') }}" alt="{{ $explore->product_name }}">
                @endif
            </div>
        </a>

        <span class="product-o__category"><a href="{{ route('frontend.shop-list-full', ['category_id' => $explore->category->getTopLevelParent()->id]) }}">{{ $explore->category ? $explore->category->getTopLevelParent()->category_name : '' }}</a></span>
        <span class="product-o__name"><a href="{{ route('frontend.product-detail', $explore->slug) }}">{{ $explore->product_name }}</a></span>

        <div class="product-o__rating gl-rating-style">
            @for ($i = 1; $i <= 5; $i++)
                @if ($i <=floor($explore->average_rating))
                <i class="fas fa-star"></i>
                @elseif ($i == ceil($explore->average_rating) && $explore->average_rating - floor($explore->average_rating) >= 0.5)
                <i class="fas fa-star-half-alt"></i>
                @else
                <i class="far fa-star"></i>
                @endif
                @endfor

                <span class="product-o__review">({{ $explore->review_count }})</span>
        </div>{{ $explore->brand->brand_name ?? "Brand Not Available" }}
        @php
        $mrPrice = $explore->mr_price;
        $sellPrice = $explore->sell_price;
        $discountPercentage = $mrPrice > 0 ? round(((($mrPrice - $sellPrice) / $mrPrice) * 100), 2) : 0;
        @endphp
        <div class="quickvewandAddtocart">
            <div class="price-section">
                <span class="product-o__price">Rs. {{(int)$explore->sell_price }}</span>
                <span class="product-o__discount">Rs. {{(int)$explore->mr_price }}</span>
            </div>
            @if((int)$explore->available_quantity > 0)
            <form method="post" action="{{ route('cart.add') }}">
                @csrf
                <input type="hidden" name="product_code" value="{{ $explore->product_code }}" />
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
    {{ $explores->links('pagination::bootstrap-5') }}
</div>