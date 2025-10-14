<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Book;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Carbon\Carbon;
use App\Models\ReturnBook;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\ReturnBookFrontResource;
use App\Models\Borrowed;
use Barryvdh\DomPDF\Facade\Pdf;
use Redirect;

class ReturnBookFrontController extends Controller
{
    public function index(): Response {
         $returnBooks = ReturnBook::query()
            ->select(['id', 'borrowed_id','user_nisn','book_id', 'return_date', 'status', 'created_at', 'updated_at','kondisi'])
            ->where('user_nisn', Auth::user()->nisn)
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['book', 'borrowed', 'user','returnBookCheck'])
            ->latest('created_at')
            ->paginate(request()->load ?? 10)
            ->withQueryString();

        return inertia('Front/ReturnBooks/Index', [
            'return_books' => ReturnBookFrontResource::collection($returnBooks)->additional([
                'meta' => [
                    'has_pages' => $returnBooks->hasPages(),
                ],
            ]),
            'page_settings' => [
                'title' => 'Pengembalian Buku',
                'subtitle' => 'Kelola pengembalian buku anda di sini.',
            ],
            'state' => [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' => 10,
            ],
            'page_data' => [
                'returned' =>ReturnBook::query()->member(Auth::user()->nisn)->returned()->count(),
                'checked' =>ReturnBook::query()->member(Auth::user()->nisn)->checked()->count(),
                
            ],
            
        ]);
    }

    public function show(ReturnBook $returnBook): Response {
        return inertia('Front/ReturnBooks/Show', [
            'return_book' => new ReturnBookFrontResource($returnBook->load(['book', 'borrowed', 'user', 'returnBookCheck'])) ,
            'page_settings' => [
                'title' => 'Detail Pengembalian',
                'subtitle' => 'Detail pengembalian buku yang anda kembalikan',
            ],

            
        ]);
    }

    public function store(Book $book, Borrowed $borrowed): RedirectResponse {
        $returnBook = $borrowed->returnBook()->create([
            'borrowed_id' => $borrowed->id,
            'book_id' => $book->id,
            'user_nisn' => Auth::user()->nisn,
            'return_date' => Carbon::today()
        ]);
        flashMessage('Buku sedang dilakukan pengecekan pengembalian, mohon tunggu.','success');
        return to_route('front.return-books.show',[$returnBook->id]);
    }

    public function download(ReturnBook $returnBook)
{
    $returnBook->load(['book', 'user', 'borrowed']);

    $pdf = Pdf::loadView('sphilang', [
        'returnBook' => $returnBook,
    ])->setPaper('a4', 'portrait');

    $filename = 'Surat_Pernyataan_Hilang_' . $returnBook->id . '.pdf';

    return $pdf->download($filename);
}


}
