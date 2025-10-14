<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryFrontResource;
use App\Http\Resources\EbookFrontSingleResource;
use App\Models\Category;
use App\Models\Ebook;
use Illuminate\Http\Request;
use Inertia\Response;

class EbookFrontController extends Controller
{
    public function index(): Response
    {
        $categories = Category::query()
            ->select(['id', 'name', 'slug', 'created_at'])
            ->whereHas('ebooks')
            ->with([
                'ebooks' =>fn($query)=> $query->limit(5)
            ])
            ->latest('created_at')
            ->get();

        return inertia('Front/Ebooks/Index', [
        'page_settings' => [
            'title' => 'E-Book',
            'subtitle' => 'Daftar E-Book yang ada disini.',
            
        ],
        'categories' => CategoryFrontResource::collection($categories),
        ]);
    }
    
    public function show(Ebook $ebook): Response
    {
        return inertia('Front/Ebooks/Show', [
            'page_settings' => [
                'title' => $ebook->judul,
                'subtitle' => "Menampilkan detail informasi buku {$ebook->title}"
            ],
            'ebook' => new EbookFrontSingleResource($ebook->load(['category', 'publisher'])),
        ]);
    }

    public function download(Ebook $ebook)
    {
        $filePath = storage_path('app/public/' . $ebook->file_path);

        if (file_exists($filePath)) {
            return response()->download($filePath, $ebook->judul . '.' . pathinfo($filePath, PATHINFO_EXTENSION));
        } else {
            return redirect()->back()->with('error', 'File not found.');
        }
    }
}
