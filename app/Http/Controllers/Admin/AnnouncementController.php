<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AnnouncementRequest;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Http\Resources\Admin\AnnouncementResource;
use App\Models\Announcement;
use Illuminate\Http\RedirectResponse;
use App\Enums\MessageType;
use Throwable;

class AnnouncementController extends Controller
{
    public function index(): Response
    {
        $announcements = Announcement::query()
            ->select(['id','title','content', 'is_active','created_at'])
            ->paginate(10)
            ->withQueryString();

        return inertia('Admin/Announcements/Index', [
            'page_settings'=>[
                'title' => 'Pengumuman',
                'subtitle' => 'Daftar Pengumuman',
            ],
            'announcements' => AnnouncementResource::collection($announcements)->additional([
                'meta' => [
                    'has_pages' => $announcements->hasPages(),
                ]
            ]),

        ]);
    }

    public function create(): Response
    {
        return inertia('Admin/Announcements/Create', [
            'page_settings'=>[
                'title' => 'Buat Pengumuman',
                'subtitle' => 'Formulir untuk membuat pengumuman baru',
                'method' => 'POST',
                'action' => route('admin.announcements.store'),
            ],
        ]);
    }

    public function store(AnnouncementRequest $request): RedirectResponse
    {
        try{
            if($request->is_active) {
                Announcement::where('is_active', true)->update(['is_active' => false]);
                
            }
            Announcement::create([
                    'title' => $request->title,
                    'content' => $request->content,
                    'is_active' => $request->is_active,
                ]);
            flashMessage(MessageType::CREATED->message('Pengumuman'),
                'success'
            );
            return to_route('admin.announcements.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.announcements.index');
        }
    }
    public function edit(Announcement $announcement): Response
    {
        return inertia('Admin/Announcements/Edit', [
            'page_settings'=>[
                'title' => 'Edit Pengumuman',
                'subtitle' => 'Formulir untuk mengedit pengumuman',
                'method' => 'PUT',
                'action' => route('admin.announcements.update', $announcement),
            ],
            'announcement' => $announcement,
        ]);
    }

    public function update(AnnouncementRequest $request, Announcement $announcement): RedirectResponse
    {
        try{
            if($request->is_active) {
                Announcement::where('is_active', true)
                ->where('id', '!=', $announcement->id)
                ->update(['is_active' => false]);
                
            }
            $announcement->update([
                    'title' => $request->title,
                    'content' => $request->content,
                    'is_active' => $request->is_active,
                ]);
            flashMessage(MessageType::UPDATED->message('Pengumuman'),
                'success'
            );
            return to_route('admin.announcements.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.announcements.index');
        }
    }

    public function destroy(Announcement $announcement): RedirectResponse
    {
        try{
            $announcement->delete();
            flashMessage(MessageType::DELETED->message('Pengumuman'),
                'success'
            );
            return to_route('admin.announcements.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.announcements.index');
        }
    }
    
}
