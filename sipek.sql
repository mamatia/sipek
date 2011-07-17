-- MySQL dump 10.13  Distrib 5.1.56, for pc-linux-gnu (x86_64)
--
-- Host: localhost    Database: sipek
-- ------------------------------------------------------
-- Server version	5.1.56-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `anggaran`
--

DROP TABLE IF EXISTS `anggaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anggaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sumber` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_terima` date NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `anggaran_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggaran`
--

LOCK TABLES `anggaran` WRITE;
/*!40000 ALTER TABLE `anggaran` DISABLE KEYS */;
INSERT INTO `anggaran` VALUES (1,'pemprov jabar',10000000000,'2010-03-09',1),(2,'pemkot bandung',500000000,'2010-02-03',1),(3,'pemkot bandung',300000000,'2010-01-06',1);
/*!40000 ALTER TABLE `anggaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bobot`
--

DROP TABLE IF EXISTS `bobot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobot` (
  `kriteria_id` int(11) NOT NULL,
  `kriteria_pembanding_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`kriteria_id`,`kriteria_pembanding_id`,`periode_id`),
  KEY `kriteria_pembanding_id` (`kriteria_pembanding_id`),
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `bobot_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobot_ibfk_3` FOREIGN KEY (`kriteria_pembanding_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bobot`
--

LOCK TABLES `bobot` WRITE;
/*!40000 ALTER TABLE `bobot` DISABLE KEYS */;
/*!40000 ALTER TABLE `bobot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bobot_kriteria`
--

DROP TABLE IF EXISTS `bobot_kriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bobot_kriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `periode_id` (`periode_id`),
  KEY `kriteria_id` (`kriteria_id`),
  CONSTRAINT `bobot_kriteria_ibfk_4` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bobot_kriteria_ibfk_3` FOREIGN KEY (`kriteria_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bobot_kriteria`
--

LOCK TABLES `bobot_kriteria` WRITE;
/*!40000 ALTER TABLE `bobot_kriteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `bobot_kriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventaris`
--

DROP TABLE IF EXISTS `inventaris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventaris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jenis` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(11) NOT NULL,
  `kondisi` enum('Baik','Cukup','Buruk') COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `inventaris_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventaris`
--

LOCK TABLES `inventaris` WRITE;
/*!40000 ALTER TABLE `inventaris` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventaris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_pelayanan`
--

DROP TABLE IF EXISTS `jenis_pelayanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jenis_pelayanan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_pelayanan`
--

LOCK TABLES `jenis_pelayanan` WRITE;
/*!40000 ALTER TABLE `jenis_pelayanan` DISABLE KEYS */;
INSERT INTO `jenis_pelayanan` VALUES (1,'Perencanaan, pengendalian, dan pembangunan daerah'),(2,'Pengembangan komunikasi, informasi, media massa, dan pemanfaatan TI'),(3,'Peningkatan kapasitas sumber daya aparatur'),(4,'Peningkatan sarana dan prasarana aparatur'),(5,'Pemeliharaan sarana dan prasarana aparatur');
/*!40000 ALTER TABLE `jenis_pelayanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kriteria`
--

DROP TABLE IF EXISTS `kriteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kriteria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `kriteria_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kriteria`
--

LOCK TABLES `kriteria` WRITE;
/*!40000 ALTER TABLE `kriteria` DISABLE KEYS */;
INSERT INTO `kriteria` VALUES (1,'Finansial',NULL),(2,'Pelanggan',NULL),(3,'Internal Bisnis',NULL),(4,'Pembelajaran dan Pertumbuhan',NULL),(5,'Anggaran Masuk',1),(6,'Penggunaan Anggaran',1),(7,'Efektivitas Anggaran',1),(8,'Kepuasan Kerja Pegawai',3),(9,'Peningkatan Kualitas Pegawai',3),(10,'Kualitas Sarana Prasaran',3),(11,'Kualitas SDM',4),(12,'Efektivitas Komunikasi',4);
/*!40000 ALTER TABLE `kriteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kti`
--

DROP TABLE IF EXISTS `kti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kti` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kriteria_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `nilai` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  KEY `kriteria_id` (`kriteria_id`),
  CONSTRAINT `kti_ibfk_2` FOREIGN KEY (`kriteria_id`) REFERENCES `kriteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kti_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kti`
--

LOCK TABLES `kti` WRITE;
/*!40000 ALTER TABLE `kti` DISABLE KEYS */;
/*!40000 ALTER TABLE `kti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pegawai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `nama` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `jabatan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `golongan` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `pend_formal` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `status` varchar(255) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pegawai`
--

LOCK TABLES `pegawai` WRITE;
/*!40000 ALTER TABLE `pegawai` DISABLE KEYS */;
INSERT INTO `pegawai` VALUES (1,'123456','c','c','II A','C','C'),(2,'a','a','a','II A','a','a'),(3,'345677','fff','fff','II A','ggggg','gggg'),(4,'123456','mamat','bendahara','III A','S1 Ilmu Komunikasi','aktif'),(5,'123333','ijong','kepala divisi komunikasi','IV A','S1 Ilmu Komunikasi','aktif'),(6,'1347888','agus','kepala dinas','IV B','s2 Ilmu komputer','aktif'),(7,'4378929','rahmat','kepala divisi pelayanan publik','IV A','S1 Ilmu Komunikasi','aktif');
/*!40000 ALTER TABLE `pegawai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penugasan`
--

DROP TABLE IF EXISTS `penugasan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `penugasan` (
  `pegawai_id` int(11) NOT NULL,
  `nama_penugasan` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `tingkat` varchar(250) COLLATE latin1_general_ci NOT NULL,
  `periode_id` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`),
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `penugasan_ibfk_1` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penugasan`
--

LOCK TABLES `penugasan` WRITE;
/*!40000 ALTER TABLE `penugasan` DISABLE KEYS */;
/*!40000 ALTER TABLE `penugasan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periode`
--

DROP TABLE IF EXISTS `periode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` year(4) NOT NULL,
  `terisi_bobot` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periode`
--

LOCK TABLES `periode` WRITE;
/*!40000 ALTER TABLE `periode` DISABLE KEYS */;
INSERT INTO `periode` VALUES (1,2010,0),(2,2011,0);
/*!40000 ALTER TABLE `periode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertemuan`
--

DROP TABLE IF EXISTS `pertemuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pertemuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_kerja_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jenis_pertemuan` varchar(255) NOT NULL,
  `selesai` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `periode_id` (`periode_id`),
  KEY `program_kerja_id` (`program_kerja_id`),
  CONSTRAINT `pertemuan_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pertemuan_ibfk_1` FOREIGN KEY (`program_kerja_id`) REFERENCES `program_kerja` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertemuan`
--

LOCK TABLES `pertemuan` WRITE;
/*!40000 ALTER TABLE `pertemuan` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertemuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presensi`
--

DROP TABLE IF EXISTS `presensi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presensi` (
  `pegawai_id` int(11) NOT NULL,
  `periode_id` int(11) NOT NULL,
  `jumlah_hadir` int(11) NOT NULL,
  `jumlah_sakit` int(11) NOT NULL,
  `jumlah_izin` int(11) NOT NULL,
  `jumlah_tanpa_keterangan` int(11) NOT NULL,
  PRIMARY KEY (`pegawai_id`,`periode_id`),
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `presensi_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `presensi_ibfk_1` FOREIGN KEY (`pegawai_id`) REFERENCES `pegawai` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presensi`
--

LOCK TABLES `presensi` WRITE;
/*!40000 ALTER TABLE `presensi` DISABLE KEYS */;
/*!40000 ALTER TABLE `presensi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_kerja`
--

DROP TABLE IF EXISTS `program_kerja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_kerja` (
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
  KEY `periode_id` (`periode_id`),
  CONSTRAINT `program_kerja_ibfk_2` FOREIGN KEY (`periode_id`) REFERENCES `periode` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `program_kerja_ibfk_1` FOREIGN KEY (`jenis_pelayanan_id`) REFERENCES `jenis_pelayanan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_kerja`
--

LOCK TABLES `program_kerja` WRITE;
/*!40000 ALTER TABLE `program_kerja` DISABLE KEYS */;
/*!40000 ALTER TABLE `program_kerja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sasaran`
--

DROP TABLE IF EXISTS `sasaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sasaran` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `periode_id` int(11) NOT NULL,
  `cash_in` int(11) NOT NULL,
  `cash_out` int(11) NOT NULL,
  `target_anggaran` int(11) NOT NULL,
  `target_penggunaan_anggaran` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sasaran`
--

LOCK TABLES `sasaran` WRITE;
/*!40000 ALTER TABLE `sasaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `sasaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1),(2,'user','ee11cbb19052e40b07aac0ca060c23ee',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-17 13:51:34
