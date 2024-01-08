-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 25. Apr 2023 um 08:44
-- Server-Version: 10.5.18-MariaDB-0+deb11u1
-- PHP-Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `web360_survey`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin`
--

CREATE TABLE `jumi_admin` (
  `uid` int(11) NOT NULL,
  `vorname` varchar(20) NOT NULL DEFAULT '',
  `nachname` varchar(20) NOT NULL DEFAULT '',
  `mail` varchar(100) NOT NULL,
  `passwort` varchar(32) NOT NULL DEFAULT '',
  `passwortcode` varchar(255) DEFAULT NULL COMMENT 'Passwort vergessen',
  `passwortcode_time` timestamp NULL DEFAULT NULL COMMENT 'Passwort vergessen',
  `aktiv` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Benutzer';

--
-- Daten für Tabelle `jumi_admin`
--

INSERT INTO `jumi_admin` (`uid`, `vorname`, `nachname`, `mail`, `passwort`, `passwortcode`, `passwortcode_time`, `aktiv`) VALUES
(1, 'Alexander', 'Schwarz', 'ali@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', '51e0496638c32ae53883079dba72b01b42ece57a', '2023-04-18 09:01:36', '1'),
(2, 'Jeannette', 'Schwarz', 'jeannette@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', NULL, NULL, '1'),
(3, 'Nadine', 'Schubert', 'nadine@ju-and-mi.de', '507e1f06de7db173ea9c3c41f7ff8d33', NULL, NULL, '1'),
(4, 'Björn', 'Idler', 'bjoern@ju-and-mi.de', 'c4308bb58d24e4feafa4300c18ddd2e8', NULL, NULL, '1'),
(5, 'Anica', 'Müller', 'anica@ju-and-mi.de', '487844c21930fb20771108d78c4d38b7', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_adminlog`
--

CREATE TABLE `jumi_adminlog` (
  `lid` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `user_agent` varchar(255) NOT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Logins der Anwender';

--
-- Daten für Tabelle `jumi_adminlog`
--

INSERT INTO `jumi_adminlog` (`lid`, `Datum`, `IP`, `user_agent`, `uid`) VALUES
(2, '2023-03-22 16:18:23', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(3, '2023-03-22 16:23:28', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(4, '2023-03-22 16:23:38', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(5, '2023-03-22 16:41:27', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(6, '2023-03-22 16:45:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1),
(8, '2023-03-22 16:59:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1),
(9, '2023-03-22 19:05:37', '93.235.6.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(10, '2023-03-22 19:09:51', '93.235.6.36', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(11, '2023-03-22 19:29:21', '77.180.60.155', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(12, '2023-03-23 06:44:15', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(13, '2023-03-23 06:45:32', '93.235.8.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(14, '2023-03-23 07:26:17', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(15, '2023-03-23 07:33:36', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(16, '2023-03-23 07:36:29', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(17, '2023-03-23 08:27:03', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(18, '2023-03-23 08:56:59', '93.235.8.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(19, '2023-03-23 13:35:05', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(20, '2023-03-23 13:41:07', '93.235.8.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(21, '2023-03-23 14:35:30', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(22, '2023-03-23 14:51:18', '93.235.8.169', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(23, '2023-03-23 14:55:36', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(28, '2023-03-23 16:11:15', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(29, '2023-03-23 16:36:43', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(30, '2023-03-23 16:39:42', '93.235.8.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(31, '2023-03-24 13:41:22', '193.197.150.215', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(32, '2023-03-24 14:20:07', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(33, '2023-03-24 16:04:26', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(34, '2023-03-24 16:07:09', '93.235.8.220', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(38, '2023-03-24 16:55:45', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(39, '2023-03-24 17:16:08', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(40, '2023-03-24 18:20:40', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(41, '2023-03-24 18:37:42', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(42, '2023-03-24 19:00:09', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(43, '2023-03-24 20:42:53', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(44, '2023-03-24 22:58:50', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(45, '2023-03-24 23:34:52', '93.235.8.220', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(46, '2023-03-25 06:50:06', '46.91.139.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(47, '2023-03-25 08:17:27', '46.91.139.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 2),
(48, '2023-03-25 10:16:39', '46.91.139.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 1),
(49, '2023-03-25 12:58:31', '46.91.139.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(50, '2023-03-25 12:59:21', '46.91.139.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(51, '2023-03-25 13:01:09', '46.91.139.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(52, '2023-03-25 15:34:18', '46.91.139.219', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.2 Safari/605.1.15', 1),
(53, '2023-03-25 20:59:53', '46.91.139.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(54, '2023-03-26 07:52:00', '93.235.6.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(55, '2023-03-26 14:05:50', '93.235.6.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:107.0) Gecko/20100101 Firefox/107.0', 1),
(56, '2023-03-27 15:11:18', '93.235.6.53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(57, '2023-03-27 17:29:55', '93.235.6.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(58, '2023-03-27 18:26:39', '93.235.6.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(59, '2023-03-27 19:04:55', '93.235.6.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(60, '2023-03-27 21:29:43', '93.235.6.53', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(61, '2023-03-28 12:55:06', '93.235.4.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(62, '2023-03-28 13:00:56', '93.235.4.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(63, '2023-03-28 13:01:37', '93.235.4.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(64, '2023-03-28 13:55:42', '93.235.4.202', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(65, '2023-03-28 15:28:09', '93.235.4.202', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(66, '2023-03-28 19:02:38', '93.235.4.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(67, '2023-03-29 16:24:08', '193.197.150.215', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(68, '2023-03-29 16:29:01', '193.197.150.215', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(69, '2023-03-30 10:45:18', '80.187.65.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(70, '2023-03-30 10:45:43', '80.187.65.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(71, '2023-03-30 15:20:55', '80.187.65.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(72, '2023-03-30 15:21:07', '80.187.65.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(73, '2023-03-30 17:06:02', '79.198.7.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(74, '2023-03-31 13:24:37', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(75, '2023-03-31 13:54:25', '80.187.65.85', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(76, '2023-03-31 16:57:47', '93.235.7.43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(77, '2023-04-01 10:09:45', '46.91.137.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(78, '2023-04-01 10:11:48', '46.91.137.11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(79, '2023-04-03 14:18:45', '93.235.7.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(80, '2023-04-03 14:44:51', '93.235.7.9', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(81, '2023-04-04 07:18:57', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1),
(82, '2023-04-04 09:34:21', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(83, '2023-04-04 11:31:50', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(84, '2023-04-05 06:33:02', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(85, '2023-04-05 08:16:17', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(86, '2023-04-05 10:52:26', '93.235.8.216', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(87, '2023-04-05 10:55:57', '93.235.8.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(88, '2023-04-05 11:28:43', '93.235.8.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(89, '2023-04-05 13:04:18', '93.235.8.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 1),
(90, '2023-04-11 13:41:44', '79.198.13.217', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(91, '2023-04-14 08:45:42', '141.10.208.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(92, '2023-04-17 19:14:37', '93.235.9.153', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 2),
(93, '2023-04-18 09:32:06', '93.235.7.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(94, '2023-04-18 10:09:04', '93.235.7.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(95, '2023-04-18 10:16:17', '93.235.7.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(96, '2023-04-18 10:46:23', '93.235.7.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(97, '2023-04-18 11:02:06', '93.235.7.154', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(98, '2023-04-18 11:22:30', '93.235.7.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(99, '2023-04-18 14:08:39', '93.235.0.144', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1', 5),
(100, '2023-04-19 15:59:58', '93.235.10.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin_rolle`
--

CREATE TABLE `jumi_admin_rolle` (
  `rid` int(11) NOT NULL,
  `bezeichnung` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_admin_rolle`
--

INSERT INTO `jumi_admin_rolle` (`rid`, `bezeichnung`) VALUES
(1, 'Administrator'),
(2, 'Noten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin_rollen_rechte_zuord`
--

CREATE TABLE `jumi_admin_rollen_rechte_zuord` (
  `roreid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `meid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `jumi_admin_rollen_rechte_zuord`
--

INSERT INTO `jumi_admin_rollen_rechte_zuord` (`roreid`, `rid`, `meid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 0, 1),
(11, 0, 9),
(12, 1, 10),
(13, 1, 11),
(14, 1, 12),
(15, 0, 12),
(16, 0, 11),
(17, 0, 10),
(18, 1, 13),
(19, 1, 14),
(20, 1, 15),
(21, 2, 9),
(22, 2, 10),
(23, 2, 11),
(24, 2, 12),
(25, 2, 13),
(26, 2, 14),
(27, 2, 15),
(28, 1, 16),
(29, 1, 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin_rollen_user_zuord`
--

CREATE TABLE `jumi_admin_rollen_user_zuord` (
  `rozuid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_admin_rollen_user_zuord`
--

INSERT INTO `jumi_admin_rollen_user_zuord` (`rozuid`, `rid`, `uid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_chor_saenger`
--

CREATE TABLE `jumi_chor_saenger` (
  `csid` int(11) NOT NULL,
  `vorname` varchar(200) NOT NULL,
  `nachname` varchar(200) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `singstimme` int(1) NOT NULL COMMENT '1=Sopran,2=Alt,3=Tenor,4=Bass,5=unbekannt',
  `bemerkung` text NOT NULL,
  `einw_livestream` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Einwilligung Livestream',
  `einw_homepage` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Einwilligung Homepage',
  `einw_socialmedia` enum('0','1') NOT NULL DEFAULT '0' COMMENT 'Einwilligung Social Media',
  `alter16` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=unter 16;1=ueber 16 für Datenschutzerklärung',
  `selfreg_date` datetime DEFAULT NULL COMMENT 'Selbstregistrierungsdatum'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_chor_saenger`
--

INSERT INTO `jumi_chor_saenger` (`csid`, `vorname`, `nachname`, `mail`, `singstimme`, `bemerkung`, `einw_livestream`, `einw_homepage`, `einw_socialmedia`, `alter16`, `selfreg_date`) VALUES
(1, 'Jeannette', 'Schwarz', 'jeannette@ja-schwarz.de', 1, '', '0', '0', '0', '1', '2023-04-17 19:15:35'),
(2, 'Alexander', 'Schwarz', 'alexander@ja-schwarz.de', 3, '<p>Ist im Technikteam</p>', '1', '1', '1', '1', '2023-04-18 10:59:22'),
(3, 'Anica', 'Müller', 'mueller.anica@web.de', 2, '', '0', '0', '0', '1', '2023-04-18 14:00:53');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_chor_saenger_uploads`
--

CREATE TABLE `jumi_chor_saenger_uploads` (
  `id` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_chor_saenger_uploads`
--

INSERT INTO `jumi_chor_saenger_uploads` (`id`, `csid`, `filename`, `originalname`, `uid`, `datum`) VALUES
(1, 2, '../media/file_upload/member/20230418_111816_Einwilligungserklaerung.pdf', 'Einwilligungserklärung.pdf', 1, '2023-04-18 11:18:16');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_finanzen`
--

CREATE TABLE `jumi_finanzen` (
  `fid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `firma` varchar(255) NOT NULL,
  `art` enum('E','A') DEFAULT NULL,
  `betrag` decimal(10,2) NOT NULL,
  `bemerkung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_finanzen`
--

INSERT INTO `jumi_finanzen` (`fid`, `datum`, `beschreibung`, `firma`, `art`, `betrag`, `bemerkung`) VALUES
(1, '2023-04-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', ''),
(2, '2023-03-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', ''),
(3, '2023-01-26', 'Domain ju-and-mi.de', 'Ionos', 'A', '-21.60', '1. Jahr, danach teurer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_finanzen_uploads`
--

CREATE TABLE `jumi_finanzen_uploads` (
  `id` int(11) NOT NULL,
  `fid` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_finanzen_uploads`
--

INSERT INTO `jumi_finanzen_uploads` (`id`, `fid`, `filename`, `originalname`, `uid`, `datum`) VALUES
(1, 1, '../media/file_upload/finanzen/20230420_111236_RG_100121618035.pdf', 'RG_100121618035.pdf', 1, '2023-04-20 11:12:36'),
(2, 2, '../media/file_upload/finanzen/20230420_111413_RG_100119951099.pdf', 'RG_100119951099.pdf', 1, '2023-04-20 11:14:13'),
(3, 3, '../media/file_upload/finanzen/20230420_111614_RG_100117336090.pdf', 'RG_100117336090.pdf', 1, '2023-04-20 11:16:14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_menu_entries`
--

CREATE TABLE `jumi_menu_entries` (
  `meid` int(11) NOT NULL,
  `headline` varchar(250) NOT NULL,
  `link` varchar(250) NOT NULL,
  `mhid` int(11) NOT NULL COMMENT 'Headline',
  `fontawesome` varchar(250) NOT NULL,
  `sup` int(11) NOT NULL COMMENT 'Übergeordnete Menüpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_menu_entries`
--

INSERT INTO `jumi_menu_entries` (`meid`, `headline`, `link`, `mhid`, `fontawesome`, `sup`) VALUES
(1, 'Home', 'index.php', 1, 'fas fa-house', 1),
(2, 'Erstellen', 'survey_erfassen.php', 2, 'fas fa-pie-chart', 2),
(3, 'Bearbeiten', 'survey_edit.php', 2, 'fas fa-edit', 3),
(4, 'Systemparameter', 'parameter.php', 20, 'fas fa-cog', 4),
(5, 'Benutzerverwaltung', '#', 20, 'fas fa-user', 5),
(6, 'Benutzer erstellen', 'create_user.php', 20, '', 5),
(7, 'Benutzer bearbeiten', 'edit_user.php', 20, '', 5),
(8, 'Rollen / Rechte', 'rollen.php', 20, '', 5),
(9, 'Noten', '#', 3, 'fa fa-upload', 9),
(10, 'Einzelnoten erfassen', 'notenupload.php', 3, '', 9),
(11, 'Chor', '#', 3, 'fa-solid fa-music', 11),
(12, 'SängerIn erfassen', 'create_member.php', 3, '', 11),
(13, 'SängerIn bearbeiten', 'edit_member.php', 3, '', 11),
(14, 'Noten bearbeiten', 'edit_noten.php', 3, '', 9),
(15, 'Notenbuch', 'notenbuch.php', 3, '', 9),
(16, 'Einwilligungen', 'einwilligungen.php', 3, '', 11),
(17, 'Ein-/Ausgaben', 'finanzen.php', 4, 'fa-solid fa-coins', 17);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_menu_headline`
--

CREATE TABLE `jumi_menu_headline` (
  `mhid` int(11) NOT NULL,
  `headline` varchar(250) NOT NULL,
  `visible` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0=unsichbar;1=sichtbar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_menu_headline`
--

INSERT INTO `jumi_menu_headline` (`mhid`, `headline`, `visible`) VALUES
(1, 'Top', '0'),
(2, 'Umfrage', '1'),
(3, 'Verwaltung', '1'),
(4, 'Finanzen', '1'),
(20, 'Administration', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_daten`
--

CREATE TABLE `jumi_noten_daten` (
  `jndid` int(11) NOT NULL,
  `titel` varchar(255) NOT NULL,
  `liednr` varchar(10) NOT NULL,
  `vid` int(11) NOT NULL,
  `anz_lizenzen` int(11) NOT NULL,
  `streamlizenz` enum('0','1') NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_daten`
--

INSERT INTO `jumi_noten_daten` (`jndid`, `titel`, `liednr`, `vid`, `anz_lizenzen`, `streamlizenz`, `uid`, `datum`) VALUES
(2, 'Heimat, heimat glanzumflossen', '258A', 3, 20, '1', 1, '2023-04-05 08:26:45'),
(3, 'Das sei alle meine Tage', '262', 3, 30, '1', 1, '2023-04-05 08:28:33');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_uploads`
--

CREATE TABLE `jumi_noten_uploads` (
  `id` int(11) NOT NULL,
  `jndid` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `originalname` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_uploads`
--

INSERT INTO `jumi_noten_uploads` (`id`, `jndid`, `filename`, `originalname`, `uid`, `datum`) VALUES
(5, 2, '../media/file_upload/noten/20230404_160717_Nebentaetigkeit_Jaehresmeldung.pdf', 'Nebentätigkeit Jähresmeldung.pdf', 1, '2023-04-04 16:07:17'),
(6, 2, '../media/file_upload/noten/20230404_160719_Uebersicht_Datenbanken_C7000.pptx', 'Uebersicht Datenbanken C7000.pptx', 1, '2023-04-04 16:07:19'),
(7, 3, '../media/file_upload/noten/20230405_082833_Ju_and_Mi.pptx', 'Ju and Mi.pptx', 1, '2023-04-05 08:28:33');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_verlag`
--

CREATE TABLE `jumi_noten_verlag` (
  `vid` int(11) NOT NULL,
  `bezeichnung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_verlag`
--

INSERT INTO `jumi_noten_verlag` (`vid`, `bezeichnung`) VALUES
(3, 'Friedrich Bischoff Verlag');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_zusammenstellung`
--

CREATE TABLE `jumi_noten_zusammenstellung` (
  `zsid` int(11) NOT NULL,
  `bezeichnung` varchar(200) NOT NULL,
  `lizenzpflicht` enum('0','1') NOT NULL DEFAULT '0',
  `anzahl_lizenz` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_zusammenstellung`
--

INSERT INTO `jumi_noten_zusammenstellung` (`zsid`, `bezeichnung`, `lizenzpflicht`, `anzahl_lizenz`) VALUES
(3, 'Feiert Jesus', '1', 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_zusammenstellung_zuord`
--

CREATE TABLE `jumi_noten_zusammenstellung_zuord` (
  `zsnid` int(11) NOT NULL,
  `jndid` int(11) NOT NULL,
  `zsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_zus_saenger_zuord`
--

CREATE TABLE `jumi_noten_zus_saenger_zuord` (
  `zszid` int(11) NOT NULL,
  `zsid` int(11) NOT NULL COMMENT 'ZusammenstellungID',
  `csid` int(11) NOT NULL COMMENT 'SängerID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_noten_zus_saenger_zuord`
--

INSERT INTO `jumi_noten_zus_saenger_zuord` (`zszid`, `zsid`, `csid`) VALUES
(8, 3, 2),
(9, 3, 1),
(10, 3, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_parameter`
--

CREATE TABLE `jumi_parameter` (
  `pid` int(11) NOT NULL,
  `beschreibung` varchar(250) NOT NULL,
  `wert` varchar(250) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_parameter`
--

INSERT INTO `jumi_parameter` (`pid`, `beschreibung`, `wert`, `sort`) VALUES
(1, 'Mailadressen Ansprechpartner', 'info@ju-and-mi.de', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_securitytokens`
--

CREATE TABLE `jumi_securitytokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `securitytoken` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `jumi_securitytokens`
--

INSERT INTO `jumi_securitytokens` (`id`, `uid`, `identifier`, `securitytoken`, `created_at`) VALUES
(21, 1, '9a41c2bbef7eaedbb98af8508e4ad83c', '97932f68355bf3aa0cb92b791c5d0433742b2897', '2023-04-18 09:02:06'),
(22, 1, '7e37641df8df637a77c4e048f9519724', 'cf577f3b712531f12c19179ba6f2a3d934ee93fb', '2023-04-18 09:22:30');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen`
--

CREATE TABLE `jumi_umfragen` (
  `umid` int(11) NOT NULL,
  `datum_von` datetime NOT NULL,
  `datum_bis` datetime NOT NULL,
  `headline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `freitext` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Kein Frextextfeld;1=Freitextfeld',
  `uid` int(11) NOT NULL,
  `datum_erfasst` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen`
--

INSERT INTO `jumi_umfragen` (`umid`, `datum_von`, `datum_bis`, `headline`, `freitext`, `uid`, `datum_erfasst`) VALUES
(3, '2023-03-26 00:00:00', '2023-03-27 00:00:00', 'Umfrage zu JU & ESS', '1', 1, '2023-03-26 14:07:07');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_antworten`
--

CREATE TABLE `jumi_umfragen_antworten` (
  `uaid` int(11) NOT NULL,
  `ufid` int(11) NOT NULL,
  `antwort` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `userorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_antworten`
--

INSERT INTO `jumi_umfragen_antworten` (`uaid`, `ufid`, `antwort`, `userorder`) VALUES
(15, 6, 'gut', 0),
(16, 6, 'weniger gut', 0),
(17, 6, 'kann ich nicht sagen', 0),
(18, 7, 'Montag', 0),
(19, 7, 'Sonntag', 2),
(20, 7, 'Freitag', 1),
(21, 8, 'geht gar nicht', 2),
(22, 8, 'gut', 1),
(23, 8, 'mega', 0),
(24, 8, 'widerlich', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_ende`
--

CREATE TABLE `jumi_umfragen_ende` (
  `uenid` int(11) NOT NULL,
  `umid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `session` varchar(50) NOT NULL,
  `ende` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_ende`
--

INSERT INTO `jumi_umfragen_ende` (`uenid`, `umid`, `ip`, `session`, `ende`) VALUES
(3, 3, '93.235.6.164', '0decptq29nvsi9b1rskqg8rlar', '1'),
(4, 3, '93.235.6.164', 'ad62egmq6ch3tr8d7bsrkv1ro3', '1'),
(5, 3, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', '1'),
(6, 3, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', '1'),
(7, 3, '88.152.185.164', '0emg0fbguq52pd8h0c7j27ea9o', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_ergebnisse`
--

CREATE TABLE `jumi_umfragen_ergebnisse` (
  `ueid` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  `session` varchar(50) NOT NULL,
  `ufid` int(11) NOT NULL,
  `uaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_ergebnisse`
--

INSERT INTO `jumi_umfragen_ergebnisse` (`ueid`, `ip`, `session`, `ufid`, `uaid`) VALUES
(6, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', 6, 15),
(7, '88.152.185.164', '0emg0fbguq52pd8h0c7j27ea9o', 6, 17),
(8, '93.235.6.164', 'ad62egmq6ch3tr8d7bsrkv1ro3', 6, 15),
(9, '93.235.6.164', 'ad62egmq6ch3tr8d7bsrkv1ro3', 7, 19),
(10, '88.152.185.164', '0emg0fbguq52pd8h0c7j27ea9o', 7, 18),
(11, '93.235.6.164', '0decptq29nvsi9b1rskqg8rlar', 6, 15),
(12, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', 7, 19),
(13, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', 7, 20),
(14, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', 6, 17),
(15, '93.235.6.164', 'ad62egmq6ch3tr8d7bsrkv1ro3', 8, 23),
(16, '93.235.6.164', '0decptq29nvsi9b1rskqg8rlar', 7, 18),
(17, '88.152.185.164', '0emg0fbguq52pd8h0c7j27ea9o', 8, 22),
(18, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', 8, 24),
(19, '93.235.6.164', '0decptq29nvsi9b1rskqg8rlar', 8, 23),
(20, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', 7, 18),
(21, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', 7, 19),
(22, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', 8, 23);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_erg_freitext`
--

CREATE TABLE `jumi_umfragen_erg_freitext` (
  `uefid` int(11) NOT NULL,
  `umid` int(11) NOT NULL,
  `ip` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `freitext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_umfragen_erg_freitext`
--

INSERT INTO `jumi_umfragen_erg_freitext` (`uefid`, `umid`, `ip`, `session`, `freitext`) VALUES
(3, 3, '93.235.6.164', 'ad62egmq6ch3tr8d7bsrkv1ro3', '😘'),
(4, 3, '93.235.6.164', '6im2hht8fb0uqc91ahk2ti8suq', 'Netter Tag 😘😘😘'),
(5, 3, '93.235.6.164', 'di7peu3vvu6imehet8vtt0jpof', 'Ali müffelt '),
(6, 3, '88.152.185.164', '0emg0fbguq52pd8h0c7j27ea9o', 'Ich find euch spitze!\r\nUnd die Umfragen sind super 🙌🏽');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_fragen`
--

CREATE TABLE `jumi_umfragen_fragen` (
  `ufid` int(11) NOT NULL,
  `umid` int(11) NOT NULL,
  `frage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `multiple` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Einfachantwort,1=Mehrfachantworten '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_fragen`
--

INSERT INTO `jumi_umfragen_fragen` (`ufid`, `umid`, `frage`, `multiple`) VALUES
(6, 3, 'Wie war das essen', '0'),
(7, 3, 'Wann wäre der liebste Probentag?', '1'),
(8, 3, 'Wie findet ihr das Lieb \"Dona nobis pacem\"', '0');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `jumi_admin`
--
ALTER TABLE `jumi_admin`
  ADD PRIMARY KEY (`uid`);

--
-- Indizes für die Tabelle `jumi_adminlog`
--
ALTER TABLE `jumi_adminlog`
  ADD PRIMARY KEY (`lid`),
  ADD KEY `gd_adminlog_ibfk_1` (`uid`);

--
-- Indizes für die Tabelle `jumi_admin_rolle`
--
ALTER TABLE `jumi_admin_rolle`
  ADD PRIMARY KEY (`rid`);

--
-- Indizes für die Tabelle `jumi_admin_rollen_rechte_zuord`
--
ALTER TABLE `jumi_admin_rollen_rechte_zuord`
  ADD PRIMARY KEY (`roreid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `admin_rolle` (`meid`);

--
-- Indizes für die Tabelle `jumi_admin_rollen_user_zuord`
--
ALTER TABLE `jumi_admin_rollen_user_zuord`
  ADD PRIMARY KEY (`rozuid`);

--
-- Indizes für die Tabelle `jumi_chor_saenger`
--
ALTER TABLE `jumi_chor_saenger`
  ADD PRIMARY KEY (`csid`);

--
-- Indizes für die Tabelle `jumi_chor_saenger_uploads`
--
ALTER TABLE `jumi_chor_saenger_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `jumi_finanzen`
--
ALTER TABLE `jumi_finanzen`
  ADD PRIMARY KEY (`fid`);

--
-- Indizes für die Tabelle `jumi_finanzen_uploads`
--
ALTER TABLE `jumi_finanzen_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `jumi_menu_entries`
--
ALTER TABLE `jumi_menu_entries`
  ADD PRIMARY KEY (`meid`);

--
-- Indizes für die Tabelle `jumi_menu_headline`
--
ALTER TABLE `jumi_menu_headline`
  ADD PRIMARY KEY (`mhid`);

--
-- Indizes für die Tabelle `jumi_noten_daten`
--
ALTER TABLE `jumi_noten_daten`
  ADD PRIMARY KEY (`jndid`);

--
-- Indizes für die Tabelle `jumi_noten_uploads`
--
ALTER TABLE `jumi_noten_uploads`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `jumi_noten_verlag`
--
ALTER TABLE `jumi_noten_verlag`
  ADD PRIMARY KEY (`vid`);

--
-- Indizes für die Tabelle `jumi_noten_zusammenstellung`
--
ALTER TABLE `jumi_noten_zusammenstellung`
  ADD PRIMARY KEY (`zsid`);

--
-- Indizes für die Tabelle `jumi_noten_zusammenstellung_zuord`
--
ALTER TABLE `jumi_noten_zusammenstellung_zuord`
  ADD PRIMARY KEY (`zsnid`);

--
-- Indizes für die Tabelle `jumi_noten_zus_saenger_zuord`
--
ALTER TABLE `jumi_noten_zus_saenger_zuord`
  ADD PRIMARY KEY (`zszid`);

--
-- Indizes für die Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  ADD PRIMARY KEY (`pid`);

--
-- Indizes für die Tabelle `jumi_securitytokens`
--
ALTER TABLE `jumi_securitytokens`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `jumi_umfragen`
--
ALTER TABLE `jumi_umfragen`
  ADD PRIMARY KEY (`umid`);

--
-- Indizes für die Tabelle `jumi_umfragen_antworten`
--
ALTER TABLE `jumi_umfragen_antworten`
  ADD PRIMARY KEY (`uaid`);

--
-- Indizes für die Tabelle `jumi_umfragen_ende`
--
ALTER TABLE `jumi_umfragen_ende`
  ADD PRIMARY KEY (`uenid`);

--
-- Indizes für die Tabelle `jumi_umfragen_ergebnisse`
--
ALTER TABLE `jumi_umfragen_ergebnisse`
  ADD PRIMARY KEY (`ueid`);

--
-- Indizes für die Tabelle `jumi_umfragen_erg_freitext`
--
ALTER TABLE `jumi_umfragen_erg_freitext`
  ADD PRIMARY KEY (`uefid`);

--
-- Indizes für die Tabelle `jumi_umfragen_fragen`
--
ALTER TABLE `jumi_umfragen_fragen`
  ADD PRIMARY KEY (`ufid`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `jumi_admin`
--
ALTER TABLE `jumi_admin`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_adminlog`
--
ALTER TABLE `jumi_adminlog`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rolle`
--
ALTER TABLE `jumi_admin_rolle`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_rechte_zuord`
--
ALTER TABLE `jumi_admin_rollen_rechte_zuord`
  MODIFY `roreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_user_zuord`
--
ALTER TABLE `jumi_admin_rollen_user_zuord`
  MODIFY `rozuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger`
--
ALTER TABLE `jumi_chor_saenger`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger_uploads`
--
ALTER TABLE `jumi_chor_saenger_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `jumi_finanzen`
--
ALTER TABLE `jumi_finanzen`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_finanzen_uploads`
--
ALTER TABLE `jumi_finanzen_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_entries`
--
ALTER TABLE `jumi_menu_entries`
  MODIFY `meid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_headline`
--
ALTER TABLE `jumi_menu_headline`
  MODIFY `mhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_daten`
--
ALTER TABLE `jumi_noten_daten`
  MODIFY `jndid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_uploads`
--
ALTER TABLE `jumi_noten_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_verlag`
--
ALTER TABLE `jumi_noten_verlag`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung`
--
ALTER TABLE `jumi_noten_zusammenstellung`
  MODIFY `zsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung_zuord`
--
ALTER TABLE `jumi_noten_zusammenstellung_zuord`
  MODIFY `zsnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zus_saenger_zuord`
--
ALTER TABLE `jumi_noten_zus_saenger_zuord`
  MODIFY `zszid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `jumi_securitytokens`
--
ALTER TABLE `jumi_securitytokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen`
--
ALTER TABLE `jumi_umfragen`
  MODIFY `umid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_antworten`
--
ALTER TABLE `jumi_umfragen_antworten`
  MODIFY `uaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ende`
--
ALTER TABLE `jumi_umfragen_ende`
  MODIFY `uenid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ergebnisse`
--
ALTER TABLE `jumi_umfragen_ergebnisse`
  MODIFY `ueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_erg_freitext`
--
ALTER TABLE `jumi_umfragen_erg_freitext`
  MODIFY `uefid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_fragen`
--
ALTER TABLE `jumi_umfragen_fragen`
  MODIFY `ufid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
