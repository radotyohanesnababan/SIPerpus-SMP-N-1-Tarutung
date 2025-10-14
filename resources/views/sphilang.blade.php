<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Surat Pernyataan Pengembalian Buku</title>
    <style>
        @page { margin: 2cm; }
        body {
            font-family: "Times New Roman", Times, serif;
            font-size: 12pt;
            line-height: 1.5;
        }
        .kop {
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            border-bottom: 2px solid black;
            padding-bottom: 6px;
            margin-bottom: 20px;
        }
        .kop img {
            position: absolute;
            left: 0;
            top: 0;
            width: 90px;
            height: 90px;
        }
        .kop-content {
            text-align: center;
            width: 100%;
        }
        .kop-content h3, .kop-content h4 {
            margin: 0;
        }
        .judul {
            text-align: center;
            font-weight: bold;
            text-decoration: underline;
            margin-top: 15px;
            margin-bottom: 5px;
        }
        .nomor { text-align: center; margin-bottom: 25px; }
        table { border-collapse: collapse; }
        td { padding: 3px 5px; vertical-align: top; }
        .section { margin-left: 30px; }
        .ttd { width: 100%; margin-top: 40px; }
        .ttd td { text-align: center; vertical-align: top; padding-top: 30px; }
    </style>
</head>
<body>
    <div class="kop">
        <img src="{{ public_path('storage/logosekolah.png') }}" alt="Logo Sekolah">
        <div class="kop-content">
            <h3>PEMERINTAH KABUPATEN TAPANULI UTARA</h3>
            <h4>DINAS PENDIDIKAN</h4>
            <h4>SMP NEGERI 1 TARUTUNG</h4>
            <p>Alamat: Jalan Nahum Situmorang No. 1, Kec. Tarutung, Kabupaten Tapanuli Utara</p>
        </div>
    </div>

    <div class="judul">SURAT PERNYATAAN KEHILANGAN BUKU</div>
    <div class="nomor">Nomor: ........................................</div>

    <p>Yang bertanda tangan di bawah ini:</p>

    <table class="section">
        <tr><td width="150">Nama Siswa</td><td width="10">:</td><td>{{ $returnBook->user->nama ?? '-' }}</td></tr>
        <tr><td>NISN</td><td>:</td><td>{{ $returnBook->user->nisn ?? '-' }}</td></tr>
    </table>

    <p>Dengan ini menyatakan bahwa saya telah meminjam buku perpustakaan dengan rincian sebagai berikut:</p>

    <table class="section">
        <tr><td width="150">Judul Buku</td><td width="10">:</td><td>{{ $returnBook->book->judul ?? '-' }}</td></tr>
        <tr><td>Kode Buku</td><td>:</td><td>{{ $returnBook->book->id ?? '-' }}</td></tr>
        <tr><td>Tanggal Pinjam</td><td>:</td>
            <td>{{ \Carbon\Carbon::parse($returnBook->borrowed->borrowed_at ?? '')->translatedFormat('d F Y') }}</td></tr>
    </table>

    <p>Namun, dengan ini saya menyatakan bahwa buku tersebut telah hilang dan tidak dapat dikembalikan dalam keadaan semula.</p>

    <p>Demikian surat pernyataan ini saya buat dengan sebenarnya tanpa paksaan dari pihak mana pun.
    Apabila di kemudian hari terdapat hal-hal yang tidak benar, saya bersedia menerima sanksi sesuai peraturan sekolah.</p>

    <table width="100%" style="margin-top:30px;">
        <tr>
            <td></td>
            <td style="text-align:center;">
                Tarutung, {{ \Carbon\Carbon::parse($returnBook->created_at)->translatedFormat('d F Y') }}<br>
                Yang membuat pernyataan,<br><br><br><br>
                ({{ $returnBook->user->name ?? '..........................................' }})
            </td>
        </tr>
    </table>

    <table class="ttd">
        <tr>
            <td>
                Mengetahui,<br>
                Orang Tua/Wali Siswa<br><br><br><br>
                (..........................................)
            </td>
            <td>
                Petugas Perpustakaan<br><br><br><br>
                (..........................................)
            </td>
        </tr>
    </table>

    <div style="text-align:center; margin-top:60px;">
        Menyetujui,<br>
        Kepala SMP Negeri 1 Tarutung<br><br><br><br>
        (..........................................)<br>
        NIP. ....................................
    </div>
</body>
</html>
