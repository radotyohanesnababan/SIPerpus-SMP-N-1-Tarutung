<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Resources\Admin\LoanStatisticResource;
use App\Http\Resources\Admin\TransactionBorrowedResource;
use App\Http\Resources\Admin\TransactionReturnBookResource;
use App\Http\Resources\BookDashboardResource;
use App\Models\Category;
use App\Models\Borrowed;
use App\Models\ReturnBook;
use App\Models\Book;
use App\Models\Ebook;
use App\Models\User;
use Carbon\Carbon;
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
        
        return inertia('Dashboard',[
            'page_settings'=>[
                'title'=>'Dashboard',
                'subtitle'=>'Statistik dan ringkasan informasi di platform ini',
                'method'=>'GET',
                
            ],
            'page_data'=>[
                'transactionsChart'=>$this->chart(),
                'borroweds'=>TransactionBorrowedResource::collection($borroweds),
                'return_books'=>TransactionReturnBookResource::collection($return_books),
                'most_loan_books'=> BookDashboardResource::collection(Book::mostLoanBooks(5)),
                'newest_books'=> BookDashboardResource::collection(Book::newestBooks(5)),
                'newest_ebooks'=> BookDashboardResource::collection(Ebook::newestEbooks(5)),
                'most_download_ebooks'=> BookDashboardResource::collection(Ebook::mostDownloadedEbooks(5)),
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

    public function chart(): array {
        $end_date = Carbon::now();
        $start_date = $end_date->copy()->subMonth(3)->startOfMonth();
        $borroweds = Borrowed::query()
            ->selectRaw('DATE(created_at) as date, COUNT(*) as borroweds')
            ->whereBetween('created_at', [$start_date, $end_date])
            ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                return $query;
            },function($query){
                return $query->where('user_nisn', Auth::user()->nisn);
            })
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('borroweds', 'date');

        $return_books = ReturnBook::query()
            ->selectRaw('DATE(created_at) as date, COUNT(*) as returned')
            ->whereBetween('created_at', [$start_date, $end_date])
            ->when(Auth::user()->hasAnyRole(['admin']),function($query){
                return $query;
            },function($query){
                return $query->where('user_nisn', Auth::user()->nisn);
            })
            ->whereNotNull('created_at')
            ->groupBy('date')
            ->orderBy('date')
            ->pluck('returned', 'date');
        
            $charts =[];
            $period = Carbon::parse($start_date) ->daysUntil($end_date);
            //dd($return_books, $borroweds);
            foreach($period as $date){
                $date_string = $date->toDateString();
                $charts[] =[
                    'date' => $date_string,
                    'borrowed' => $borroweds->get($date_string, 0),
                    'return_book' => $return_books->get($date_string, 0),
                ];
            }

            return $charts;
    }
}
