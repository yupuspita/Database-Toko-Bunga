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
```sql
-- Membuat database baru dengan nama TokoBungaDB
CREATE DATABASE TokoBungaDB;

-- Menggunakan database TokoBungaDB sebagai database aktif
USE TokoBungaDB;

-- Membuat tabel Pelanggan
CREATE TABLE Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY, -- Nomor identifikasi unik untuk setiap pelanggan, diatur secara otomatis, berfungsi sebagai kunci utama
    nama VARCHAR(100) NOT NULL, -- Nama pelanggan, wajib diisi, maksimal 100 karakter
    email VARCHAR(100) UNIQUE NOT NULL, -- Alamat email pelanggan, wajib diisi, harus unik, maksimal 100 karakter
    telepon VARCHAR(15), -- Nomor telepon pelanggan, maksimal 15 karakter
    total_pengeluaran DECIMAL(10, 2) DEFAULT 0.00 -- Total pengeluaran pelanggan, nilai awal 0.00 dengan dua digit desimal
);

-- Membuat tabel Produk
CREATE TABLE Produk (
    id_produk INT AUTO_INCREMENT PRIMARY KEY, -- Nomor identifikasi unik untuk setiap produk, diatur secara otomatis, berfungsi sebagai kunci utama
    nama VARCHAR(100) NOT NULL, -- Nama produk, wajib diisi, maksimal 100 karakter
    harga DECIMAL(10, 2) NOT NULL -- Harga produk, wajib diisi, dengan dua digit desimal
);

-- Membuat tabel Pesanan
CREATE TABLE Pesanan (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY, -- Nomor identifikasi unik untuk setiap pesanan, diatur secara otomatis, berfungsi sebagai kunci utama
    id_pelanggan INT, -- Nomor identifikasi pelanggan yang membuat pesanan
    tanggal_pesanan DATETIME DEFAULT CURRENT_TIMESTAMP, -- Tanggal dan waktu pesanan dibuat, secara otomatis diset pada waktu saat pesanan dibuat
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan) -- Kunci asing yang mengacu pada kolom id_pelanggan di tabel Pelanggan
);

-- Membuat tabel ItemPesanan
CREATE TABLE ItemPesanan (
    id_item_pesanan INT AUTO_INCREMENT PRIMARY KEY, -- Nomor identifikasi unik untuk setiap item pesanan, diatur secara otomatis, berfungsi sebagai kunci utama
    id_pesanan INT, -- Nomor identifikasi pesanan
    id_produk INT, -- Nomor identifikasi produk yang dipesan
    jumlah INT NOT NULL, -- Jumlah produk yang dipesan, wajib diisi
    FOREIGN KEY (id_pesanan) REFERENCES Pesanan(id_pesanan), -- Kunci asing yang mengacu pada kolom id_pesanan di tabel Pesanan
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk) -- Kunci asing yang mengacu pada kolom id_produk di tabel Produk
);

-- Membuat trigger untuk menghitung dan memperbarui total pengeluaran setelah pesanan dimasukkan
DELIMITER //
CREATE TRIGGER setelah_insert_pesanan 
AFTER INSERT ON Pesanan 
FOR EACH ROW 
BEGIN 
    DECLARE total DECIMAL(10, 2);

    -- Menghitung total pengeluaran untuk pesanan baru
    SET total = (
        SELECT SUM(p.harga * ip.jumlah) 
        FROM ItemPesanan ip 
        JOIN Produk p ON ip.id_produk = p.id_produk 
        WHERE ip.id_pesanan = NEW.id_pesanan
    );

    -- Memperbarui total pengeluaran pelanggan berdasarkan pesanan baru
    UPDATE Pelanggan 
    SET total_pengeluaran = total_pengeluaran + total 
    WHERE id_pelanggan = NEW.id_pelanggan;
END;
//
DELIMITER ;

-- Membuat view untuk menampilkan data pesanan pelanggan
CREATE VIEW TampilanPesananPelanggan AS
SELECT p.id_pelanggan, p.nama, p.email, COUNT(o.id_pesanan) AS total_pesanan, p.total_pengeluaran
FROM Pelanggan p
LEFT JOIN Pesanan o ON p.id_pelanggan = o.id_pelanggan
GROUP BY p.id_pelanggan, p.nama, p.email, p.total_pengeluaran;

-- Mengisi tabel Pelanggan dengan data contoh
INSERT INTO Pelanggan (nama, email, telepon, total_pengeluaran)
VALUES
    ('Andi', 'andi@example.com', '08123456789', 0.00),
    ('Budi', 'budi@example.com', '08234567890', 0.00),
    ('Cindy', 'cindy@example.com', '08345678901', 0.00);

-- Mengisi tabel Produk dengan data contoh
INSERT INTO Produk (nama, harga)
VALUES
    ('Mawar Merah', 35000.00),
    ('Anggrek Putih', 45000.00),
    ('Lily Kuning', 30000.00);

-- Mengisi tabel Pesanan dengan data contoh
INSERT INTO Pesanan (id_pelanggan)
VALUES
    (1), -- Andi
    (2), -- Budi
    (3); -- Cindy

-- Mengisi tabel ItemPesanan dengan data contoh
INSERT INTO ItemPesanan (id_pesanan, id_produk, jumlah)
VALUES
    (1, 1, 2), -- Andi membeli 2 Mawar Merah
    (1, 3, 1), -- Andi membeli 1 Lily Kuning
    (2, 2, 3), -- Budi membeli 3 Anggrek Putih
    (3, 1, 1), -- Cindy membeli 1 Mawar Merah
    (3, 2, 2); -- Cindy membeli 2 Anggrek Putih

-- Menampilkan total pengeluaran setiap pelanggan
SELECT p.id_pelanggan, p.nama, SUM(ip.jumlah * pr.harga) AS total_pengeluaran
FROM Pelanggan p
JOIN Pesanan o ON p.id_pelanggan = o.id_pelanggan
JOIN ItemPesanan ip ON o.id_pesanan = ip.id_pesanan
JOIN Produk pr ON ip.id_produk = pr.id_produk
GROUP BY p.id_pelanggan, p.nama;

-- Menampilkan total penjualan setiap produk
SELECT pr.id_produk, pr.nama, SUM(ip.jumlah) AS total_terjual
FROM ItemPesanan ip
JOIN Produk pr ON ip.id_produk = pr.id_produk
GROUP BY pr.id_produk, pr.nama;

-- Menampilkan rata-rata pengeluaran pelanggan
SELECT AVG(total_pengeluaran) AS rata_rata_pengeluaran
FROM (
    SELECT SUM(ip.jumlah * pr.harga) AS total_pengeluaran
    FROM Pelanggan p
    JOIN Pesanan o ON p.id_pelanggan = o.id_pelanggan
    JOIN ItemPesanan ip ON o.id_pesanan = ip.id_pesanan
    JOIN Produk pr ON ip.id_produk = pr.id_produk
    GROUP BY p.id_pelanggan
) AS subquery;

-- Menampilkan produk terlaris
SELECT pr.nama, SUM(ip.jumlah) AS total_terjual
FROM ItemPesanan ip
JOIN Produk pr ON ip.id_produk = pr.id_produk
GROUP BY pr.id_produk, pr.nama
ORDER BY total_terjual DESC
LIMIT 1;

-- Membuat indeks untuk mempercepat pencarian di tabel Pesanan dan ItemPesanan
CREATE INDEX idx_id_pelanggan ON Pesanan(id_pelanggan);
CREATE INDEX idx_id_pesanan ON ItemPesanan(id_pesanan);
CREATE INDEX idx_id_produk ON ItemPesanan(id_produk);
CREATE UNIQUE INDEX idx_email ON Pelanggan(email);

-- Menampilkan data pelanggan dengan pesanan menggunakan LEFT JOIN
SELECT p.nama, o.id_pesanan, o.tanggal_pesanan
FROM Pelanggan p
LEFT JOIN Pesanan o ON p.id_pelanggan = o.id_pelanggan;

-- Menampilkan detail pesanan menggunakan INNER JOIN
SELECT o.id_pesanan, pr.nama, ip.jumlah
FROM Pesanan o
INNER JOIN ItemPesanan ip ON o.id_pesanan = ip.id_pesanan
INNER JOIN Produk pr ON ip.id_produk = pr.id_produk;

-- Menampilkan pelanggan yang total pengeluarannya di atas rata-rata menggunakan subquery
SELECT * FROM Pelanggan
WHERE total_pengeluaran > (SELECT AVG(total_pengeluaran) FROM Pelanggan);

-- Menampilkan produk yang terjual lebih dari 3 menggunakan HAVING
SELECT pr.nama, SUM(ip.jumlah) AS total_terjual
FROM ItemPesanan ip
INNER JOIN Produk pr ON ip.id_produk = pr.id_produk
GROUP BY pr.nama
HAVING total_terjual > 3;

-- Menampilkan produk yang mengandung kata 'Mawar' menggunakan wildcard
SELECT * FROM Produk
WHERE nama LIKE '%Mawar%';

-- Menambahkan lebih banyak data ke tabel Pesanan
INSERT INTO Pesanan (id_pelanggan)
VALUES
    (1), -- Andi
    (1), -- Andi
    (2), -- Budi
    (3); -- Cindy

-- Menambahkan lebih banyak data ke tabel ItemPesanan
INSERT INTO ItemPesanan (id_pesanan, id_produk, jumlah)
VALUES
    (1, 1, 5), -- Andi membeli 5 Bunga Mawar
    (1, 2, 3), -- Andi membeli 3 Bunga Tulip
    (2, 3, 10), -- Andi membeli 10 Bunga Matahari
    (3, 1, 2), -- Budi membeli 2 Bunga Mawar
    (4, 2, 7); -- Cindy membeli 7 Bunga Tulip

-- Menghitung total pengeluaran untuk setiap pelanggan dan memperbarui tabel Pelanggan
UPDATE Pelanggan p
JOIN (
    SELECT 
        pe.id_pelanggan, 
        SUM(pr.harga * ip.jumlah) AS total_pengeluaran
    FROM Pesanan pe
    JOIN ItemPesanan ip ON pe.id_pesanan = ip.id_pesanan
    JOIN Produk pr ON ip.id_produk = pr.id_produk
    GROUP BY pe.id_pelanggan
) AS subquery ON p.id_pelanggan = subquery.id_pelanggan
SET p.total_pengeluaran = subquery.total_pengeluaran;

-- Memeriksa data di tabel Pelanggan setelah pembaruan
SELECT * FROM Pelanggan;
```
