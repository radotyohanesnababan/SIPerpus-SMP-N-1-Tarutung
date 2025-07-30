<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Borrowed;
use App\Http\Resources\Admin\BorrowedResource;
use App\Http\Requests\Admin\BorrowedRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use App\Traits\HasFile;


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
}
