<?php

if (!function_exists ('flashMessage')){
    function flashMessage($message, $type = 'success'): void{
        session()->flash('message', $message);
        session()->flash('type', $type);
    }
}

if (!function_exists('generateStudentEmail')) {
    function generateStudentEmail($name, $nisn)
    {
        // lowercase
        $clean = strtolower($name);

        // hilangkan karakter yang tidak aman untuk email
        $clean = preg_replace('/[^a-z0-9 ]+/', '', $clean);

        // ganti spasi dengan titik
        $clean = str_replace(' ', '.', $clean);

        return "{$clean}.{$nisn}@gmail.com";
    }
}

