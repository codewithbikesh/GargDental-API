<?php
use App\CentralLogics\Helpers;
?>
<header id="header" class="header fixed-top d-flex align-items-center">

  <div class="d-flex align-items-center justify-content-between">
    @php($company_logo_header=\App\Models\SystemSetting::where(['key'=>'company_logo_header'])->first())
    <form method="get" action="{{ route('backend.dashboard') }}">
      <button type="submit" class="logo d-flex align-items-center" style="border:none; background:transparent;"><img src="{{ \App\CentralLogics\Helpers::get_full_url('system',$company_logo_header?->value,$restaurant_logo?->storage[0]?->value ?? 'public', 'favicon') }}" alt=""></button>
    </form>

    <i class="bi bi-list toggle-sidebar-btn"></i>
  </div>

  <nav class="header-nav ms-auto">
    <ul class="d-flex align-items-center">

      <li class="nav-item dropdown pe-3">

        <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
          <img src="{{ Auth::user()->image_full_url }}" alt="Profile" class="rounded-circle">
          <span class="d-none d-md-block dropdown-toggle ps-2">{{ Auth::user()->name }}</span>
        </a>

        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
          <li class="dropdown-header">
            <h6>{{ Auth::user()->name }}</h6>
          </li>
          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <form method="get" action="{{ route('backend.profile.profile') }}">
              @csrf
              <button type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.profile.profile') ? 'active' : '' }}"><i class="fa fa-user"></i>My profile</></button>
            </form>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <!-- <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.setapi.index') ? 'active' : '' }}" href="{{ route('backend.setapi.index') }}"><i class="bi bi-code-slash"></i>Set API</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.loadproductsapi.index') ? 'active' : '' }}" href="{{ route('backend.loadproductsapi.index') }}"><i class="fa fa-download"></i>Load Products</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li> -->

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.uploadproductimages.index') ? 'active' : '' }}" href="{{ route('backend.uploadproductimages.index') }}"><i class="fa fa-file-excel-o"></i>Upload Product & Images</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.website.setting') ? 'active' : '' }}" href="{{ route('backend.website.setting') }}"><i class="fa fa-cog"></i>Ecommerce Settings</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.website.carousel') ? 'active' : '' }}" href="{{ route('backend.website.carousel') }}"><i class="fa fa-sliders"></i>Carousel</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.website.poster_card') ? 'active' : '' }}" href="{{ route('backend.website.poster_card') }}"><i class="fa fa-file-image-o"></i>Poster Card</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.optimization') ? 'active' : '' }}" href="{{ route('backend.optimization') }}"><i class="fa fa-refresh"></i>Clear System Optimization</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a type="submit" class="dropdown-item d-flex align-items-center {{ request()->routeIs('backend.uploadimagefolder.index') ? 'active' : '' }}" href="{{ route('backend.uploadimagefolder.index') }}"><i class="fa fa-upload"></i>Upload Image Folder</a>
          </li>

          <li>
            <hr class="dropdown-divider">
          </li>

          <li>
            <a class="dropdown-item d-flex align-items-center" href="#" data-bs-toggle="modal" data-bs-target="#logoutmodal"><i class="fa fa-sign-out"></i>Logout</a>
          </li>

        </ul>
      </li>

    </ul>
  </nav>

</header>


<!--Users Logout Modal-->
<div class="modal fade" id="logoutmodal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Logout</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

        <b>Are you sure you want to Logout?</b>

      </div>

      <div class="modal-footer">
        <form id="frm-logout" action="{{ route('admin.log.out') }}" method="POST" style="display: none;">
          @csrf
        </form>
        <button type="button" class="btn btn-primary" onclick="event.preventDefault(); document.getElementById('frm-logout').submit();">Logout</button>

        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
      </div>

    </div>
  </div>
</div>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.dashboard') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.dashboard') }}"><i class="fa fa-dashboard"></i><span>Dashboard</span></a>
    </li>

  <li class="nav-item">
    <a class="nav-link {{ request()->routeIs('backend.products.index') || request()->routeIs('backend.products.new') || request()->routeIs('backend.products.edit') ? '' : 'collapsed' }}" 
       data-bs-toggle="collapse" href="#products-submenu" aria-expanded="false">
        <i class="fa fa-product-hunt"></i><span>Products</span><i class="fa fa-chevron-down ms-auto"></i>
    </a>

    <ul id="products-submenu" 
        class="nav-content collapse {{ request()->routeIs('backend.products.index') || request()->routeIs('backend.products.new') || request()->routeIs('backend.products.edit') ? 'show' : '' }}" 
        data-bs-parent="#sidebar-nav">

        {{-- Add Product (only if admin has product-add permission) --}}
        @if(\App\CentralLogics\Helpers::module_permission_check('product-add'))
            <li>
                <a href="{{ route('backend.products.new') }}" 
                   class="{{ request()->routeIs('backend.products.new') ? 'active' : '' }}">
                    <i class="fa fa-circle"></i><span>Add Product</span>
                </a>
            </li>
        @endif

        {{-- Products List (only if admin has product-view permission) --}}
        @if(Helpers::module_permission_check('product-view'))
            <li>
                <a href="{{ route('backend.products.index') }}" 
                   class="{{ request()->routeIs('backend.products.index') || request()->routeIs('backend.products.edit') ? 'active' : '' }}">
                    <i class="fa fa-circle"></i><span>Products List</span>
                </a>
            </li>
        @endif
    </ul>
</li>



    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.categories.index') || request()->routeIs('backend.categories.new') || request()->routeIs('backend.categories.edit') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#categories-submenu" aria-expanded="false">
        <i class="fa fa-list-alt"></i><span>Categories</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="categories-submenu" class="nav-content collapse {{ request()->routeIs('backend.categories.index') || request()->routeIs('backend.categories.new') || request()->routeIs('backend.categories.edit') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.categories.new') }}" class="{{ request()->routeIs('backend.categories.new') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Add Category</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.categories.index') }}" class="{{ request()->routeIs('backend.categories.index') || request()->routeIs('backend.categories.edit') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Categories List</span>
          </a>
        </li>
      </ul>
    </li>

    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.brands.index') || request()->routeIs('backend.brands.new') || request()->routeIs('backend.brands.edit') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#brands-submenu" aria-expanded="false">
        <i class="fa fa-font-awesome"></i><span>Brands</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="brands-submenu" class="nav-content collapse {{ request()->routeIs('backend.brands.index') || request()->routeIs('backend.brands.new') || request()->routeIs('backend.brands.edit') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.brands.new') }}" class="{{ request()->routeIs('backend.brands.new') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Add Brand</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.brands.index') }}" class="{{ request()->routeIs('backend.brands.index') || request()->routeIs('backend.brands.edit') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Brands List</span>
          </a>
        </li>
      </ul>
    </li>
        
    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.coupons.index') || request()->routeIs('backend.coupons.new') || request()->routeIs('backend.coupons.edit') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#coupons-submenu" aria-expanded="false">
        <i class="fa fa-gift"></i><span>Coupons</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="coupons-submenu" class="nav-content collapse {{ request()->routeIs('backend.coupons.index') || request()->routeIs('backend.coupons.new') || request()->routeIs('backend.coupons.edit') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.coupons.new') }}" class="{{ request()->routeIs('backend.coupons.new') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Add Coupon</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.coupons.index') }}" class="{{ request()->routeIs('backend.coupons.index') || request()->routeIs('backend.coupons.edit') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Coupons List</span>
          </a>
        </li>
      </ul>
    </li>
        
    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.orders.*') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#orders-submenu" aria-expanded="{{ request()->routeIs('backend.orders.*') ? 'true' : 'false' }}">
        <i class="fa fa-shopping-cart"></i><span>Manage Orders</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="orders-submenu" class="nav-content collapse {{ request()->routeIs('backend.orders.*') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.orders.byStatus', 'processing') }}" class="{{ request()->routeIs('backend.orders.byStatus') && request()->route('status') === 'processing' ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Processing List</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.orders.byStatus', 'shipped') }}" class="{{ request()->routeIs('backend.orders.byStatus') && request()->route('status') === 'shipped' ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Shipped List</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.orders.byStatus', 'delivered') }}" class="{{ request()->routeIs('backend.orders.byStatus') && request()->route('status') === 'delivered' ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Delivered List</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.orders.byStatus', 'cancelled') }}" class="{{ request()->routeIs('backend.orders.byStatus') && request()->route('status') === 'cancelled' ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Cancelled List</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.orders.byStatus', 'returned') }}" class="{{ request()->routeIs('backend.orders.byStatus') && request()->route('status') === 'returned' ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Return Request List</span>
          </a>
        </li>
      </ul>
    </li>

    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.clinic.setup') || request()->routeIs('backend.clinic.requests') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#clinic-submenu" aria-expanded="{{ request()->routeIs('backend.clinic.setup') || request()->routeIs('backend.clinic.requests') ? 'true' : 'false' }}">
        <i class="fa fa-hospital-o"></i><span>Manage Clinic Setup</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="clinic-submenu" class="nav-content collapse {{ request()->routeIs('backend.clinic.setup') || request()->routeIs('backend.clinic.requests') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.clinic.setup') }}" class="{{ request()->routeIs('backend.clinic.setup') ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Setup Page</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.clinic.requests') }}" class="{{ request()->routeIs('backend.clinic.requests') ? 'active' : '' }}">
              <i class="fa fa-circle"></i><span>Setup Request Lists</span>
          </a>
        </li>
      </ul>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.customers.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.customers.index') }}"><i class="fa fa-users"></i><span>Customers</span></a>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.ratings.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.ratings.index') }}"><i class="fa fa-star"></i><span>Reviews and Ratings</span></a>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.inquiries.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.inquiries.index') }}"><i class="fa fa-inbox"></i><span>Inquiries</span></a>
    </li>
    
    <li>
      <a class="nav-link {{ request()->routeIs('backend.grievances.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.grievances.index') }}"><i class="fa fa-inbox"></i><span>Grievances</span></a>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.newsletters.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.newsletters.index') }}"><i class="fa fa-bell"></i><span>Newsletter Subscribers</span></a>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.users.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.users.index') }}"><i class="fa fa-user-circle"></i><span>System Users</span></a>
    </li>

     <li>
     <a class="nav-link {{ request()->routeIs('backend.custom-role.list') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.custom-role.list') }}">
     <i class="fa fa-users-cog"></i><span>Custom Roles</span>
     </a>
     </li>

    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.carriers.index') || request()->routeIs('backend.carriers.new') || request()->routeIs('backend.carriers.edit') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#carriers-submenu" aria-expanded="false">
        <i class="fa fa-list-alt"></i><span>Shipping Carriers</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="carriers-submenu" class="nav-content collapse {{ request()->routeIs('backend.carriers.index') || request()->routeIs('backend.carriers.new') || request()->routeIs('backend.carriers.edit') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        <li>
          <a href="{{ route('backend.carriers.new') }}" class="{{ request()->routeIs('backend.carriers.new') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Add Carrier</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.carriers.index') }}" class="{{ request()->routeIs('backend.carriers.index') || request()->routeIs('backend.carriers.edit') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Carriers List</span>
          </a>
        </li>
      </ul>
    </li>

    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.provinces.index') || request()->routeIs('backend.setshipping.index') || request()->routeIs('backend.addresszone.index') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#address-submenu" aria-expanded="{{ request()->routeIs('backend.provinces.index') || request()->routeIs('backend.setshipping.index') || request()->routeIs('backend.addresszone.index') ? 'true' : 'false' }}">
        <i class="fa fa-map-marker"></i><span>Manage Address</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="address-submenu" class="nav-content collapse {{ request()->routeIs('backend.provinces.index') || request()->routeIs('backend.setshipping.index') || request()->routeIs('backend.addresszone.index') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">

        <li>
          <a class="nav-link {{ request()->routeIs('backend.provinces.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.provinces.index') }}"><i class="fa fa-inbox"></i><span>Manage Provinces</span></a>
        </li>

        <li>
          <a class="nav-link {{ request()->routeIs('backend.setshipping.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.setshipping.index') }}"><i class="fa fa-truck"></i><span>Set City/Shipping</span></a>
        </li>

        <li>
          <a class="nav-link {{ request()->routeIs('backend.addresszone.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.addresszone.index') }}"><i class="fa fa-area-chart"></i><span>Set City Zone</span></a>
        </li>
      </ul>
    </li>

    <li>
      <a class="nav-link {{ request()->routeIs('backend.cancelreasons.index') ? '' : 'collapsed' }}" style="border:none" href="{{ route('backend.cancelreasons.index') }}"><i class="fa fa-close"></i><span>Return & Cancel Reasons</span></a>
    </li>
    
    <li class="nav-item">
      <a class="nav-link {{ request()->routeIs('backend.compliance.business-registration') || request()->routeIs('backend.compliance.medical-certifications') || request()->routeIs('backend.compliance.return-refund-policy') || request()->routeIs('backend.compliance.privacy-policy') || request()->routeIs('backend.compliance.about-company') || request()->routeIs('backend.compliance.about-us-page') || request()->routeIs('backend.compliance.terms-conditions') ? '' : 'collapsed' }}" data-bs-toggle="collapse" href="#compliance-submenu" aria-expanded="false">
        <i class="fa fa-gift"></i><span>Compliance & Legitimacy</span><i class="fa fa-chevron-down ms-auto"></i>
      </a>
      <ul id="compliance-submenu" class="nav-content collapse {{ request()->routeIs('backend.compliance.business-registration') || request()->routeIs('backend.compliance.medical-certifications') || request()->routeIs('backend.compliance.return-refund-policy') || request()->routeIs('backend.compliance.privacy-policy') || request()->routeIs('backend.compliance.about-company') || request()->routeIs('backend.compliance.about-us-page') || request()->routeIs('backend.compliance.terms-conditions') ? 'show' : '' }}" data-bs-parent="#sidebar-nav">
        
        <li>
          <a href="{{ route('backend.compliance.about-company') }}" class="{{ request()->routeIs('backend.compliance.about-company') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>About Company</span>
          </a>
        </li>
        
        <li>
          <a href="{{ route('backend.compliance.about-us-page') }}" class="{{ request()->routeIs('backend.compliance.about-us-page') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>About Us</span>
          </a>
        </li>
        
        <li>
          <a href="{{ route('backend.compliance.terms-conditions') }}" class="{{ request()->routeIs('backend.compliance.terms-conditions') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Terms & Conditions</span>
          </a>
        </li>

        <li>
          <a href="{{ route('backend.compliance.business-registration') }}" class="{{ request()->routeIs('backend.compliance.business-registration') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Business Registration</span>
          </a>
        </li>
        <li>
          <a href="{{ route('backend.compliance.medical-certifications') }}" class="{{ request()->routeIs('backend.compliance.medical-certifications') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Medical Certifications</span>
          </a>
        </li>
        
        <li>
          <a href="{{ route('backend.compliance.return-refund-policy') }}" class="{{ request()->routeIs('backend.compliance.return-refund-policy') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Return & Refund Policy</span>
          </a>
        </li>
        
        <li>
          <a href="{{ route('backend.compliance.privacy-policy') }}" class="{{ request()->routeIs('backend.compliance.privacy-policy') ? 'active' : '' }}">
            <i class="fa fa-circle"></i><span>Privacy Policy</span>
          </a>
        </li>
      </ul>
    </li>

  </ul>

</aside>