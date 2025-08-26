@extends('backend.layout.master')
@section('content')

<style>
  .breadcrumb {
    padding: 0;
    margin: 0;
    list-style: none;
    display: flex;
    flex-wrap: wrap;
  }

  .breadcrumb-item {
    margin-right: 5px;
  }

  .breadcrumb-item + .breadcrumb-item:before {
    content: " / ";
  }

  .status-badge {
    font-size: 0.9rem;
    padding: 0.35rem 0.65rem;
    border-radius: 0.25rem;
    text-transform: capitalize;
  }

  .badge-processing {
    background-color: #ffc107;
    color: #212529;
  }

  .badge-shipped {
    background-color: #0dcaf0;
    color: #212529;
  }

  .badge-delivered {
    background-color: #198754;
    color: white;
  }

  .badge-cancelled {
    background-color: #dc3545;
    color: white;
  }

  .badge-paid {
    background-color: #198754;
    color: white;
  }

  .badge-unpaid {
    background-color: #dc3545;
    color: white;
  }

  .info-card {
    border-left: 4px solid #0d6efd;
    border-radius: 0.25rem;
    margin-bottom: 1.5rem;
    box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
  }

  .info-card-header {
    background-color: #f8f9fa;
    padding: 0.75rem 1.25rem;
    border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    font-weight: 600;
  }

  .info-card-body {
    padding: 1.25rem;
  }

  .info-row {
    margin-bottom: 0.75rem;
  }

  .info-label {
    font-weight: 600;
    color: #495057;
  }

  .print-only {
    display: none;
  }

  @media print {
    body * {
      visibility: hidden;
    }
    .print-section, .print-section * {
      visibility: visible;
    }
    .print-section {
      position: absolute;
      left: 0;
      top: 0;
      width: 100%;
    }
    .no-print {
      display: none !important;
    }
    .print-only {
      display: block;
    }
    .info-card {
      box-shadow: none;
      border: 1px solid #dee2e6;
    }
    .table {
      border-collapse: collapse;
      width: 100%;
    }
    .table th, .table td {
      border: 1px solid #dee2e6;
      padding: 0.5rem;
    }
  }
</style>

<div class="pagetitle">
  <h1>Order Details</h1>
  <nav>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a class="nav-link" style="border:none" href="{{ route('backend.dashboard') }}">
          <i class="fa fa-dashboard"></i><span> Dashboard</span>
        </a>
      </li>
      <li class="breadcrumb-item active">Order Details</li>
    </ol>
  </nav>
</div><!-- End Page Title --> 

<div class="card shadow mb-4 print-section">
  <div class="card-header py-3 d-flex justify-content-between align-items-center no-print">
    <h4 class="card-title mb-0">Order #{{ $order->order_id }}</h4>
    <div>
      <button onclick="window.print()" class="btn btn-secondary me-2">
        <i class="fa fa-print me-1"></i> Print Invoice
      </button>
      <a href="{{ route('backend.orders.byStatus', ['status' => $order->order_status]) }}" class="btn btn-outline-primary">
        <i class="fa fa-arrow-left me-1"></i> Back to Orders
      </a>
    </div>
  </div>

  <div class="card-body">
    <!-- Print Header (only visible when printing) -->
    <div class="print-only mb-4 text-center">
      <h2>{{ $landing_data['company_name'] }}</h2>
      <p class="mb-1">Order Invoice</p>
      <p class="text-muted">Generated on: {{ now()->format('d M Y H:i:s') }}</p>
    </div>

    </br>
    <!-- Status and Action Bar -->
    <div class="row mb-4 no-print">
      <div class="col-md-6">
        <div class="d-flex align-items-center">
          <div class="me-3">
            <strong>Order Status:</strong>
            <span class="status-badge badge-{{ $order->order_status }} ms-2">
              {{ ucfirst($order->order_status) }}
            </span>
          </div>
          <div>
            <strong>Payment Status:</strong>
            <span class="status-badge badge-{{ $order->payment_status }} ms-2">
              {{ ucfirst($order->payment_status) }}
            </span>
            @if ($order->orderPayment && $order->orderPayment->due_amount > 0)
              <span class="status-badge ms-2" style="background-color:#fd7e14; color:white;">
                Due Remaining
              </span>
            @endif
          </div>
        </div>
      </div>
      
      @if (!in_array($order->order_status, ['delivered', 'cancelled']))
      <div class="col-md-6">
        <form method="post" action="{{ route('backend.orders.changestatus') }}" class="row g-2">
          @csrf
          <input type="hidden" value="{{ $order->order_id }}" name="order_id">

          <div class="col-md-5">
            <select id="orderStatus" class="form-select" name="order_status" onchange="showStatusFields(this.value)">
              <option value="processing" {{ $order->order_status == 'processing' ? 'selected' : '' }}>Processing</option>
              <option value="shipped" {{ $order->order_status == 'shipped' ? 'selected' : '' }}>Shipped</option>
              <option value="delivered" {{ $order->order_status == 'delivered' ? 'selected' : '' }}>Delivered</option>
              <option value="cancelled" {{ $order->order_status == 'cancelled' ? 'selected' : '' }}>Cancelled</option>
            </select>
          </div>

          <div class="col-md-5">
            <select id="paymentStatus" class="form-select" name="payment_status">
              <option value="paid" {{ $order->payment_status == 'paid' ? 'selected' : '' }}>Paid</option>
              <option value="unpaid" {{ $order->payment_status == 'unpaid' ? 'selected' : '' }}>Unpaid</option>
            </select>
          </div>

          <!-- Dynamic Status Fields -->
          <div id="statusFieldsContainer" class="mt-3">
            <!-- Shipped Fields -->
            <div id="shippedFields" class="status-fields" style="display:none">
              <div class="mb-3">
                <label class="form-label">Shipping Carrier</label>
                <select class="form-select" name="shipping_carrier">
                  <option value="" selected disabled>Select Carrier</option>
                  @foreach ($carriers as $carrier)
                    <option value="{{ $carrier->id }}">{{ $carrier->name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label">Estimated Delivery Date</label>
                <input type="date" class="form-control" name="estimated_delivery_date">
              </div>
            </div>

            <!-- Delivered Fields -->
            <div id="deliveredFields" class="status-fields" style="display:none">
              <div class="mb-3">
                <label class="form-label">Delivery Date</label>
                <input type="datetime-local" class="form-control" name="delivered_at" 
                      value="{{ now()->format('Y-m-d\TH:i') }}">
              </div>
              <div class="mb-3">
                <label class="form-label">Received By</label>
                <input type="text" class="form-control" name="received_by" 
                      placeholder="Person who received the package">
              </div>
            </div>

            <!-- Cancelled Fields -->
            <div id="cancelledFields" class="status-fields" style="display:none">
              <div class="mb-3">
                <label class="form-label">Cancellation Reason</label>
                <select class="form-select" name="cancellation_reason">
                  <option value="" selected disabled>Select Cancel Reason</option>
                  @foreach ($order_cancel_reasons as $order_cancel_reason)
                    <option value="{{ $order_cancel_reason->id }}">{{ $order_cancel_reason->reason_name }}</option>
                  @endforeach
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label">Additional Notes</label>
                <textarea class="form-control" name="cancellation_notes"></textarea>
              </div>
            </div>
            <!-- Paid Fields -->
            <div id="paidFields" style="display:none">
              <input type="hidden" value="{{ $order->total_amount }}" name="total_amount">
              <div class="mb-3">
                <label class="form-label">Payment Mode</label>
                <select class="form-select" name="payment_mode">
                  <option value="" disabled selected>Select Payment Mode</option>
                  <option value="C">Cash On Delivery</option>
                  <option value="E">eSewa</option>
                  <option value="NP">Nepal Pay</option>
                </select>
              </div>
              <div class="mb-3">
                <label class="form-label">Paid Amount</label>
                <input type="number" step="0.01" name="paid_amount" class="form-control" placeholder="Enter Paid Amount">
              </div>
              <div class="mb-3">
                <label class="form-label">Transaction ID</label>
                <input type="text" name="transactionId" class="form-control" placeholder="Enter Transaction ID">
              </div>
              <div class="mb-3">
                <label class="form-label">Reference ID</label>
                <input type="text" name="referenceId" class="form-control" placeholder="Enter Reference ID (if any)">
              </div>
            </div>

          </div>

          <div class="col-md-2">
            <button type="submit" class="btn btn-primary w-100">Update</button>
          </div>
        </form>
      </div>

      @endif

      @if ($order->orderPayment && $order->orderPayment->due_amount > 0)
        <div class="col-md-6">
          <form method="post" action="{{ route('backend.orders.cleardues') }}" class="row g-2">
            @csrf
            <input type="hidden" value="{{ $order->order_id }}" name="order_id">
            <input type="hidden" value="clearing_dues" name="clearing_dues">
            
            <div class="col-md-5">
              <button type="Submit" class="btn btn-primary">Clear Dues</button>
            </div>
          </form>
        </div>
      @endif
    </div>

    <div class="row">
      <!-- Order Information -->
      <div class="col-md-4">
        <div class="info-card">
          <div class="info-card-header">
            <i class="fa fa-shopping-cart me-2"></i>Order Information
          </div>
          <div class="info-card-body">
            <div class="info-row">
              <span class="info-label">Order ID:</span>
              <span>{{ $order->order_id }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Order Date:</span>
              <span>{{ $order->created_at->format('d M Y H:i:s') }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Order Status:</span>
              <span class="status-badge badge-{{ $order->order_status }}">
                {{ ucfirst($order->order_status) }}
              </span>
            </div>
            <div class="info-row">
              <span class="info-label">Payment Status:</span>
              <span class="status-badge badge-{{ $order->payment_status }}">
                {{ ucfirst($order->payment_status) }}
              </span>
              
              @if ($order->orderPayment && $order->orderPayment->due_amount > 0)
                <span class="status-badge ms-2" style="background-color:#fd7e14; color:white;">
                  Due Remaining
                </span>
              @endif
            </div>
            @if($order->order_status == 'shipped')
            <div class="info-row">
              <span class="info-label">Tracking Number:</span>
              <span>{{ $order->tracking_number ?? 'Not provided' }}</span>
            </div>
            @endif
            @if($order->order_status == 'delivered')
            <div class="info-row">
              <span class="info-label">Delivery Date:</span>
              <span>{{ $order->delivered_at ? $order->delivered_at->format('d M Y H:i:s') : 'Not recorded' }}</span>
            </div>
            @endif
            @if($order->order_status == 'cancelled')
            <div class="info-row">
              <span class="info-label">Cancellation Reason:</span>
              <span>{{ $order->cancellation_reason ?? 'Not specified' }}</span>
            </div>
            @endif
          </div>
        </div>
      </div>

      <!-- Customer Information -->
      <div class="col-md-4">
        <div class="info-card">
          <div class="info-card-header">
            <i class="fa fa-user me-2"></i>Customer Information
          </div>
          <div class="info-card-body">
            <div class="info-row">
              <span class="info-label">Name:</span>
              <span>{{ $order->customer->full_name }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Email:</span>
              <span>{{ $order->customer->email }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Phone:</span>
              <span>{{ $order->customer->phone }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Customer Since:</span>
              <span>{{ $order->customer->created_at->format('d M Y') }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Total Orders:</span>
              <span>{{ $order->total_items }}</span>
            </div>
          </div>
        </div>
      </div>
      
      <!-- Shipping Address -->
      <div class="col-md-4">
        <div class="info-card">
          <div class="info-card-header">
            <i class="fa fa-truck me-2"></i>Shipping Information
          </div>
          <div class="info-card-body">
            <div class="info-row">
              <span class="info-label">Shipping Method:</span>
              <span>{{ $order->shipping_method ?? 'Standard Shipping' }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Province:</span>
              <span>{{ $order->deliveryInformation->province->province_name }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">City:</span>
              <span>{{ $order->deliveryInformation->city->city }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Zone:</span>
              <span>{{ $order->deliveryInformation->zone->zone_name }}</span>
            </div>
            <div class="info-row">
              <span class="info-label">Street Address:</span>
              <span>{{ $order->deliveryInformation->address }}</span>
            </div>
            @if($order->delivery_notes)
            <div class="info-row">
              <span class="info-label">Delivery Notes:</span>
              <span>{{ $order->delivery_notes }}</span>
            </div>
            @endif
          </div>
        </div>
      </div>
    </div>

    <!-- Order Items -->
    <div class="info-card mt-4">
      <div class="info-card-header">
        <i class="fa fa-list me-2"></i>Order Items
      </div>
      <div class="info-card-body p-0">
        <div class="table-responsive">
          <table class="table table-bordered mb-0">
            <thead class="table-light">
              <tr>
                <th width="5%">#</th>
                <th width="45%">Product</th>
                <th width="10%" class="text-center">Qty</th>
                <th width="20%" class="text-end">Unit Price</th>
                <th width="20%" class="text-end">Subtotal</th>
              </tr>
            </thead>
            <tbody>
              @foreach($order->orderItems as $item)
              <tr>
                <td>{{ $loop->iteration }}</td>
                <td>
                  {{ $item->product->product_name }}
                  @if($item->product->sku)
                    <br><small class="text-muted">SKU: {{ $item->product->sku }}</small>
                  @endif
                </td>
                <td class="text-center">{{ $item->quantity }}</td>
                <td class="text-end">{{ number_format($item->actual_price, 2) }}</td>
                <td class="text-end">{{ number_format($item->subtotal_without_tax, 2) }}</td>
              </tr>
              @endforeach
            </tbody>
            <tfoot>
              <tr>
                <td colspan="4" class="text-end"><strong>Subtotal:</strong></td>
                <td class="text-end">{{ number_format($order->subtotal_without_tax, 2) }}</td>
              </tr>
              <tr>
                <td colspan="4" class="text-end"><strong>Tax (13%):</strong></td>
                <td class="text-end">{{ number_format($order->tax, 2) }}</td>
              </tr>
              @if($order->discount > 0)
              <tr>
                <td colspan="4" class="text-end"><strong>Discount:</strong></td>
                <td class="text-end">{{ number_format($order->discount, 2) }}</td>
              </tr>
              @endif
              <tr>
                <td colspan="4" class="text-end"><strong>Shipping Cost:</strong></td>
                <td class="text-end">{{ number_format($order->shipping_cost, 2) }}</td>
              </tr>
              <tr>
                <td colspan="4" class="text-end"><strong>Total Amount:</strong></td>
                <td class="text-end"><strong>{{ number_format($order->total_amount, 2) }}</strong></td>
              </tr>
              @if($order->payment_status == 'paid')
              <tr>
                <td colspan="4" class="text-end"><strong>Amount Paid:</strong></td>
                <td class="text-end">{{ number_format($order->orderPayment?->paid_amount ?? 0, 2) }}</td>
              </tr>
              
              <tr>
                <td colspan="4" class="text-end"><strong>Due Amount:</strong></td>
                <td class="text-end">{{ number_format($order->orderPayment?->due_amount ?? 0, 2) }}</td>
              </tr>

              <tr>
                <td colspan="4" class="text-end"><strong>Payment Method:</strong></td>
                <td class="text-end">{{ ucfirst($order->orderPayment?->payment_mode ?? 'Not Available') }}</td>
              </tr>
              @endif
            </tfoot>
          </table>
        </div>
      </div>
    </div>

    <!-- Additional Information -->
    @if($order->notes || $order->customer_notes)
    <div class="info-card mt-4">
      <div class="info-card-header">
        <i class="fas fa-info-circle me-2"></i>Additional Information
      </div>
      <div class="info-card-body">
        @if($order->notes)
        <div class="info-row">
          <span class="info-label">Admin Notes:</span>
          <span>{{ $order->notes }}</span>
        </div>
        @endif
        @if($order->customer_notes)
        <div class="info-row">
          <span class="info-label">Customer Notes:</span>
          <span>{{ $order->customer_notes }}</span>
        </div>
        @endif
      </div>
    </div>
    @endif
  </div>
</div>

@endsection

<script>
  function showStatusFields(status = null, paymentStatus = null) {
    // Hide all status fields first
    document.querySelectorAll('.status-fields').forEach(el => {
      el.style.display = 'none';
    });
    
    // Show relevant order status fields
    if(status === 'shipped') {
      document.getElementById('shippedFields').style.display = 'block';
    } else if(status === 'delivered') {
      document.getElementById('deliveredFields').style.display = 'block';
    } else if(status === 'cancelled') {
      document.getElementById('cancelledFields').style.display = 'block';
    }
    
    // Handle payment status fields separately
    const paidFields = document.getElementById('paidFields');
    if (paymentStatus === 'paid') {
      paidFields.style.display = 'block';
    } else {
      paidFields.style.display = 'none';
    }
  }

  // Initialize fields if coming from form submission with errors
  document.addEventListener('DOMContentLoaded', function() {
    const currentStatus = document.getElementById('orderStatus').value;
    const currentPayment = document.getElementById('paymentStatus').value;
    showStatusFields(currentStatus, currentPayment);
    
    // Add event listener for payment status change
    document.getElementById('paymentStatus').addEventListener('change', function() {
      const orderStatus = document.getElementById('orderStatus').value;
      showStatusFields(orderStatus, this.value);
    });
    
    // Existing order status change listener
    document.getElementById('orderStatus').addEventListener('change', function() {
      const paymentStatus = document.getElementById('paymentStatus').value;
      showStatusFields(this.value, paymentStatus);
    });
  });
</script>
