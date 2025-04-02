<?php
namespace App\Enums;

use GuzzleHttp\Psr7\Message;

enum MessageType: string
{
    case CREATED = 'Berhasil ditambahkan';
    case UPDATED = 'Berhasil diperbarui';
    case DELETED = 'Berhasil dihapus';
    case ERROR = 'Terjadi kesalahan';

    public function message(string $entity='',$error = null): string
    {
        if ($this == MessageType::ERROR && $error) {
            return "{$this->value} {$error}" ;
        }
        return "{$this->value} {$entity}";

    } 
}
