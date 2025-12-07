<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Mail\DueReminderMail;
use App\Models\Borrowed;
use Illuminate\Support\Facades\Mail;
use Carbon\Carbon;


class SendDueReminder extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'reminder:japo-kembali';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Kirim email pengingat kepada pengguna tentang peminjaman buku yang akan jatuh tempo';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $dayBefore = 3; 
        $targetDate = Carbon::today()->addDays($dayBefore)->toDateString();

        $borrowings = Borrowed::with(['user','book'])
            ->whereDate('returned_at', $targetDate)
            ->whereDoesntHave('returnBook')
            ->get();

        foreach ($borrowings as $borrowed) {
            Mail::to($borrowed->user->email)->queue(new DueReminderMail($borrowed));
        }

        $this->info("Jatuh Tempo terkirim untuk {$borrowings->count()} peminjam.");
    }
}
