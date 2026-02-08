<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class BookRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'judul' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:books,slug,' . $this->book?->id,
            'tahun_terbit' => 'required|integer|min:1900|max:' . date('Y'),
            'isbn' => 'nullable|string|max:255|unique:books,isbn,' . $this->book?->id,
            'deskripsi' => 'nullable|string',
            'publisher_id' => 'required|exists:publishers,id',
            'cover' => 'nullable|image|mimes:jpg,jpeg,png,webp,avif|max:3096',
            'category_id' => 'required|exists:categories,id',
            

        ];
    }
    public function attributes():array{
        return [
            'judul' => 'Judul',
            'slug' => 'Slug',
            'tahun_terbit' => 'Tahun Terbit',
            'isbn' => 'ISBN',
            'deskripsi' => 'Deskripsi',
            'publisher_id' => 'Penerbit',
            'cover' => 'Cover',
            'category_id' => 'Kategori'

        ];
    }
}
