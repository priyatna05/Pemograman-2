-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.27-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for dbaplikasipenilaianmahasiswa
CREATE DATABASE IF NOT EXISTS `dbaplikasipenilaianmahasiswa` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `dbaplikasipenilaianmahasiswa`;

-- Dumping structure for table dbaplikasipenilaianmahasiswa.karyawan
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id` int(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jenis_kelamin` char(10) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabupaten` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table dbaplikasipenilaianmahasiswa.karyawan: ~1 rows (approximately)
INSERT INTO `karyawan` (`id`, `nim`, `nama`, `jenis_kelamin`, `alamat`, `kelurahan`, `kecamatan`, `kabupaten`, `provinsi`) VALUES
	(2010, '2010', 'priyatna', 'pria', 'pd cabe 1', 'pamulang', 'ciputat', 'tangerang', 'banten');

-- Dumping structure for table dbaplikasipenilaianmahasiswa.tbbiayakuliah
CREATE TABLE IF NOT EXISTS `tbbiayakuliah` (
  `prodi` varchar(12) NOT NULL,
  `biaya_semester` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbaplikasipenilaianmahasiswa.tbbiayakuliah: ~3 rows (approximately)
INSERT INTO `tbbiayakuliah` (`prodi`, `biaya_semester`) VALUES
	('Informatika', '1000'),
	('Pertanian', '5000000'),
	('Teknik mesin', '5000000');

-- Dumping structure for table dbaplikasipenilaianmahasiswa.tbmahasiswa
CREATE TABLE IF NOT EXISTS `tbmahasiswa` (
  `nim` varchar(20) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `semester` int(11) NOT NULL,
  `kelas` varchar(1) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbaplikasipenilaianmahasiswa.tbmahasiswa: ~2 rows (approximately)
INSERT INTO `tbmahasiswa` (`nim`, `nama`, `semester`, `kelas`, `password`) VALUES
	('201011400103', 'Priyatna', 5, 'C', '202cb962ac59075b964b07152d234b70'),
	('201011400104', 'anonim', 5, 'A', '827ccb0eea8a706c4c34a16891f84e7b');

-- Dumping structure for table dbaplikasipenilaianmahasiswa.tbmatakuliah
CREATE TABLE IF NOT EXISTS `tbmatakuliah` (
  `kode` varchar(12) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbaplikasipenilaianmahasiswa.tbmatakuliah: ~2 rows (approximately)
INSERT INTO `tbmatakuliah` (`kode`, `nama`, `sks`) VALUES
	('um1', 'Pemograman 2', 3),
	('um2', 'Basic Java', 2);

-- Dumping structure for table dbaplikasipenilaianmahasiswa.tbnilai
CREATE TABLE IF NOT EXISTS `tbnilai` (
  `nim` varchar(12) NOT NULL,
  `kodematakuliah` varchar(12) NOT NULL,
  `tugas` varchar(3) NOT NULL,
  `uts` varchar(3) NOT NULL,
  `uas` varchar(3) NOT NULL,
  PRIMARY KEY (`nim`,`kodematakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table dbaplikasipenilaianmahasiswa.tbnilai: ~4 rows (approximately)
INSERT INTO `tbnilai` (`nim`, `kodematakuliah`, `tugas`, `uts`, `uas`) VALUES
	('11402248', 'P2', '89', '88', '78'),
	('11402248', 'TBO1', '70', '80', '90'),
	('201011400103', 'um1', '80', '78', '85'),
	('201011400103', 'um2', '80', '80', '80');

-- Dumping structure for table dbaplikasipenilaianmahasiswa.tbpembayarankuliah
CREATE TABLE IF NOT EXISTS `tbpembayarankuliah` (
  `no_tagihan` varchar(20) NOT NULL,
  `nim` varchar(50) NOT NULL DEFAULT '0',
  `prodi` varchar(17) DEFAULT NULL,
  `pembayaran` int(11) DEFAULT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tanggal_bayar` date DEFAULT NULL,
  PRIMARY KEY (`nim`,`no_tagihan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='\r\n';

-- Dumping data for table dbaplikasipenilaianmahasiswa.tbpembayarankuliah: ~2 rows (approximately)
INSERT INTO `tbpembayarankuliah` (`no_tagihan`, `nim`, `prodi`, `pembayaran`, `jumlah_bayar`, `status`, `tanggal_bayar`) VALUES
	('2010114000951', '201011400095', 'Akuntansi', 7000000, 2000000, 'KURANG', '2022-12-11'),
	('2010114001071', '201011400107', 'Teknik mesin', 5000000, 1000000, 'KURANG', '2022-12-17');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
