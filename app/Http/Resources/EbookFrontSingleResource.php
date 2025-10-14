<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class EbookFrontSingleResource extends JsonResource
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
            'judul' => $this->judul,
            'slug' => $this->slug,
            'cover' => $this->cover ? Storage::url($this->cover): null,
            'file_path' => $this->file_path ? Storage::url($this->file_path): null,
            'tahun_terbit' => $this->tahun_terbit,
            'isbn' => $this->isbn,
            'deskripsi' => $this->deskripsi,
            'created_at' => $this->created_at?->format('d M Y'),
            'category_id' => $this->whenLoaded('category',[
                'id' => $this->category?->id,
                'name' => $this->category?->name
            ]),
            'publisher_id' => $this->whenLoaded('publisher',[  
                'id' => $this->publisher?->id,
                'name' => $this->publisher?->name
            ]),
        ];
    }
}
