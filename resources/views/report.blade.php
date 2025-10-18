<!doctype html>
<html lang="id">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Laporan Perpustakaan</title>
  <style>
    body{font-family: Arial, Helvetica, sans-serif; color:#111}
    .container{max-width:900px;margin:24px auto;padding:18px;border:1px solid #ddd}
    .header{text-align:center;margin-bottom:18px}
    .header h1{margin:6px 0;font-size:18px}
    .header p{margin:2px 0;font-size:13px}
    .period{margin-bottom:18px;text-align:center}
    table{width:100%;border-collapse:collapse;margin-bottom:18px}
    table th, table td{border:1px solid #ccc;padding:8px;text-align:left;font-size:13px}
    table th{background:#f3f3f3}
    .two-col{display:flex;gap:16px}
    .card{flex:1;padding:12px;border:1px solid #eee;background:#fafafa}
    .chart-wrap{text-align:center;margin:12px 0}
    .footer{font-size:12px;color:#666;margin-top:8px}
    .small{font-size:13px;color:#333}
  </style>
</head>
<body>
  <div class="container">
    <div class="header">
      <h1>PEMERINTAH KABUPATEN TAPANULI UTARA</h1>
      <h1>DINAS PENDIDIKAN DAN KEBUDAYAAN</h1>
      <h1>SMP NEGERI 1 TARUTUNG</h1>
      <p>Jalan Nahum Situmorang Tarutung 22413 &nbsp; Provinsi Sumatera Utara</p>
      <p>Email : <a href="mailto:smpn1tarutung.taput@gmail.com">smpn1tarutung.taput@gmail.com</a></p>
    </div>

    <div class="period">
      <h2>LAPORAN PERPUSTAKAAN</h2>
      <p>{{ $start ?? 'DD/MM/YYYY' }} &ndash; {{ $end ?? 'DD/MM/YYYY' }}</p>
    </div>

    <!-- 1. Laporan Stok Buku -->
    <h3>1. Laporan Stok Buku</h3>

    <div class="card small">
      <strong>a. Total Stok Buku</strong>
      <p>Total Buku : {{ $totalBuku ?? 'xxx' }} Eksemplar</p>
      <p>Total Judul : {{ $totalJudul ?? 'xxx' }} Judul</p>
    </div>

    <div style="margin-top:12px">
      <strong>b. Daftar Buku Per Penerbit</strong>
      <table>
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Penerbit</th>
            <th>Jumlah Judul</th>
            <th>Jumlah Satuan</th>
          </tr>
        </thead>
        <tbody>
          @forelse(($publishers ?? []) as $i => $publisher)
            <tr>
              <td>{{ $i + 1 }}</td>
              <td>{{ $publisher['name'] }}</td>
              <td>{{ $publisher['titles'] }}</td>
              <td>{{ $publisher['copies'] }}</td>
            </tr>
          @empty
            <tr>
              <td colspan="4" style="text-align:center;color:#999">Tidak ada data penerbit</td>
            </tr>
          @endforelse
        </tbody>
      </table>
    </div>

    <div style="margin-top:12px">
      <strong>c. Buku baru selama periode ini</strong>
      <table>
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Buku</th>
            <th>Penerbit</th>
            <th>Jumlah Satuan</th>
          </tr>
        </thead>
        <tbody>
          @forelse(($new_books ?? []) as $i => $book)
            <tr>
              <td>{{ $i + 1 }}</td>
              <td>{{ $book['judul'] }}</td>
              <td>{{ $book['publisher'] }}</td>

            </tr>
          @empty
            <tr><td colspan="4" style="text-align:center;color:#999">Tidak ada buku baru</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

    <div style="margin-top:12px">
      <strong>d. Buku Hilang</strong>
      <table>
        <thead>
          <tr>
            <th>No</th>
            <th>Nama Buku</th>
            <th>Jumlah</th>
          </tr>
        </thead>
        <tbody>
          @forelse(($lost_books ?? []) as $i => $book)
            <tr>
              <td>{{ $i + 1 }}</td>
              <td>{{ $book['title'] }}</td>
              <td>{{ $book['count'] }}</td>
            </tr>
          @empty
            <tr><td colspan="3" style="text-align:center;color:#999">Tidak ada laporan buku hilang</td></tr>
          @endforelse
        </tbody>
      </table>
    </div>

    <!-- 2. Laporan Peminjaman Buku -->
    <h3>2. Laporan Peminjaman Buku</h3>
    <div class="two-col" style="margin-bottom:12px">
      <div class="card">
        <p><strong>Total Buku yang dipinjam :</strong> {{ $borrowed_total ?? '-' }}</p>
        <p><strong>Rata-rata durasi peminjaman :</strong> {{ $avg_duration ?? '-' }} hari</p>
      </div>
      <div class="card">
        <p><strong>Buku Paling Sering Dipinjam :</strong></p>
        <ol>
          @forelse(($top_borrowed ?? []) as $book)
            <li>{{ $book }}</li>
          @empty
            <li>-</li>
          @endforelse
        </ol>
      </div>
    </div>

    <!-- 3. Laporan Pengembalian Buku -->
    <h3>3. Laporan Pengembalian Buku</h3>
    <div class="card small">
      <p>Jumlah buku yang dikembalikan tepat waktu : {{ $returned_on_time ?? '-' }}</p>
      <p>Jumlah buku yang terlambat dikembalikan : {{ $returned_late ?? '-' }}</p>
      <p>Rata rata durasi keterlambatan : {{ $avg_late_duration ?? '-' }} hari</p>
    </div>

    <!-- 4. Laporan Aktifitas Ebook -->
    <h3>4. Laporan Aktifitas Ebook</h3>
    <div class="card small">
        <p>Total Ebook tersedia : {{ $ebook_total ?? '-' }} Judul</p>
      <p>E-book paling sering di download : {{ $ebook_top ?? '-' }}</p>
    </div>

    <!-- 5. Aktivitas Anggota Perpustakaan -->
    <h3>5. Aktivitas Anggota Perpustakaan</h3>
    <p><strong>Total Peminjaman Berdasarkan Kelas</strong></p>
    <table>
      <thead>
        <tr>
          <th>Kelas</th>
          <th>Total Peminjaman</th>
        </tr>
      </thead>
      <tbody>
        @foreach(($class_totals ?? ['VII'=>0,'VIII'=>0,'IX'=>0]) as $kelas => $total)
          <tr>
            <td>{{ $kelas }}</td>
            <td>{{ $total }}</td>
          </tr>
        @endforeach
      </tbody>
    </table>

    <div class="chart-wrap" style="position: relative; width: 100%; max-width: 600px; height: 300px; margin: auto;">
    <p>Distribusi Peminjaman Berdasarkan Kelas</p>
    <canvas id="classChart"></canvas>
    </div>

    <div class="footer">
      <p>Untuk pertanyaan: <a href="mailto:smpn1tarutung.taput@gmail.com">smpn1tarutung.taput@gmail.com</a></p>
    </div>

  </div>

  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    (function(){
      try{
        var labels = @json($chart_labels ?? array_keys(($class_totals ?? ['VII'=>0,'VIII'=>0,'IX'=>0])));
        var data = @json($chart_data ?? array_values(($class_totals ?? ['VII'=>0,'VIII'=>0,'IX'=>0])));

        
        if(typeof Chart !== 'undefined'){
          var ctx = document.getElementById('classChart').getContext('2d');
          new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: labels,
        datasets: [{
            data: data,
            backgroundColor: ['#36A2EB','#FFCE56','#FF6384'],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            legend: {
                position: 'bottom'
            }
        }
    }
});
        } else {
         
          var c = document.getElementById('classChart');
          c.parentNode.innerHTML = '<p style="color:#666">(Chart tidak tersedia — sertakan Chart.js atau kirim data chart dari controller)</p>';
        }
      }catch(e){
        console.warn('Chart render skipped', e);
      }
    })();
  </script>

</body>
</html>
