# Database-Toko-Bunga
## Entity Relationship Diagram Toko Bunga
![Screenshot 2024-06-24 232415](https://github.com/yupuspita/Database-Toko-Bunga/assets/168649202/41f9d354-ba05-4aa8-9bd6-419d3c7532fb)
1. Pelanggan dan Pesanan: Relasi One-to-Many
- Satu pelanggan dapat membuat banyak pesanan.
- Kolom id_pelanggan di tabel Pesanan adalah Foreign Key yang mengacu ke kolom id_pelanggan di tabel Pelanggan.
2. Pesanan dan ItemPesanan: Relasi One-to-Many
- Satu pesanan dapat memiliki banyak item pesanan.
- Kolom id_pesanan di tabel ItemPesanan adalah Foreign Key yang mengacu ke kolom id_pesanan di tabel Pesanan.
3. Produk dan ItemPesanan: Relasi One-to-Many
- Satu produk dapat muncul di banyak item pesanan.
- Kolom id_produk di tabel ItemPesanan adalah Foreign Key yang mengacu ke kolom id_produk di tabel Produk.
## Deskripsi Sistem Toko Bunga
### Latar Belakang
Toko bunga adalah salah satu jenis usaha yang menyediakan berbagai jenis bunga dan rangkaian bunga untuk berbagai keperluan, seperti pernikahan, ulang tahun, acara korporat, dan lainnya. Seiring dengan perkembangan teknologi dan meningkatnya permintaan pelanggan, pengelolaan toko bunga secara manual menjadi kurang efisien dan rentan terhadap kesalahan manusia. Oleh karena itu, dibutuhkan sebuah sistem basis data yang terkomputerisasi untuk membantu mengelola operasi bisnis secara lebih efektif dan efisien
### Tujuan
Sistem basis data untuk toko bunga ini dirancang untuk mencapai beberapa tujuan utama:
1. Mengelola Data Pelanggan: Menyimpan informasi pelanggan dengan aman dan terorganisir, termasuk data kontak dan riwayat pembelian mereka.
2. Mengelola Inventaris Produk: Memantau ketersediaan dan harga produk bunga secara real-time, sehingga memudahkan pengelolaan stok dan penetapan harga.
3. Mengelola Pesanan dan Penjualan: Melacak pesanan yang masuk, memproses penjualan, dan menghasilkan laporan penjualan yang akurat.
4. Meningkatkan Efisiensi Operasional: Mengurangi kesalahan manual dan meningkatkan kecepatan pelayanan melalui automasi berbagai proses bisnis.
5. Memberikan Layanan Pelanggan yang Lebih Baik: Memungkinkan personalisasi layanan dan penawaran khusus berdasarkan data riwayat pelanggan.
### Ruang Lingkup
Sistem basis data toko bunga mencakup beberapa komponen utama:
- Pelanggan: Menyimpan informasi tentang pelanggan, seperti nama, email, nomor telepon, dan total pengeluaran mereka.
- Produk: Menyimpan informasi tentang produk bunga, termasuk nama produk dan harga.
- Pesanan: Melacak pesanan yang dilakukan oleh pelanggan, mencakup tanggal pesanan dan total nilai pesanan.
- Item Pesanan: Mendetailkan setiap produk yang dipesan dalam setiap pesanan, termasuk jumlah dan harga masing-masing produk.
- Laporan: Menyediakan berbagai laporan operasional dan keuangan, seperti total pengeluaran pelanggan dan total penjualan produk.
### Spesifikasi Teknis
1. Basis Data
Basis Data: MySQL
MySQL digunakan untuk menyimpan semua informasi tentang pelanggan, produk bunga, dan pesanan mereka. Ini dipilih karena kehandalannya dan kemampuannya dalam mengelola data dengan baik.
2. Bahasa Pemrograman
Bahasa Pemrograman: SQL (Structured Query Language)
SQL digunakan untuk mengambil data dari basis data, menambahkan data baru, mengubah data yang sudah ada, dan melakukan berbagai operasi lainnya. Ini adalah bahasa standar untuk bekerja dengan basis data seperti MySQL.
3. Indexing
Digunakan untuk membuat pencarian data lebih cepat. Misalnya, ada indeks untuk mencari data berdasarkan ID pelanggan, ID pesanan, dan ID produk.
4. View
Berfungsi untuk menyederhanakan query yang kompleks. Misalnya, kita bisa membuat tampilan yang menunjukkan informasi tentang pelanggan dan total pengeluaran mereka secara langsung tanpa harus menulis query yang rumit setiap kali.
5. Trigger
Digunakan untuk melakukan tindakan otomatis ketika ada peristiwa tertentu dalam basis data. Contohnya, kita bisa membuat trigger untuk menghitung total pengeluaran pelanggan setiap kali ada pesanan baru dimasukkan ke dalam sistem.
6. Backup dan Recovery
Data di-backup secara teratur menggunakan metode mysqldump untuk mengamankan informasi pelanggan dan riwayat pesanan. Ini penting untuk memastikan bahwa data tetap aman dan dapat dipulihkan jika terjadi masalah.
7. Keamanan
Akses ke data dijaga dengan baik menggunakan izin akses yang tepat. Data sensitif seperti informasi pelanggan dienkripsi untuk melindungi privasi mereka. Langkah-langkah keamanan ini penting untuk memastikan bahwa informasi pelanggan tetap aman dan terlindungi dari akses yang tidak sah.
### Manfaat
Dengan menerapkan sistem basis data ini, toko bunga dapat meraih berbagai manfaat, antara lain:
- Peningkatan Efisiensi: Proses bisnis yang lebih cepat dan minim kesalahan.
- Peningkatan Layanan Pelanggan: Layanan yang lebih personal dan responsif berdasarkan riwayat pembelian.
- Pengambilan Keputusan yang Lebih Baik: Laporan dan analisis data yang akurat membantu dalam pengambilan keputusan strategis.
- Pengelolaan Stok yang Lebih Baik: Memastikan ketersediaan produk yang optimal dan mengurangi kelebihan stok atau kekurangan stok.
- Keamanan Data yang Lebih Baik: Data yang tersimpan dengan aman dan terlindungi dari kehilangan atau kerusakan.
### Kesimpulan
Sistem basis data untuk toko bunga adalah alat yang penting untuk menghadapi tantangan operasional dan memanfaatkan peluang bisnis secara lebih efektif. Dengan sistem ini, toko bunga dapat mengoptimalkan operasionalnya, meningkatkan layanan pelanggan, dan mengambil keputusan bisnis yang lebih baik berdasarkan data yang akurat dan terstruktur.

## Skema Basis Data

