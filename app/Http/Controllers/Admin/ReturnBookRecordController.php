<?php

namespace App\Http\Controllers\Admin;

use App\Enums\ReturnBookCondition;
use App\Enums\ReturnBookStatus;
use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\ReturnBookResource;
use App\Models\ReturnBook;
use Illuminate\Http\Request;

class ReturnBookRecordController extends Controller
{
    public function index()
    {
        $returnBooks = ReturnBook::query()
            ->select(['id', 'borrowed_id','user_nisn','book_id', 'return_date', 'status', 'created_at', 'updated_at',])
            ->where('status', [ReturnBookStatus::RETURNED, ReturnBookStatus::DENIED])
            ->filter(request()->only(['search']))
            ->sorting(request()->only(['field', 'direction']))
            ->with(['book', 'borrowed', 'user','returnBookCheck'])
            ->latest('created_at')
            ->paginate(request()->load ?? 10)
            ->withQueryString();
        
        return inertia('Admin/ReturnBooksRecords/Index', [
            'return_books' => ReturnBookResource::collection($returnBooks)->additional([
                'meta' => [
                    'has_pages' => $returnBooks->hasPages(),
                ],
            ]),
            'page_settings' => [
                'title' => 'Riwayat Pengembalian Buku',
                'subtitle' => 'Lihat riwayat pengembalian buku yang telah dilakukan.',
            ],
            'state' => [
                'page' => request()->page ?? 1,
                'search' => request()->search ?? '',
                'load' => 10,
            ],
            'conditions' => ReturnBookCondition::options(),
            
        ]);
    }
}
