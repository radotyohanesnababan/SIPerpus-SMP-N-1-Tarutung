<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TransactionReturnBookResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'return_book_id' => $this->borrowed_id,
            'book' =>$this->whenLoaded('book', [
                'id' => $this->book?->id,
                'judul' => $this->book?->judul,
            ]),
            'user' =>$this->whenLoaded('user', [
               'nisn' => $this->user?->nisn,
               'nama' => $this->user?->nama,
            ])
        ];
    }
}
