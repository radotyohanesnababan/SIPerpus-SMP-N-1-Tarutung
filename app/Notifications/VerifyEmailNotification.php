<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\URL;

class VerifyEmailNotification extends Notification
{
    use Queueable;

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        $verificationUrl = $this->verificationUrl($notifiable);

        return (new MailMessage)
            ->subject('Verifikasi Alamat Email - SPARTA')
            ->withSymfonyMessage(function ($message){
                $message->getHeaders()->addTextHeader('X-Mailin-Track', '0');
            })
            ->view('emails.verify-email', [
                'url' => $verificationUrl,
                'email' => $notifiable->getEmailForVerification(),
                'nama' => $notifiable->nama,
            ]);
    }

    protected function verificationUrl($notifiable)
    {
        return URL::temporarySignedRoute(
            'verification.verify',
            Carbon::now()->addMinutes(Config::get('auth.verification.expire', 60)),
            [
                
                'id' => $notifiable->getKey(), 
                'hash' => sha1($notifiable->getEmailForVerification()),
            ]
        );
    }
}