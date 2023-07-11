-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for laporansiswa
CREATE DATABASE IF NOT EXISTS `laporansiswa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `laporansiswa`;

-- Dumping structure for table laporansiswa.hubungan
CREATE TABLE IF NOT EXISTS `hubungan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siswa_id` int(10) DEFAULT NULL,
  `ortu_id` int(10) DEFAULT NULL,
  `status_hub_anak` char(50) DEFAULT NULL,
  `keterangan` char(50) DEFAULT NULL,
  `status_ortu` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hubungan_ortu` (`ortu_id`),
  KEY `fk_hubungan_siswa` (`siswa_id`),
  CONSTRAINT `fk_hubungan_ortu` FOREIGN KEY (`ortu_id`) REFERENCES `ortu` (`id`),
  CONSTRAINT `fk_hubungan_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.kelas
CREATE TABLE IF NOT EXISTS `kelas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  `jenis` varchar(20) DEFAULT NULL,
  `jurusan` enum('IPA','IPS') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.ortu
CREATE TABLE IF NOT EXISTS `ortu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nik` char(20) DEFAULT NULL,
  `nama` char(60) DEFAULT NULL,
  `pendidikan` char(50) DEFAULT NULL,
  `pekerjaan` char(50) DEFAULT NULL,
  `telp` char(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `agama` char(30) DEFAULT NULL,
  `is_active` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.poin
CREATE TABLE IF NOT EXISTS `poin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_poin` varchar(30) DEFAULT NULL,
  `bobot` varchar(10) DEFAULT NULL,
  `jenis` enum('Pelanggaran','Prestasi') DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.semester
CREATE TABLE IF NOT EXISTS `semester` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siswa_id` int(10) DEFAULT NULL,
  `poin_id` int(10) DEFAULT NULL,
  `wali_id` int(10) DEFAULT NULL,
  `ortu_id` int(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` int(10) DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_semeter_siswa` (`siswa_id`),
  KEY `fk_semester_poin` (`poin_id`),
  KEY `fk_semester_wali_kelas` (`wali_id`),
  KEY `fk_semester_ortu` (`ortu_id`),
  CONSTRAINT `fk_semester_ortu` FOREIGN KEY (`ortu_id`) REFERENCES `ortu` (`id`),
  CONSTRAINT `fk_semester_poin` FOREIGN KEY (`poin_id`) REFERENCES `poin` (`id`),
  CONSTRAINT `fk_semester_wali_kelas` FOREIGN KEY (`wali_id`) REFERENCES `wali_kelas` (`id`),
  CONSTRAINT `fk_semeter_siswa` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.siswa
CREATE TABLE IF NOT EXISTS `siswa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nis` char(20) DEFAULT NULL,
  `nisn` char(20) DEFAULT NULL,
  `nama` varchar(60) DEFAULT NULL,
  `nik` char(20) DEFAULT NULL,
  `tempat_lahir` varchar(150) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `hp` char(20) DEFAULT NULL,
  `status` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `level` enum('User','Admin') DEFAULT NULL,
  `status` enum('Guru','Siswa','Ortu') DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_userid` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_userid` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table laporansiswa.wali_kelas
CREATE TABLE IF NOT EXISTS `wali_kelas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nik` int(20) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `telp` int(15) DEFAULT NULL,
  `matpel` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `status` enum('Wali_Kelas','TU') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
