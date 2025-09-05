<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
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
        ]);
    }
}
