<?php

namespace App\Http\Resources;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class ReturnBookFrontResource extends JsonResource
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
            'status' => $this->status,
            'return_date' => $this->return_date ? Carbon::parse($this->return_date)->format('d M Y') : null,
            'created_at'=> $this->created_at->format('d M Y'),
            'book' =>$this->whenLoaded('book', [
                'id' => $this->book?->id,
                'judul' => $this->book?->judul,
                'slug' => $this->book?->slug,
                'cover' => $this->book?->cover ? Storage::url($this->book?->cover): null
            ]),
            'borrowed' =>$this->whenLoaded('borrowed', [
                'id' => $this->borrowed?->id,
                'borrowed_at' => Carbon::parse($this->borrowed?->borrowed_at)->format('d M Y'),
                'returned_at' => Carbon::parse($this->borrowed?->returned_at)->format('d M Y'),
            ]),
            'user' =>$this->whenLoaded('user', [
                'nisn' => $this->user?->nisn,
                'nama' => $this->user?->nama
            ]),
            'return_book_check' => $this->whenLoaded(
    'returnBookCheck',
    fn () => $this->returnBookCheck->condition
),

        ];
    }
}
