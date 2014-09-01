-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2014 at 04:08 AM
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
  `deskripsi` text,
  `id_penyakit` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gambar_penyakit1_idx` (`id_penyakit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jejaring_sosial`
--

CREATE TABLE IF NOT EXISTS `jejaring_sosial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` text NOT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jejaring_sosial_user1_idx` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `langganan_jejaring_sosial`
--

CREATE TABLE IF NOT EXISTS `langganan_jejaring_sosial` (
  `id_user_follower` bigint(20) NOT NULL,
  `id_user_following` bigint(20) NOT NULL,
  PRIMARY KEY (`id_user_following`,`id_user_follower`),
  KEY `fk_langganan_jejaring_sosial_user1_idx` (`id_user_follower`),
  KEY `fk_langganan_jejaring_sosial_user2_idx` (`id_user_following`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `log_data`
--

INSERT INTO `log_data` (`id`, `stamp`, `log_act`, `id_user`) VALUES
(1, '2014-09-01 19:06:49', '{"operation":"insert","table_name":"obat","data":{"id":"1"}}', 1),
(2, '2014-09-01 19:30:38', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(3, '2014-09-01 19:30:42', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(4, '2014-09-01 19:30:43', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(5, '2014-09-01 19:49:55', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(6, '2014-09-01 19:49:57', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(7, '2014-09-01 19:50:36', '{"operation":"insert","table_name":"penyakit","data":{"knowledge":null}}', 1),
(8, '2014-09-01 19:51:52', '{"operation":"insert","table_name":"obat","data":{"id":"2"}}', 1),
(9, '2014-09-01 19:51:53', '{"operation":"insert","table_name":"obat","data":{"id":"3"}}', 1),
(10, '2014-09-01 19:52:26', '{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}', 1),
(11, '2014-09-01 19:52:30', '{"operation":"delete","table_name":"penyakit","data":{"knowledge":null}}', 1),
(12, '2014-09-01 19:52:47', '{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}', 1),
(13, '2014-09-01 19:53:03', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat2"}}', 1),
(14, '2014-09-01 19:53:17', '{"operation":"insert","table_name":"obat","data":{"id":"4"}}', 1),
(15, '2014-09-01 19:53:18', '{"operation":"insert","table_name":"obat","data":{"id":"5"}}', 1),
(16, '2014-09-01 19:53:59', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat3"}}', 1),
(17, '2014-09-01 19:54:11', '{"operation":"insert","table_name":"obat","data":{"id":"6"}}', 1),
(18, '2014-09-01 19:54:13', '{"operation":"insert","table_name":"obat","data":{"id":"7"}}', 1),
(19, '2014-09-01 19:54:25', '{"operation":"delete","table_name":"obat","data":{"dosis":"Obat4"}}', 1),
(20, '2014-09-01 19:58:17', '{"operation":"insert","table_name":"obat","data":{"id":"8"}}', 1),
(21, '2014-09-01 19:58:43', '{"operation":"insert","table_name":"obat","data":{"id":"9"}}', 1),
(22, '2014-09-01 19:59:23', '{"operation":"update","table_name":"penyakit","data":{"knowledge":null}}', 1),
(23, '2014-09-01 20:13:03', '{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}', 1),
(24, '2014-09-01 20:17:40', '{"operation":"update","table_name":"penyakit","data":{"knowledge":"testy"}}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE IF NOT EXISTS `obat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `keterangan` text,
  `dosis` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id`, `nama`, `keterangan`, `dosis`) VALUES
(1, 'Obat1', 'Test', 'Test'),
(2, 'Obat2', 'Obat2', 'Obat2'),
(4, 'Obat3', 'Obat3', 'Obat3'),
(6, 'Obat4', 'Obat4', 'Obat4'),
(8, 'Obat5', 'Obat5', 'Obat5'),
(9, 'Obat6', 'Obat6', 'Obat6');

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
  `knowledge` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id`, `nama`, `penyebab`, `gejala`, `diagnosis`, `knowledge`) VALUES
(6, 'test', 'test', 'test', 'test', 'testy');

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

--
-- Dumping data for table `penyakit_has_obat`
--

INSERT INTO `penyakit_has_obat` (`id_penyakit`, `id_obat`) VALUES
(6, 1),
(6, 2),
(6, 4),
(6, 6),
(6, 8),
(6, 9);

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
  ADD CONSTRAINT `fk_gambar_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jejaring_sosial`
--
ALTER TABLE `jejaring_sosial`
  ADD CONSTRAINT `fk_jejaring_sosial_user1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `langganan_jejaring_sosial`
--
ALTER TABLE `langganan_jejaring_sosial`
  ADD CONSTRAINT `fk_langganan_jejaring_sosial_user1` FOREIGN KEY (`id_user_follower`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_langganan_jejaring_sosial_user2` FOREIGN KEY (`id_user_following`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penyakit_has_obat`
--
ALTER TABLE `penyakit_has_obat`
  ADD CONSTRAINT `fk_penyakit_has_obat_obat1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penyakit_has_obat_penyakit` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
