<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\LoanStatisticResource;
use App\Models\Book;
use App\Models\Borrowed;
use Illuminate\Http\Request;
use Inertia\Response;

class LoanStatisticController extends Controller
{
    public function index() :Response
    {
        return inertia('Admin/LoanStatistics/Index', [
            'page_settings' => [
                'title' => 'Statistik Peminjaman',
                'subtitle' => 'Lihat statistik peminjaman buku di sini.'
            ],
            'page_data' => [
                'least_loan_books'=> LoanStatisticResource::collection(Book::leastLoanBooks(5)),
                'most_loan_books'=> LoanStatisticResource::collection(Book::mostLoanBooks(5)),
                'total_loans'=>Borrowed::totalLoanBooks()
            ]
        ]);
    }
}
