<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Borrowed;
use App\Http\Resources\Admin\BorrowedResource;
use Carbon\Carbon;
use App\Http\Requests\Admin\BorrowedRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use App\Traits\HasFile;
use App\Models\Book;
use App\Models\User;


class BorrowedController extends Controller
{
    public function index(): Response
    {
        $borroweds = Borrowed::query()
            ->select(['id', 'borrowed_at', 'returned_at', 'created_at', 'user_nisn', 'book_id'])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['user', 'book', 'returnBook'])
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/Borroweds/Index', [
            'borroweds' => BorrowedResource::collection($borroweds)->additional([
                'meta' => [
                    'has_pages' => $borroweds->hasPages(),
                ],
            ]),
            'page_settings' => [
                'title' => 'Peminjaman',
                'description' => 'Kelola peminjaman buku di sini.',
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
        return inertia('Admin/Borroweds/Create', [
            'page_settings' => [
                'title' => 'Tambah Peminjaman',
                'description' => 'Tambah peminjaman buku di sini.',
                'method' => 'POST',
                'action' => route('admin.borroweds.store'),
            ],
            'page_data' => [
                'date' => [
                    'borrowed_at'=> Carbon::now()->toDateString(),
                    'returned_at' => Carbon::now()->addDays(7)->toDateString(),
                ],
            'books'=> Book::query()
                ->select(['id', 'judul'])
                ->whereHas('stock', fn($query) => $query->where('total', '>', 0))
                ->get()
                ->map(fn($item)=> [
                    'value' => $item->id,
                    'label' => $item->id . ' - ' . $item->judul,
            ]),
            'users'=> User::query()
                ->select(['nisn', 'nama'])
                ->get()
                ->map(fn($item)=> [
                    'value' => $item->nisn,
                    'label' => $item->nisn . ' - ' . $item->nama,
                ]),
            ],
            
        ]);
    }

    public function store(BorrowedRequest $request): RedirectResponse
    {
        try{

            //dd($request->all());

            $user = User::query()
                ->where('nisn', $request->user_nisn)
                ->firstOrFail();
            $book = Book::query()
                ->where('id', $request->book_id)
                ->firstOrFail();
            
            
            if(Borrowed::checkBorrowedBook($user->nisn, $book->id)) {
                flashMessage(MessageType::ERROR->message(', Buku sudah dipinjam oleh pengguna ini.'), 'error');
                return to_route('admin.borroweds.index');
            }

            $book->stock->available > 0 ? tap(Borrowed::create([
                'user_nisn' => $user->nisn,
                'book_id' => $book->id,
                'borrowed_at' => Carbon::now()->toDateString(),
                'returned_at' => Carbon::now()->addDays(7)->toDateString(),
            ]), function ($borrowed)  {
                $borrowed->book->stock_borrowed();
                flashMessage(MessageType::CREATED->message('Peminjaman'),
                'success'
            );
            }) : flashMessage(MessageType::ERROR->message('Buku tidak tersedia.'), 'error');
            
            
            return to_route('admin.borroweds.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.borroweds.index');
        }
    }

    public function edit(Borrowed $borrowed): Response
    {
        return inertia('Admin/Borroweds/Create', [
            'page_settings' => [
                'title' => 'Edit Peminjaman',
                'subtitle' => 'Edit peminjaman buku di sini.',
                'method' => 'PUT',
                'action' => route('admin.borroweds.update', $borrowed),
            ],
            'page_data' => [
                
                'date' => [
                    'borrowed_at'=> Carbon::now()->toDateString(),
                    'returned_at' => Carbon::now()->addDays(7)->toDateString(),
                ],
            'books'=> Book::query()
                ->select(['id', 'judul'])
                ->whereHas('stock', fn($query) => $query->where('total', '>', 0))
                ->get()
                ->map(fn($item)=> [
                    'value' => $item->id,
                    'label' => $item->id . ' - ' . $item->judul,
            ]),
            'users'=> User::query()
                ->select(['nisn', 'nama'])
                ->get()
                ->map(fn($item)=> [
                    'value' => $item->nisn,
                    'label' => $item->nisn . ' - ' . $item->nama,
                ]),
            ],
            'borrowed' => $borrowed->load(['user', 'book']),
            
        ]);
    }

     public function update (Borrowed $borrowed, BorrowedRequest $request): RedirectResponse
    {
        try{

            //dd($request->all());

            $user = User::query()
                ->where('nisn', $request->user_nisn)
                ->firstOrFail();
            $book = Book::query()
                ->where('id', $request->book_id)
                ->firstOrFail();
            if(Borrowed::checkBorrowedBook($user->nisn, $book->id)) {
                flashMessage(MessageType::ERROR->message('Buku sudah dipinjam oleh pengguna ini.'), 'error');
                return to_route('admin.borroweds.index');
            }

            $book->stock->available > 0 ? tap(Borrowed::create([
                'user_nisn' => $user->nisn,
                'book_id' => $book->id,
                'borrowed_at' => Carbon::now()->toDateString(),
                'returned_at' => Carbon::now()->addDays(7)->toDateString(),
            ]), function ($borrowed)  {
                $borrowed->book->stock_borrowed();
                flashMessage(MessageType::CREATED->message('Peminjaman Berhasil'),
                'success'
            );
            }) : flashMessage(MessageType::ERROR->message('Buku tidak tersedia.'), 'error');
            

            $borrowed->update([
                'user_nisn' => $user->nisn,
                'book_id' => $book->id,
            ]);
            flashMessage(MessageType::UPDATED->message('Peminjaman'),
                'success'
            );
            return to_route('admin.borroweds.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.borroweds.index');
        }
    }

    public function destroy(Borrowed $borrowed): RedirectResponse
    {
        try{
            $borrowed->book->stock_returned();
            $borrowed->delete();
            flashMessage(MessageType::DELETED->message('Peminjaman'),
                'success'
            );
            return to_route('admin.borroweds.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.borroweds.index');
        }
    }
}
