<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Http\Resources\Admin\UserResource;
use Inertia\Response;
use App\Http\Requests\Admin\UserRequest;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use App\Models\Kelas;
use App\Traits\HasFile;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('roles')
            ->select(['nisn', 'nama', 'email', 'created_at'])
            ->filter (request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Users/Index', [
            'page_settings' => [
                'title' => 'Pengguna',
                'subtitle' => 'Kelola pengguna Anda di sini.',
            ],
            'users' => UserResource::collection($users)->additional([
                'meta' => [
                    'has_pages' => $users->hasPages(),
                ],
            ]),
            'state' => [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' => 10,
            ],
        ]);
    }

    public function create(Request $request, Kelas $kelas) :Response
    {   $kelas = Kelas::all();
        $role = $request->query('role', 'member');
        return inertia('Admin/Users/Create', [
            'kelas' => $kelas,
            'role' => $role,
            'page_settings' => [
                'title' => 'Tambah Pengguna',
                'subtitle' => 'Buat pengguna baru di sini.',
                'method' => 'POST',
                'action' => route('admin.users.store'),
            ],

        ]);
    }

    public function store (UserRequest $request): RedirectResponse
    {
        try{
            $user = User::create([
                'nisn' =>  $request->nisn,
                'nama' => $request->nama,
                'email' => $request->email,
                'kelas_id' => $request->kelas_id,
                'password' => Hash::make($request->password),
                
            ]);

            $user->assignRole($request->role);
            flashMessage(MessageType::CREATED->message('Pengguna'),
                'success'
            );
            return to_route('admin.users.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.users.index');
        }
    }

    public function edit(User $user, Request $request, Kelas $kelas):Response{
        $kelas = Kelas::all();
        $role = $user->getRoleNames()->first();
        return inertia('Admin/Users/Edit',[
            'kelas' => $kelas,
            'role' => $role,
            'page_settings' => [
                'title' => 'Edit Pengguna',
                'subtitle' => 'Perbarui informasi pengguna disini.',
                'action' => route('admin.users.update', $user, false),
                'method' => 'PUT',
            ],
            'user' => $user
        ]);
    }

    public function update(User $user, UserRequest $request): RedirectResponse
    {
        try{
            $user->update([
                'nisn' => $request->nisn,
                'nama' =>  $request->nama,
                'email' => $request->email,
                'kelas_id' => $request->kelas_id,
                'password' => Hash::make($request->password),
            ]);
            flashMessage(MessageType::UPDATED->message('Pengguna'),
                'success'
            );
            return to_route('admin.users.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()));
            return to_route('admin.users.index');
        }
    }
    public function destroy(User $user): RedirectResponse
    {
        try{
            $user->delete();
            flashMessage(MessageType::DELETED->message('Pengguna'),
                'success'
            );
            return to_route('admin.users.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.users.index');
        }
    }
}
