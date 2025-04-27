-- 1. HAPUS DATABASE JIKA ADA
DROP DATABASE IF EXISTS joki_gaming;
CREATE DATABASE joki_gaming;
USE joki_gaming;

-- 2. BUAT SEMUA TABEL

CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    nama_akun VARCHAR(100) UNIQUE NOT NULL,
    no_telp VARCHAR(20) UNIQUE
);

CREATE TABLE penjoki (
    id_akun_penjoki INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    umur INT UNSIGNED,
    alamat VARCHAR(100),
    role VARCHAR(50) NOT NULL,
    gaji DECIMAL(10,2) NOT NULL,
    relasi_role TEXT
);

CREATE TABLE paket_joki (
    id_paket INT AUTO_INCREMENT PRIMARY KEY,
    nama_paket VARCHAR(100) UNIQUE NOT NULL,
    harga DECIMAL(10,2) NOT NULL
);

CREATE TABLE `order` (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT NOT NULL,
    id_paket INT NOT NULL,
    tgl_order DATE NOT NULL,
    status_bayar ENUM('belum', 'lunas') DEFAULT 'belum' NOT NULL,
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_paket) REFERENCES paket_joki(id_paket) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE terlibat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_paket INT NOT NULL,
    id_akun_penjoki INT NOT NULL,
    FOREIGN KEY (id_paket) REFERENCES paket_joki(id_paket) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (id_akun_penjoki) REFERENCES penjoki(id_akun_penjoki) ON DELETE RESTRICT ON UPDATE CASCADE,
    UNIQUE KEY (id_paket, id_akun_penjoki) -- Mencegah penjoki yang sama di paket yang sama
);

CREATE TABLE admin_joki (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nama_admin VARCHAR(100) NOT NULL,
    no_hp VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE metode_pembayaran (
    id_metode INT AUTO_INCREMENT PRIMARY KEY,
    nama_metode VARCHAR(50) UNIQUE NOT NULL,
    biaya_admin DECIMAL(10,2) NOT NULL DEFAULT 0.00
);

CREATE TABLE hero_request (
    id_hero INT AUTO_INCREMENT PRIMARY KEY,
    nama_hero VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE rank_request (
    id_rank INT AUTO_INCREMENT PRIMARY KEY,
    rank_awal VARCHAR(50) NOT NULL,
    rank_tujuan VARCHAR(50) NOT NULL
);

CREATE TABLE transaksi_pembayaran (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    id_order INT NOT NULL,
    jumlah_bayar DECIMAL(10,2) NOT NULL,
    tgl_bayar DATE NOT NULL,
    metode_bayar VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_order) REFERENCES `order`(id_order) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 3. ISI DATA DUMMY

-- pelanggan
INSERT INTO pelanggan (nama, nama_akun, no_telp) VALUES
('Andra', 'AndraMLBB', '081111111111'),
('Arya', 'AryaGaming', '082222222222'),
('Rasyid', 'RasyidML', '083333333333'),
('Ical', 'IcalPro', '084444444444'),
('Zirul', 'ZirulLegend', '085555555555');

-- penjoki
INSERT INTO penjoki (nama, umur, alamat, role, gaji, relasi_role) VALUES
('Donkey', 19, 'Jakarta', 'Roamer', 5000000.00, 'Mengutamakan jungler dan gold lane'),
('Wann', 20, 'Depok', 'Jungler', 5000000.00, 'Mengutamakan gold (uang) dalam game'),
('Oura', 18, 'Banten', 'Exp Lane', 5000000.00, 'Membantu roamer menjaga role lain'),
('Luminaire', 17, 'Bandung', 'Mid Lane', 5000000.00, 'Membantu teman satu tim memberikan damage'),
('Rekt', 19, 'Lampung', 'Gold Lane', 5000000.00, 'Menggantikan jungler saat kalah gold');

-- paket_joki
INSERT INTO paket_joki (nama_paket, harga) VALUES
('Master ke Mythic Biasa', 600000),
('GM/Epic ke Mythic Biasa', 450000),
('Master ke Mythical Honor', 800000),
('GM/Epic ke Mythical Honor', 750000),
('Legend/Mythic ke Mythical Honor', 550000),
('Master ke Mythical Glory', 1200000),
('Epic ke Mythical Glory', 1000000),
('Legend/Mythic ke Mythical Glory', 900000),
('Mythic Biasa ke Mythical Honor', 300000),
('Mythic Biasa ke Mythical Glory', 700000),
('Mythical Honor ke Mythical Glory', 500000),
('Master ke Mythic Immortal', 2500000),
('Epic ke Mythic Immortal', 2300000),
('Legend/Mythic ke Mythic Immortal', 2100000),
('Mythic Biasa ke Mythic Immortal', 1900000),
('Mythical Honor ke Mythic Immortal', 1700000),
('Mythical Glory ke Mythic Immortal', 1500000);

-- order
INSERT INTO `order` (id_pelanggan, id_paket, tgl_order, status_bayar) VALUES
(1, 1, '2025-04-20', 'lunas'),
(2, 2, '2025-04-21', 'belum'),
(3, 3, '2025-04-21', 'lunas');

-- terlibat
INSERT INTO terlibat (id_paket, id_akun_penjoki) VALUES
(1, 1),
(2, 2),
(3, 4),
(3, 5);

-- admin_joki
INSERT INTO admin_joki (nama_admin, no_hp) VALUES
('Andra', '085175352788'),
('Arya', '082339579993');

-- metode_pembayaran
INSERT INTO metode_pembayaran (nama_metode, biaya_admin) VALUES
('DANA', 1000),
('BANK BNI', 1500),
('BANK BRI', 1000),
('BANK BCA', 2000),
('BANK PERMATA', 1000),
('BANK SYARIAH', 1000);

-- hero_request
INSERT INTO hero_request (nama_hero, role) VALUES
('Gusion', 'Assassin'),
('Layla', 'Marksman'),
('Tigreal', 'Tank');

-- rank_request
INSERT INTO rank_request (rank_awal, rank_tujuan) VALUES
('Epic', 'Mythic Biasa'),
('Grandmaster', 'Mythical Honor'),
('Legend', 'Mythical Glory'),
('Mythic', 'Mythic Immortal');

-- transaksi_pembayaran
INSERT INTO transaksi_pembayaran (id_order, jumlah_bayar, tgl_bayar, metode_bayar) VALUES
(1, 601000, '2025-04-20', 'DANA'),
(2, 451000, '2025-04-21', 'BANK BRI'),
(3, 802000, '2025-04-21', 'BANK BCA');


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