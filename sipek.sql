-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 17, 2011 at 11:06 PM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT=0;
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sipek`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `anggaran`
--

INSERT INTO `anggaran` (`id`, `sumber`, `jumlah`, `tanggal_terima`, `periode_id`) VALUES
(1, 'pemprov jabar', 10000000000, '2010-03-09', 1),
(2, 'pemkot bandung', 500000000, '2010-02-03', 1),
(3, 'pemkot bandung', 300000000, '2010-01-06', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `bobot_kriteria`
--


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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id`, `jenis`, `jumlah`, `kondisi`, `periode_id`) VALUES
(1, 'Kendaraan M-CAP', 2, 'Baik', 1),
(2, 'Genset M-CAP', 2, 'Baik', 1),
(3, 'Modem ADSL Backup', 5, 'Baik', 1),
(4, 'Server Mirror', 1, 'Baik', 1),
(5, 'Rol Kabel UTP', 2, 'Baik', 1),
(6, 'wireless router CAP', 2, 'Baik', 1),
(7, 'switch', 2, 'Baik', 1);

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

INSERT INTO `jenis_pelayanan` (`id`, `nama`) VALUES
(1, 'Perencanaan, pengendalian, dan pembangunan daerah'),
(2, 'Pengembangan komunikasi, informasi, media massa, dan pemanfaatan TI'),
(3, 'Peningkatan kapasitas sumber daya aparatur'),
(4, 'Peningkatan sarana dan prasarana aparatur'),
(5, 'Pemeliharaan sarana dan prasarana aparatur');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama`, `parent_id`) VALUES
(1, 'Finansial', NULL),
(2, 'Pelanggan', NULL),
(3, 'Internal Bisnis', NULL),
(4, 'Pembelajaran dan Pertumbuhan', NULL),
(5, 'Anggaran Masuk', 1),
(6, 'Penggunaan Anggaran', 1),
(7, 'Efektivitas Anggaran', 1),
(8, 'Kepuasan Kerja Pegawai', 3),
(9, 'Peningkatan Kualitas Pegawai', 3),
(10, 'Kualitas Sarana Prasaran', 3),
(11, 'Kualitas SDM', 4),
(12, 'Efektivitas Komunikasi', 4);

-- --------------------------------------------------------

--
-- Table structure for table `kti`
--

DROP TABLE IF EXISTS `kti`;
CREATE TABLE IF NOT EXISTS `kti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  KEY `kriteria_id` (`kriteria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `kti`
--


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

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `jabatan`, `golongan`, `pend_formal`, `status`) VALUES
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

--
-- Dumping data for table `penugasan`
--


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

INSERT INTO `periode` (`id`, `nama`, `terisi_bobot`) VALUES
(1, 2010, 0),
(2, 2011, 0);

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

--
-- Dumping data for table `pertemuan`
--


-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
CREATE TABLE IF NOT EXISTS `presensi` (
  `pegawai_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jumlah_hadir` int(11) NOT NULL,
  `jumlah_sakit` int(11) NOT NULL,
  `jumlah_izin` int(11) NOT NULL,
  `jumlah_tanpa_keterangan` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`,`periode_id`),
  KEY `periode_id` (`periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`pegawai_id`, `periode_id`, `jumlah_hadir`, `jumlah_sakit`, `jumlah_izin`, `jumlah_tanpa_keterangan`) VALUES
(4, 1, 23, 3, 3, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `program_kerja`
--

INSERT INTO `program_kerja` (`id`, `nama`, `jenis_pelayanan_id`, `target_anggaran`, `tanggal_mulai`, `tanggal_target_selesai`, `riil_tanggal_selesai`, `riil_anggaran`, `periode_id`, `selesai`) VALUES
(6, 'Pengembangan infrastruktur jaringan provinsi', 1, 7600000000, '2010-07-18', '2010-07-18', '2010-07-18', 7600000000, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sasaran`
--

DROP TABLE IF EXISTS `sasaran`;
CREATE TABLE IF NOT EXISTS `sasaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periode_id` int(11) NOT NULL,
  `cash_in` int(11) NOT NULL,
  `cash_out` int(11) NOT NULL,
  `target_anggaran` int(11) NOT NULL,
  `target_penggunaan_anggaran` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sasaran`
--


-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 0);

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
  ADD CONSTRAINT `bobot_ibfk_3` FOREIGN KEY (`kriteria_pembanding_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bobot_kriteria`
--
ALTER TABLE `bobot_kriteria`
  ADD CONSTRAINT `bobot_kriteria_ibfk_5` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bobot_kriteria_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventaris`
--
ALTER TABLE `inventaris`
  ADD CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kriteria`
--
ALTER TABLE `kriteria`
  ADD CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kti`
--
ALTER TABLE `kti`
  ADD CONSTRAINT `kti_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kti_ibfk_2` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `presensi_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `program_kerja`
--
ALTER TABLE `program_kerja`
  ADD CONSTRAINT `program_kerja_ibfk_1` FOREIGN KEY (`jenis_pelayanan_id`) REFERENCES `jenis_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `program_kerja_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
