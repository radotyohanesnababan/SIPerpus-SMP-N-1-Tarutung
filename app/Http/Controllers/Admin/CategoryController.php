<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Inertia\Response;
use App\Models\Category;
use App\Http\Resources\Admin\Category\Resource as CategoryResource;
use App\Http\Requests\Admin\CategoryRequest;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\RedirectResponse;
use Throwable;
use App\Enums\MessageType;
use GuzzleHttp\Psr7\Message;

class CategoryController extends Controller
{
    public function index(): Response
    {
        $categories = Category::query()
        ->select(['id', 'name', 'slug', 'created_at'])
        ->get();
         return inertia('Admin/Categories/Index', [
            'categories' => CategoryResource::collection($categories),
            'page_settings'=>[
                'title' => 'Kategori',
                'description' => 'Kelola kategori Anda di sini.',
            ]
        ]);

        
    }
    public function create(): Response
    {
        return inertia('Admin/Categories/Create', [
            'page_settings' => [
                'title' => 'Tambah Kategori',
                'subtitle' => 'Buat kategori baru untuk mengelompokkan konten Anda.',
                'action' => route('admin.categories.store',[], false ),
                'method' => 'POST',
            ]
        ]);
    }
    public function store (CategoryRequest $request): RedirectResponse
    {
        try{
            Category::create([
                'name' => $name = $request->name,
                'slug' =>str()->lower(str()->slug($name). str()->random(4)),
                'description' => $request->description,
            ]);
            flashMessage(MessageType::CREATED->message('Kategori'),
                'success'
            );
            return to_route('admin.categories.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.categories.index');
        }
    }

    public function edit(Category $category):Response{
        return inertia('Admin/Categories/Edit',[
            'page_settings' => [
                'title' => 'Edit Kategori',
                'subtitle' => 'Perbarui informasi kategori disini.',
                'action' => route('admin.categories.update', $category->id, false),
                'method' => 'PUT',
            ],
            'category'=> $category
        ]);
    }

    public function update(Category $category, CategoryRequest $request): RedirectResponse
    {
        try{
            $category->update([
                'name' => $name = $request->name,
                'slug' => $name !== $category->name
                    ? str()->lower(str()->slug($name). str()->random(4))
                    : $category->slug,
                'description' => $request->description,
            ]);
            flashMessage(MessageType::UPDATED->message('Kategori'),
                'success'
            );
            return to_route('admin.categories.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()));
            return to_route('admin.categories.index');
        }
    }
    public function destroy(Category $category): RedirectResponse
    {
        try{
            $category->delete();
            flashMessage(MessageType::DELETED->message('Kategori'),
                'success'
            );
            return to_route('admin.categories.index');
        }catch(Throwable $e){
            flashMessage(MessageType::ERROR->message(error: $e->getMessage()),'error');
            return to_route('admin.categories.index');
        }
    }
}