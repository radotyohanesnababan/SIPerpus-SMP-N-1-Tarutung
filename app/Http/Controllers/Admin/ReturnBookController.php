<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\ReturnBook;
use App\Http\Resources\Admin\ReturnBookResource;
use App\Http\Requests\Admin\ReturnBookRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use App\Enums\ReturnBookCondition;
use App\Models\Borrowed;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class ReturnBookController extends Controller
{
    public function index(): Response
    {
        $returnBooks = ReturnBook::query()
            ->select(['id', 'borrowed_id','user_nisn','book_id', 'return_date', 'status', 'created_at', 'updated_at',])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['book', 'borrowed', 'user','returnBookCheck'])
            ->latest('created_at')
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Admin/ReturnBooks/Index', [
            'return_books' => ReturnBookResource::collection($returnBooks)->additional([
                'meta' => [
                    'has_pages' => $returnBooks->hasPages(),
                ],
            ]),
            'page_settings' => [
                'title' => 'Pengembalian Buku',
                'subtitle' => 'Kelola pengembalian buku di sini.',
            ],
            'state' => [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' => 10,
            ],
            
        ]);


    }

    public function create( Borrowed $borrowed): Response|RedirectResponse
    {
        if($borrowed->returnBook()->exists()){
            return to_route ('admin.borroweds.index');
        }

        return inertia('Admin/ReturnBooks/Create', [
            'page_settings' => [
                'title' => 'Pengembalian Buku',
                'subtitle' => 'Kembalikan buku yang telah dipinjam disini.',
                'method' => 'POST',
                'action' => route('admin.return-books.store', $borrowed),
            ],
            'page_data' => [
                
                'conditions' => ReturnBookCondition::options(),
            ],
            'borrowed' => $borrowed->load(['book' => fn($query) => $query->with('publisher'), 'user']),
            'date' => [
                'return_date' => Carbon::now()->toDateString(),
                'borrowed' => [
                    'borrowed_at' => Carbon::parse($borrowed->borrowed_at)->format('d M Y'),
                    'returned_at' => Carbon::parse($borrowed->returned_at)->format('d M Y'),
                ],
            ],
            
        ]);
    }

    public function store(ReturnBookRequest $request, Borrowed $borrowed): RedirectResponse
    {

        DB::beginTransaction();

        try {
            $returnBook = $borrowed->returnBook()->create([
                'borrowed_id' => $borrowed->id,
                'user_nisn' => $borrowed->user_nisn,
                'book_id' => $borrowed->book_id,
                'return_date' => Carbon::today(),
                
            ]);

            $return_book_check = $returnBook->returnBookCheck()->create([
                'return_book_id' => $returnBook->id,
                'condition' => $request->condition,
                'notes' => $request->notes,
                'book_id' => $borrowed->book_id,

            ]);

            match($return_book_check->condition->value){
                ReturnBookCondition::GOOD->value => $return_book_check->book->stock_returned(),
                ReturnBookCondition::LOST->value => $return_book_check->book->stock_lost(),
                default => flashMessage(MessageType::ERROR->message('Kondisi buku tidak valid'), 'error')
            };

            DB::commit();
            flashMessage(MessageType::CREATED->message('Pengembalian buku'), 'success');
            return to_route('admin.return-books.index');
        } catch (Throwable $e) {
            DB::rollBack();
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()), 'error');
            return to_route('admin.borroweds.index');
        }
    }

    public function destroy(ReturnBook $return_book): RedirectResponse
    {
        try{
            
            $return_book->delete();
            flashMessage(MessageType::DELETED->message('Riwayat Pengembalian'),
                'success'
            );
            return to_route('admin.return-books.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.return-books.index');
        }
    }


}
