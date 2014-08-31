-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2014 at 10:57 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `e_healthkms`
--

-- --------------------------------------------------------

--
-- Table structure for table `gambar`
--

CREATE TABLE IF NOT EXISTS `gambar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` varchar(60) NOT NULL,
  `deskripsi` text NOT NULL,
  `id_penyakit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gambar_penyakit1` (`id_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_data`
--

CREATE TABLE IF NOT EXISTS `log_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `log_act` text NOT NULL,
  `id_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `log_data`
--

INSERT INTO `log_data` (`id`, `stamp`, `log_act`, `id_user`) VALUES
(1, '2014-06-17 04:57:11', '{"operation":"insert","table_name":"penyakit","data":{"id":"1"}}', 1),
(2, '2014-06-24 03:32:27', '{"operation":"insert","table_name":"penyakit","data":{"id":"2"}}', 1),
(3, '2014-06-24 03:32:29', '{"operation":"insert","table_name":"penyakit","data":{"id":"3"}}', 1),
(4, '2014-06-24 03:33:06', '{"operation":"delete","table_name":"penyakit","data":{"diagnosis":"Ditemukan adanya bakteri galau"}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `dosis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE IF NOT EXISTS `penyakit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) NOT NULL,
  `penyebab` text NOT NULL,
  `gejala` text NOT NULL,
  `diagnosis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `nama`, `penyebab`, `gejala`, `diagnosis`) VALUES
(1, 'Test penyakit', 'Lorem ipsum', 'Lorem ipsum', 'Lorem ipsum'),
(2, 'sakit hati', 'gak boleh ikut sidang', 'pusing sakit perut nyeri', 'Ditemukan adanya bakteri galau');

-- --------------------------------------------------------

--
-- Table structure for table `penyakit_has_obat`
--

CREATE TABLE IF NOT EXISTS `penyakit_has_obat` (
  `id_penyakit` bigint(20) NOT NULL,
  `id_obat` bigint(20) NOT NULL,
  PRIMARY KEY (`id_penyakit`,`id_obat`),
  KEY `fk_penyakit_has_obat_obat1_idx` (`id_obat`),
  KEY `fk_penyakit_has_obat_penyakit_idx` (`id_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomor_sip` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `salt` varchar(60) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `lokasi_penugasan` varchar(50) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `role` char(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gambar`
--
ALTER TABLE `gambar`
  ADD CONSTRAINT `fk_gambar_penyakit1` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penyakit_has_obat`
--
ALTER TABLE `penyakit_has_obat`
  ADD CONSTRAINT `fk_penyakit_has_obat_obat1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penyakit_has_obat_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
