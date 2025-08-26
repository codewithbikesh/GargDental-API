<footer>
    <div class="outer-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="outer-footer__content u-s-m-b-40">

                        <span class="outer-footer__content-title">Contact Us</span>
                        <div class="outer-footer__text-wrap"><i class="fas fa-home footerIcons"></i>
                            <span>{{ $landing_data['address'] }}</span>
                        </div>
                        <div class="outer-footer__text-wrap"><i class="fas fa-phone-volume footerIcons"></i>
                            <span>{{ $landing_data['primary_phone'] }} @if ($landing_data['secondary_phone']) {{ ' / ' . $landing_data['secondary_phone'] }} @endif</span>
                        </div>
                        <div class="outer-footer__text-wrap"><i class="far fa-envelope footerIcons"></i>
                            <span>{{ $landing_data['primary_email'] }}</span>
                        </div>
                        <div class="outer-footer__social">
                            <ul>
                                <li>
                                    <a class="s-fb--color-hover" href="#"><i class="fab fa-facebook-f footerIcons"></i></a>
                                </li>
                                <li>
                                    <a class="s-tw--color-hover" href="#"><i class="fab fa-twitter footerIcons"></i></a>
                                </li>
                                <li>
                                    <a class="s-youtube--color-hover" href="#"><i class="fab fa-youtube footerIcons"></i></a>
                                </li>
                                <li>
                                    <a class="s-insta--color-hover" href="#"><i class="fab fa-instagram footerIcons"></i></a>
                                </li>
                                <li>
                                    <a class="s-gplus--color-hover" href="#"><i class="fab fa-google-plus-g footerIcons"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="outer-footer__content u-s-m-b-40">

                                <span class="outer-footer__content-title">Information</span>
                                <div class="outer-footer__list-wrap">
                                    <ul>
                                        <li>
                                            <a href="{{ route('frontend.cart') }}">Cart</a>
                                        </li>
                                        
                                        @auth('customer')
                                        <li>
                                            <a href="{{ route('frontend.dash-my-wishlist') }}">Wishlist</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('frontend.account') }}">Account</a>
                                        </li>
                                        @endauth
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <div class="outer-footer__content u-s-m-b-40">
                                <div class="outer-footer__list-wrap">
                                    <span class="outer-footer__content-title">Our Company</span>
                                    <ul>
                                        <li>
                                            <a href="{{ route('frontend.about') }}">About us</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('frontend.contact') }}">Contact Us</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('frontend.contact') }}">Privacy Policy</a>
                                        </li>
                                        <li>
                                            <a href="{{ route('frontend.contact') }}">Terms of Conditions</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-12">
                    <div class="outer-footer__content">

                        <span class="outer-footer__content-title">Join our Newsletter</span>
                        <form class="newsletter" method="POST" action="{{ route('frontend.newsletter.store') }}">
                            @csrf
                            <div class="u-s-m-b-15">
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" value="M" id="male" name="gender" required>
                                    <div class="radio-box__state radio-box__state--primary">
                                        <label class="radio-box__label" for="male">Male</label>
                                    </div>
                                </div>
                                <div class="radio-box newsletter__radio">

                                    <input type="radio" value="F" id="female" name="gender" required> 
                                    <div class="radio-box__state radio-box__state--primary">
                                        <label class="radio-box__label" for="female">Female</label>
                                    </div>
                                </div>
                            </div>
                            <div class="newsletter__group">

                                <label for="newsletter"></label>

                                <input class="input-text input-text--only-white" type="text" id="newsletter"
                                    placeholder="Enter your Email" name="email" required>

                                <button class="btn btn--e-brand newsletter__btn" type="submit">SUBSCRIBE</button>
                            </div>

                            <span class="newsletter__text">Subscribe to the mailing list to receive updates on
                                promotions, new arrivals, discount and coupons.</span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="lower-footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="lower-footer__content">
                        <div class="lower-footer__copyright" style="margin: auto;">

                            <span>Copyright &copy; {{ now()->year }}</span>

                            <a href="https://omsok.com/">{{ $landing_data['company_name'] }}</a>

                            <span>All Right Reserved</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

</div>

<script src="{{ dynamicAsset('public/client-side/js/navbar.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/vendor.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/jquery.shopnav.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/crousal.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/app.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/bootstrapmin.js') }}"></script>
<script src="{{ dynamicAsset('public/client-side/js/bootstrapmin.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="{{ dynamicAsset('public/client-side/js/product-detail.js') }}"></script>
<script>
    window.csrfToken = window.csrfToken || '{{ csrf_token() }}';
</script>
<script>
    var baseUrl = ""; // This sets baseUrl to your application's asset URL
</script>
<script>
    function toggleDropdown(id) {
        const dropdown = document.getElementById(id);
        const isVisible = dropdown.style.display === 'block';

        const dropdowns = document.querySelectorAll('.filter-dropdown');
        dropdowns.forEach(dd => dd.style.display = 'none');

        dropdown.style.display = isVisible ? 'none' : 'block';
    }
</script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Check if there's an error message in the session
        @if (Session::has('error'))
        var errorMessage = "{{ Session::get('error') }}";
        showAlert('Error!', errorMessage, 'error');
        @endif

        // Check if there's a success message in the session
        @if (Session::has('success'))
        var successMessage = "{{ Session::get('success') }}";
        showAlert('Success!', successMessage, 'success');
        @endif

        // Function to display SweetAlert2 modal
        function showAlert(title, message, icon) {
            Swal.fire({
                title: title,
                text: message,
                icon: icon,
                confirmButtonColor: "{{ $landing_data['header_theme_color'] }}",
                confirmButtonText: 'OK'
            });
        }
    });
</script>
  
@yield('customJs')
</body>

</html>