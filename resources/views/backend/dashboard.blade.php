@extends('backend.layout.master')
@section('content')

<div class="pagetitle">
      <h1>Dashboard</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item">
            <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
              <span>Home</span>
            </a>
          </li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
    
    <section class="section dashboard">
      <div class="row">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- products Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">Products</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-product-hunt"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $product_count }}</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End products Card -->

            <!-- categories Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">Categories</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-list-alt"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $category_count }}</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End categories Card -->

            <!-- brand Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">Brands</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-font-awesome"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $brand_count }}</h6>
                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End brands Card -->

            <!-- customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">Customers</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-users"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $customer_count }}</h6>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End customers Card -->

            <!-- orders Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

                <div class="card-body">
                  <h5 class="card-title">Orders </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-shopping-cart"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $order_count }}</h6>
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End orders Card -->


            <!-- inquiries Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card revenue-card">

                <div class="card-body">
                  <h5 class="card-title">Inquiries </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-inbox"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $inquiry_count }}</h6>
                      
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End inquiries Card -->
            
            <!-- Offer subscribers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card revenue-card">

                <div class="card-body">
                  <h5 class="card-title">Subscribers </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-bell"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $newsletter_count }}</h6>
                      
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End subscribers Card -->
            
            <!-- System Users Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card revenue-card">

                <div class="card-body">
                  <h5 class="card-title">System Users </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-user-circle"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $user_count }}</h6>
                      
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End System users Card -->
            
            <!-- Reviews Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card revenue-card">

                <div class="card-body">
                  <h5 class="card-title">Reviews </h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="fa fa-star"></i>
                    </div>
                    <div class="ps-3">
                      <h6>{{ $reviews_count }}</h6>
                      
                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Reviews Card -->
            
          </div>
        </div><!-- End Left side columns -->

        <!-- Right side columns -->
        <div class="col-lg-4">
            
          <!-- Recent Orders Data -->
          <div class="card">
            <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center py-3">
                <h6 class="mb-0 fw-semibold">
                    <i class="bi bi-hourglass-top me-2 text-success"></i>Processing ({{ $processing_order_count }})
                </h6>
                <a href="{{ route('backend.orders.byStatus', ['status' => 'processing']) }}" class="btn btn-sm btn-outline-secondary">View All</a>
            </div>
            
            <div class="card-body p-0">
                <div class="list-group list-group-flush">
                    @foreach($orders as $order)
                    <div class="list-group-item border-0 py-2 px-3 position-relative">
                        @if(!$loop->first)
                          <div class="divider"></div>
                        @endif
                        <div class="d-flex justify-content-between align-items-start mb-1">
                            <a href="{{ route('backend.orders.view', $order->id) }}" class="fw-semibold text-dark">#{{ $order->order_id }}</a>
                            <span class="badge bg-success text-white small">{{ ucfirst($order->order_status) }}</span>
                        </div>
                        
                        <div class="d-flex justify-content-between small text-muted mb-1">
                            <span><i class="bi bi-box-seam me-1"></i> {{ $order->total_items }} items</span>
                            <span>{{ number_format($order->total_amount, 2) }}</span>
                        </div>
                        
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="text-truncate small" style="max-width: 120px;">
                                <i class="bi bi-person me-1"></i> {{ $order->customer->full_name ?? 'Guest' }}
                            </div>
                            <div class="text-muted small">
                                {{ $order->created_at->format('Y-m-d h:i A') }}
                            </div>
                        </div>
                    </div>
                    @endforeach
                    
                    @if($orders->isEmpty())
                    <div class="text-center py-4">
                        <i class="bi bi-check-circle text-success" style="font-size: 1.5rem;"></i>
                        <p class="small text-muted mt-2 mb-0">No processing orders</p>
                    </div>
                    @endif
                </div>
            </div>
          </div>

<style>
    .list-group-item {
        border-left: 3px solid transparent;
        transition: all 0.2s;
    }
    .list-group-item:hover {
        border-left-color: var(--bs-warning);
        background-color: #f8f9fa;
    }
    .badge {
        font-size: 0.7em;
        font-weight: 500;
        padding: 0.25em 0.4em;
    }
      .divider {
        position: absolute;
        top: 0;
        left: 1rem;
        right: 1rem;
        height: 1px;
        background-color: rgba(0,0,0,0.05);
    }
</style>

          <!-- Visual Data -->
          <div class="card">

            <div class="card-body pb-0">
              <h5 class="card-title">Visual Data of Orders </h5>

              <div id="visualdataChart" style="min-height: 400px;" class="echart"></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                  echarts.init(document.querySelector("#visualdataChart")).setOption({
                    tooltip: {
                      trigger: 'item'
                    },
                    legend: {
                      top: '5%',
                      left: 'center'
                    },
                    series: [{
                      name: 'Total',
                      type: 'pie',
                      radius: ['40%', '70%'],
                      avoidLabelOverlap: false,
                      label: {
                        show: false,
                        position: 'center'
                      },
                      emphasis: {
                        label: {
                          show: true,
                          fontSize: '18',
                          fontWeight: 'bold'
                        }
                      },
                      labelLine: {
                        show: false
                      },
                      data: [{
                          value: {{ $processing_order_count }},
                          name: 'Processing'
                        },
                        {
                          value: {{ $shipped_order_count }},
                          name: 'Shipped'
                        },
                        {
                          value: {{ $delivered_order_count }},
                          name: 'Delivered'
                        },
                        {
                          value: {{ $cancelled_order_count }},
                          name: 'Cancelled'
                        }
                      ]
                    }]
                  });
                });
              </script>

            </div>
          </div><!-- End Visual Data -->
          
        </div><!-- End Right side columns -->

      </div>
      </section>

@endsection