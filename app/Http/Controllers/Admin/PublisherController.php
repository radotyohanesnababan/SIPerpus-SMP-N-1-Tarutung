<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Publisher;
use App\Http\Resources\Admin\PublisherResource;
use App\Http\Requests\Admin\PublisherRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use App\Traits\HasFile;
class PublisherController extends Controller
{
    use HasFile;
    public function index()
    {
        $publishers = Publisher::query()
            ->select(['id', 'name', 'slug', 'created_at'])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->when(request()->search, function ($query, $value) {
                $query->whereAny([
                    'name',
                    'slug',
                ], 'REGEXP', $value);
            })
            ->when(request()->field && request()->direction, function ($query) {
                $query->orderBy(request()->field, request()->direction);
            })
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Publishers/Index', [
            'publishers' => PublisherResource::collection($publishers)->additional([
                'meta' => [
                    'has_pages' => $publishers->hasPages(),
                ],
            ]),
            'page_settings' => [
                'title' => 'Penerbit',
                'subtitle' => 'Kelola penerbit Anda di sini.',
            ],
            'state' => [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' => 10,
            ],
        ]);
    }

    public function create(): Response
    {
        return inertia('Admin/Publishers/Create', [
            'page_settings' => [
                'title' => 'Tambah Penerbit',
                'subtitle' => 'Tambahkan penerbit baru ke dalam sistem.',
                'method' => 'POST',
                'action' => route('admin.publishers.store'),
            ],
        ]);
    }
    public function store (PublisherRequest $request): RedirectResponse
    {
        try{
            Publisher::create([
                'name' => $name = $request->name,
                'slug' =>str()->lower(str()->slug($name). str()->random(4)),
            ]);
            flashMessage(MessageType::CREATED->message('Penerbit'),
                'success'
            );
            return to_route('admin.publishers.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.publishers.index');
        }
    }

    public function edit(Publisher $publisher): Response
    {
        return inertia('Admin/Publishers/Edit', [
            'publisher' => new PublisherResource($publisher),
            'page_settings' => [
                'title' => 'Edit Penerbit',
                'subtitle' => 'Perbarui informasi penerbit ini.',
                'method' => 'PUT',
                'action' => route('admin.publishers.update', $publisher),
            ],
            'publisher' => $publisher,
        ]);
    }
    public function update(PublisherRequest $request, Publisher $publisher): RedirectResponse
    {
        try {
            $publisher->update([
                'name' => $name = $request->name,
                'slug' => $name !== $publisher->name ? str()->lower(str()->slug($name) . str()->random(4)) : $publisher->slug,
            ]);
            flashMessage(MessageType::UPDATED->message('Penerbit'),
                'success'
            );
            return to_route('admin.publishers.index');
        } catch (Throwable $e) {
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()), 'error');
            return to_route('admin.publishers.index');
        }
    }
    public function destroy(Publisher $publisher): RedirectResponse
    {
        try {
            $publisher->delete();
            flashMessage(MessageType::DELETED->message('Penerbit'),
                'success'
            );
            return to_route('admin.publishers.index');
        } catch (Throwable $e) {
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()), 'error');
            return to_route('admin.publishers.index');
        }
    }

}
