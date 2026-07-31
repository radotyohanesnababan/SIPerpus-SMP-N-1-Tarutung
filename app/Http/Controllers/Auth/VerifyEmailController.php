<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Auth\Events\Verified;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;

class VerifyEmailController extends Controller
{
    public function __invoke(Request $request, $id, $hash): RedirectResponse
    {
        $user = User::where('nisn', $id)->first();

        if (! $user) {
            return redirect()->route('login')->with('flash_message', [
                'message' => 'Pengguna tidak ditemukan.',
                'type' => 'error'
            ]);
        }

        if (! hash_equals((string) $hash, sha1($user->getEmailForVerification()))) {
            return redirect()->route('login')->with('flash_message', [
                'message' => 'Link verifikasi tidak valid.',
                'type' => 'error'
            ]);
        }

        if ($user->hasVerifiedEmail()) {
            return redirect()->route('login')->with('status', 'Email sudah terverifikasi sebelumnya. Silakan login.');
        }

        $user->forceFill([
            'email_verified_at' => now(),
        ])->save();

        event(new Verified($user));

        return redirect()->route('login')->with('status', 'Email berhasil diverifikasi! Silakan masuk ke akun Anda.');
    }
}