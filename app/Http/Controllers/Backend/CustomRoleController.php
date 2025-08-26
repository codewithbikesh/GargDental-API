<?php

namespace App\Http\Controllers\Backend;

use App\Models\AdminRole;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CustomRoleController extends Controller
{
    // List all roles except the super admin (id=1)
    public function list()
    {
        $rl = AdminRole::whereNotIn('id', [1])
            ->latest()
            ->paginate(config('default_pagination'));

        return view('backend.custom-role.list', compact('rl'));
    }

    // Store a new role
    public function store(Request $request)
    {
        // Validate input
        $request->validate([
            'name' => 'required|unique:admin_roles|max:191',
            'modules' => 'required|array|min:1'
        ], [
            'name.required' => 'Group name is required!',
            'modules.required' => 'Please select at least one module'
        ]);

        // Create new role
        $role = new AdminRole();
        $role->name = $request->name;
        $role->modules = json_encode($request->modules); // Store modules as JSON
        $role->status = 1;
        $role->save();

        // Redirect back with plain text alert
        return back()->with('alert', 'User group added successfully!');
    }

    // Edit a role
    public function edit($id)
    {
        if ($id == 1) {
            return view('errors.404');
        }

        $role = AdminRole::withoutGlobalScope('translate')
            ->with('translations')
            ->where('id', $id)
            ->first(['id', 'name', 'modules']);

        if (!$role) {
            return redirect()->route('backend.custom-role.list')
                ->with('alert', 'Role not found!');
        }

        return view('backend.custom-role.edit', compact('role'));
    }

    // Update an existing role
    public function update(Request $request, $id)
    {
        if ($id == 1) {
            return view('errors.404');
        }

        $request->validate([
            'modules' => 'required|array|min:1'
        ], [
            'modules.required' => 'Please select at least one module'
        ]);

        $role = AdminRole::find($id);

        if (!$role) {
            return redirect()->route('backend.custom-role.list')
                ->with('alert', 'Role not found!');
        }

        $role->modules = json_encode($request->modules); // Store modules as JSON
        $role->status = 1;
        $role->save();

        return redirect()->route('backend.custom-role.list')
            ->with('alert', 'Role updated successfully!');
    }

    // Search roles by name
    public function search(Request $request)
    {
        $key = explode(' ', $request->search);

        $rl = AdminRole::where('id', '!=', 1)
            ->where(function ($q) use ($key) {
                foreach ($key as $value) {
                    $q->orWhere('name', 'like', "%{$value}%");
                }
            })
            ->latest()
            ->limit(50)
            ->get();

        return response()->json([
            'view' => view('backend.custom-role.partials._table', compact('rl'))->render(),
            'count' => $rl->count()
        ]);
    }
}
