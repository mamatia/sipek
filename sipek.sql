-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 19, 2011 at 08:42 PM
-- Server version: 5.1.51
-- PHP Version: 5.3.6-pl0-gentoo

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


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

CREATE TABLE IF NOT EXISTS `anggaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sumber` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_terima` date NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `anggaran`
--

INSERT INTO `anggaran` (`id`, `sumber`, `jumlah`, `tanggal_terima`, `periode_id`) VALUES
(1, 'fsdgsgs', 4342525, '2011-05-16', 1),
(2, 'ghgjghjjjh', 689898988, '2011-05-16', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bobot`
--

CREATE TABLE IF NOT EXISTS `bobot` (
  `kriteria_id` int(11) NOT NULL,
  `kriteria_pembanding_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`kriteria_id`,`kriteria_pembanding_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `bobot`
--

INSERT INTO `bobot` (`kriteria_id`, `kriteria_pembanding_id`, `nilai`, `periode_id`) VALUES
(1, 2, 1, 1),
(1, 3, 0.5, 1),
(1, 4, 2, 1),
(2, 1, 1, 1),
(2, 3, 0.5, 1),
(2, 4, 1, 1),
(3, 1, 2, 1),
(3, 2, 2, 1),
(3, 4, 1, 1),
(4, 1, 0.5, 1),
(4, 2, 1, 1),
(4, 3, 1, 1),
(5, 6, 6, 1),
(5, 7, 5, 1),
(6, 5, 0.17, 1),
(6, 7, 6, 1),
(7, 5, 0.2, 1),
(7, 6, 0.17, 1),
(8, 9, 5, 1),
(8, 10, 4, 1),
(9, 8, 0.2, 1),
(9, 10, 0.2, 1),
(10, 8, 0.25, 1),
(10, 9, 5, 1),
(11, 12, 0.14, 1),
(12, 11, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bobot_kriteria`
--

CREATE TABLE IF NOT EXISTS `bobot_kriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `bobot_kriteria`
--

INSERT INTO `bobot_kriteria` (`id`, `kriteria_id`, `periode_id`, `nilai`) VALUES
(1, 1, 1, 0.22),
(2, 2, 1, 0.19),
(3, 3, 1, 0.34),
(4, 4, 1, 0.21),
(5, 5, 1, 0.7),
(6, 6, 1, 0.34),
(7, 7, 1, 0.07),
(8, 8, 1, 0.66),
(9, 9, 1, 0.08),
(10, 10, 1, 0.34),
(11, 11, 1, 0.12),
(12, 12, 1, 0.8);

-- --------------------------------------------------------

--
-- Table structure for table `inventaris`
--

CREATE TABLE IF NOT EXISTS `inventaris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kondisi` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `inventaris`
--

INSERT INTO `inventaris` (`id`, `jenis`, `jumlah`, `kondisi`, `periode_id`) VALUES
(1, 'bbfdbfb', 45, 'Baik', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pelayanan`
--

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
-- Table structure for table `pegawai`
--

CREATE TABLE IF NOT EXISTS `pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jabatan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `golongan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pend_formal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `status` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id`, `nip`, `nama`, `jabatan`, `golongan`, `pend_formal`, `status`, `periode_id`) VALUES
(1, '123456', 'c', 'c', 'II A', 'C', 'C', 0),
(2, 'a', 'a', 'a', 'II A', 'a', 'a', 0),
(3, '345677', 'fff', 'fff', 'II A', 'ggggg', 'gggg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `penugasan`
--

CREATE TABLE IF NOT EXISTS `penugasan` (
  `pegawai_id` int(11) NOT NULL,
  `nama_penugasan` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `tingkat` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `penugasan`
--


-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` year(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `periode`
--

INSERT INTO `periode` (`id`, `nama`) VALUES
(1, 2010);

-- --------------------------------------------------------

--
-- Table structure for table `presensi`
--

CREATE TABLE IF NOT EXISTS `presensi` (
  `pegawai_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jumlah_hadir` int(11) NOT NULL,
  `jumlah_sakit` int(11) NOT NULL,
  `jumlah_izin` int(11) NOT NULL,
  `jumlah_tanpa_keterangan` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`,`periode_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `presensi`
--

INSERT INTO `presensi` (`pegawai_id`, `periode_id`, `jumlah_hadir`, `jumlah_sakit`, `jumlah_izin`, `jumlah_tanpa_keterangan`) VALUES
(0, 1, 333, 2, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `program_kerja`
--

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
  PRIMARY KEY (`id`),
  KEY `jenis_pelayanan_id` (`jenis_pelayanan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `program_kerja`
--

INSERT INTO `program_kerja` (`id`, `nama`, `jenis_pelayanan_id`, `target_anggaran`, `tanggal_mulai`, `tanggal_target_selesai`, `riil_tanggal_selesai`, `riil_anggaran`, `periode_id`) VALUES
(1, 'sfskgks', 0, 3940000, '2011-06-20', '2011-06-20', '2011-06-20', 4200000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sasaran`
--

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

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `is_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 0);
