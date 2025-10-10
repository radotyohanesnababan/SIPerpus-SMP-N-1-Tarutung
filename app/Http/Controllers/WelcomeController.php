<?php

namespace App\Http\Controllers;

use App\Http\Resources\Admin\TransactionBorrowedResource;
use App\Http\Resources\Admin\TransactionReturnBookResource;
use App\Models\Book;
use App\Models\Borrowed;
use App\Models\Category;
use App\Models\ReturnBook;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;


class WelcomeController extends Controller
{
    public function index(){

        $borroweds = Borrowed::query()
            ->select(['id', 'user_nisn', 'book_id', 'created_at'])
            
            ->latest('created_at')
            ->limit(5)
            ->with(['user', 'book'])
            ->get();
            
        $return_books = ReturnBook::query()
            ->select(['id', 'user_nisn', 'book_id', 'created_at'])
            ->latest('created_at')
            ->limit(5)
            ->with(['user', 'book'])
            ->get();          
        return inertia('Welcome',[
             'auth' => [
            'user' => Auth::user(),
            ],
            
            'page_settings'=>[
                'title'=>'Welcome',
                'subtitle'=>'Selamat Datang di Perpustakaan SMPN 1 Tarutung',
                'method'=>'GET',
                
            ],
            'page_data'=>[
                'borroweds'=>TransactionBorrowedResource::collection($borroweds),
                'return_books'=>TransactionReturnBookResource::collection($return_books),
               
                

            ]   
        ]);
    }
}