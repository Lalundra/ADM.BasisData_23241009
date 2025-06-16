-- Nama: Lalu Andra Khairil Ramadhan
-- Nim: 23241009
-- Kelas: A
-- Modul - 4: ORDER BY, Fungsi Agregasi, GROUP BY, dan HAVING


USE pti_mart;
-- Praktek 1 ORDER BY
SELECT * FROM tr_penjualan_dqlab ORDER BY qty;
SELECT nama_produk, qty FROM tr_penjualan_dqlab;
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty;

-- Praktek 2 ORDER BY 2 KOLOM
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty, nama_produk;

-- Latihan Mandiri
-- nomer 1
SELECT * FROM tr_penjualan_dqlab ORDER BY qty, tgl_transaksi;
-- nomer 2
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan;
-- nomer 3
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat;

-- ASC/Ascending (kecil ke besar) dan DESC/Descending (besar ke kecil)
-- Praktek 3
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC;
SELECT nama_produk, qty FROM tr_penjualan_dqlab ORDER BY qty DESC, nama_produk DESC;

-- Latihan Mandiri 2
-- nomer 1
SELECT * FROM tr_penjualan_dqlab ORDER BY tgl_transaksi DESC, qty ASC;
-- nomer 2
SELECT * FROM ms_pelanggan_dqlab ORDER BY nama_pelanggan DESC;
-- nomer 3
SELECT * FROM ms_pelanggan_dqlab ORDER BY alamat DESC;

-- Praktek 5
SELECT nama_produk, qty, harga, qty*harga AS total
FROM tr_penjualan_dqlab
ORDER BY qty*harga DESC;

-- Latihan Mandiri 3
SELECT * FROM tr_penjualan_dqlab;
SELECT 
  nama_produk,
  qty,
  harga,
  diskon_persen,
  harga * (diskon_persen / 100) AS diskon,
  harga - (harga * (diskon_persen / 100)) AS harga_setelah_diskon
FROM tr_penjualan_dqlab
ORDER BY diskon;

-- praktek 6: menggunakan Where dengan Order by
SELECT nama_produk, qty FROM tr_penjualan_dqlab 
WHERE nama_produk LIKE 'F%'
ORDER BY qty DESC;

-- Latihan Mandiri 4
-- nomer 1
SELECT * FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
ORDER BY harga DESC;
-- nomer 2
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab
WHERE harga >= 100000
ORDER BY harga DESC;
-- nomer 3
SELECT nama_produk, qty, harga FROM tr_penjualan_dqlab
WHERE harga >= 100000 OR nama_produk LIKE 'T%'
ORDER BY diskon_persen DESC;

SELECT * FROM tr_penjualan_dqlab ORDER BY diskon_persen DESC;


--- FUNGSI AGREGASI ---
-- SUM (menjumlahkan nilai)
SELECT SUM(qty) AS total_qty FROM tr_penjualan_dqlab;

-- praktek 8
-- COUNT (menghitung jumlah baris)
SELECT COUNT(*) AS jumlah_baris FROM tr_penjualan_dqlab;
SELECT * FROM tr_penjualan_dqlab;

-- praktek 9
-- menggunakan 2 fungsi agregasi (sum dan count)
SELECT SUM(qty) AS total_qty, COUNT(*) AS jumlah_baris FROM tr_penjualan_dqlab;

-- praktek 10
SELECT AVG(qty) AS rata_rata, MAX(qty) AS maximum, MIN(qty) AS minimum FROM tr_penjualan_dqlab;
select qty from tr_penjualan_dqlab;
-- SELECT nama_produk, SUM(qty) AS total_terjual
-- FROM tr_penjualan_dqlab
-- GROUP BY nama_produk;

-- praktek 11
-- COUNT (DISTINC)

-- tanpa count(distinc)
SELECT COUNT(nama_produk) FROM tr_penjualan_dqlab;

-- dengan count(distinc)
SELECT COUNT(DISTINCT nama_produk) FROM tr_penjualan_dqlab;

-- praktek 12
SELECT COUNT(DISTINCT nama_produk), COUNT(nama_produk) FROM tr_penjualan_dqlab;
select nama_produk from tr_penjualan_dqlab;
-- praktek 13
SELECT nama_produk, MAX(qty) FROM tr_penjualan_dqlab;

-- praktek 14
-- group by (pengelompokan isi data dari 1 kolom atau lebih dari biasanya digabung dengan fungsi agregasi)
-- ambil nilai dari pengelompokan nama produk dari tabel penjualan
SELECT nama_produk FROM tr_penjualan_dqlab GROUP BY nama_produk;

-- praktek 15
-- penggunaan group by dengan 2 kolom
SELECT nama_produk, qty FROM tr_penjualan_dqlab GROUP BY nama_produk, qty;

-- praktek 16
-- group by + agregasi
SELECT nama_produk, SUM(qty) FROM tr_penjualan_dqlab GROUP BY nama_produk;

-- praktek 17
-- group by + agregasi + order by
SELECT nama_produk, SUM(qty) 
FROM tr_penjualan_dqlab 
GROUP BY nama_produk 
ORDER BY SUM(qty) DESC;

--- HAVING adalah kata kunci untuk filtering atau penyaringan pada hasil agregasi dengan group by ---
-- praktek 18
SELECT nama_produk, SUM(qty) AS produk_terjual 
FROM tr_penjualan_dqlab 
GROUP BY nama_produk 
HAVING SUM(qty) >2; 

-- Latihan Mandiri
-- 1
SELECT nama_produk, SUM(qty) AS produk_terjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) >4;
-- 2
SELECT nama_produk, SUM(qty) AS produk_terjual
FROM tr_penjualan_dqlab
GROUP BY nama_produk
HAVING SUM(qty) =9;
-- 3
SELECT nama_produk, SUM((harga * qty) - diskon_persen) AS total_penjualan
FROM tr_penjualan_dqlab
GROUP BY nama_produk
ORDER BY total_penjualan DESC;

-- tesss ajaa
-- SELECT nama_produk, qty, harga, diskon_persen, 
-- 	(qty*harga) AS total_harga, 
-- 	SUM(qty*harga) - (qty * harga * ( diskon_persen / 100 )) AS Total_setelah_Diskon
-- FROM tr_penjualan_dqlab
-- GROUP BY nama_produk, qty
-- HAVING diskon_persen > 0
-- ORDER BY SUM(qty) DESC;
-- perbaikan
-- jika pakai where ga perlu sum
-- SELECT nama_produk, 
--        qty, 
--        harga, 
--        diskon_persen, 
--        (qty * harga) AS total_harga,
--        (qty * harga * (1 - diskon_persen / 100)) AS total_setelah_diskon
-- FROM tr_penjualan_dqlab
-- WHERE diskon_persen > 0
-- ORDER BY qty DESC;
-- -- dengan group by dan having
-- SELECT nama_produk, diskon_persen,
--        SUM(qty) AS total_order,
--        SUM(harga) AS total_harga_satuan,
--        SUM(qty * harga) AS total_harga,
--        SUM(qty * harga * (diskon_persen / 100)) AS total_diskon,
--        SUM(qty * harga) - SUM(qty * harga * (diskon_persen / 100)) AS total_setelah_diskon
-- FROM tr_penjualan_dqlab
-- GROUP BY nama_produk, diskon_persen
-- HAVING diskon_persen > 0
-- ORDER BY total_setelah_diskon DESC;


-- select nama_produk, qty, harga, sum (qty * harga) as total_belanja
-- from tr_penjualan_dqlab
-- group by qty
-- having qty > 3
-- order by total_belanja desc;

-- SELECT nama_produk, qty, harga, qty * harga AS total_belanja
-- FROM tr_penjualan_dqlab
-- WHERE qty > 3
-- ORDER BY total_belanja DESC;

-- select nama_produk, sum(qty) as jumlah_terjual
-- from tr_penjualan_dqlab
-- group by nama_produk
-- having jumlah_terjual > 5
-- order by jumlah_terjual asc;

-- select nama_produk, qty, harga, diskon_persen, 
-- 	sum(qty * harga) as total_sebelum_diskon, 
-- 	sum(qty * harga * (diskon_persen / 100)) as total_diskon,
-- 	sum(qty * harga) - sum(qty * harga * (diskon_persen / 100)) as total_setelah_diskon
-- from tr_penjualan_dqlab
-- where diskon_persen > 0
-- group by nama_produk
-- order by total_setelah_diskon desc;

-- SELECT nama_produk, diskon_persen,
--        ROUND(SUM(qty * harga), 2) AS total_awal,
--        ROUND(SUM(qty * harga * (diskon_persen / 100)), 2) AS total_diskon,
--        ROUND(SUM(qty * harga * (1 - diskon_persen / 100)), 2) AS total_bayar
-- FROM tr_penjualan_dqlab
-- GROUP BY nama_produk, diskon_persen
-- HAVING total_bayar > 50000
-- ORDER BY total_bayar DESC;

-- select nama_produk, qty, harga, tgl_transaksi
-- from tr_penjualan_dqlab
-- where nama_produk like 'F%' 
-- 	and harga >= 100000 
--  and month(tgl_transaksi)=6;

-- no1
select nama_produk, sum(qty) as total_terjual
from tr_penjualan_dqlab
group by nama_produk
order by total_terjual desc;
-- no2
select nama_produk, sum(qty) as total_terjual
from tr_penjualan_dqlab
group by nama_produk
having sum(qty) > 10;
-- no3
select avg(harga) as rata_harga
from tr_penjualan_dqlab;
-- no4
select nama_produk, qty, harga, diskon_persen,
	sum(qty * harga) as total_sebelum_diskon,
    sum(harga - diskon_persen / 100) as diskon_rp,
	sum(qty * harga (1 - diskon_persen / 100)) total_setelah_diskon
where diskon_persen > 0
group by total_setelah_diskon;
-- perbaikan no4
SELECT nama_produk, qty, harga, diskon_persen,
	SUM(qty * harga) AS total_sebelum_diskon,
    SUM(qty * harga * (diskon_persen / 100)) AS diskon_rp,
	SUM(qty * harga * (1 - diskon_persen / 100)) AS total_setelah_diskon
FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
GROUP BY nama_produk;

SELECT nama_produk, qty, harga, diskon_persen,
       SUM(qty * harga) AS total_sebelum_diskon,
       SUM(qty * harga * (diskon_persen / 100)) AS diskon_rp,
       SUM(qty * (harga - (harga * diskon_persen / 100))) AS total_setelah_diskon
FROM tr_penjualan_dqlab
WHERE diskon_persen > 0
GROUP BY nama_produk
ORDER BY diskon_persen DESC;


-- no5
select nama_produk, qty,
count(distinct nama_produk) as jumlah_produk_unik
from tr_penjualan_dqlab;
-- perbaikan no5
SELECT COUNT(DISTINCT nama_produk) AS jumlah_produk_unik
FROM tr_penjualan_dqlab;