<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StockRequest;
use App\Http\Resources\Admin\StockResource;
use App\Models\Stock;
use Illuminate\Http\Request;
use Inertia\Response;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;


class BookStockReportController extends Controller
{
    public function index() :Response{
        $stocks = Stock::query()
        ->select(['stocks.id', 'book_id', 'total', 'available', 'borrowed', 'lost', 'stocks.created_at', 'stocks.updated_at'])
        ->filter(request()->only('search'))
        ->sorting(request()->only('field', 'direction'))
        ->paginate(10)
        ->withQueryString();

        return inertia('Admin/BookStockReports/Index', [
            'page_settings'=>[
                'title'=>'Laporan Stok Buku',
                'subtitle'=> 'Menampilkan laporan stok buku',
                'method'=>'GET',
                'action'=>route('admin.book-stock-reports.index')
            ],
            'stocks'=>StockResource::collection($stocks)->additional([
                'meta'=>[
                    'has_pages'=>$stocks->hasPages(),
                ]
            ]),
            'state'=>[
                'page'=>request()->page ?? 1,
                'search'=>request()->search ?? '',
                'load'=>10,
            ]
        ]);
    }

    public function edit(Stock $stock): Response
    {
        return inertia('Admin/BookStockReports/Edit', [
            'page_settings' => [
                'title' => 'Edit Stok Buku',
                'subtitle' => 'Mengedit data stok buku',
                'method' => 'PUT',
                'action' => route('admin.book-stock-reports.update', $stock),
            ],
            'stock' => $stock
        ]);
    }
    public function update(StockRequest $request, Stock $stock): RedirectResponse
    {
       try{
        $minimumTotal = $request->available + $request->borrowed + $request->lost;

        if($request->total < $minimumTotal){
            flashMessage(
                MessageType::ERROR->message("Total stok tidak boleh kurang dari jumlah stok yang tersedia, dipinjam, dan hilang."),
                'error'
            );
            return to_route('admin.book-stock-reports.edit', $stock);
        }
        $stock->update(
            [
                'total'=>$request->total,
                'available'=>$request->available,
            ]
        );
        flashMessage(
            MessageType::UPDATED->message('Stok Buku'),
            'success'

        );
        return to_route('admin.book-stock-reports.index');

       }
       catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.book-stock-reports.index');
        }
    }
}
