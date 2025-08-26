<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\AdminRole;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;

class UserController extends Controller
{
    public function index(Request $request, DataTables $dataTables)
    {
        if ($request->ajax()) {
            $data = Admin::select('admins.*');
            return $dataTables->eloquent($data)
                ->addIndexColumn()
                ->editColumn('role_id', function($row) {
               return $row->role ? $row->role->name : 'N/A';
               })
                ->addColumn('action', function($row) {
                    $view = route('backend.users.view');
                    $edit = route('backend.users.edit');
                    $delete = route('backend.users.delete', $row->id);
                    return view('backend.users.partials.actions', compact('row', 'view', 'edit', 'delete'))->render();
                })
                ->rawColumns(['action'])
                ->make(true);
        }
         return view('backend.users.index');
    }

    public function add()
    {
        $roles = AdminRole::all();
        return view('backend.users.add', compact('roles'));
    }

    public function store(Request $request)
{
    // Validate the incoming request
    $request->validate([
        'name' => 'required|string|max:100',
        'email' => 'required|email|unique:admins,email',
        'phone' => 'required|string|max:20',
        'address' => 'required|string|max:255',
        'country' => 'required|string|max:100',
        'role_id' => 'required|exists:admin_roles,id', // Make sure role exists
        'password' => 'required|string|min:8', // Optional: password confirmation
    ]);

    // Create new admin user
    $user = new Admin();
    $user->name = $request->name;
    $user->email = $request->email;
    $user->phone = $request->phone;
    $user->address = $request->address;
    $user->country = $request->country;
    $user->role_id = $request->role_id; // Store role_id
    $user->password = Hash::make($request->password);

    if ($user->save()) {
        session()->flash('success', 'System User Added Successfully!');
    } else {
        session()->flash('error', 'Error occurred while adding system user!');
    }

    return redirect()->route('backend.users.index');
}

    public function view(Request $request)
    {
        $user = Admin::findOrFail($request->id);
        return view('backend.users.view', compact('user'));
    }

    public function edit(Request $request)
    {
        $user = Admin::findOrFail($request->id);
        $roles = AdminRole::all();
        return view('backend.users.edit', compact('user','roles'));
    }

    public function update(Request $request, $id)
    {
        $user = Admin::findOrFail($id);
        // $user->update($request->all());
        $user->update($request->except(['_token', '_method']));
        return redirect()->route('backend.users.index')->with('success', 'System User Details updated successfully');
    }

    public function delete($id)
    {
        $user = Admin::findOrFail($id);
        $user->delete();
        return redirect()->route('backend.users.index')->with('success', 'System User deleted successfully');
    }

}
