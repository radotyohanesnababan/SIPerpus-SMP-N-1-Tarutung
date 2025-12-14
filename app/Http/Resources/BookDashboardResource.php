<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Storage;

class BookDashboardResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id'    => $this->id,
            'judul' => $this->judul,
            'slug'  => $this->slug,
            'cover' => $this->cover ? Storage::url($this->cover) : null,
            'publisher_id' => $this->publisher_id,
            'category_id'  => $this->category_id,
            'file_path'  => $this->file_path,
        ];
    }
}
