<?php

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class UserRequest extends FormRequest
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
            'nisn' =>[
                'required',
                'integer',
                Rule::unique('users')->ignore($this->user->nisn, 'nisn'),
            ],
            'email' => [
                'required',
                'email',
                'max:255',
                Rule::unique('users', 'email')->ignore($this->user->nisn, 'nisn'),
            ],
            'nama' =>[
                'required',
                'string',
                'max:255',
            ],
            'password' => Rule::when($this->routeIs('admin.users.store'),[
                'required',
                'string',
                'min:8',
                'confirmed',
            ]),
            Rule::when($this->routeIs('admin.users.update'), [
                'nullable',
                'string',
                'min:8',
                'confirmed',
            ]),

        ];
    }

    public function attributes(): array
    {
        return [
            'nisn' => 'NISN',
            'email' => 'Email',
            'nama' => 'Nama',
            'password' => 'Kata Sandi',
        ];
    }
}
