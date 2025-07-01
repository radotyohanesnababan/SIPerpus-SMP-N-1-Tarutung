<?php
namespace App\Enums;

use GuzzleHttp\Psr7\Message;

enum MessageType: string
{
    case CREATED = 'Berhasil menambahkan';
    case UPDATED = 'Berhasil memperbarui';
    case DELETED = 'Berhasil menghapus';
    case ERROR = 'Terjadi kesalahan';

    public function message(string $entity='',$error = null): string
    {
        if ($this == MessageType::ERROR && $error) {
            return "{$this->value} {$error}" ;
        }
        return "{$this->value} {$entity}";

    } 
}
