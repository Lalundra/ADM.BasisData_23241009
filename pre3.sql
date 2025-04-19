
DROP DATABASE IF EXISTS joki_gaming;

CREATE DATABASE joki_gaming;

USE joki_gaming;

-- 3. Buat tabel `pelanggan`
CREATE TABLE pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    nama_akun VARCHAR(100),
    no_telp VARCHAR(20)
);

-- 4. Buat tabel `penjoki`
CREATE TABLE penjoki (
    id_akun_penjoki INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100),
    role_hero VARCHAR(50),
    alamat TEXT,
    gaji DECIMAL(10,2),
    memproses_akun BOOLEAN
);

-- 5. Buat tabel `paket_joki`
CREATE TABLE paket_joki (
    id_paket INT AUTO_INCREMENT PRIMARY KEY,
    req_rank VARCHAR(50),
    req_hero VARCHAR(100),
    req_penjoki VARCHAR(100),
    paket_rank VARCHAR(50),
    harga DECIMAL(10,2)
);

-- 6. Buat tabel `order`
CREATE TABLE `order` (
    id_order INT AUTO_INCREMENT PRIMARY KEY,
    id_pelanggan INT,
    id_paket INT,
    status_bayar ENUM('belum', 'lunas') DEFAULT 'belum',
    admin VARCHAR(100),
    tgl_order DATE,
    metode_bayar VARCHAR(50),
    qty INT,
    total_bayar DECIMAL(10,2),
    FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan),
    FOREIGN KEY (id_paket) REFERENCES paket_joki(id_paket)
);

-- 7. Buat tabel `terlibat` (relasi penjoki <-> paket)
CREATE TABLE terlibat (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_paket INT,
    id_akun_penjoki INT,
    FOREIGN KEY (id_paket) REFERENCES paket_joki(id_paket),
    FOREIGN KEY (id_akun_penjoki) REFERENCES penjoki(id_akun_penjoki)
);

-- 🔸 Pelanggan
INSERT INTO pelanggan (nama, nama_akun, no_telp) VALUES
('Andra', 'AndraMLBB', '081111111111'),
('Arya', 'AryaGaming', '082222222222'),
('Rasyid', 'RasyidML', '083333333333'),
('Ical', 'IcalPro', '084444444444'),
('Zirul', 'ZirulLegend', '085555555555');

-- 🔸 Penjoki
INSERT INTO penjoki (nama, role_hero, alamat, gaji, memproses_akun) VALUES
('Donkey', 'Roamer', 'Jakarta', 5000000.00, TRUE),
('Wann', 'Jungler', 'Depok', 5000000.00, TRUE),
('Oura', 'EXP Lane', 'Banten', 5000000.00, TRUE),
('Luminaire', 'Mid Lane', 'Bandung', 5000000.00, TRUE),
('Rekt', 'Gold Lane', 'Lampung', 5000000.00, TRUE);

-- 🔸 Paket Joki
INSERT INTO paket_joki (req_rank, req_hero, req_penjoki, paket_rank, harga) VALUES
('Master', 'Bebas', 'Donkey', 'Mythic', 600000.00),
('Grandmaster/Epic', 'Gusion', 'Wann', 'Mythic', 450000.00),
('Legend/Mythic', 'Layla', 'Luminaire', 'Mythical Glory', 400000.00);

-- 🔸 Order (admin: Andra dan Arya)
INSERT INTO `order` (id_pelanggan, id_paket, status_bayar, admin, tgl_order, metode_bayar, qty, total_bayar) VALUES
(1, 1, 'lunas', 'Andra', '2025-04-20', 'DANA', 1, 601000.00), -- harga + biaya admin DANA (1000)
(2, 2, 'belum', 'Arya', '2025-04-21', 'BANK BRI', 1, 451000.00), -- harga + admin BRI
(3, 3, 'lunas', 'Andra', '2025-04-21', 'BANK BCA', 1, 402000.00);

-- 🔸 Terlibat (penjoki mana yang terlibat di paket apa)
INSERT INTO terlibat (id_paket, id_akun_penjoki) VALUES
(1, 1), -- Donkey untuk paket 1
(2, 2), -- Wann untuk paket 2
(3, 4), -- Luminaire untuk paket 3
(3, 5); -- Rekt juga bantu paket 3


