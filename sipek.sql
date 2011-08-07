-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 07, 2011 at 11:14 AM
-- Server version: 5.1.56
-- PHP Version: 5.3.6-pl0-gentoo

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sipek_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggaran`
--

DROP TABLE IF EXISTS `anggaran`;
CREATE TABLE IF NOT EXISTS `anggaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sumber` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_terima` date NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `anggaran`
--

INSERT IGNORE INTO `anggaran` (`id`, `sumber`, `jumlah`, `tanggal_terima`, `periode_id`) VALUES
(4, '7600000000', 7600000000, '2010-01-07', 1),
(5, 'pemprov jabar', 500000000, '2010-02-02', 1),
(6, 'pemprov jabar', 10000000000, '2010-04-08', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

DROP TABLE IF EXISTS `bobot`;
CREATE TABLE IF NOT EXISTS `bobot` (
  `kriteria_id` int(11) NOT NULL,
  `kriteria_pembanding_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`kriteria_id`,`kriteria_pembanding_id`,`periode_id`),
  KEY `kriteria_pembanding_id` (`kriteria_pembanding_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bobot`
--

INSERT IGNORE INTO `bobot` (`kriteria_id`, `kriteria_pembanding_id`, `nilai`, `periode_id`) VALUES
(1, 2, 1, 1),
(1, 2, 1, 2),
(1, 3, 1, 1),
(1, 3, 1, 2),
(1, 4, 1, 1),
(1, 4, 1, 2),
(2, 1, 1, 1),
(2, 1, 1, 2),
(2, 3, 1, 1),
(2, 3, 1, 2),
(2, 4, 1, 1),
(2, 4, 1, 2),
(3, 1, 1, 1),
(3, 1, 1, 2),
(3, 2, 1, 1),
(3, 2, 1, 2),
(3, 4, 1, 1),
(3, 4, 1, 2),
(4, 1, 1, 1),
(4, 1, 1, 2),
(4, 2, 1, 1),
(4, 2, 1, 2),
(4, 3, 1, 1),
(4, 3, 1, 2),
(5, 7, 1, 1),
(5, 7, 1, 2),
(7, 5, 1, 1),
(7, 5, 1, 2),
(8, 9, 1, 1),
(8, 9, 1, 2),
(8, 10, 1, 1),
(8, 10, 1, 2),
(9, 8, 1, 1),
(9, 8, 1, 2),
(9, 10, 1, 1),
(9, 10, 1, 2),
(10, 8, 1, 1),
(10, 8, 1, 2),
(10, 9, 1, 1),
(10, 9, 1, 2),
(11, 12, 1, 1),
(11, 12, 1, 2),
(12, 11, 1, 1),
(12, 11, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bobot_kriteria`
--

DROP TABLE IF EXISTS `bobot_kriteria`;
CREATE TABLE IF NOT EXISTS `bobot_kriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kriteria_id` (`kriteria_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `bobot_kriteria`
--

INSERT IGNORE INTO `bobot_kriteria` (`id`, `kriteria_id`, `periode_id`, `nilai`) VALUES
(13, 1, 1, 0.25),
(14, 2, 1, 0.25),
(15, 3, 1, 0.25),
(16, 4, 1, 0.25),
(17, 5, 1, 0.13),
(18, 7, 1, 0.13),
(19, 13, 1, 0.25),
(20, 8, 1, 0.08),
(21, 9, 1, 0.08),
(22, 10, 1, 0.08),
(23, 11, 1, 0.13),
(24, 12, 1, 0.13),
(25, 1, 2, 0.25),
(26, 2, 2, 0.25),
(27, 3, 2, 0.25),
(28, 4, 2, 0.25),
(29, 5, 2, 0.13),
(30, 7, 2, 0.13),
(31, 13, 2, 0.25),
(32, 8, 2, 0.08),
(33, 9, 2, 0.08),
(34, 10, 2, 0.08),
(35, 11, 2, 0.13),
(36, 12, 2, 0.13);

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

DROP TABLE IF EXISTS `inventaris`;
CREATE TABLE IF NOT EXISTS `inventaris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kondisi` enum('Baik','Cukup','Buruk') COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `inventaris`
--

INSERT IGNORE INTO `inventaris` (`id`, `jenis`, `jumlah`, `kondisi`, `periode_id`) VALUES
(8, 'Modem ADSL Backup', 5, 'Baik', 1),
(9, 'Serveer Mirror', 2, 'Cukup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pelayanan`
--

DROP TABLE IF EXISTS `jenis_pelayanan`;
CREATE TABLE IF NOT EXISTS `jenis_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jenis_pelayanan`
--

INSERT IGNORE INTO `jenis_pelayanan` (`id`, `nama`) VALUES
(1, 'Perencanaan, pengendalian, dan pembangunan daerah'),
(2, 'Pengembangan komunikasi, informasi, media massa, dan pemanfaatan TI'),
(3, 'Peningkatan kapasitas sumber daya aparatur'),
(4, 'Peningkatan sarana dan prasarana aparatur'),
(5, 'Pemeliharaan sarana dan prasarana aparatur');

-- --------------------------------------------------------

--
-- Table structure for table `kpi`
--

DROP TABLE IF EXISTS `kpi`;
CREATE TABLE IF NOT EXISTS `kpi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  KEY `kriteria_id` (`kriteria_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `kpi`
--

INSERT IGNORE INTO `kpi` (`id`, `kriteria_id`, `periode_id`, `nilai`) VALUES
(13, 1, 1, NULL),
(14, 2, 1, NULL),
(15, 3, 1, NULL),
(16, 4, 1, NULL),
(17, 5, 1, 18100000000),
(18, 7, 1, 1),
(19, 13, 1, 0.5),
(20, 8, 1, 0.97291666666667),
(21, 9, 1, 0.5),
(22, 10, 1, 1),
(23, 11, 1, 0),
(24, 12, 1, 0),
(25, 1, 2, NULL),
(26, 2, 2, NULL),
(27, 3, 2, NULL),
(28, 4, 2, NULL),
(29, 5, 2, NULL),
(30, 7, 2, NULL),
(31, 13, 2, 0),
(32, 8, 2, 0),
(33, 9, 2, 0),
(34, 10, 2, 0),
(35, 11, 2, 0),
(36, 12, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kriteria`
--

DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE IF NOT EXISTS `kriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `kriteria`
--

INSERT IGNORE INTO `kriteria` (`id`, `nama`, `parent_id`) VALUES
(1, 'Finansial', NULL),
(2, 'Pelanggan', NULL),
(3, 'Internal Bisnis', NULL),
(4, 'Pembelajaran dan Pertumbuhan', NULL),
(5, 'Anggaran Masuk', 1),
(7, 'Efektivitas Anggaran', 1),
(8, 'Kepuasan Kerja Pegawai', 3),
(9, 'Peningkatan Kualitas Pegawai', 3),
(10, 'Kualitas Sarana Prasaran', 3),
(11, 'Kualitas SDM', 4),
(12, 'Efektivitas Komunikasi', 4),
(13, 'Tingkat Pelayanan Publik', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE IF NOT EXISTS `pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jabatan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `golongan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pend_formal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `status` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `pegawai`
--

INSERT IGNORE INTO `pegawai` (`id`, `nip`, `nama`, `jabatan`, `golongan`, `pend_formal`, `status`) VALUES
(4, '123456', 'mamat', 'bendahara', 'III A', 'S1 Ilmu Komunikasi', 'aktif'),
(5, '123333', 'ijong', 'kepala divisi komunikasi', 'IV A', 'S1 Ilmu Komunikasi', 'aktif'),
(6, '1347888', 'agus', 'kepala dinas', 'IV B', 's2 Ilmu komputer', 'aktif'),
(7, '4378929', 'rahmat', 'kepala divisi pelayanan publik', 'IV A', 'S1 Ilmu Komunikasi', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

DROP TABLE IF EXISTS `penugasan`;
CREATE TABLE IF NOT EXISTS `penugasan` (
  `pegawai_id` int(11) NOT NULL,
  `nama_penugasan` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `tingkat` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` year(4) NOT NULL,
  `terisi_bobot` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `periode`
--

INSERT IGNORE INTO `periode` (`id`, `nama`, `terisi_bobot`) VALUES
(1, 2010, 1),
(2, 2011, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pertemuan`
--

DROP TABLE IF EXISTS `pertemuan`;
CREATE TABLE IF NOT EXISTS `pertemuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_kerja_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jenis_pertemuan` varchar(255) NOT NULL,
  `selesai` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  KEY `program_kerja_id` (`program_kerja_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
CREATE TABLE IF NOT EXISTS `presensi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periode_id` int(11) NOT NULL,
  `nip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah_hadir` int(11) NOT NULL,
  `jumlah_sakit` int(11) NOT NULL,
  `jumlah_izin` int(11) NOT NULL,
  `jumlah_tanpa_keterangan` int(11) NOT NULL,
  PRIMARY KEY (`id`,`periode_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `presensi`
--

INSERT IGNORE INTO `presensi` (`id`, `periode_id`, `nip`, `jumlah_hadir`, `jumlah_sakit`, `jumlah_izin`, `jumlah_tanpa_keterangan`) VALUES
(1, 1, '123456', 234, 3, 2, 1),
(2, 1, '123333', 233, 3, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `program_kerja`
--

DROP TABLE IF EXISTS `program_kerja`;
CREATE TABLE IF NOT EXISTS `program_kerja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jenis_pelayanan_id` int(11) NOT NULL,
  `target_anggaran` double NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_target_selesai` date NOT NULL,
  `riil_tanggal_selesai` date NOT NULL,
  `riil_anggaran` double NOT NULL,
  `periode_id` int(11) NOT NULL,
  `selesai` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jenis_pelayanan_id` (`jenis_pelayanan_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `program_kerja`
--

INSERT IGNORE INTO `program_kerja` (`id`, `nama`, `jenis_pelayanan_id`, `target_anggaran`, `tanggal_mulai`, `tanggal_target_selesai`, `riil_tanggal_selesai`, `riil_anggaran`, `periode_id`, `selesai`) VALUES
(7, 'Penyusunan RIP Postel', 1, 150000000, '2010-03-07', '2010-03-07', '2010-03-07', 150000000, 1, 1),
(8, 'penyusunan rancangan peraturan daerah kominfo', 1, 150000000, '2010-04-07', '2010-04-07', '2010-04-07', 150000000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pegawai_id` int(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT IGNORE INTO `user` (`id`, `username`, `password`, `pegawai_id`, `is_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 0, 0),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 0, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anggaran`
--
ALTER TABLE `anggaran`
  ADD CONSTRAINT `anggaran_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bobot`
--
ALTER TABLE `bobot`
  ADD CONSTRAINT `bobot_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_ibfk_3` FOREIGN KEY (`kriteria_pembanding_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_5` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kpi`
--
ALTER TABLE `kpi`
  ADD CONSTRAINT `kpi_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kpi_ibfk_2` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penugasan`
--
ALTER TABLE `penugasan`
  ADD CONSTRAINT `penugasan_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pertemuan`
--
ALTER TABLE `pertemuan`
  ADD CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`program_kerja_id`) REFERENCES `program_kerja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pertemuan_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `presensi`
--
ALTER TABLE `presensi`
  ADD CONSTRAINT `presensi_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program_kerja`
--
ALTER TABLE `program_kerja`
  ADD CONSTRAINT `program_kerja_ibfk_1` FOREIGN KEY (`jenis_pelayanan_id`) REFERENCES `jenis_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `program_kerja_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
