<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\TransactionBorrowedResource;
use App\Http\Resources\Admin\TransactionReturnBookResource;
use App\Models\Category;
use App\Models\Borrowed;
use App\Models\ReturnBook;
use App\Models\Book;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    
    public function index(){

        $borroweds = Borrowed::query()
            ->select(['id', 'user_nisn', 'book_id', 'created_at'])
            ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                return $query;
            },function($query){
                return $query->where('user_nisn', Auth::user()->nisn);
            })
            ->latest('created_at')
            ->limit(5)
            ->with(['user', 'book'])
            ->get();
            
        $return_books = ReturnBook::query()
            ->select(['id', 'user_nisn', 'book_id', 'created_at'])
            ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                return $query;
            },function($query){
                return $query->where('user_nisn', Auth::user()->nisn);
            })
            ->latest('created_at')
            ->limit(5)
            ->with(['user', 'book'])
            ->get();  
//         dd([
//     'auth_user' => Auth::user(),
//     'role'      => Auth::user()->getRoleNames(),
//     'nisn'      => Auth::user()->nisn,
//     'borrowed_count' => \App\Models\Borrowed::where('user_nisn', Auth::user()->nisn)->count(),
//     'all_count' => \App\Models\Borrowed::count(),
// ]);

        
        return inertia('Dashboard',[
            'page_settings'=>[
                'title'=>'Dashboard',
                'subtitle'=>'Statistik dan ringkasan informasi di platform ini',
                'method'=>'GET',
                
            ],
            'page_data'=>[
                'borroweds'=>TransactionBorrowedResource::collection($borroweds),
                'return_books'=>TransactionReturnBookResource::collection($return_books),
                'total_books'=>Auth::user()->hasAnyRole(['admin','member'])? Book::count() : 0,
                'total_categories'=>Auth::user()->hasAnyRole(['admin','member'])?Category::count() : 0,
                'total_users'=>Auth::user()->hasAnyRole(['admin'])? User::count() : 0,
                'total_borrowed' => Borrowed::query()
                    ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                        return $query;
                    },function($query){
                        return $query->where('user_nisn', Auth::user()->nisn);
                    })->count(),
                'total_returned' => ReturnBook::query()
                    ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                        return $query;
                    },function($query){
                        return $query->where('user_nisn', Auth::user()->nisn);
                    })->count(),
                

            ]   
        ]);
    }
}
