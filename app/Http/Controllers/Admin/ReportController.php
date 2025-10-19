<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\Borrowed;
use App\Models\Ebook;
use App\Models\Kelas;
use App\Models\Publisher;
use App\Models\ReturnBook;
use App\Models\Stock;
use App\Models\User;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;
use Inertia\Response;
use QuickChart;

class ReportController extends Controller
{
   
    public function index(): Response
    {

        return Inertia::render('Admin/Reports/Index', [
            'page_settings' => [
                'title' => 'Cetak Laporan Perpustakaan',
                'subtitle' => 'Pilih periode laporan yang ingin dicetak.',
            ],
        ]);
    }

    // Generate PDF
    public function generate(Request $request)
    {
        $start = Carbon::parse($request->input('start', now()->startOfMonth()));
        $end   = Carbon::parse($request->input('end', now()->endOfMonth()));

        //dd($start, $end);

        // 1. Total Buku
        $totalBuku = Stock::get()->sum(function($stock) {
            return $stock->available + $stock->borrowed + $stock->damaged + $stock->lost;
        });
        $totalJudul = Book::count();


        // 2.Daftar Buku per Penerbit
        $publishers = Publisher::with(['books.stock'])
            ->get()
            ->map(function ($publisher) {
                return [
                    'name' => $publisher->name,
                    'titles' => $publisher->books->count(),
                    'copies' => $publisher->books->sum(function ($book) {
                        return ($book->stock->available ?? 0)
                            + ($book->stock->borrowed ?? 0)
                            + ($book->stock->damaged ?? 0)
                            + ($book->stock->lost ?? 0);
                    }),
                ];
            })
            ->toArray();

        // 3.Buku baru dalam periode
                $new_books = Book::with(['publisher:id,name', 'stock:book_id,available,borrowed,damaged,lost'])
            ->whereBetween('created_at', [$start, $end])
            ->get()
            ->map(function ($book) {
                $copies = optional($book->stock)->available 
                        + optional($book->stock)->borrowed 
                        + optional($book->stock)->damaged 
                        + optional($book->stock)->lost;

                return [
                    'judul' => $book->judul,
                    'publisher' => $book->publisher?->name,
                    'copies' => $copies ?? 0,
                ];
            })
            ->toArray();



        // 4. Buku hilang 
            $lost_books = Book::whereHas('stock', fn($q) => $q->where('lost', '>', 0))
                ->with('stock:id,book_id,lost')
                ->get()
                ->map(fn($book) => [
                    'title' => $book->judul,
                    'count' => $book->stock->lost,
                ])
                ->toArray();

        // 5. Laporan peminjaman
        $borrowed = Borrowed::whereBetween('borrowed_at', [$start, $end])->get();
        $borrowed_total = $borrowed->count();

        $avg_duration = round($borrowed->avg(function ($b) {
            return Carbon::parse($b->borrowed_at)->diffInDays(Carbon::parse($b->due_at));
        }), 1);

        // Buku paling sering dipinjam
        $top_borrowed = Borrowed::with('book:id,judul')
        ->select('book_id', DB::raw('COUNT(*) as total'))
        ->groupBy('book_id')
        ->orderByDesc('total')
        ->take(3)
        ->get()
        ->map(fn($b) => $b->book?->judul ?? 'Judul tidak tersedia')
        ->toArray();


        // 6.Laporan pengembalian
        $returned = ReturnBook::whereBetween('return_date', [$start, $end])->get();
        $returned_on_time = $returned->where('is_late', false)->count();
        $returned_late = $returned->where('is_late', true)->count();
        $avg_late_duration = round($returned->avg('late_days') ?? 0, 1);

        // 7.Ebook
        $ebook_top = Ebook::orderByDesc('download_count')->take(3)->pluck('judul');
        $ebook_total = Ebook::count();

       // 8. Aktivitas per kelas (Eloquent murni, sesuai struktur kelas + users + borroweds)
        $class_totals = Kelas::withCount(['users as borroweds_count' => function ($query) {
            $query->join('borroweds', 'users.nisn', '=', 'borroweds.user_nisn');
        }])->pluck('borroweds_count', 'tingkat')->toArray();

        // Chart.js via QuickChart
        // Buat konfigurasi chart Chart.js
    $total = array_sum($class_totals);
$percentages = [];
foreach ($class_totals as $kelas => $val) {
    $percentages[] = round($val / $total * 100, 1);
}

// Dataset
$data = array_values($class_totals);
$labels = [];
foreach ($class_totals as $kelas => $val) {
    $labels[] = $kelas . ' (' . round($val / $total * 100,1) . '%)';
}

$qc = new QuickChart();
$qc->width = 500;
$qc->height = 300;
$qc->config = json_encode([
    'type' => 'doughnut',
    'data' => [
        'labels' => $labels,
        'datasets' => [[
            'data' => $data,
            'backgroundColor' => ['#36A2EB','#FFCE56','#FF6384']
        ]]
    ],
    'options' => [
        'plugins' => [
            'legend' => [
                'position' => 'bottom',
                'labels' => [
                    'font' => ['size' => 12]
                ]
            ]
        ]
    ]
]);
$chart_url = $qc->getUrl();
$image = file_get_contents($chart_url);
$chart_base64 = 'data:image/png;base64,' . base64_encode($image);

        // Kirim semua ke PDF view
        $data = compact(
            'start', 'end', 'totalBuku', 'publishers', 'new_books', 'lost_books',
            'borrowed_total', 'avg_duration', 'top_borrowed',
            'returned_on_time', 'returned_late', 'avg_late_duration',
            'ebook_top', 'class_totals', 'totalJudul', 'ebook_total', 'chart_url', 'chart_base64'
        );

        $pdf = Pdf::loadView('report', $data)->setPaper('a4', 'portrait');
        $filename = 'Laporan_Perpustakaan_' . now()->format('Ymd_His') . '.pdf';

        return $pdf->download($filename);

        return view ('report', $data);
    }
}
