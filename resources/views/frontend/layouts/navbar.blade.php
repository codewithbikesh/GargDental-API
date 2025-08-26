<div class="preloader is-active">
    <div class="preloader__wrap">
        <img class="preloader__img" src="{{ $landing_data['company_logo_header'] }}" alt="">
    </div>
</div>

<!--====== Main App ======-->
<div id="app">

    <!-- Header section start -->
    <header class="ecomNav-header">
        <div class="upperOptionsNav">
            <a href="/" class="ecomNav-logo">
                <img src="{{ $landing_data['company_logo_header'] }}" alt="{{ $landing_data['company_name'] }}">
            </a>
            <nav class="ecomNav-navbar">
                <a href="/">HOME</a>
                <a href="{{ route('frontend.newarrival') }}">NEW ARRIVAL</a>
                <a href="{{ route('frontend.explore') }}">EXPLORE</a>
                <a href="{{ route('frontend.whatsnew') }}">WHAT'S NEW?</a>
                @auth('customer')
                @else
                    <a href="{{ route('frontend.signin') }}">LOGIN</a>
                    <a href="{{ route('frontend.signup') }}">SIGN UP</a>
                @endauth
            </nav>

            <div class="iconParent">
                <div class="ecomNav-icons">
                    <div class="fas fa-bars" id="ecomNav-menu-btn"></div>
                    
                    @auth('customer')
                        <a href="{{ route('frontend.dash-my-wishlist') }}" title="Cart">
                            <div class="ri-heart-3-fill fas" id="" title="WishList">
                                <span class="cartNum wishList">{{ $wishitem_count }}</span>
                            </div>
                        </a>
                    @endauth
                    
                    @auth('customer')
                        <a href="{{ route('frontend.cart') }}" title="Cart">
                            <div class="fas fa-shopping-cart" id="">
                                <span class="cartNum navcartcount">{{ $cartItemCount }}</span>
                            </div>
                        </a>
                    @else
                        <a href="{{ route('frontend.signin') }}" title="Login to view your cart">
                            <div class="fas fa-shopping-cart" id="ecomNav-cart-btn">
                                <span class="cartNum">0</span>
                            </div>
                        </a>
                    @endauth

                    @auth('customer')
                        <div>
                            <a href="{{ route('frontend.account') }}" style="display:flex;">
                                <div class="fas fa-tachometer-alt" id="ecomNav-cart-btn"></div>
                            </a>
                            <a href="javascript:void(0)" class="loggedInUserIcon">
                                <div class="navAccountName moreOptionUser fas fa-user morebtn"></div>
                            </a>
                        </div>
                    @else
                        <a href="{{ route('frontend.account') }}">
                            <a href="javascript:void(0)" class="hideInPc">
                                <div class="fas fa-user morebtn" title="Be Member"></div>
                        </a>
                    @endauth
                    
                </div>
                @auth('customer')
                    <a href="javascript:void(0)" class="userNameWelcome">
                        <p class="navAccountName morebtn"> <i class="ri-flower-fill"></i> Hi, {{ auth('customer')->user()->full_name }}<i class="ri-arrow-down-s-line"></i></p>
                    </a>
                @endauth
            </div>

            @auth('customer')

                <form action="" style="display:inline;" class="ecomNav-login-form ecomNav-profile-options">
                    <a href="{{ route('frontend.account') }}"><i class="ri-dashboard-line"></i>Manage Account</a>
                    <a href="{{ route('frontend.dash-my-order') }}"><i class="ri-list-ordered"></i>My Orders <span class="sideBarOrderIcon">{{ $orderCount }}</span></a>
                    <a href="{{ route('frontend.address.book') }}"><i class="ri-list-ordered greycolor ri-map-pin-line material-symbols-outlined"></i>Address Book</a>
                    <a href="{{ route('frontend.dash-my-wishlist') }}"><i class="ri-heart-fill"></i> My Wishlist</a>
                    <a href="{{ route('frontend.dash-my-reviews') }}"><i class="ri-discuss-fill"></i>My Reviews</a>
                    <a class="position-relative" href="{{ route('frontend.cart') }}"><i class="ri-shopping-cart-2-fill"></i>My Cart  <span class="sideBarOrderIcon">{{ $cartItemCount }}</span></a>
                    <a href="{{ route('frontend.dash-cancellation') }}"><i class="ri-arrow-go-back-fill"></i>My Cancellations</a>
                    <a href="{{ route('frontend.change.password') }}"><i class="ri-key-fill"></i>Change Password</a>
                    <a href="{{ route('frontend.logout')}}" onclick="confirmLogout(event);" type="submit" class=""><i class="ri-logout-box-line"></i>Logout</a>
                </form>

            @else

                <form action="" class="ecomNav-login-form">
                    <h3>Be Our Member</h3>
                    <a href="{{ route('frontend.signin') }}" class="ecomNav-btn">Signin</a>
                    <a href="{{ route('frontend.signup') }}" class="ecomNav-btn">Signup</a>
                </form>

            @endauth
        </div>
        <div class="">
            <form action="{{ route('frontend.shop-list-full') }}" method="get">
                <div class="input-group">
                    <div class="input-group serchParent">
                        <input type="search" class="form-control searchBar"
                            placeholder="Search any products here..." aria-label="Search" name="keyword"
                            value="{{ session('search_keyword', Request::get('keyword')) }}" aria-describedby="search-addon" id="search-input" />
                        <button type="submit" class="input-group-text border-0 searchBarIcin" id="search-addon">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                </div>
            </form>
        </div>

    </header>
    <!-- Header section end -->
    <style>
    .swal2-confirm-btn {
        font-size: 1.2rem; /* Increase font size */
        padding: 0.75rem 1.5rem; /* Adjust padding */
    }

    .swal2-cancel-btn {
        font-size: 1.2rem; /* Increase font size */
        padding: 0.75rem 1.5rem; /* Adjust padding */
    }
</style>
<script>
    function confirmLogout(event) {
        event.preventDefault(); // Prevent the default action of the link

        Swal.fire({
            title: 'Are you sure you want to log out?',
            text: "You will be logged out of your account.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: 'var(--dynamic-header-color)',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, logout',
            cancelButtonText: 'No, cancel',
            customClass: {
                confirmButton: 'swal2-confirm-btn',
                cancelButton: 'swal2-cancel-btn'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                // If confirmed, redirect to the logout route
                window.location.href = "{{ route('frontend.logout') }}";
            } else {
                // If canceled, do nothing
                console.log("Logout canceled.");
            }
        });
    }
</script>