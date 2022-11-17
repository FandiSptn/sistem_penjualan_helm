-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2022 pada 15.22
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_helm`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_barang` int(11) NOT NULL,
  `kode_barang` varchar(9) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` decimal(15,2) NOT NULL,
  `id_suplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_barang`
--

INSERT INTO `tb_barang` (`id_barang`, `kode_barang`, `nama_barang`, `stok`, `harga`, `id_suplier`) VALUES
(1, 'ARX7', 'Arai RX-7X', 2, '9800000.00', 7),
(2, 'ACA21', 'Arai Classic Air', 3, '5500000.00', 7),
(3, 'ARN1', 'Arai Rapide Neo', 2, '8000000.00', 7),
(4, 'AS70', 'Arai S-70', 2, '3200000.00', 7),
(5, 'AGP7RC	', 'Arai GP-7RC', 1, '85000000.00', 7),
(6, 'ACK6K	', 'Arai CK-6K', 3, '6600000.00', 7),
(9, 'QQD002', 'CARGLOSS YRH Helm Half face - Espresso Brown All Size', 4, '250.00', 1),
(10, 'SWP001', 'PAKET HELM CARGLOS CARGLOSS RETRO GOOGLE MASK', 10, '448500.00', 1),
(11, 'DWP001', 'HELM CARGLOSS KACA DATAR', 7, '285000.00', 1),
(12, 'SMGA50', 'HELM INK REPLIKA BASIC CENTRO HITAM METALIC GOOD QUALITY', 3, '155000.00', 5),
(20, 'SMGM13', 'HELM INK TYPE T1 WARNA HITAM DOF DOUBLE VISOR GOOD QUALITY', 6, '400000.00', 5),
(21, 'SMGM13001', 'HELM INK DYNAMIC BLACK DOFF HALF FACE', 11, '650000.00', 5),
(22, 'SMGZ003', 'INK Stealth Wings', 8, '680000.00', 5),
(23, 'AMP21', 'INK Trooper Solid', 4, '715000.00', 6),
(24, 'SAA001', 'KYT FULL FACE RC SEVEN', 7, '420000.00', 6),
(25, 'SAC001', 'KYT Full Face X-ROCKET', 10, '390000.00', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_suplier`
--

CREATE TABLE `tb_suplier` (
  `id_suplier` int(11) NOT NULL,
  `nama_suplier` varchar(200) NOT NULL,
  `alamat_suplier` varchar(200) NOT NULL,
  `no_telp` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_suplier`
--

INSERT INTO `tb_suplier` (`id_suplier`, `nama_suplier`, `alamat_suplier`, `no_telp`, `email`) VALUES
(1, 'Cargloss', 'Jl. Abadi no 33 Batu Ceper, Tangerang', '085321005134', 'cs@cargloss.co.id'),
(5, 'INK', 'Jl. Slamet Riyadi No. 22 Bandung', '08000111888', 'cs@INK.co.id'),
(6, 'KYT', 'Jl. Samanhudi No. 45 Kabupaten Karawang', '083534232524', 'cs@KYT.co.id'),
(7, 'Arai', 'Jl Raya Padjajaran No.17 Babakan, Bogor Tengah', '089486238462	', 'cs@arai.co.id');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `id_user` int(10) UNSIGNED NOT NULL,
  `nama_user` varchar(200) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','staff','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`id_user`, `nama_user`, `username`, `password`, `role`) VALUES
(9, 'Fandi Septian', 'fandi', 'fandi123', 'admin'),
(11, 'Adam Malik', 'adam', 'adam123', 'staff'),
(12, 'User Test', 'tester', 'tester123', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_barang`) USING BTREE,
  ADD KEY `FK_barang_suplier` (`id_suplier`) USING BTREE;

--
-- Indeks untuk tabel `tb_suplier`
--
ALTER TABLE `tb_suplier`
  ADD PRIMARY KEY (`id_suplier`) USING BTREE;

--
-- Indeks untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id_user`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_suplier`
--
ALTER TABLE `tb_suplier`
  MODIFY `id_suplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id_user` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD CONSTRAINT `FK_barang_suplier` FOREIGN KEY (`id_suplier`) REFERENCES `tb_suplier` (`id_suplier`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
