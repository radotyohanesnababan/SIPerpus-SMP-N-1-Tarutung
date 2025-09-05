<?php

namespace App\Http\Controllers\Admin;

use App\Enums\MessageType;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\RoleRequest;
use Illuminate\Http\Request;
use Inertia\Response;
use Spatie\Permission\Models\Role;
use App\Http\Resources\Admin\RoleResource;
use Illuminate\Http\RedirectResponse;

class RoleController extends Controller
{
    public function index(): Response{
        $roles = Role::query()
            ->select(['id', 'name', 'guard_name', 'created_at', 'updated_at'])
            ->when(request()->search, function ($query, $search){
                $query->whereAny([
                    'name',
                    'guard_name'
                ], 'REGEXP', $search);
            })
            ->when(request()->field && request()->direction, fn($query) => $query->orderBy(request()->field, request()->direction))
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Roles/Index', [
            'page_settings' => [
                'title' => 'Daftar Peran',
                'subtitle' => 'Kelola peran pengguna'
            ],
            'roles' => RoleResource::collection($roles)->additional([
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

    public function create(): Response
    {
        return inertia('Admin/Roles/Create', [
            'page_settings' => [
                'title' => 'Buat Peran',
                'subtitle' => 'Tambahkan peran baru',
                'method' => 'POST',
                'action' => route('admin.roles.store')
            ]
        ]);


    }

    public function store(RoleRequest $request) : RedirectResponse
    {
       try {
         //dd($request->all());
           Role::create([
               'name' => $request->name,
               'guard_name' => $request->guard_name,
           ]);

              flashMessage(MessageType::CREATED->message('Kategori'),
                'success'
            );
              return to_route('admin.roles.index');
       } catch (\Exception $e) {
           flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
           return to_route('admin.roles.index');
       }
    }

    public function edit(Role $role) :Response
    {
        return inertia('Admin/Roles/Edit', [
            'page_settings' => [
                'title' => 'Edit Peran',
                'subtitle' => 'Perbarui informasi peran',
                'method' => 'PUT',
                'action' => route('admin.roles.update', $role->id),
            ],

            'role' => $role
        ]);
    }

    public function update(RoleRequest $request, Role $role) :RedirectResponse
    {
        try{
            $role->update([
                'name' => $request->name,
                'guard_name' => $request->guard_name,
            ]);

            flashMessage(MessageType::UPDATED->message('Peran'),
                'success'
            );
            return to_route('admin.roles.index');
        }catch(\Exception $e){
            flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
            return to_route('admin.roles.index');
        }
    }
    public function destroy(Role $role) :RedirectResponse
    {
        try{
            $role->delete();
            flashMessage(MessageType::DELETED->message('Peran'),
                'success'
            );
            return to_route('admin.roles.index');
        }catch(\Exception $e){
            flashMessage(MessageType::ERROR, 'Terjadi kesalahan: ' . $e->getMessage());
            return to_route('admin.roles.index');
        }
    }

    
}
