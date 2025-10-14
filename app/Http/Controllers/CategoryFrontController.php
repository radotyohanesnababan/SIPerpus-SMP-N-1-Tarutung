<?php

namespace App\Http\Controllers;

use App\Models\Category;
use Illuminate\Http\Request;
use Inertia\Response;
use App\Http\Resources\CategoryFrontResource;
use App\Http\Resources\BookFrontResource;
use App\Models\Book;

class CategoryFrontController extends Controller
{
    public function index(): Response
    {
        $categories = Category::query()
            ->withCount('books', 'ebooks')
            ->latest()
            ->paginate(12);

           //dd($categories->toArray());


        return inertia('Front/Categories/Index', [
            'page_settings' => [
                'title' => 'Kategori',
                'subtitle' => 'Daftar Kategori yang ada disini',
            ],
            'categories' => CategoryFrontResource::collection($categories),
        ]);
        

    }

    public function show(Category $category): Response
    {
        $books = Book::query()
            ->select(['id', 'judul', 'slug','cover', 'deskripsi', 'publisher_id','category_id'])
            ->where('category_id', $category->id)
            ->paginate(12);
        return inertia('Front/Categories/Show', [
            'page_settings' => [
                'title' => $category->name,
                'subtitle' => "Menampilkan buku yang tersedia pada kategori {$category->name} .",
            ],
            'books' => BookFrontResource::collection($books)->additional([
               'meta' => [
                   'has_pages' => $books->hasPages(),
               ] 
            ]),
            'category' => new CategoryFrontResource($category->load(['books'])),
        ]);
    }
}
