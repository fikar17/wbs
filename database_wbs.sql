-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Mar 2022 pada 07.18
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database_wbs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `lavel_user`
--

CREATE TABLE `lavel_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_acara`
--

CREATE TABLE `tb_acara` (
  `id` int(11) NOT NULL,
  `nm_acara` varchar(500) NOT NULL,
  `jml_user` varchar(10000) NOT NULL,
  `tgl_acara` date NOT NULL,
  `waktu_acara` time NOT NULL,
  `tgl_update` int(11) NOT NULL,
  `tgl_buat` int(11) NOT NULL,
  `terhapus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tiket`
--

CREATE TABLE `tb_tiket` (
  `id` int(11) NOT NULL,
  `noreg` varchar(100) NOT NULL,
  `nama_acara` varchar(350) NOT NULL,
  `tgl_update` date NOT NULL,
  `tgl_buat` date NOT NULL,
  `terhapus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `date_created` int(11) NOT NULL,
  `telepon` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `gender` enum('laki-laki','wanita') NOT NULL,
  `alamat` varchar(350) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `email`, `image`, `password`, `role_id`, `is_active`, `date_created`, `telepon`, `tgl_lahir`, `gender`, `alamat`) VALUES
(19, 'ales', 'ales@gmail.com', 'default.jpg', '$2y$10$wXEU0MTa7/oSzkfRw8Q0re7fmu/Hgm/qg2nr8j9UQv/yXjDM2JfmO', 1, 1, 1642555341, '123456789', '2022-02-10', 'laki-laki', 'jalan buntu'),
(26, 'rania', 'rania@gmail.com', 'default.jpg', '$2y$10$sMfTmmsJAPGkNHSqHnNUh.poW2Q.6aXlltmM5MUMqbxpEV4qW/8UC', 2, 1, 1643179967, '089652005994', '2022-01-22', 'wanita', 'Jalan Aren III, RT.007/RW.005, Pondok Bahar, Kota Tangerang, Banten, Indonesia'),
(74, 'pixie', 'pixie@gmail.com', 'default.jpg', '$2y$10$Dca63Ygo1nIN/6qxZM/Mh.CfzYVQeedBky1x228X7z0LV9UTRnp1.', 2, 1, 1646962367, '089652005994', '2020-05-20', 'wanita', 'Jalan Pondok Aren III, Pondok Betung, Kota Tangerang Selatan, Banten, Indonesia'),
(75, 'fikar', 'fikar@gmail.com', 'default.jpg', '$2y$10$iTUPEWqYu3vJ44LR0Xxgd.UtP5czMfUA7fgeLS52AFjBSQtrrQnE6', 2, 1, 1647233465, '0852147963', '2022-01-04', 'laki-laki', 'Jalan Kebayoran Residence, Pondok Aren, South Tangerang City, Banten, Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `menu_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(5, 2, 3),
(6, 2, 4),
(7, 1, 5),
(8, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_menu`
--

CREATE TABLE `user_menu` (
  `menu` varchar(128) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(100) NOT NULL,
  `isactive` int(11) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_menu`
--

INSERT INTO `user_menu` (`menu`, `url`, `icon`, `isactive`, `id`) VALUES
('Dashboard', 'index.php/Dashboard/home', 'fas fa-fw fa-home', 1, 1),
('Certificate', 'index.php/Certificate', 'fa-solid fa-graduation-cap', 1, 2),
('Profile', 'index.php/profile', 'far fa-fw fa-user-circle', 1, 3),
('History', 'index.php/history', 'fas fa-fw fa-history', 1, 4),
('Menu Management', 'index.php/dashboard/menu_management', 'fa-solid fa-fingerprint', 1, 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(2, 'Member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 2, 'My Profile', 'user', 'fas fa-fw fa-user', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `lavel_user`
--
ALTER TABLE `lavel_user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_acara`
--
ALTER TABLE `tb_acara`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_fk` (`menu_id`),
  ADD KEY `user_fk` (`role_id`);

--
-- Indeks untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `lavel_user`
--
ALTER TABLE `lavel_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_acara`
--
ALTER TABLE `tb_acara`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_tiket`
--
ALTER TABLE `tb_tiket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
