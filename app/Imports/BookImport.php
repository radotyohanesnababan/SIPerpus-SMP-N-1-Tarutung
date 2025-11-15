<?php

namespace App\Imports;

use App\Models\Book;
use Illuminate\Support\Facades\File;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BookImport implements ToModel, WithHeadingRow
{
    public function model(array $row)
    {
        $dummyCover = 'images/no_cover.png';
        $dummyPath = public_path($dummyCover);
        if (!File::exists($dummyPath)) {
            File::ensureDirectoryExists(dirname($dummyPath));

            $image = imagecreatetruecolor(300, 400);
            $gray = imagecolorallocate($image, 200, 200, 200);
            imagefill($image, 0, 0, $gray);
            imagestring($image, 5, 100, 180, 'No Cover', imagecolorallocate($image, 0, 0, 0));
            imagepng($image, $dummyPath);
            imagedestroy($image);
        }
        return new Book([
            'judul'     => $row['judul'] ?? 'Tanpa Judul',
            'pengarang' => $row['pengarang'] ?? 'Tidak Diketahui',
            'tahun'     => $row['tahun'] ?? 0,
            'penerbit'  => $row['penerbit'] ?? 'Tidak Diketahui',
            'cover'     => $dummyCover,
        ]);
    }
}
