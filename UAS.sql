-- Nama : Lalu Andra Khairil Ramadhan
-- Nim : 23241009
-- Kelas : A - 4

USE pti_mart;

-- soal 1 
/*munculkan nama produk, tgl transaksi, bulan, tahun dan selisih hari 
dari transaksi dengan tgl 30 juni 2023 atas semua produk distransaksikan

SELECT 
    nama_produk,
    tgl_transaksi,
    MONTHNAME(tgl_transaksi) AS bulan,
    YEAR(tgl_transaksi) AS tahun,
    DATEDIFF('2023-06-30', tgl_transaksi) AS selisih_hari 
FROM 
    tr_penjualan_dqlab;




-- soal 2
/*tampilkan nama pelanggan dan nilai transaksinya dengan nilai transaksi terkecil




-- soal 3
/*tampilkan bulan, nama produk, kategori dan harga dari produk yang tidak pernah terjual pada bulan mei







