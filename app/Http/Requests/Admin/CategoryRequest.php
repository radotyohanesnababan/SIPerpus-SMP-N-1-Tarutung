<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class CategoryRequest extends FormRequest
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
            'name' => 'required|string|max:255',
            'slug' => 'nullable|string|max:255|unique:categories,slug,' . $this->category?->id,
            'avatar' => 'nullable|image|mimes:jpg,jpeg,png,gif,webp|max:2048',
            'description' => 'nullable|string|max:1000',
        ];
    }
    public function attributes()
    {
        return [
            'name' => 'Nama Kategori',
            'slug' => 'Slug',
            'avatar' => 'Avatar Kategori',
            'description' => 'Deskripsi Kategori',
        ];
    }
}
