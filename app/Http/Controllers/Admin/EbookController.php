<?php

namespace App\Http\Controllers\Admin;

use App\Enums\BookStatus;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;

use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;


use App\Http\Resources\Admin\BookResource;
use App\Http\Requests\Admin\BookRequest;
use App\Http\Requests\Admin\EbookRequest;
use App\Traits\HasFile;
use App\Models\Category;
use App\Models\Ebook;
use App\Models\Publisher;
use Auth;

class EbookController extends Controller
{
    use HasFile;
  public function index(): Response
    {
       $ebooks = Ebook::query()
            ->select([
                'id',
                'judul',
                'slug',
                'tahun_terbit',
                'isbn',
                'deskripsi',
                'publisher_id',
                'file_path',
                'cover',
                'category_id',
                'created_at',
                
            ])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['category', 'publisher'])
            ->latest('created_at')
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Ebooks/Index', [
            'page_settings' => [
                'title' => 'Ebook',
                'subtitle' => 'Kelola ebook Anda di sini.',
            ],
            'ebooks' => BookResource::collection($ebooks)->additional([
                'meta' => [
                    'has_pages' => $ebooks->hasPages(),
                ]
            ]),
            'state'=> [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' =>  10,
            ],

        ]);
    }

    public function create() :Response
    {

       return inertia('Admin/Ebooks/Create', [
           'page_settings' => [
               'title' => 'Tambah Ebook',
               'subtitle' => 'Tambahkan ebook baru ke dalam sistem.',
               'method' => 'POST',
               'action' => route('admin.ebooks.store'),
           ],
           'page_data' => [
                'tahun_terbit' => range(2000, now()->year),
                'categories' => Category::query()->select(['id', 'name'])->get()->map(fn($item)=>[
                    'id' => $item->id,
                    'name' => $item->name,
                ]),
                'publishers' => Publisher::query()->select(['id', 'name'])->get()->map(fn($item)=>[
                    'id' => $item->id,
                    'name' => $item->name,
                ])
           ]
           ]);
    }

    public function store(EbookRequest $request) :RedirectResponse
    {
        try{
        //dd(Auth::check(), Auth::user()?->roles);
            // dd($request->all());
           $ebook = Ebook::create([
                'judul' => $request->judul,
                'slug' =>str()->lower(str()->slug($request->judul). str()->random(4)),
                'tahun_terbit' => $request->tahun_terbit,
                'isbn' => $request->isbn,
                'deskripsi' => $request->deskripsi,
                'publisher_id' => $request->publisher_id,
                'category_id' => $request->category_id,
                'cover' => $this->upload_file($request, 'cover', 'ebooks'),
                'file_path' => $this->upload_file($request, 'file_path', 'ebooks'),
                
            ]);
            flashMessage(MessageType::CREATED->message('Ebook'),
                'success'
            );
            return to_route('admin.ebooks.index');
        }catch(Throwable $e){
            report($e);
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.ebooks.index');
        }
        
    }
    public function edit(Ebook $ebook) :Response
    {
       return inertia('Admin/Ebooks/Edit', [
           'page_settings' => [
               'title' => 'Edit Ebook',
               'subtitle' => 'Edit ebook yang ada di sistem.',
               'method' => 'PUT',
               'action' => route('admin.ebooks.update', $ebook),
           ],
           'ebook' => $ebook,
           'page_data' => [
                'tahun_terbit' => range(2000, now()->year),
                'categories' => Category::query()->select(['id', 'name'])->get()->map(fn($item)=>[
                    'id' => $item->id,
                    'name' => $item->name,
                ]),
                'publishers' => Publisher::query()->select(['id', 'name'])->get()->map(fn($item)=>[
                    'id' => $item->id,
                    'name' => $item->name,
                ])
           ]
           ]);
    }
    public function update(BookRequest $request, Ebook $ebook) :RedirectResponse
    {
        try{
            // dd($request->all());
           $ebook->update([
                'judul' => $request->judul,
                'slug' => $request->judul !== $ebook->judul ? str()->lower(str()->slug($request->judul). str()->random(4)) : $ebook->slug,
                'tahun_terbit' => $request->tahun_terbit,
                'isbn' => $request->isbn,
                'deskripsi' => $request->deskripsi,
                'publisher_id' => $request->publisher_id,
                'kondisi' => $request->stok > 0 ? BookStatus::AVAILABLE->value : BookStatus::UNAVAILABLE->value,
                'category_id' => $request->category_id,
                'cover' => $this->update_file($request, $ebook, 'cover', 'books'),
                'file_path' => $this->update_file($request, $ebook, 'file_path', 'ebooks'),
                
            ]);
            flashMessage(MessageType::UPDATED->message('Ebook'),
                'success'
            );
            return to_route('admin.ebooks.index');
        }catch(Throwable $e){
            report($e);
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.books.index');
        }
        
    }
    public function destroy(Ebook $ebook): RedirectResponse
    {
       try{
        $this->delete_file($ebook, 'cover', 'ebooks');
        $this->delete_file($ebook, 'file_path', 'ebooks');
            $ebook->delete();
            flashMessage(MessageType::DELETED->message('Ebook'),
                'success'
            );
            return to_route('admin.ebooks.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.ebooks.index');
        }
    }
}
