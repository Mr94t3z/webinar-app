-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 23, 2021 at 05:37 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seminar`
--

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `jenjang`
--

CREATE TABLE `jenjang` (
  `id_jenjang` tinyint(2) NOT NULL,
  `kode_jenjang` varchar(3) NOT NULL,
  `nama_jenjang` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenjang`
--

INSERT INTO `jenjang` (`id_jenjang`, `kode_jenjang`, `nama_jenjang`) VALUES
(1, 'D3', 'Diploma-3'),
(2, 'S1', 'Strata-1');

-- --------------------------------------------------------

--
-- Table structure for table `konsentrasi`
--

CREATE TABLE `konsentrasi` (
  `id_konsentrasi` tinyint(2) NOT NULL,
  `kode_konsentrasi` varchar(3) NOT NULL,
  `nama_konsentrasi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `konsentrasi`
--

INSERT INTO `konsentrasi` (`id_konsentrasi`, `kode_konsentrasi`, `nama_konsentrasi`) VALUES
(1, 'SI', 'Sistem Infomasi'),
(2, 'RPL', 'Rekayasa Perangkat Lunak'),
(3, 'TK', 'Teknik Komputer');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL,
  `nim` int(10) NOT NULL,
  `nama_mhs` varchar(50) NOT NULL,
  `id_prodi` tinyint(2) NOT NULL,
  `id_konsentrasi` tinyint(2) NOT NULL,
  `id_jenjang` tinyint(2) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_telp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nim`, `nama_mhs`, `id_prodi`, `id_konsentrasi`, `id_jenjang`, `email`, `no_telp`) VALUES
(1, 1197050081, 'Muhamad Taopik', 1, 2, 2, 'muhamadtaopik007@gmail.com', '082214760288'),
(2, 25474567, 'Afrinaldi', 2, 1, 1, 'afrinaldi@gmail.com', '364575674567'),
(3, 12345678, 'Iqbal Putra', 1, 2, 2, 'iqbal@gmail.com', '012384946576'),
(4, 12345675, 'Khoerul Ummam', 1, 2, 2, 'ummam@gmail.com', '089646736576'),
(5, 11346436, 'Fakhri', 1, 2, 2, 'fakhri@gmail.com', '008756574561'),
(6, 19127432, 'Fahriz Dimasqy', 1, 1, 2, 'fahriz@gmail.com', '084968947833');

-- --------------------------------------------------------

--
-- Table structure for table `metode_pembayaran`
--

CREATE TABLE `metode_pembayaran` (
  `id_metode` tinyint(2) NOT NULL,
  `nama_metode` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `metode_pembayaran`
--

INSERT INTO `metode_pembayaran` (`id_metode`, `nama_metode`) VALUES
(1, 'Gratis'),
(2, 'Transfer'),
(3, 'Belum Bayar');

-- --------------------------------------------------------

--
-- Table structure for table `pembicara`
--

CREATE TABLE `pembicara` (
  `id_pembicara` tinyint(3) NOT NULL,
  `nama_pembicara` varchar(150) NOT NULL,
  `latar_belakang` varchar(100) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembicara`
--

INSERT INTO `pembicara` (`id_pembicara`, `nama_pembicara`, `latar_belakang`, `id_seminar`, `foto`) VALUES
(12, 'Zulaikha', 'Dosen & Penggiat Perempuan', 1, '0f1d13f9c28f586436332773e60464a0.png'),
(13, 'Anik Vega Vitianingsih', 'Koordinator Gerakan Pandai', 1, '6bb14b5073a5b7b056104c2b51fc09c0.png'),
(14, 'Cecep Nurul Alam', 'Bidang Ahli ICT Kopertais II Jawa Barat', 1, 'e4fb4f11281d2e2c628d2da0637918ea.png'),
(15, 'Desmona', 'Presenter TV', 1, 'ee3b546fcd30300076e61057375b2b22.png'),
(16, 'Tesa Lonika R. Meluwu', 'Influencer', 1, '7d167290268759b541e18ab7f6339bb1.png'),
(17, 'Wildan Budian ST,. M.Kom', 'Dosen UIN Bandung', 9, 'd785f9c827eeceac8297065e3c747e7d.png');

-- --------------------------------------------------------

--
-- Table structure for table `pendaftaran_seminar`
--

CREATE TABLE `pendaftaran_seminar` (
  `id_pendaftaran` int(10) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `id_mahasiswa` int(11) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `jam_daftar` time NOT NULL,
  `id_stsbyr` tinyint(2) NOT NULL,
  `id_metode` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pendaftaran_seminar`
--

INSERT INTO `pendaftaran_seminar` (`id_pendaftaran`, `id_seminar`, `id_mahasiswa`, `tgl_daftar`, `jam_daftar`, `id_stsbyr`, `id_metode`) VALUES
(1, 1, 1, '2021-12-20', '11:37:04', 1, 1),
(2, 9, 3, '2021-12-23', '10:07:04', 1, 1),
(3, 1, 2, '2021-12-23', '10:12:14', 1, 1),
(4, 9, 4, '2021-12-23', '10:12:47', 1, 1),
(5, 9, 5, '2021-12-23', '11:24:22', 1, 1),
(6, 1, 6, '2021-12-23', '11:26:42', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `presensi_seminar`
--

CREATE TABLE `presensi_seminar` (
  `id_presensi` int(11) NOT NULL,
  `id_mahasiswa` tinyint(3) NOT NULL,
  `nomor_induk` int(15) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `tgl_khd` date NOT NULL,
  `jam_khd` time NOT NULL,
  `id_stskhd` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `presensi_seminar`
--

INSERT INTO `presensi_seminar` (`id_presensi`, `id_mahasiswa`, `nomor_induk`, `id_seminar`, `tgl_khd`, `jam_khd`, `id_stskhd`) VALUES
(1, 1, 1197050081, 1, '2021-12-22', '06:51:40', 2),
(2, 3, 12345678, 9, '2021-12-23', '10:11:29', 2),
(3, 4, 12345675, 9, '2021-12-23', '10:13:10', 2),
(4, 6, 19127432, 9, '2021-12-23', '11:27:03', 2);

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `id_prodi` tinyint(2) NOT NULL,
  `kode_prodi` varchar(2) NOT NULL,
  `nama_prodi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`id_prodi`, `kode_prodi`, `nama_prodi`) VALUES
(1, 'IF', 'Teknik Informatika'),
(2, 'MI', 'Manajemen Informatika'),
(3, 'KA', 'Komputer Akuntansi');

-- --------------------------------------------------------

--
-- Table structure for table `seminar`
--

CREATE TABLE `seminar` (
  `id_seminar` int(3) NOT NULL,
  `nama_seminar` varchar(50) NOT NULL,
  `link_meet` varchar(225) NOT NULL,
  `tgl_pelaksana` date NOT NULL,
  `lampiran` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seminar`
--

INSERT INTO `seminar` (`id_seminar`, `nama_seminar`, `link_meet`, `tgl_pelaksana`, `lampiran`) VALUES
(1, 'LINDUNGI DIRI, JAGA PRIVASI DI INTERNET', 'https://meet.google.com/unv-pnrq-ytf', '2021-12-21', '4541199ba6ce72f127eb66e7c2a90e28.jpg'),
(9, 'Dasar-Dasar Klasifikasi Image', 'https://s.id/kapita-selekta', '2021-12-25', '5ffa7c83bd9cd2ff1558e08dacc20bb0.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sponsor`
--

CREATE TABLE `sponsor` (
  `id_sponsor` tinyint(3) NOT NULL,
  `nama_sponsor` varchar(30) NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sponsor`
--

INSERT INTO `sponsor` (`id_sponsor`, `nama_sponsor`, `gambar`, `id_seminar`) VALUES
(5, 'Telkomsel', '6ec9ff92bb44566d1c1bf03767621356.png', 1),
(6, 'Indodax', '4cc0e05c639dc5535cc21ee16c087e66.png', 1),
(7, 'Toko Crypto', '7eb37d6e1dd4c0bb06270b784acef50c.png', 1),
(8, 'Binance', 'a0dd20c665b07f42e74df8d98a6e33cd.png', 1),
(9, 'Binance', '4d94fb6e32c101e2c2ea1f6962f345ef.png', 9);

-- --------------------------------------------------------

--
-- Table structure for table `status_kehadiran`
--

CREATE TABLE `status_kehadiran` (
  `id_stskhd` tinyint(1) NOT NULL,
  `nama_stskhd` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_kehadiran`
--

INSERT INTO `status_kehadiran` (`id_stskhd`, `nama_stskhd`) VALUES
(1, 'Tidak Hadir'),
(2, 'Hadir');

-- --------------------------------------------------------

--
-- Table structure for table `status_pembayaran`
--

CREATE TABLE `status_pembayaran` (
  `id_stsbyr` tinyint(2) NOT NULL,
  `nama_stsbyr` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status_pembayaran`
--

INSERT INTO `status_pembayaran` (`id_stsbyr`, `nama_stsbyr`) VALUES
(2, 'Belum Lunas'),
(1, 'Sudah Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `id_tiket` tinyint(3) NOT NULL,
  `id_seminar` tinyint(3) NOT NULL,
  `harga_tiket` bigint(15) NOT NULL,
  `slot_tiket` int(5) NOT NULL,
  `lampiran_tiket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`id_tiket`, `id_seminar`, `harga_tiket`, `slot_tiket`, `lampiran_tiket`) VALUES
(6, 1, 0, 200, 'f9dc22ed1d626760ba65ce07543971ee.png'),
(8, 9, 0, 100, 'e9778040f0a0b5501e9137c63cfe0898.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(5, '::1', 'mr.94t3z@gmail.com', '$2y$12$rcQw5IT4HSBnWdoDX06x5OGK4m099Qad9YBChlwAITXO7Roed4eMS', 'mr.94t3z@gmail.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1640046348, 1640232802, 1, 'Muhamad', 'Taopik', 'State Islamic University', '082214760288'),
(6, '::1', 'irvan.falasifa@gmail.com', '$2y$10$zTHJ2N/UMvLz0voi1fuoGu1j9iQyKBHizH9nw06WSg8iUAZ6EYioi', 'irvan.falasifa@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1640096168, 1640226849, 1, 'Irvan', 'Falasifa', 'State Islamic University', '08989995886'),
(7, '::1', 'nur.lukman@gmail.com', '$2y$10$Ldj5l2EnSzfQpqyWh2bEGO3zcu1DVXq4m5w.Q0ZFktNYPQu0FIAaC', 'nur.lukman@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1640097555, NULL, 1, 'Nur', 'Lukman', 'State Islamic University', '08562297375'),
(8, '::1', 'nandi@gmail.com', '$2y$10$Ldj5l2EnSzfQpqyWh2bEGO3zcu1DVXq4m5w.Q0ZFktNYPQu0FIAaC', 'nandi@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1640097555, 1640143636, 1, 'Nandi', 'Irmawan', 'Bakso Padarek', '085722795433');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(3, 5, 1),
(4, 6, 2),
(5, 7, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenjang`
--
ALTER TABLE `jenjang`
  ADD PRIMARY KEY (`id_jenjang`);

--
-- Indexes for table `konsentrasi`
--
ALTER TABLE `konsentrasi`
  ADD PRIMARY KEY (`id_konsentrasi`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`),
  ADD KEY `id_prodi` (`id_prodi`,`id_konsentrasi`,`id_jenjang`);

--
-- Indexes for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  ADD PRIMARY KEY (`id_metode`);

--
-- Indexes for table `pembicara`
--
ALTER TABLE `pembicara`
  ADD PRIMARY KEY (`id_pembicara`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `pendaftaran_seminar`
--
ALTER TABLE `pendaftaran_seminar`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `id_seminar` (`id_seminar`,`id_mahasiswa`,`id_stsbyr`,`id_metode`);

--
-- Indexes for table `presensi_seminar`
--
ALTER TABLE `presensi_seminar`
  ADD PRIMARY KEY (`id_presensi`),
  ADD KEY `id_mahasiswa` (`id_mahasiswa`,`id_stskhd`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`id_prodi`);

--
-- Indexes for table `seminar`
--
ALTER TABLE `seminar`
  ADD PRIMARY KEY (`id_seminar`);

--
-- Indexes for table `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`id_sponsor`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `status_kehadiran`
--
ALTER TABLE `status_kehadiran`
  ADD PRIMARY KEY (`id_stskhd`);

--
-- Indexes for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  ADD PRIMARY KEY (`id_stsbyr`),
  ADD KEY `nama_stsbyr` (`nama_stsbyr`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`id_tiket`),
  ADD KEY `id_seminar` (`id_seminar`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jenjang`
--
ALTER TABLE `jenjang`
  MODIFY `id_jenjang` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `konsentrasi`
--
ALTER TABLE `konsentrasi`
  MODIFY `id_konsentrasi` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `metode_pembayaran`
--
ALTER TABLE `metode_pembayaran`
  MODIFY `id_metode` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembicara`
--
ALTER TABLE `pembicara`
  MODIFY `id_pembicara` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pendaftaran_seminar`
--
ALTER TABLE `pendaftaran_seminar`
  MODIFY `id_pendaftaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `presensi_seminar`
--
ALTER TABLE `presensi_seminar`
  MODIFY `id_presensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `prodi`
--
ALTER TABLE `prodi`
  MODIFY `id_prodi` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `seminar`
--
ALTER TABLE `seminar`
  MODIFY `id_seminar` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sponsor`
--
ALTER TABLE `sponsor`
  MODIFY `id_sponsor` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `status_kehadiran`
--
ALTER TABLE `status_kehadiran`
  MODIFY `id_stskhd` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `status_pembayaran`
--
ALTER TABLE `status_pembayaran`
  MODIFY `id_stsbyr` tinyint(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tiket`
--
ALTER TABLE `tiket`
  MODIFY `id_tiket` tinyint(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
