<?php

namespace App\Http\Controllers\Admin;

use App\Enums\MessageType;
use App\Http\Controllers\Controller;
use App\Models\Kelas;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Inertia\Response;
use Inertia\Inertia;
use PhpOffice\PhpSpreadsheet\IOFactory;

class MemberImportController extends Controller
{
    public function index(): Response
    {
        return Inertia::render('Admin/ImportMembers/Index', [
            'page_settings' => [
                'title' => 'Impor Anggota',
                'subtitle' => 'Import Anggota dari file Excel',
            ],
        ]);
    }
    public function import(Request $request)
{
    $request->validate([
        'file' => 'required|mimes:xlsx,xls',
    ]);

    $file = $request->file('file')->getRealPath();
    $spreadsheet = IOFactory::load($file);
    $sheet = $spreadsheet->getActiveSheet();
    $rows = $sheet->toArray(null, true, true, true);
    $header = array_map('strtolower', array_shift($rows));

    $created = 0;
    $updated = 0;

    try {
        DB::transaction(function () use ($rows, $header, &$created, &$updated) {

            foreach ($rows as $row) {
                $data = array_combine($header, $row);
                if (collect($data)->filter(fn($v) => trim($v) !== '')->isEmpty()) {
                    continue;
                }
                $tingkat = trim($data['kelas'] ?? '');
                if ($tingkat === '') {
                    continue;
                }
                $nisn = trim($data['nisn'] ?? '');
                if ($nisn === '') {
                    continue;
                }
                $nama = trim($data['nama'] ?? '-');
                $email = generateStudentEmail($nama, $nisn);

                $kelas = Kelas::where('tingkat', $tingkat)->first();
                $kelas_id = $kelas ? $kelas->id : null;

                $anggota = User::updateOrCreate(
                    ['nisn' => $nisn],
                    [
                        'nama'     => $nama,
                        'email'    => $email,
                        'password' => bcrypt($nisn),
                        'kelas_id' => $kelas_id,
                    ]
                );
                $anggota->syncRoles('member');

                $anggota->wasRecentlyCreated ? $created++ : $updated++;
            }
               

        });

    
    flashMessage("Import berhasil. {$created} anggota baru ditambahkan.",'success');
    return to_route('admin.import-members.index');
    

    } catch (\Throwable $e) {
        flashMessage(
        MessageType::ERROR->message(error: $e->getMessage()),'error'
    );
    return to_route('admin.import-members.index');
    }
}
}