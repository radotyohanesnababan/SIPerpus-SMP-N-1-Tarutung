<?php

namespace App\Http\Resources\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;
use SebastianBergmann\CodeCoverage\Report\Xml\Totals;

class BookResource extends JsonResource
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
            'deskripsi' => $this->deskripsi,
            'cover' => $this->cover ? url(Storage::url($this->cover)) : null,

            'category' => [
                'id' => $this->category?->id,
                'name' => $this->category?->name,
            ],
            'publisher' => [
                'id' => $this->publisher?->id,
                'name' => $this->publisher?->name,
            ],
            'isbn' => $this->isbn,
            'tahun_terbit' => $this->tahun_terbit,
            'created_at' => $this->created_at?->format('d M Y'),
            'updated_at' => $this->updated_at?->format('d M Y'),
            'kondisi' => $this->kondisi,
            'stok' =>[
                'total'=> $this->stock?->total ?? 0,
                'available' => $this->stock?->available ?? 0,
                'borrowed' => $this->stock?->borrowed ?? 0,
                'lost' => $this->stock?->lost ?? 0,
            ]

            
        ];
    }
}
