-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Okt 2021 pada 11.31
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 5.6.39

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_koperasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_anggota`
--

CREATE TABLE `t_anggota` (
  `kode_anggota` char(5) NOT NULL,
  `kode_tabungan` int(11) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `alamat_anggota` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `pekerjaan` varchar(50) NOT NULL,
  `tgl_masuk` date NOT NULL,
  `telp` varchar(12) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `status` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_anggota`
--

INSERT INTO `t_anggota` (`kode_anggota`, `kode_tabungan`, `nama_anggota`, `alamat_anggota`, `jenis_kelamin`, `pekerjaan`, `tgl_masuk`, `telp`, `tempat_lahir`, `tgl_lahir`, `status`, `u_entry`, `tgl_entri`) VALUES
('A0003', 59, 'GILANG', 'WAY KANDIS', 'Laki-laki', 'Wiraswasta', '2021-10-12', '089909098787', 'Palembang', '2021-10-07', 'aktif', 'Gilang', '2021-10-12'),
('A0002', 58, 'Yoga', 'Sukarame', '', 'Mahasiswa', '2021-10-08', '082282108836', 'Palembang', '2021-10-08', 'aktif', 'Gilang', '2021-10-08'),
('A0001', 57, 'Yoga', 'Sukarame', 'Laki-laki', 'Wiraswasta', '2021-09-21', '082282108836', 'Palembang', '2021-09-21', 'aktif', 'Gilang', '2021-09-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_angsur`
--

CREATE TABLE `t_angsur` (
  `kode_angsur` int(11) NOT NULL,
  `kode_pinjam` int(11) NOT NULL,
  `angsuran_ke` int(11) NOT NULL,
  `besar_angsuran` int(11) NOT NULL,
  `denda` int(11) NOT NULL,
  `sisa_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis_pinjam`
--

CREATE TABLE `t_jenis_pinjam` (
  `kode_jenis_pinjam` char(5) NOT NULL,
  `nama_pinjaman` varchar(50) NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `maks_pinjam` double NOT NULL,
  `bunga` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jenis_pinjam`
--

INSERT INTO `t_jenis_pinjam` (`kode_jenis_pinjam`, `nama_pinjaman`, `lama_angsuran`, `maks_pinjam`, `bunga`, `u_entry`, `tgl_entri`) VALUES
('P0003', 'Hight', 35, 25000000, 10, 'Gilang', '2021-10-08'),
('P0002', 'Medium', 35, 20000000, 5, 'Gilang', '2021-09-21'),
('P0001', 'Hight', 60, 25000000, 10, 'Gilang', '2021-09-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_jenis_simpan`
--

CREATE TABLE `t_jenis_simpan` (
  `kode_jenis_simpan` char(5) NOT NULL,
  `nama_simpanan` varchar(50) NOT NULL,
  `besar_simpanan` float NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_jenis_simpan`
--

INSERT INTO `t_jenis_simpan` (`kode_jenis_simpan`, `nama_simpanan`, `besar_simpanan`, `u_entry`, `tgl_entri`) VALUES
('S0001', 'pokok', 10000, 'Kang Admin', '2017-03-09'),
('S0002', 'wajib', 15000, 'Kang Admin', '2017-04-08'),
('S0003', 'sukarela', 0, 'Kang Admin', '2017-02-15');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengajuan`
--

CREATE TABLE `t_pengajuan` (
  `kode_pengajuan` int(4) NOT NULL,
  `tgl_pengajuan` date NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_jenis_pinjam` varchar(10) NOT NULL,
  `besar_pinjam` int(11) NOT NULL,
  `tgl_acc` date NOT NULL,
  `status` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pengajuan`
--

INSERT INTO `t_pengajuan` (`kode_pengajuan`, `tgl_pengajuan`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `tgl_acc`, `status`) VALUES
(1, '2021-10-12', 'A0003', 'P0003', 25000000, '2021-10-12', 'diterima');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pengambilan`
--

CREATE TABLE `t_pengambilan` (
  `kode_ambil` int(5) NOT NULL,
  `kode_anggota` varchar(10) NOT NULL,
  `kode_tabungan` int(5) NOT NULL,
  `besar_ambil` int(20) NOT NULL,
  `tgl_ambil` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_petugas`
--

CREATE TABLE `t_petugas` (
  `kode_petugas` char(5) NOT NULL,
  `nama_petugas` varchar(50) NOT NULL,
  `alamat_petugas` varchar(100) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_petugas`
--

INSERT INTO `t_petugas` (`kode_petugas`, `nama_petugas`, `alamat_petugas`, `no_telp`, `jenis_kelamin`, `u_entry`, `tgl_entri`) VALUES
('P0001', 'Yoga', 'Sukarame', '082282108836', 'Laki-laki', 'Kang Admin', '2021-09-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pinjam`
--

CREATE TABLE `t_pinjam` (
  `kode_pinjam` int(11) NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `kode_jenis_pinjam` char(5) NOT NULL,
  `besar_pinjam` double NOT NULL,
  `besar_angsuran` double NOT NULL,
  `lama_angsuran` int(11) NOT NULL,
  `sisa_angsuran` int(11) NOT NULL,
  `sisa_pinjaman` double NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_entri` date NOT NULL,
  `tgl_tempo` date NOT NULL,
  `status` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_pinjam`
--

INSERT INTO `t_pinjam` (`kode_pinjam`, `kode_anggota`, `kode_jenis_pinjam`, `besar_pinjam`, `besar_angsuran`, `lama_angsuran`, `sisa_angsuran`, `sisa_pinjaman`, `u_entry`, `tgl_entri`, `tgl_tempo`, `status`) VALUES
(71, 'A0003', 'P0003', 25000000, 3214285.7142857, 35, 0, 25000000, '', '2021-10-12', '2021-11-11', 'belum lunas'),
(70, 'A0001', 'P0001', 25000000, 2916666.6666667, 60, 0, 25000000, '', '2021-09-21', '2021-10-21', 'belum lunas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_simpan`
--

CREATE TABLE `t_simpan` (
  `kode_simpan` int(11) NOT NULL,
  `jenis_simpan` varchar(10) NOT NULL,
  `besar_simpanan` double NOT NULL,
  `kode_anggota` char(5) NOT NULL,
  `u_entry` varchar(50) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_entri` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_simpan`
--

INSERT INTO `t_simpan` (`kode_simpan`, `jenis_simpan`, `besar_simpanan`, `kode_anggota`, `u_entry`, `tgl_mulai`, `tgl_entri`) VALUES
(198, 'sukarela', 10000000, 'A0003', 'Operator Koperasi', '2021-10-12', '2021-10-12'),
(197, 'pokok', 10000, 'A0003', 'Gilang', '2021-10-12', '2021-10-12'),
(196, 'pokok', 10000, 'A0002', 'Gilang', '2021-10-08', '2021-10-08'),
(195, 'pokok', 10000, 'A0001', 'Gilang', '2021-09-21', '2021-09-21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_tabungan`
--

CREATE TABLE `t_tabungan` (
  `kode_tabungan` int(11) NOT NULL,
  `kode_anggota` varchar(6) COLLATE latin1_general_ci NOT NULL,
  `tgl_mulai` date NOT NULL,
  `besar_tabungan` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `t_tabungan`
--

INSERT INTO `t_tabungan` (`kode_tabungan`, `kode_anggota`, `tgl_mulai`, `besar_tabungan`) VALUES
(59, 'A0003', '2021-10-12', 10010000),
(58, 'A0002', '2021-10-08', 10000),
(57, 'A0001', '2021-09-21', 10000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_user`
--

CREATE TABLE `t_user` (
  `kode_user` char(5) NOT NULL,
  `kode_petugas` varchar(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `tgl_entri` date NOT NULL,
  `foto` varchar(100) NOT NULL,
  `level` char(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `t_user`
--

INSERT INTO `t_user` (`kode_user`, `kode_petugas`, `username`, `password`, `nama`, `tgl_entri`, `foto`, `level`) VALUES
('U0001', '', 'operator', 'operator', 'Operator Koperasi', '2020-12-09', 'I-love-you-hearts.PNG', 'operator'),
('U0002', '', 'admin', 'admin', 'Gilang', '2020-12-09', 'dd.jpg', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `t_anggota`
--
ALTER TABLE `t_anggota`
  ADD PRIMARY KEY (`kode_anggota`);

--
-- Indeks untuk tabel `t_angsur`
--
ALTER TABLE `t_angsur`
  ADD PRIMARY KEY (`kode_angsur`);

--
-- Indeks untuk tabel `t_jenis_pinjam`
--
ALTER TABLE `t_jenis_pinjam`
  ADD PRIMARY KEY (`kode_jenis_pinjam`);

--
-- Indeks untuk tabel `t_jenis_simpan`
--
ALTER TABLE `t_jenis_simpan`
  ADD PRIMARY KEY (`kode_jenis_simpan`);

--
-- Indeks untuk tabel `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  ADD PRIMARY KEY (`kode_pengajuan`);

--
-- Indeks untuk tabel `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  ADD PRIMARY KEY (`kode_ambil`);

--
-- Indeks untuk tabel `t_petugas`
--
ALTER TABLE `t_petugas`
  ADD PRIMARY KEY (`kode_petugas`);

--
-- Indeks untuk tabel `t_pinjam`
--
ALTER TABLE `t_pinjam`
  ADD PRIMARY KEY (`kode_pinjam`);

--
-- Indeks untuk tabel `t_simpan`
--
ALTER TABLE `t_simpan`
  ADD PRIMARY KEY (`kode_simpan`);

--
-- Indeks untuk tabel `t_tabungan`
--
ALTER TABLE `t_tabungan`
  ADD PRIMARY KEY (`kode_tabungan`);

--
-- Indeks untuk tabel `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `t_angsur`
--
ALTER TABLE `t_angsur`
  MODIFY `kode_angsur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=159;

--
-- AUTO_INCREMENT untuk tabel `t_pengajuan`
--
ALTER TABLE `t_pengajuan`
  MODIFY `kode_pengajuan` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `t_pengambilan`
--
ALTER TABLE `t_pengambilan`
  MODIFY `kode_ambil` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `t_pinjam`
--
ALTER TABLE `t_pinjam`
  MODIFY `kode_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `t_simpan`
--
ALTER TABLE `t_simpan`
  MODIFY `kode_simpan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=199;

--
-- AUTO_INCREMENT untuk tabel `t_tabungan`
--
ALTER TABLE `t_tabungan`
  MODIFY `kode_tabungan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
