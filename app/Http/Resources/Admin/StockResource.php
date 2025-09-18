<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StockResource extends JsonResource
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
            'book_id' => $this->book_id,
            'total'=> $this->total,
            'available'=> $this->available,
            'borrowed'=> $this->borrowed,
            'lost'=> $this->lost,
            'created_at' => $this->created_at->format('d M Y'),
            'updated_at' => $this->updated_at->format('d M Y'),
            'book'=> [
                'id' => $this->book->id,
                'judul' => $this->book->judul,
                
            ]
            
            ];
    }
}
