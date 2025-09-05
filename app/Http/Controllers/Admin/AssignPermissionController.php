<?php

namespace App\Http\Controllers\Admin;

use App\Enums\MessageType;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AssignPermissionRequest;
use App\Http\Resources\Admin\AssignPermissionResource;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Inertia\Response;
use Spatie\Permission\Models\Permission;
use Throwable;

class AssignPermissionController extends Controller
{
    public function index(): Response{
        $roles = Role::query()
            ->select(['id', 'name', 'guard_name', 'created_at', 'updated_at'])
            ->when(request()->search, function ($query, $search){
                $query->where([
                    'name',
                ], 'REGEXP', $search);
            })
            ->when(request()->field && request()->direction, fn($query) => $query->orderBy(request()->field, request()->direction))
            ->with('permissions')
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/AssignPermissions/Index', [
            'page_settings' => [
                'title' => 'Tetapkan Izin',
                'subtitle' => 'Sinkronisasi Izin dan Peran disini'
            ],
            'roles' => AssignPermissionResource::collection($roles)->additional([
                'meta' => [
                    'has_pages' => $roles->hasPages(),
                ],
            ]),
            'state' => [
                'page'=>request()->page ?? 1,
                'search' => request()->search ?? '',
               'load' => request()->load ?? 10,
                
            ]

        ]);
    }

    public function edit(Role $role): Response
    {
        return inertia('Admin/AssignPermissions/Edit', [
            'page_settings' => [
                'title' => 'Edit Peran',
                'subtitle' => 'Perbarui data peran',
                'method' => 'PUT',
                'action' => route('admin.assign-permissions.update', $role)
            ],
            'role' => $role->load('permissions'),
            'permissions'=> Permission::query()
                ->select(['id', 'name'])->where('guard_name', 'web')
                ->get()->map(fn($item) => [
                    'value' => $item->id,
                    'label' => $item->name
                ])
        ]);
    }

    public function update(Role $role, AssignPermissionRequest $request): RedirectResponse
    {
       try{
            $role->syncPermissions($request->permissions);
            flashMessage(MessageType::UPDATED->message('Izin, Izin Tersinkronisasi!'),
                'success'
            );
            return to_route('admin.assign-permissions.index');

       }
         catch (Throwable $e){
             flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage(), 'error');
                return to_route('admin.assign-permissions.index');
         }
    }
}
