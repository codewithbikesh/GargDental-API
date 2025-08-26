<div class="leftSideBar sliderHide">
    <aside class="sidebar">
        <ul class="links">
            <h4>Main Menu</h4>
            <li class="animated-link">
                <span class="ri-user-settings-line greycolor material-symbols-outlined"></span>
                <a class="dash-active greycolor" href="{{ route('frontend.account') }}">Manage My
                    Account</a>
            </li>
              <li class="animated-link">
                <span class="greycolor ri-map-pin-line material-symbols-outlined greycolor"></span>
                <a class="greycolor" href="{{ route('frontend.address.book') }}">Address Book</a>
            </li>
            <li class="animated-link">
                <span class="ri-list-ordered greycolor material-symbols-outlined"></span>
                <a class="greycolor" href="{{ route('frontend.dash-my-order') }}">My Orders <span class="sideBarOrderIcon">{{ $orderCount }}</span> </a>
            </li>
            <hr>
            <h4>Advanced</h4>
            <li class="animated-link">
                <span class="ri-heart-fill greycolor material-symbols-outlined"></span>
                <a href="{{ route('frontend.dash-my-wishlist') }}" class="greycolor">My Wishlist</a>
            </li>
            <li class="animated-link">
                <span class="ri-discuss-fill greycolor material-symbols-outlined"></span>
                <a href="{{ route('frontend.dash-my-reviews') }}" class="greycolor">My Reviews</a>
            </li>
            <li class="animated-link">
                <span class="ri-arrow-go-back-fill greycolor material-symbols-outlined"></span>
            <a class="greycolor" href="{{ route('frontend.dash-cancellation') }}">My Cancellations</a>
            </li>
        </ul>
    </aside>  
</div>
