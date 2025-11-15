<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Models\Book;
use PhpOffice\PhpSpreadsheet\IOFactory;
use App\Enums\BookStatus;
use App\Enums\MessageType;
use App\Http\Controllers\Controller;
use DB;
use Inertia\Inertia;
use Inertia\Response;

class BookImportController extends Controller
{
    public function index(): Response
    {
        return Inertia::render('Admin/ImportBooks/Index', [
            'page_settings' => [
                'title' => 'Impor Buku',
                'subtitle' => 'Import Buku dari file Excel',
            ],
        ]);
    }
    public function import(Request $request)
{
    $request->validate([
        'file' => 'required|mimes:xlsx,xls',
    ]);

    $file = $request->file('file')->getRealPath();
    $spreadsheet = IOFactory::load($file);
    $sheet = $spreadsheet->getActiveSheet();
    $rows = $sheet->toArray(null, true, true, true);
    $header = array_map('strtolower', array_shift($rows));

    try {
        DB::transaction(function () use ($rows, $header, &$createdCount) {
            $createdCount = 0;

            foreach ($rows as $row) {
                $data = array_combine($header, $row);
                if (collect($data)->filter(fn($v) => trim($v) !== '')->isEmpty()) {
                    continue;
                }
                $isbn = trim($data['isbn'] ?? '');
                if ($isbn === '') {
                    continue;
                }
                $book = Book::updateOrCreate(
                    ['isbn' => $isbn],
                    [
                        'judul'        => $data['judul'] ?? 'Tanpa Judul',
                        'slug'         => str()->slug($data['judul'] ?? 'tanpa-judul') . str()->random(4),
                        'isbn'         => $isbn,
                        'tahun_terbit' => $data['tahun_terbit'] ?: now()->year,
                        'deskripsi'    => $data['deskripsi'] ?? '-',
                        'publisher_id' => $data['publisher_id'] ?? 1,
                        'category_id'  => $data['category_id'] ?? 1,
                        'kondisi'      => ($data['stok'] ?? 0) > 0 
                                          ? BookStatus::AVAILABLE->value 
                                          : BookStatus::UNAVAILABLE->value,
                        'cover'        => 'books/no_cover.jpg',
                    ]
                );
                if ($book->wasRecentlyCreated) {
            $createdCount++;
        }
                $book->stock()->updateOrCreate(
                    ['book_id' => $book->id],
                    [
                        'total'     => $data['stok'] ?? 0,
                        'available' => $data['stok'] ?? 0,
                    ]
                );
            }

        });

        if ($createdCount > 0) {
    flashMessage("Import berhasil. {$createdCount} buku baru ditambahkan.",'success');
    } else {
    flashMessage( 'Import selesai. Tidak ada data baru.','warning');
    }

    } catch (\Throwable $e) {
        flashMessage(
        MessageType::ERROR->message(error: $e->getMessage()),'error'
    );
    return to_route('import-books.index');
    }
}

}
