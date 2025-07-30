<?php

namespace App\Http\Controllers\Admin;

use App\Enums\BookStatus;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;

use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;

use App\Models\Book;
use App\Http\Resources\Admin\BookResource;
use App\Http\Requests\Admin\BookRequest;
use App\Traits\HasFile;
use App\Models\Category;
use App\Models\Publisher;




class BookController extends Controller
{
    use HasFile;
  public function index(): Response
    {
       $books = Book::query()
            ->select([
                'id',
                'judul',
                'slug',
                'tahun_terbit',
                'isbn',
                'deskripsi',
                'publisher_id',
                'kondisi',
                'cover',
                'stok',
                'category_id',
                'created_at',
                
            ])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['category', 'publisher', 'stock'])
            ->latest('created_at')
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Books/Index', [
            'page_settings' => [
                'title' => 'Buku',
                'subtitle' => 'Kelola buku Anda di sini.',
            ],
            'books' => BookResource::collection($books)->additional([
                'meta' => [
                    'has_pages' => $books->hasPages(),
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
       return inertia('Admin/Books/Create', [
           'page_settings' => [
               'title' => 'Tambah Buku',
               'subtitle' => 'Tambahkan buku baru ke dalam sistem.',
               'method' => 'POST',
               'action' => route('admin.books.store'),
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

    public function store(BookRequest $request) :RedirectResponse
    {
        try{
            // dd($request->all());
           $book = Book::create([
                'judul' => $request->judul,
                'slug' =>str()->lower(str()->slug($request->judul). str()->random(4)),
                'tahun_terbit' => $request->tahun_terbit,
                'isbn' => $request->isbn,
                'deskripsi' => $request->deskripsi,
                'publisher_id' => $request->publisher_id,
                'kondisi' => $request->stok > 0 ? BookStatus::AVAILABLE->value : BookStatus::UNAVAILABLE->value,
                'category_id' => $request->category_id,
                'cover' => $this->upload_file($request, 'cover', 'books'),
                'stok' => $request->stok
            ]);

            

            flashMessage(MessageType::CREATED->message('Buku'),
                'success'
            );
            return to_route('admin.books.index');
        }catch(Throwable $e){
            report($e);
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.books.index');
        }
        
    }
    public function edit(Book $book) :Response
    {
       return inertia('Admin/Books/Edit', [
           'page_settings' => [
               'title' => 'Edit Buku',
               'subtitle' => 'Edit buku yang ada di sistem.',
               'method' => 'PUT',
               'action' => route('admin.books.update', $book),
           ],
           'book' => $book,
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
    public function update(BookRequest $request, Book $book) :RedirectResponse
    {
        try{
            // dd($request->all());
           $book->update([
                'judul' => $request->judul,
                'slug' => $request->judul !== $book->judul ? str()->lower(str()->slug($request->judul). str()->random(4)) : $book->slug,
                'tahun_terbit' => $request->tahun_terbit,
                'isbn' => $request->isbn,
                'deskripsi' => $request->deskripsi,
                'publisher_id' => $request->publisher_id,
                'kondisi' => $request->stok > 0 ? BookStatus::AVAILABLE->value : BookStatus::UNAVAILABLE->value,
                'category_id' => $request->category_id,
                'cover' => $this->update_file($request,$book, 'cover', 'books'),
                'stok' => $request->stok
            ]);

            

            flashMessage(MessageType::CREATED->message('Buku'),
                'success'
            );
            return to_route('admin.books.index');
        }catch(Throwable $e){
            report($e);
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.books.index');
        }
        
    }

    // private function bookCode(int $tahun_terbit, int $category_id): string
    // {
    //     $category = Category::find($category_id);

    //     $last_book = Book::query()
    //         ->orderByDesc('book_code')
    //         ->first();

    //     $order =1;
    //     if ($last_book) {
    //         $last_order = (int) substr($last_book->book_code, -3) + 1;
    //     }
    //     $order =$last_order +1;

    //     $ordering = str_pad($order, 4, '0', STR_PAD_LEFT);

    //     return 'S1TR'.$tahun_terbit. '-'. str()->slug($category->name). '-'. $ordering;
    // }

    public function destroy(Book $book): RedirectResponse
    {
       try{
        $this->delete_file($book, 'cover', 'books');
            $book->delete();
            flashMessage(MessageType::DELETED->message('Buku'),
                'success'
            );
            return to_route('admin.books.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.books.index');
        }
    }
}
