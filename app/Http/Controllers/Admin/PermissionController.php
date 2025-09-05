<?php

namespace App\Http\Controllers\Admin;

use App\Enums\MessageType;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\PermissionRequest;
use Illuminate\Http\Request;
use Inertia\Response;
use Spatie\Permission\Models\Permission;
use App\Http\Resources\Admin\PermissionResource;
use Illuminate\Http\RedirectResponse;

class PermissionController extends Controller
{
   public function index(): Response{
        $permissions = Permission::query()
            ->select(['id', 'name', 'guard_name', 'created_at', 'updated_at'])
            ->when(request()->search, function ($query, $search){
                $query->where('name', 'REGEXP', $search);
            })
            ->when(request()->field && request()->direction, fn($query) => $query->orderBy(request()->field, request()->direction))
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Permissions/Index', [
            'page_settings' => [
                'title' => 'Daftar Izin',
                'subtitle' => 'Kelola izin pengguna'
            ],
            'permissions' => PermissionResource::collection($permissions)->additional([
                'meta' => [
                    'has_pages' => $permissions->hasPages(),
                ],
            ]),
            'state' => [
                'page'=>request()->page ?? 1,
                'search' => request()->search ?? '',
               'load' => request()->load ?? 10,
                
            ]

        ]);
    }

    public function create(): Response
    {
        return inertia('Admin/Permissions/Create', [
            'page_settings' => [
                'title' => 'Buat Izin',
                'subtitle' => 'Tambahkan izin baru',
                'method' => 'POST',
                'action' => route('admin.permissions.store')
            ]
        ]);


    }

    public function store(PermissionRequest $request) : RedirectResponse
    {
       try {
         //dd($request->all());
           Permission::create([
               'name' => $request->name,
               'guard_name' => $request->guard_name,
           ]);

              flashMessage(MessageType::CREATED->message('Izin'),
                'success'
            );
              return to_route('admin.permissions.index');
       } catch (\Exception $e) {
           flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
           return to_route('admin.permissions.index');
       }
    }

    public function edit(Permission $permission) :Response
    {
        return inertia('Admin/Permissions/Edit', [
            'page_settings' => [
                'title' => 'Edit Izin',
                'subtitle' => 'Perbarui informasi izin',
                'method' => 'PUT',
                'action' => route('admin.permissions.update', $permission->id),
            ],

            'permission' => $permission
        ]);
    }

    public function update(PermissionRequest $request, Permission $permission) :RedirectResponse
    {
        try{
            $permission->update([
                'name' => $request->name,
                'guard_name' => $request->guard_name,
            ]);

            flashMessage(MessageType::UPDATED->message('Izin'),
                'success'
            );
            return to_route('admin.permissions.index');
        }catch(\Exception $e){
            flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
            return to_route('admin.permissions.index');
        }
    }
    public function destroy(Permission $permission) :RedirectResponse
    {
        try{
            $permission->delete();
            flashMessage(MessageType::DELETED->message('Izin'),
                'success'
            );
            return to_route('admin.permissions.index');
        }catch(\Exception $e){
            flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
            return to_route('admin.permissions.index');
        }
    }
}
