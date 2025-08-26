<?php

namespace App\Http\Controllers\Backend;

use App\CentralLogics\Helpers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderCancelReasons;
use App\Models\OrderDelivered;
use App\Models\OrderItem;
use App\Models\OrderItemCancel;
use App\Models\OrderPayment;
use App\Models\OrderShipped;
use App\Models\Product;
use App\Models\ShippingCarrier;
use Yajra\DataTables\DataTables;

class OrderController extends Controller
{
    private function getOrdersByStatus($status, Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $orders = Order::with(['customer', 'deliveryInformation.zone', 'deliveryInformation.city', 'deliveryInformation.province'])
                ->where('order_status', $status);

            return $dataTables->eloquent($orders)
                ->addIndexColumn()->addColumn('order_id', function($row) {
                    return '<a href="'.route('backend.orders.view', $row->id).'">#' . $row->order_id . '</a>';
                })
                ->addColumn('customer', fn($row) => $row->customer->full_name ?? '-')
                ->addColumn('shipping_address', function ($row) {
                    if (!$row->deliveryInformation) return '-';
                    return $row->deliveryInformation->zone->zone_name . ', ' .
                        $row->deliveryInformation->city->city . ', ' .
                        $row->deliveryInformation->province->province_name;
                })
                ->addColumn('total_items', fn($row) => $row->orderItems->count())
                ->addColumn('action', fn($row) => view('backend.orders.partials.actions', compact('row'))->render())
                ->editColumn('created_at', function($row) {
                    return $row->created_at ? $row->created_at->format('Y-m-d') : '-';
                })
                ->rawColumns(['order_id', 'action'])
                ->make(true);
        }

        return view('backend.orders.index', ['status' => $status]);
    }

    public function byStatus($status, Request $request, DataTables $dataTables)
    {
        $validStatuses = ['processing', 'shipped', 'delivered', 'cancelled', 'returned'];

        if (!in_array($status, $validStatuses)) {
            abort(404);
        }

        return $this->getOrdersByStatus($status, $request, $dataTables);
    }

    public function show($id)
    {
        $landing_data = Helpers::get_landing_data();
        $order_cancel_reasons = OrderCancelReasons::active()->where('reason_type', 'cancel')->where('reason_for', 'supplier')->get();
        $carriers = ShippingCarrier::active()->get();
        $order = Order::with('customer', 'deliveryInformation', 'orderItems.product', 'orderPayment')
            ->findOrFail($id);

        return view('backend.orders.view', compact('order', 'landing_data', 'order_cancel_reasons', 'carriers'));
    }
            
    public function changestatus(Request $request)
    {
        $order = Order::where('order_id', $request->order_id)->first();
        if ($order) {
            if ($request->order_status == 'cancelled') {
                $cancel = new OrderItemCancel();
                $cancel->order_id = $request->order_id;
                $cancel->cancel_reason = $request->cancellation_reason;
                $cancel->reason_description = $request->cancellation_notes;
                $cancel->cancelled_by = 'supplier';
                $cancel->save();
                
                // Restore stock
                $orderItems = OrderItem::where('order_id', $order->order_id)->get();
                foreach ($orderItems as $item) {
                    $product = Product::where('product_code', $item->product_code)->first();
                    if ($product) {
                        $product->available_quantity += $item->quantity;
                        $product->stock_quantity += $item->quantity;
                        $product->save();
                    }
                }
            } else if ($request->order_status == 'delivered') {
                $delivered = new OrderDelivered();
                $delivered->order_id = $request->order_id;
                $delivered->delivery_date = $request->delivered_at;
                $delivered->received_by = $request->received_by;
                $delivered->save();
            } else if ($request->order_status == 'shipped') {
                $shipped = new OrderShipped();
                $shipped->order_id = $request->order_id;
                $shipped->tracking_number = $request->order_id;
                $shipped->shipping_carrier = $request->shipping_carrier;
                $shipped->estimated_delivery_date = $request->estimated_delivery_date;
                $shipped->save();
            }

            if ($request->payment_status == 'paid') {
                $payment = new OrderPayment();
                $payment->order_id = $request->order_id;
                $payment->payment_mode = $request->payment_mode;
                $payment->transactionId = $request->transactionId;
                $payment->referenceId = $request->referenceId;
                $payment->paid_amount = $request->paid_amount;
                $payment->due_amount = $request->total_amount - $request->paid_amount;
                $payment->save();
            }

            $order->order_status = $request->order_status;
            $order->payment_status = $request->payment_status;
            if ($order->save()) {
                session()->flash('success', 'Status Changed Successfully !');
            } else {
                session()->flash('error', 'Error occured while changing status!');
            }
        } else {
            session()->flash('error', 'Order not found!');
        }
        return redirect()->back();
    }

    public function cleardues(Request $request)
    {
        $order = Order::where('order_id', $request->order_id)->first();
        if ($order) {
            if ($request->clearing_dues == 'clearing_dues') {
                $due = OrderPayment::where('order_id', $request->order_id)->first();
                $due->paid_amount = $due->paid_amount + $due->due_amount;
                $due->due_amount = 0;
                if ($due->save()) {
                    session()->flash('success', 'Dues cleared Successfully !');
                } else {
                    session()->flash('error', 'Error occured while clearing dues!');
                }
            }
        }
    }

}
