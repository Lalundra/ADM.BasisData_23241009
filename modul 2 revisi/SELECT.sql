
-- Gunakan database
USE joki_gaming;

-- 1. TABEL pelanggan (prefix: p)
-- (ambil 1 kolom)
SELECT p.nama AS nama_pelanggan FROM pelanggan p;
-- (ambil 2 kolom)
SELECT p.nama AS nama_pelanggan, p.nama_akun AS akun_pelanggan FROM pelanggan p;

-- 2. TABEL penjoki (prefix: pj)
-- (ambil 1 kolom)
SELECT pj.nama AS nama_penjoki FROM penjoki pj;
-- (ambil 2 kolom)
SELECT pj.nama AS nama_penjoki, pj.role AS role_penjoki FROM penjoki pj;

-- 3. TABEL paket_joki (prefix: pk)
-- (ambil 1 kolom)
SELECT pk.nama_paket AS nama_paket FROM paket_joki pk;
-- (ambil 2 kolom)
SELECT pk.nama_paket AS nama_paket, pk.harga AS harga_paket FROM paket_joki pk;

-- 4. TABEL order (prefix: o)
-- (ambil 1 kolom)
SELECT o.status_bayar AS status_bayar_order FROM `order` o;
-- (ambil 2 kolom)
SELECT o.tgl_order AS tanggal_order, o.status_bayar AS status_bayar_order FROM `order` o;

-- 5. TABEL terlibat (prefix: t)
-- (ambil 1 kolom)
SELECT t.id_paket AS id_paket_terlibat FROM terlibat t;
-- (ambil 2 kolom)
SELECT t.id_paket AS id_paket_terlibat, t.id_akun_penjoki AS id_penjoki_terlibat FROM terlibat t;

-- 6. TABEL admin_joki (prefix: a)
-- (ambil 1 kolom)
SELECT a.nama_admin AS nama_admin_joki FROM admin_joki a;
-- (ambil 2 kolom)
SELECT a.nama_admin AS nama_admin_joki, a.no_hp AS no_hp_admin FROM admin_joki a;

-- 7. TABEL metode_pembayaran (prefix: mp)
-- (ambil 1 kolom)
SELECT mp.nama_metode AS metode_bayar FROM metode_pembayaran mp;
-- (ambil 2 kolom)
SELECT mp.nama_metode AS metode_bayar, mp.biaya_admin AS biaya_admin_metode FROM metode_pembayaran mp;

-- 8. TABEL hero_request (prefix: hr)
-- (ambil 1 kolom)
SELECT hr.nama_hero AS nama_hero_request FROM hero_request hr;
-- (ambil 2 kolom)
SELECT hr.nama_hero AS nama_hero_request, hr.role AS role_hero_request FROM hero_request hr;

-- 9. TABEL rank_request (prefix: rr)
-- (ambil 1 kolom)
SELECT rr.rank_awal AS rank_awal_request FROM rank_request rr;
-- (ambil 2 kolom)
SELECT rr.rank_awal AS rank_awal_request, rr.rank_tujuan AS rank_tujuan_request FROM rank_request rr;

-- 10. TABEL transaksi_pembayaran (prefix: tp)
-- (ambil 1 kolom)
SELECT tp.jumlah_bayar AS jumlah_pembayaran FROM transaksi_pembayaran tp;
-- (ambil 2 kolom)
SELECT tp.jumlah_bayar AS jumlah_pembayaran, tp.metode_bayar AS metode_pembayaran FROM transaksi_pembayaran tp;