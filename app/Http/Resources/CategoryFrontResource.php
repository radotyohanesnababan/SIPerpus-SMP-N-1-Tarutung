<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryFrontResource extends JsonResource
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
            'name' => $this->name,
            'slug' => $this->slug,
            'description' => $this->description,
            'books_count' => $this->books_count,
            'books' => BookFrontResource::collection($this->whenLoaded('books')),
            'ebooks' => EbookFrontResource::collection($this->whenLoaded('ebooks')),
        ];
    }
}
