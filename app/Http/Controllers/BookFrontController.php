<?php

namespace App\Http\Controllers;

use App\Http\Resources\BookFrontSingleResource;
use App\Http\Resources\CategoryFrontResource;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Category;
use App\Models\Book;
class BookFrontController extends Controller
{
    public function index(): Response
    {
        $categories = Category::query()
            ->select(['id', 'name', 'slug', 'created_at'])
            ->whereHas('books')
            ->with([
                'books' =>fn($query)=> $query->limit(5)
            ])
            ->latest('created_at')
            ->get();

        return inertia('Front/Books/Index', [
        'page_settings' => [
            'title' => 'Buku',
            'subtitle' => 'Daftar Buku yang ada disini',
            
        ],
        'categories' => CategoryFrontResource::collection($categories),
        ]);
    }
    
    public function show(Book $book): Response
    {
        return inertia('Front/Books/Show', [
            'page_settings' => [
                'title' => $book->judul,
                'subtitle' => "Menampilkan detail informasi buku {$book->title}"
            ],
            'book' => new BookFrontSingleResource($book->load(['category', 'publisher', 'stock'])),
        ]);
    }
}
