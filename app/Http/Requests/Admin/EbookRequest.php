<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class EbookRequest extends FormRequest
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
            'slug' => 'nullable|string|max:255|unique:ebooks,slug,' . $this->ebook?->id,
            'tahun_terbit' => 'required|integer|min:1900|max:' . date('Y'),
            'isbn' => 'nullable|string|max:255|unique:ebooks,isbn,' . $this->ebook?->id,
            'deskripsi' => 'nullable|string',
            'publisher_id' => 'required|exists:publishers,id',
            'file_path' => 'required|file|mimes:pdf,epub|max:102400',
            'cover' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:3096',
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
            'file_path' => 'File Ebook',
            'cover' => 'Cover',
            'category_id' => 'Kategori'

        ];
    }
}
