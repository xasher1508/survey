-- phpMyAdmin SQL Dump
-- version 5.0.4deb2+deb11u1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Erstellungszeit: 09. Jan 2024 um 06:41
-- Server-Version: 10.5.21-MariaDB-0+deb11u1
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
  `last_activity` datetime DEFAULT NULL,
  `aktiv` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Benutzer';

--
-- Daten für Tabelle `jumi_admin`
--

INSERT INTO `jumi_admin` (`uid`, `vorname`, `nachname`, `mail`, `passwort`, `passwortcode`, `passwortcode_time`, `last_activity`, `aktiv`) VALUES
(1, 'Alexander', 'Schwarz', 'ali@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', NULL, NULL, '2024-01-08 11:23:19', '1'),
(2, 'Jeannette', 'Schwarz', 'jeannette@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', NULL, NULL, '2023-04-17 19:14:37', '1'),
(3, 'Nadine', 'Schubert', 'nadine@ju-and-mi.de', '507e1f06de7db173ea9c3c41f7ff8d33', NULL, NULL, NULL, '1'),
(4, 'Björn', 'Idler', 'bjoern@ju-and-mi.de', 'c4308bb58d24e4feafa4300c18ddd2e8', NULL, NULL, NULL, '1'),
(5, 'Anica', 'Müller', 'anica@ju-and-mi.de', '487844c21930fb20771108d78c4d38b7', NULL, NULL, '2023-05-09 11:05:54', '1'),
(6, 'Julia', 'Bantle', 'julia@ju-and-mi.de', '7fd0e99ff6d870cdededfcf7004dbf69', NULL, NULL, '2023-09-20 17:31:10', '1'),
(7, 'Toni', 'Kasperski', 'toni@ju-and-mi.de', '60019be9251acd030fbe1492cef9a7f8', 'd60507c1adb0fb7535bb6a85bc924d837fb41297', '2023-09-22 12:49:40', '2023-09-22 15:04:11', '1');

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
(100, '2023-04-19 15:59:58', '93.235.10.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(101, '2023-04-26 11:58:55', '5.146.193.29', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 5),
(102, '2023-04-26 12:52:35', '141.10.208.40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Safari/537.36', 1),
(103, '2023-04-27 08:33:31', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1),
(104, '2023-04-27 17:20:45', '93.235.7.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1),
(105, '2023-04-28 21:07:29', '93.235.8.100', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(106, '2023-04-28 21:59:03', '93.235.8.100', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(107, '2023-05-02 10:32:24', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1),
(108, '2023-05-05 13:52:21', '79.198.6.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/112.0', 1),
(109, '2023-05-06 07:13:45', '46.91.137.202', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(110, '2023-05-06 09:45:34', '46.91.137.202', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/113.0.0.0 Safari/537.36', 1),
(111, '2023-05-09 11:05:54', '5.146.193.29', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 5),
(112, '2023-05-09 11:08:46', '93.235.9.52', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(113, '2023-05-09 11:15:37', '93.235.9.52', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(114, '2023-05-17 20:04:05', '93.235.1.12', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(115, '2023-05-19 14:28:09', '79.198.7.67', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_4_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.4 Mobile/15E148 Safari/604.1', 1),
(116, '2023-05-22 17:08:37', '79.198.8.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/113.0', 1),
(117, '2023-05-28 20:12:27', '45.82.133.52', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1', 1),
(118, '2023-05-30 18:29:14', '139.28.177.243', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1', 1),
(119, '2023-06-11 16:36:05', '46.91.132.133', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5 Mobile/15E148 Safari/604.1', 1),
(120, '2023-06-19 07:33:44', '46.91.138.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(121, '2023-06-19 10:10:41', '46.91.138.244', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(122, '2023-06-20 07:48:43', '93.235.6.138', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(123, '2023-06-21 09:33:12', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(124, '2023-06-21 12:39:35', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(125, '2023-06-22 07:36:51', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(126, '2023-06-23 12:01:03', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(127, '2023-06-26 07:13:50', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(128, '2023-06-27 15:49:59', '46.91.130.156', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(129, '2023-07-04 11:12:59', '46.91.137.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(130, '2023-07-04 12:30:18', '46.91.137.166', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(131, '2023-07-05 06:43:01', '79.198.7.160', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/114.0', 1),
(132, '2023-07-24 20:59:43', '79.198.2.219', 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.5.2 Mobile/15E148 Safari/604.1', 1),
(133, '2023-07-25 06:44:25', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 1),
(134, '2023-07-25 16:47:23', '93.235.14.248', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 1),
(135, '2023-07-25 16:59:43', '93.235.14.248', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 1),
(136, '2023-07-26 07:10:06', '93.235.13.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 1),
(137, '2023-07-26 07:13:43', '93.235.13.161', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/115.0', 1),
(138, '2023-08-25 07:48:43', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/116.0', 1),
(139, '2023-09-02 17:30:44', '79.198.0.98', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 1),
(140, '2023-09-08 09:05:48', '79.198.13.189', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0', 1),
(141, '2023-09-20 17:30:23', '46.114.0.122', 'Mozilla/5.0 (iPhone; CPU iPhone OS 15_6_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Mobile/15E148 Safari/604.1', 6),
(142, '2023-09-22 14:50:09', '207.89.80.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 7),
(143, '2023-09-22 14:52:55', '207.89.80.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 7),
(144, '2023-09-22 15:03:59', '207.89.80.127', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36', 7),
(145, '2023-09-27 07:32:23', '79.198.3.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36', 1),
(146, '2023-09-27 07:32:56', '79.198.3.176', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/117.0', 1),
(147, '2023-09-27 09:00:29', '79.198.3.176', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1', 1),
(148, '2023-10-21 08:09:00', '79.198.1.156', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0.1 Mobile/15E148 Safari/604.1', 1),
(149, '2023-10-23 10:19:04', '46.91.140.164', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1),
(150, '2023-10-31 08:11:28', '193.197.150.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/118.0.0.0 Safari/537.36', 1),
(151, '2023-11-20 13:24:26', '93.235.1.169', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.1.1 Mobile/15E148 Safari/604.1', 1),
(152, '2023-12-16 15:49:14', '77.180.143.15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:120.0) Gecko/20100101 Firefox/120.0', 1);

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
(1, 'Administratoren'),
(3, 'Anwender_Musik');

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
(28, 1, 16),
(29, 1, 17),
(30, 1, 18),
(31, 1, 19),
(32, 1, 20),
(33, 1, 21),
(34, 1, 22),
(35, 1, 23),
(36, 3, 1),
(37, 3, 2),
(38, 3, 3),
(39, 3, 9),
(40, 3, 10),
(41, 3, 11),
(42, 3, 12),
(43, 3, 13),
(44, 3, 14),
(45, 3, 15),
(46, 3, 16),
(47, 3, 18);

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
(6, 1, 2),
(7, 3, 6),
(9, 3, 7);

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
(3, 'Anica', 'Müller', 'mueller.anica@web.de', 2, '', '1', '1', '1', '1', '2023-04-18 14:00:53'),
(4, 'Thomas', 'Angermaier', 'thomasangermaier@gmx.de', 3, '', '0', '0', '0', '1', '2023-05-21 11:18:42'),
(5, 'Nadine', 'Schlotz', 'nadine.schlotz@freenet.de', 2, '', '0', '0', '0', '1', '2023-05-21 18:25:22'),
(6, 'Julian', 'Thimmel', 'julian.thimmel@web.de', 4, '', '0', '0', '0', '1', '2023-05-21 18:26:01'),
(7, 'Felicitas', 'Haas', 'haas.felicitas@web.de', 1, '', '1', '1', '1', '1', '2023-05-21 18:37:25'),
(8, 'Tatjana', 'Immel', 'lido1214@googlemail.com', 2, '', '1', '1', '1', '1', '2023-05-21 18:59:03'),
(9, 'Amelie', 'Schulz', 'amelie051117@gmail.com', 1, '', '1', '1', '1', '1', '2023-05-23 23:48:08'),
(10, 'Leonie', 'Beck', 'la.beck@gmx.net', 2, '', '0', '0', '0', '0', '2023-05-24 19:01:23'),
(11, 'Jonas', 'Schneider', 'schneider_jonas@t-online.de', 3, '', '0', '0', '0', '1', '2023-05-25 00:49:32'),
(12, 'Nadine', 'Schubert', 'mail@nadine-schubert.com', 1, '', '0', '0', '0', '1', '2023-06-13 21:41:34'),
(13, 'Malin', 'Schulz', 'malinschulz2007@gmail.com', 1, '', '0', '0', '0', '0', '2023-06-25 20:26:00'),
(14, 'Emilia', 'Vester', 'emilia.vester@gmx.de', 1, '', '1', '1', '1', '1', '2023-07-22 21:35:40'),
(15, 'Björn', 'Idler', 'bjoern@ju-and-mi.de', 3, '', '0', '0', '0', '1', '2023-07-25 07:18:12'),
(16, 'Felix', 'Dinkelacker', 'felix99di@gmail.com', 4, '', '0', '0', '0', '1', '2023-07-30 12:31:33'),
(17, 'Nadja', 'Schulz', 'nadja.schulz2708@gmx.de', 1, '', '1', '1', '1', '1', '2023-08-27 10:55:22'),
(18, 'Lea', 'Bantleon', 'lea@bantleon.net', 1, '', '1', '1', '1', '0', '2023-09-10 19:44:53'),
(19, 'Stefan', 'Kazmaier', 'stefan-kazmaier@web.de', 3, '', '1', '1', '1', '1', '2023-09-11 09:02:49'),
(20, 'Julia', 'Bantle', 'bantle.juli@gmail.com', 1, '', '1', '1', '1', '1', '2023-09-12 17:10:52'),
(21, 'Sunita', 'Silcher', 'sunisilcher2010@gmail.com', 1, '<p>kein Namen im Internet erw&auml;hnen</p>', '1', '1', '1', '0', '2023-09-14 19:01:37'),
(22, 'Lotta', 'Ebert', 'lotta.sophie.ebert@gmail.com', 1, '', '0', '0', '0', '0', '2023-09-17 16:54:34'),
(23, 'Sarah', 'Busch', 'sarah.busch@mein.gmx', 1, '', '1', '1', '1', '0', '2023-09-17 18:46:39'),
(24, 'Benedict', 'Silcher', 'benedict.silcher@gmail.com', 3, '', '1', '1', '1', '1', '2023-09-18 22:25:21'),
(25, 'Nele', 'Müller', 'nele.mueller0109@gmail.com', 1, '', '1', '1', '1', '1', '2023-09-19 17:11:40'),
(26, 'Maja', 'Kriechbaum', 'maja.kriechbaum@icloud.com', 1, '', '1', '1', '1', '1', '2023-09-21 13:16:47'),
(27, 'Carolyn', 'Braun', 'carolynbraun98@gmx.de', 1, '', '1', '1', '1', '1', '2023-09-21 17:41:49'),
(28, 'Luis', 'Busch', 'luis-busch@gmx.de', 3, '', '1', '1', '1', '0', '2023-09-21 17:41:56'),
(29, 'Fabian', 'Löhle', 'fabian@familoehle.de', 4, '', '1', '1', '1', '1', '2023-09-21 19:24:14'),
(30, 'Denise', 'Mazur', 'Denise.mazur08@gmail.com', 2, '', '1', '0', '0', '0', '2023-09-21 20:22:07'),
(31, 'Carl', 'Wieland', 'carl.wieland@t-online.de', 4, '', '0', '0', '0', '1', '2023-09-22 13:33:35'),
(32, 'Julia', 'Schneider', 'schneider.julia193@gmail.com', 1, '', '1', '1', '1', '1', '2023-09-22 13:34:16'),
(33, 'Clara', 'Ehle', 'Clara@ehle.org', 1, '', '1', '1', '1', '0', '2023-09-22 13:37:48'),
(34, 'Toni', 'Kasperski', 'tonikasperski@hotmail.de', 3, '', '1', '1', '1', '0', '2023-09-22 14:30:21'),
(35, 'Amelie', 'Schröder', 'amelieruthschroeder@icloud.com', 1, '', '1', '1', '1', '0', '2023-09-22 18:18:58'),
(36, 'Louisa', 'Gauß', 'olligauss@web.de', 1, '', '1', '1', '1', '0', '2023-09-22 19:56:49'),
(37, 'Annette', 'Flaig', 'AFlaig@web.de', 2, '', '1', '1', '0', '1', '2023-09-22 21:01:46'),
(38, 'Lara', 'Claß', 'lara.class@outlook.de', 1, '', '0', '0', '0', '1', '2023-09-22 21:38:59'),
(39, 'Hannah', 'Idler', 'stefanieidler@aol.com', 1, '', '1', '1', '1', '0', '2023-09-23 09:42:36'),
(40, 'Finn', 'Ebert', 'finn.lukas.ebert@gmail.com', 3, '', '0', '0', '0', '0', '2023-09-23 12:06:11'),
(41, 'Noah', 'Kriechbaum', 'Noah.kriechbaum@icloud.com', 4, '', '1', '1', '0', '0', '2023-09-23 12:47:28');

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
(1, 2, '../media/file_upload/member/20230418_111816_Einwilligungserklaerung.pdf', 'Einwilligungserklärung.pdf', 1, '2023-04-18 11:18:16'),
(2, 18, '../media/file_upload/member/20230911_075138_Einwillungserklaerung_Bantleon_Lea.pdf', 'Einwillungserklärung_Bantleon_Lea.pdf', 1, '2023-09-11 07:51:38'),
(3, 29, '../media/file_upload/member/20230922_100513_Einwilligungserklaerung_Loehle_Fabian.pdf.png', 'Einwilligungserklaerung_Löhle_Fabian.pdf.png', 1, '2023-09-22 10:05:13'),
(4, 30, '../media/file_upload/member/20230922_174540_IMG-20230922-WA0012.jpeg', 'IMG-20230922-WA0012.jpeg', 1, '2023-09-22 17:45:40'),
(5, 35, '../media/file_upload/member/20230923_070320_Einwilligungserklaerung__Amelie_Ruth_Schroeder.pdf', 'Einwilligungserklärung_ Amelie_Ruth_Schröder.pdf', 1, '2023-09-23 07:03:20'),
(6, 41, '../media/file_upload/member/20230925_115021_Einwilligungserklaerung_Kriechbaum_Noah.pdf', 'Einwilligungserklärung_Kriechbaum_Noah.pdf', 1, '2023-09-25 11:50:21'),
(7, 28, '../media/file_upload/member/20230925_115043_Einwilligungserklaerung_Busch_Luis.pdf', 'Einwilligungserklärung_Busch_Luis.pdf', 1, '2023-09-25 11:50:43'),
(8, 14, '../media/file_upload/member/20230925_115104_Einwilligungserklaerung_Vester_Emilia.pdf', 'Einwilligungserklärung_Vester_Emilia.pdf', 1, '2023-09-25 11:51:04'),
(9, 27, '../media/file_upload/member/20230925_115128_Einwilligungserklaerung_Braun_Carolyn.pdf', 'Einwilligungserklärung_Braun_Carolyn.pdf', 1, '2023-09-25 11:51:28'),
(10, 8, '../media/file_upload/member/20230925_115203_Einwilligungserklaerung_Immel_Tatjana.pdf', 'Einwilligungserklärung_Immel_Tatjana.pdf', 1, '2023-09-25 11:52:03'),
(11, 7, '../media/file_upload/member/20230925_115224_Einwilligungserklaerung_Haas_Felicitas.pdf', 'Einwilligungserklärung_Haas_Felicitas.pdf', 1, '2023-09-25 11:52:24'),
(12, 25, '../media/file_upload/member/20230925_115242_Einwilligungserklaerung_Mueller_Nele.pdf', 'Einwilligungserklärung_Müller_Nele.pdf', 1, '2023-09-25 11:52:42'),
(13, 34, '../media/file_upload/member/20230925_115259_Einwilligungserklaerung_Kasperski_Toni.pdf', 'Einwilligungserklärung_Kasperski_Toni.pdf', 1, '2023-09-25 11:52:59'),
(14, 20, '../media/file_upload/member/20230925_115318_Einwilligungserklaerung_Bantle_Julia.pdf', 'Einwilligungserklärung_Bantle_Julia.pdf', 1, '2023-09-25 11:53:18'),
(15, 23, '../media/file_upload/member/20230925_115440_Einwilligungserklaerung_Busch_Sarah.pdf', 'Einwilligungserklärung_Busch_Sarah.pdf', 1, '2023-09-25 11:54:40'),
(16, 26, '../media/file_upload/member/20230925_115502_Einwilligungserklaerung_Kriechbaum_Maja.pdf', 'Einwilligungserklärung_Kriechbaum_Maja.pdf', 1, '2023-09-25 11:55:02'),
(17, 32, '../media/file_upload/member/20230925_115527_Einwilligungserklaerung_Schneider_Julia.pdf', 'Einwilligungserklärung_Schneider_Julia.pdf', 1, '2023-09-25 11:55:27'),
(18, 9, '../media/file_upload/member/20230925_115649_Einwilligungserklaerung_Schulz_Amelie.pdf', 'Einwilligungserklärung_Schulz_Amelie.pdf', 1, '2023-09-25 11:56:49'),
(19, 37, '../media/file_upload/member/20230925_115748_Einwilligungserklaerung_Flaig_Annette.pdf', 'Einwilligungserklärung_Flaig_Annette.pdf', 1, '2023-09-25 11:57:48'),
(20, 24, '../media/file_upload/member/20230925_115813_Einwilligungserklaerung_Silcher_Benedict.pdf', 'Einwilligungserklärung_Silcher_Benedict.pdf', 1, '2023-09-25 11:58:13'),
(21, 19, '../media/file_upload/member/20230925_115834_Einwilligungserklaerung_Kazmaier_Stefan.pdf', 'Einwilligungserklärung_Kazmaier_Stefan.pdf', 1, '2023-09-25 11:58:34'),
(22, 3, '../media/file_upload/member/20230925_115853_Einwilligungserklaerung_Mueller_Anica.pdf', 'Einwilligungserklärung_Müller_Anica.pdf', 1, '2023-09-25 11:58:53'),
(23, 21, '../media/file_upload/member/20230925_115930_Einwilligungserklaerung_Silcher_Sunita.pdf', 'Einwilligungserklärung_Silcher_Sunita.pdf', 1, '2023-09-25 11:59:30'),
(24, 33, '../media/file_upload/member/20231008_163105_Einverstaendniserklaerung_Ehle_Clara.pdf', 'Einverständniserklärung_Ehle_Clara.pdf', 1, '2023-10-08 16:31:05'),
(25, 39, '../media/file_upload/member/20231009_081852_Einwilligungserklaerung_Idler_Hannah.pdf', 'Einwilligungserklärung_Idler_Hannah.pdf', 1, '2023-10-09 08:18:52'),
(26, 36, '../media/file_upload/member/20231023_101943_Einverstaendniserklaerung_Gauss_Louisa.pdf', 'Einverständniserklärung_Gauss_Louisa.pdf', 1, '2023-10-23 10:19:43'),
(27, 17, '../media/file_upload/member/20231121_093843_Einverstaendniserklaerung_Schulz_Nadja.jpg', 'Einverständniserklärung_Schulz_Nadja.jpg', 1, '2023-11-21 09:38:43');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_finanzen`
--

CREATE TABLE `jumi_finanzen` (
  `fid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` date NOT NULL,
  `beschreibung` varchar(255) NOT NULL,
  `firma` varchar(255) NOT NULL,
  `art` enum('E','A') DEFAULT NULL,
  `betrag` decimal(10,2) NOT NULL,
  `bemerkung` varchar(255) NOT NULL,
  `mailversand` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_finanzen`
--

INSERT INTO `jumi_finanzen` (`fid`, `uid`, `datum`, `beschreibung`, `firma`, `art`, `betrag`, `bemerkung`, `mailversand`) VALUES
(1, 1, '2023-04-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-04-28 20:55:06'),
(2, 1, '2023-03-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-04-28 20:55:06'),
(3, 1, '2023-01-26', 'Domain ju-and-mi.de', 'Ionos', 'A', '-21.60', '1. Jahr, danach teurer', '2023-04-28 20:55:05'),
(4, 1, '2023-04-29', 'Flyer / Aufkleber', 'Druckhäusle', 'A', '-92.72', '', '2023-04-29 17:25:05'),
(5, 1, '2023-05-02', 'Überweisung Bernd Schulz', '', 'E', '500.00', '', '2023-05-02 10:50:08'),
(6, 5, '2023-05-09', 'Polo Shirts', 'Shirtlabor GmbH', 'A', '-168.49', '', '2023-05-09 11:10:09'),
(7, 1, '2023-05-04', 'Gutschrift Druckhäusle', 'NAK süd', 'E', '92.72', '', '2023-05-10 13:00:21'),
(8, 1, '2023-05-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-05-18 08:05:06'),
(9, 1, '2023-06-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-06-20 07:55:04'),
(10, 1, '2023-07-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-07-14 08:40:05'),
(11, 1, '2023-07-24', '50 x Noten: Leite uns, Herr', 'Gerth Medien', 'A', '-125.00', 'Eingereicht bei NAK', '2023-07-24 21:05:04'),
(12, 1, '2023-07-28', 'Gutschrift: Leite uns, Herr', 'NAK', 'E', '125.00', '', '2023-08-05 07:50:06'),
(13, 1, '2023-08-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-08-21 12:15:06'),
(14, 1, '2023-08-25', 'Laserdrucker Brother HL-L2375DW für Noten', 'Böttcher AG', 'A', '-178.68', '', '2023-08-28 10:55:04'),
(15, 1, '2023-09-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-09-14 08:15:08'),
(16, 1, '2023-09-13', '60 Liedordner', 'Büroshop 24', 'A', '-241.50', 'Eingereicht bei NAK', '2023-09-14 08:15:07'),
(17, 1, '2023-09-13', '4-fach Locher', 'Amazon', 'A', '-38.30', '', '2023-09-14 08:15:07'),
(18, 1, '2023-09-20', 'Gutschrift: 60 Liedordner', 'NAK', 'E', '241.50', '', '2023-09-21 20:15:05'),
(19, 1, '2023-10-16', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-10-16 13:35:04'),
(20, 1, '2023-11-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.00', '', '2023-11-16 14:00:14'),
(21, 1, '2023-11-24', 'Weihnachtsplakate', 'Wir machen Druck', 'A', '-17.67', '', '2023-11-27 12:25:05'),
(22, 1, '2023-12-05', 'All I want for Christmas', 'alle-noten.de', 'A', '-29.90', '10er Lizenz vorab', '2023-12-05 16:10:07'),
(23, 1, '2023-12-05', 'Gutschrift: Weihnachtsplakate', 'NAK', 'E', '17.67', '', '2023-12-10 10:40:08'),
(24, 1, '2023-12-08', 'Holz Feuerkorb', 'Globus Baumarkt', 'A', '-17.96', '', '2023-12-13 08:45:06'),
(25, 1, '2023-12-08', 'Propangasfüllung - Weihnachtsmarkt', 'Globus Baumarkt', 'A', '-13.99', '', '2023-12-13 08:45:06'),
(26, 1, '2023-12-12', 'Verpflegung Jugendchorwochenende', 'Aldi', 'A', '-126.89', '', '2023-12-13 08:45:08'),
(27, 1, '2023-12-12', 'Verpflegung Jugendchorwochenende', 'Lidl', 'A', '-53.16', '', '2023-12-13 08:45:08'),
(28, 1, '2023-12-09', 'Glühwein Weihnachtsmarkt', 'Aldi', 'A', '-95.52', '', '2023-12-13 08:45:07'),
(29, 1, '2023-12-13', 'Nutzungserlaubnis Musik im Freien', 'GEMA', 'A', '-24.01', '', '2023-12-13 10:35:05'),
(30, 1, '2023-12-14', 'Punsch, Puderzucker, Saft', 'Edeka', 'A', '-27.07', '', '2023-12-14 09:40:06'),
(31, 1, '2023-12-14', 'Postfächer ju-and-mi.de', 'Ionos', 'A', '-2.50', '', '2023-12-14 11:10:06'),
(32, 1, '2023-12-15', 'Druckerpapier', 'Expert', 'A', '-22.20', '', '2023-12-15 09:55:05'),
(33, 1, '2023-12-16', '250 Wellis', 'Weller', 'A', '-175.00', '', '2023-12-19 15:00:14'),
(34, 1, '2023-12-16', 'Geschenke für Helfer', 'CAP', 'A', '-15.54', '', '2023-12-19 15:00:14'),
(35, 1, '2023-12-19', 'Würste, Grill, Kartoffelsalat, Gas', 'Metzgerei Schäfer', 'A', '-401.36', '', '2023-12-19 15:00:15'),
(36, 1, '2023-12-20', 'Pfand', 'Neukauf', 'E', '24.50', '', '2023-12-20 10:50:07'),
(37, 1, '2023-12-21', 'Spenden Konzert', '', 'E', '1134.80', '', '2023-12-21 12:10:06'),
(38, 1, '2023-12-22', 'Gutschrift Konzert ', 'NAK', 'E', '1002.60', '', '2023-12-26 13:55:05'),
(39, 1, '2024-01-04', 'Spende Sparschwein', '', 'E', '20.00', '', '2024-01-05 09:10:06');

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
(3, 3, '../media/file_upload/finanzen/20230420_111614_RG_100117336090.pdf', 'RG_100117336090.pdf', 1, '2023-04-20 11:16:14'),
(4, 4, '../media/file_upload/finanzen/20230429_172205_2023-04-29_Druckhaeusle.pdf', '2023-04-29_Druckhäusle.pdf', 1, '2023-04-29 17:22:05'),
(5, 6, '../media/file_upload/finanzen/20230509_110649_R24308502.pdf', 'R24308502.pdf', 5, '2023-05-09 11:06:49'),
(6, 8, '../media/file_upload/finanzen/20230518_080235_RG_100123294592.pdf', 'RG_100123294592.pdf', 1, '2023-05-18 08:02:35'),
(7, 9, '../media/file_upload/finanzen/20230620_075137_RG_100124947326.pdf', 'RG_100124947326.pdf', 1, '2023-06-20 07:51:38'),
(8, 10, '../media/file_upload/finanzen/20230714_083733_RG_100126596951.pdf', 'RG_100126596951.pdf', 1, '2023-07-14 08:37:33'),
(9, 11, '../media/file_upload/finanzen/20230724_210148_Rechnung_Noten_Jugendchor.pdf', 'Rechnung Noten Jugendchor.pdf', 1, '2023-07-24 21:01:48'),
(10, 13, '../media/file_upload/finanzen/20230821_121249_RG_100128260634.pdf', 'RG_100128260634.pdf', 1, '2023-08-21 12:12:49'),
(11, 14, '../media/file_upload/finanzen/20230828_105404_320233474338.pdf', '320233474338.pdf', 1, '2023-08-28 10:54:04'),
(12, 15, '../media/file_upload/finanzen/20230914_081055_Rechnung_2023-09-14_100129927851_V87626187.pdf', 'Rechnung_2023-09-14_100129927851_V87626187.pdf', 1, '2023-09-14 08:10:55'),
(13, 16, '../media/file_upload/finanzen/20230914_081146_bueroshop24_Rechnung_0137266833.pdf', 'bueroshop24_Rechnung_0137266833.pdf', 1, '2023-09-14 08:11:46'),
(14, 17, '../media/file_upload/finanzen/20230914_081322_Amazon_4Locher.pdf', 'Amazon_4Locher.pdf', 1, '2023-09-14 08:13:22'),
(15, 19, '../media/file_upload/finanzen/20231016_133455_Rechnung_2023-10-14_100131597109_V87626187.pdf', 'Rechnung_2023-10-14_100131597109_V87626187.pdf', 1, '2023-10-16 13:34:55'),
(16, 20, '../media/file_upload/finanzen/20231116_135818_Rechnung_2023-11-14_100133291921_V87626187.pdf', 'Rechnung_2023-11-14_100133291921_V87626187.pdf', 1, '2023-11-16 13:58:18'),
(17, 21, '../media/file_upload/finanzen/20231127_122050_Rechnung_plakat-weihnachtskonzert-39412200-2.pdf', 'Rechnung_plakat-weihnachtskonzert-39412200-2.pdf', 1, '2023-11-27 12:20:50'),
(18, 22, '../media/file_upload/finanzen/20231205_160941_Rechnung_RE23115515.pdf', 'Rechnung_RE23115515.pdf', 1, '2023-12-05 16:09:41'),
(19, 24, '../media/file_upload/finanzen/20231213_084026_2023-12-08_Baumarkt_Holz_Feuerkorb_Weihnachtsmarkt.pdf', '2023-12-08_Baumarkt_Holz_Feuerkorb_Weihnachtsmarkt.pdf', 1, '2023-12-13 08:40:26'),
(20, 25, '../media/file_upload/finanzen/20231213_084057_2023-12-08_Baumarkt_Propanfuellung_Weihnachtsmarkt.pdf', '2023-12-08_Baumarkt_Propanfüllung_Weihnachtsmarkt.pdf', 1, '2023-12-13 08:40:57'),
(21, 26, '../media/file_upload/finanzen/20231213_084126_2023-12-12_Aldi_Verpflegung.pdf', '2023-12-12_Aldi_Verpflegung.pdf', 1, '2023-12-13 08:41:26'),
(22, 27, '../media/file_upload/finanzen/20231213_084151_2023-12-12_LIDL_Verpflegung.pdf', '2023-12-12_LIDL_Verpflegung.pdf', 1, '2023-12-13 08:41:51'),
(23, 29, '../media/file_upload/finanzen/20231213_103135_Nutzungsmeldebestaetigung_2023-12-13_10-25.pdf', 'Nutzungsmeldebestätigung_2023-12-13_10-25.pdf', 1, '2023-12-13 10:31:35'),
(24, 30, '../media/file_upload/finanzen/20231214_093818_2023-12-14_Edeka_Punsch.pdf', '2023-12-14_Edeka_Punsch.pdf', 1, '2023-12-14 09:38:18'),
(25, 31, '../media/file_upload/finanzen/20231214_110627_Rechnung_2023-12-14_100134992144_V87626187.pdf', 'Rechnung_2023-12-14_100134992144_V87626187.pdf', 1, '2023-12-14 11:06:27'),
(26, 32, '../media/file_upload/finanzen/20231215_095259_2023-12-15_Expert_Druckpapier.pdf', '2023-12-15_Expert_Druckpapier.pdf', 1, '2023-12-15 09:52:59'),
(27, 28, '../media/file_upload/finanzen/20231219_145512_2023-12-09_Aldi.pdf', '2023-12-09_Aldi.pdf', 1, '2023-12-19 14:55:12'),
(28, 33, '../media/file_upload/finanzen/20231219_145637_2023-12-16_Weller.pdf', '2023-12-16_Weller.pdf', 1, '2023-12-19 14:56:37'),
(29, 34, '../media/file_upload/finanzen/20231219_145706_2023-12-16_CAP.pdf', '2023-12-16_CAP.pdf', 1, '2023-12-19 14:57:06'),
(30, 35, '../media/file_upload/finanzen/20231219_145801_2023-12-19_Schaefer_Verpflegung.pdf', '2023-12-19_Schäfer_Verpflegung.pdf', 1, '2023-12-19 14:58:01'),
(31, 36, '../media/file_upload/finanzen/20231220_104759_72475832873__33A512DA-D266-4CAD-BD0F-ACE7F72801E2.jpeg', '72475832873__33A512DA-D266-4CAD-BD0F-ACE7F72801E2.jpeg', 1, '2023-12-20 10:47:59');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_mailverteiler`
--

CREATE TABLE `jumi_mailverteiler` (
  `mvid` int(11) NOT NULL,
  `bezeichnung` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_mailverteiler`
--

INSERT INTO `jumi_mailverteiler` (`mvid`, `bezeichnung`) VALUES
(1, 'Bernd Schulz'),
(2, 'Michael Dinkelacker'),
(3, 'Bischof Matthias Grauer'),
(4, 'Apostel Jürgen Loy'),
(5, 'Öffentlichkeitsarbeit'),
(6, 'BoxenStopp'),
(7, 'Vorsteher S/FE');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_mailverteiler_entries`
--

CREATE TABLE `jumi_mailverteiler_entries` (
  `mveid` int(11) NOT NULL,
  `vorname` varchar(255) NOT NULL,
  `nachname` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_mailverteiler_entries`
--

INSERT INTO `jumi_mailverteiler_entries` (`mveid`, `vorname`, `nachname`, `mail`) VALUES
(1, 'Bernd', 'Schulz', 'sh1966@gmx.net'),
(2, 'Michael', 'Dinkelacker', 'michael.dinkelacker@axeo.de'),
(3, 'Matthias', 'Grauer', 'm.grauer@nak-sued.de'),
(4, 'Jürgen', 'Loy', 'j.loy@nak-sued.de'),
(5, 'Dieter', 'Staniczek', 'Dieter.Staniczek@t-online.de'),
(6, 'Bernd', 'Cammerer', 'Bernd.Cammerer@t-online.de'),
(7, 'Marcello', 'Raff', 'kirch@rasama.de'),
(8, 'Ingrid', 'Wendler', 'wendler.ingrid@gmail.com'),
(9, 'Stefan', 'Zink', 'ste.zink@gmx.de'),
(10, 'Marc', 'Digel', 'marc.digel@web.de'),
(11, 'Markus', 'Schlotz', 'markus.schlotz@freenet.de'),
(12, 'Dieter', 'Wittlinger', 'dieter.wittlinger@googlemail.com'),
(13, 'Achim', 'Wolf', 'achimwebwolf@web.de'),
(14, 'Frank', 'Geiger', 'frankgeiger@web.de'),
(15, 'Hartmut', 'Berggötz', 'shberggoetz@web.de'),
(16, 'Rainer', 'Weinhart', 'rainer.weinhart@arcor.de'),
(17, 'Patrick', 'Nowak', 'nowakpatrick@hotmail.com'),
(18, 'Peter', 'Kriechbaum', 'Peter.Kriechbaum@gmx.de'),
(19, 'Jochen', 'Class', 'j.class@jochenclass.de'),
(20, 'Steffen', 'Schober', 'steffen-kai-schober@schober-transport.de');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_mailverteiler_user_zuord`
--

CREATE TABLE `jumi_mailverteiler_user_zuord` (
  `mvzid` int(11) NOT NULL,
  `mvid` int(11) NOT NULL COMMENT 'VerteilerID',
  `mveid` int(11) NOT NULL COMMENT 'PersonenID\r\n\r\n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_mailverteiler_user_zuord`
--

INSERT INTO `jumi_mailverteiler_user_zuord` (`mvzid`, `mvid`, `mveid`) VALUES
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 5, 6),
(7, 6, 7),
(8, 6, 8),
(9, 7, 9),
(10, 7, 10),
(11, 7, 11),
(12, 7, 12),
(13, 7, 13),
(14, 7, 14),
(15, 7, 15),
(16, 7, 16),
(17, 7, 17),
(18, 7, 18),
(19, 7, 19),
(20, 7, 20),
(21, 1, 1),
(22, 7, 1);

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
(17, 'Ein-/Ausgaben', 'finanzen.php', 4, 'fa-solid fa-coins', 17),
(18, 'Mailversand', 'mailversand.php', 5, 'fa fa-envelope', 18),
(19, 'Verteiler', '#', 5, 'fa fa-users', 19),
(20, 'Verteilerlisten', 'verteilerlisten.php', 5, '', 19),
(21, 'Kontakt', 'create_verteileruser.php', 5, '', 19),
(22, 'Kontakt bearbeiten', 'edit_verteileruser.php', 5, '', 19),
(23, 'Backup', '../msd', 20, 'fa fa-hdd', 23);

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
(5, 'Mailsystem', '1'),
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
  `streamlizenz` enum('0','1','2') NOT NULL DEFAULT '2' COMMENT '0=nein;1=ja;2=ungeklärt',
  `bemerkung` text NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_daten`
--

INSERT INTO `jumi_noten_daten` (`jndid`, `titel`, `liednr`, `vid`, `anz_lizenzen`, `streamlizenz`, `bemerkung`, `uid`, `datum`) VALUES
(4, 'Leite uns, Herr', '4', 4, 50, '1', '<p>Sehr geehrter Herr Schwarz,</p>\n<p>danke f&uuml;r Ihre Anfrage.</p>\n<p>Die Musiknutzung im Gottesdienst ist bei den meisten Gemeinden &uuml;ber einen Rahmenvertrag mit der GEMA abgedeckt.&nbsp;<br>Ausnahme: Gr&ouml;&szlig;eres Musikwerke, die aufgef&uuml;hrt werden und l&auml;nger als 10 Minuten sind (z.B. Messen, Kantaten usw) oder Kirchenkonzerte m&uuml;ssen gesondert</p>\n<p>bei der GEMA gemeldet werden. Sie d&uuml;rfen also das angefragte Chor-St&uuml;ck gerne im Gottesdienst mit Livestream-&Uuml;bertragung verwenden.</p>\n<p>Wir gestatten Ihnen das Lied im Livestream auf YouTube f&uuml;r 2 Wochen kostenfrei online zu stellen. Falls Sie das Lied f&uuml;r einen l&auml;ngeren Zeitraum online verf&uuml;gbar haben m&ouml;chten, w&uuml;rde daf&uuml;r eine Lizenzgeb&uuml;hr anfallen und k&ouml;nnen wir Ihnen bei Interesse gerne ein entsprechendes Angebot machen. Ansonsten bitten wir Sie das Musikst&uuml;ck nach Ablauf der 2 Wochen aus dem Livestream herauszuschneiden.</p>\n<p>In jedem Fall bitten wir Sie (im oder unter dem Video) die korrekten Rechtsangaben einzublenden.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>\n<p>SCM Verlag in der SCM Verlagsgruppe<br>E-Mail: Bender@scm-verlagsgruppe.de<br>Telefon: +49 (0)7031 7414-453</p>\n<p>Gilt das f&uuml;r alle Noten bei Gerth-Medien?</p>\n<p>Hallo Herr Schwarz,</p>\n<p>ja, das gilt f&uuml;r alle Werke, die von Gerth Medien oder SCM H&auml;nssler verwaltet werden.</p>\n<p>Unsere beiden Verlage geh&ouml;ren zur SCM Verlagsgruppe und wir sind daher ein Unternehmen.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>', 1, '2023-08-24 15:07:57'),
(5, 'Höher', '3', 5, 999, '1', '<p>CCLI Song # 7051762<br>CCLI License # 652373</p>', 1, '2023-08-24 15:07:33'),
(6, 'Anker in der Zeit - mehrstimmig', '2B', 5, 999, '1', '<p>CCLI Song # 4326005<br>CCLI License # 652373</p>', 1, '2023-08-24 15:07:22'),
(7, 'Leuchtturm', '5A', 5, 999, '1', '<p>CCLI Song # 7051347<br>CCLI License # 557416</p>', 1, '2023-09-14 09:42:25'),
(8, 'Lighthouse', '5B', 5, 999, '1', '<p>CCLI Song # 7002032<br>CCLI License # 557416</p>', 1, '2023-09-14 09:40:06'),
(9, '10000 Reasons', '1', 5, 999, '1', '<p>CCLI Song # 6016351<br>CCLI License # 652373</p>', 1, '2023-08-24 15:06:35'),
(11, 'Anker in der Zeit - einstimmig', '2A', 5, 999, '1', '<p>CCLI Song # 4326005<br>CCLI License # 652373</p>', 1, '2023-08-24 15:11:39'),
(12, 'Still', '6', 5, 999, '1', '<p>CCLI Song # 5463280<br>CCLI License # 652373</p>', 1, '2023-09-14 09:52:16'),
(13, 'Wenn Friede mit Gott', '0', 4, 1, '1', '<p>Sehr geehrter Herr Schwarz,</p>\n<p>danke f&uuml;r Ihre Anfrage.</p>\n<p>Die Musiknutzung im Gottesdienst ist bei den meisten Gemeinden &uuml;ber einen Rahmenvertrag mit der GEMA abgedeckt.&nbsp;<br>Ausnahme: Gr&ouml;&szlig;eres Musikwerke, die aufgef&uuml;hrt werden und l&auml;nger als 10 Minuten sind (z.B. Messen, Kantaten usw) oder Kirchenkonzerte m&uuml;ssen gesondert</p>\n<p>bei der GEMA gemeldet werden. Sie d&uuml;rfen also das angefragte Chor-St&uuml;ck gerne im Gottesdienst mit Livestream-&Uuml;bertragung verwenden.</p>\n<p>Wir gestatten Ihnen das Lied im Livestream auf YouTube f&uuml;r 2 Wochen kostenfrei online zu stellen. Falls Sie das Lied f&uuml;r einen l&auml;ngeren Zeitraum online verf&uuml;gbar haben m&ouml;chten, w&uuml;rde daf&uuml;r eine Lizenzgeb&uuml;hr anfallen und k&ouml;nnen wir Ihnen bei Interesse gerne ein entsprechendes Angebot machen. Ansonsten bitten wir Sie das Musikst&uuml;ck nach Ablauf der 2 Wochen aus dem Livestream herauszuschneiden.</p>\n<p>In jedem Fall bitten wir Sie (im oder unter dem Video) die korrekten Rechtsangaben einzublenden.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>\n<p>SCM Verlag in der SCM Verlagsgruppe<br>E-Mail: Bender@scm-verlagsgruppe.de<br>Telefon: +49 (0)7031 7414-453</p>\n<p>Gilt das f&uuml;r alle Noten bei Gerth-Medien?</p>\n<p>Hallo Herr Schwarz,</p>\n<p>ja, das gilt f&uuml;r alle Werke, die von Gerth Medien oder SCM H&auml;nssler verwaltet werden.</p>\n<p>Unsere beiden Verlage geh&ouml;ren zur SCM Verlagsgruppe und wir sind daher ein Unternehmen.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>', 1, '2023-07-26 10:09:36'),
(14, 'In Times like These', '0', 4, 1, '1', '<p>Sehr geehrter Herr Schwarz,</p>\n<p>danke f&uuml;r Ihre Anfrage.</p>\n<p>Die Musiknutzung im Gottesdienst ist bei den meisten Gemeinden &uuml;ber einen Rahmenvertrag mit der GEMA abgedeckt.&nbsp;<br>Ausnahme: Gr&ouml;&szlig;eres Musikwerke, die aufgef&uuml;hrt werden und l&auml;nger als 10 Minuten sind (z.B. Messen, Kantaten usw) oder Kirchenkonzerte m&uuml;ssen gesondert</p>\n<p>bei der GEMA gemeldet werden. Sie d&uuml;rfen also das angefragte Chor-St&uuml;ck gerne im Gottesdienst mit Livestream-&Uuml;bertragung verwenden.</p>\n<p>Wir gestatten Ihnen das Lied im Livestream auf YouTube f&uuml;r 2 Wochen kostenfrei online zu stellen. Falls Sie das Lied f&uuml;r einen l&auml;ngeren Zeitraum online verf&uuml;gbar haben m&ouml;chten, w&uuml;rde daf&uuml;r eine Lizenzgeb&uuml;hr anfallen und k&ouml;nnen wir Ihnen bei Interesse gerne ein entsprechendes Angebot machen. Ansonsten bitten wir Sie das Musikst&uuml;ck nach Ablauf der 2 Wochen aus dem Livestream herauszuschneiden.</p>\n<p>In jedem Fall bitten wir Sie (im oder unter dem Video) die korrekten Rechtsangaben einzublenden.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>\n<p>SCM Verlag in der SCM Verlagsgruppe<br>E-Mail: Bender@scm-verlagsgruppe.de<br>Telefon: +49 (0)7031 7414-453</p>\n<p>Gilt das f&uuml;r alle Noten bei Gerth-Medien?</p>\n<p>Hallo Herr Schwarz,</p>\n<p>ja, das gilt f&uuml;r alle Werke, die von Gerth Medien oder SCM H&auml;nssler verwaltet werden.</p>\n<p>Unsere beiden Verlage geh&ouml;ren zur SCM Verlagsgruppe und wir sind daher ein Unternehmen.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>', 1, '2023-07-26 10:09:15'),
(15, 'In dieser Zeit', '0', 4, 1, '1', '<p>Sehr geehrter Herr Schwarz,</p>\n<p>danke f&uuml;r Ihre Anfrage.</p>\n<p>Die Musiknutzung im Gottesdienst ist bei den meisten Gemeinden &uuml;ber einen Rahmenvertrag mit der GEMA abgedeckt.&nbsp;<br>Ausnahme: Gr&ouml;&szlig;eres Musikwerke, die aufgef&uuml;hrt werden und l&auml;nger als 10 Minuten sind (z.B. Messen, Kantaten usw) oder Kirchenkonzerte m&uuml;ssen gesondert</p>\n<p>bei der GEMA gemeldet werden. Sie d&uuml;rfen also das angefragte Chor-St&uuml;ck gerne im Gottesdienst mit Livestream-&Uuml;bertragung verwenden.</p>\n<p>Wir gestatten Ihnen das Lied im Livestream auf YouTube f&uuml;r 2 Wochen kostenfrei online zu stellen. Falls Sie das Lied f&uuml;r einen l&auml;ngeren Zeitraum online verf&uuml;gbar haben m&ouml;chten, w&uuml;rde daf&uuml;r eine Lizenzgeb&uuml;hr anfallen und k&ouml;nnen wir Ihnen bei Interesse gerne ein entsprechendes Angebot machen. Ansonsten bitten wir Sie das Musikst&uuml;ck nach Ablauf der 2 Wochen aus dem Livestream herauszuschneiden.</p>\n<p>In jedem Fall bitten wir Sie (im oder unter dem Video) die korrekten Rechtsangaben einzublenden.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>\n<p>SCM Verlag in der SCM Verlagsgruppe<br>E-Mail: Bender@scm-verlagsgruppe.de<br>Telefon: +49 (0)7031 7414-453</p>\n<p>Gilt das f&uuml;r alle Noten bei Gerth-Medien?</p>\n<p>Hallo Herr Schwarz,</p>\n<p>ja, das gilt f&uuml;r alle Werke, die von Gerth Medien oder SCM H&auml;nssler verwaltet werden.</p>\n<p>Unsere beiden Verlage geh&ouml;ren zur SCM Verlagsgruppe und wir sind daher ein Unternehmen.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>', 1, '2023-07-26 10:09:05'),
(16, 'Gemeinsam unterwegs', '0', 4, 1, '1', '<p>Sehr geehrter Herr Schwarz,</p>\n<p>danke f&uuml;r Ihre Anfrage.</p>\n<p>Die Musiknutzung im Gottesdienst ist bei den meisten Gemeinden &uuml;ber einen Rahmenvertrag mit der GEMA abgedeckt.&nbsp;<br>Ausnahme: Gr&ouml;&szlig;eres Musikwerke, die aufgef&uuml;hrt werden und l&auml;nger als 10 Minuten sind (z.B. Messen, Kantaten usw) oder Kirchenkonzerte m&uuml;ssen gesondert</p>\n<p>bei der GEMA gemeldet werden. Sie d&uuml;rfen also das angefragte Chor-St&uuml;ck gerne im Gottesdienst mit Livestream-&Uuml;bertragung verwenden.</p>\n<p>Wir gestatten Ihnen das Lied im Livestream auf YouTube f&uuml;r 2 Wochen kostenfrei online zu stellen. Falls Sie das Lied f&uuml;r einen l&auml;ngeren Zeitraum online verf&uuml;gbar haben m&ouml;chten, w&uuml;rde daf&uuml;r eine Lizenzgeb&uuml;hr anfallen und k&ouml;nnen wir Ihnen bei Interesse gerne ein entsprechendes Angebot machen. Ansonsten bitten wir Sie das Musikst&uuml;ck nach Ablauf der 2 Wochen aus dem Livestream herauszuschneiden.</p>\n<p>In jedem Fall bitten wir Sie (im oder unter dem Video) die korrekten Rechtsangaben einzublenden.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>\n<p>SCM Verlag in der SCM Verlagsgruppe<br>E-Mail: Bender@scm-verlagsgruppe.de<br>Telefon: +49 (0)7031 7414-453</p>\n<p>Gilt das f&uuml;r alle Noten bei Gerth-Medien?</p>\n<p>Hallo Herr Schwarz,</p>\n<p>ja, das gilt f&uuml;r alle Werke, die von Gerth Medien oder SCM H&auml;nssler verwaltet werden.</p>\n<p>Unsere beiden Verlage geh&ouml;ren zur SCM Verlagsgruppe und wir sind daher ein Unternehmen.</p>\n<p>Mit freundlichen Gr&uuml;&szlig;en<br>Diana Bender<br>Rechte &amp; Lizenzen Audio</p>', 1, '2023-07-26 10:08:51'),
(17, 'Mögen Engel dich begleiten - einstimmig', '', 6, 999, '1', '<p>Lizenz: Mail vom 05.08.2023</p>', 1, '2023-09-14 09:51:13'),
(18, 'Mögen Engel dich begleiten - mehrstimmig', '', 7, 999, '1', '<p>Lizenz: Mail vom 05.08.2023</p>', 1, '2023-09-14 09:51:28'),
(19, 'Lege deine Sorgen nieder', '', 4, 0, '0', '<p>Arr. Frieder K&ouml;pf, Ev. Kirche Beutelsbach</p>', 1, '2023-09-21 18:23:23'),
(20, 'Still a Bach Christmas', '300', 8, 9, '2', '<p>https://www.alfred.com/still-a-bach-christmas/p/00-PO-0003880/</p>', 1, '2023-10-21 07:27:06'),
(21, 'All I want for Christmas', '', 9, 10, '2', '<p>Gekauft: order@ju-and-mi.de</p>', 1, '2023-12-02 17:18:15');

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
(8, 4, '../media/file_upload/noten/20230724_200635_Leite_uns,_Herr.pdf', 'Leite uns, Herr.pdf', 1, '2023-07-24 20:06:35'),
(9, 5, '../media/file_upload/noten/20230725_070252_Hoeher.pdf', 'Höher.pdf', 1, '2023-07-25 07:02:52'),
(10, 6, '../media/file_upload/noten/20230725_070353_Anker_in_der_Zeit.pdf', 'Anker in der Zeit.pdf', 1, '2023-07-25 07:03:53'),
(13, 9, '../media/file_upload/noten/20230725_070602_10000_Reasons.pdf', '10000 Reasons.pdf', 1, '2023-07-25 07:06:02'),
(15, 11, '../media/file_upload/noten/20230725_070729_Anker_in_der_Zeit_einstimmig.pdf', 'Anker in der Zeit einstimmig.pdf', 1, '2023-07-25 07:07:29'),
(16, 12, '../media/file_upload/noten/20230725_070751_Still.pdf', 'Still.pdf', 1, '2023-07-25 07:07:51'),
(17, 13, '../media/file_upload/noten/20230725_100121_Wenn_Friede_mit_Gott.pdf', 'Wenn Friede mit Gott.pdf', 1, '2023-07-25 10:01:21'),
(18, 14, '../media/file_upload/noten/20230725_100830_In_Times_like_These.pdf', 'In Times like These.pdf', 1, '2023-07-25 10:08:30'),
(19, 15, '../media/file_upload/noten/20230725_101338_In_dieser_Zeit.pdf', 'In dieser Zeit.pdf', 1, '2023-07-25 10:13:38'),
(20, 16, '../media/file_upload/noten/20230725_101437_Gemeinsam_unterwegs.pdf', 'Gemeinsam unterwegs.pdf', 1, '2023-07-25 10:14:37'),
(23, 17, '../media/file_upload/noten/20230805_154648_1-MoeE-Taufe.pdf', '1-MöE-Taufe.pdf', 1, '2023-08-05 15:46:48'),
(24, 18, '../media/file_upload/noten/20230824_150101_MoeE-Chor.pdf', 'MoeE-Chor.pdf', 1, '2023-08-24 15:01:01'),
(25, 8, '../media/file_upload/noten/20230914_093917_My_Lighthouse_A.pdf', 'My_Lighthouse_A.pdf', 1, '2023-09-14 09:39:17'),
(26, 7, '../media/file_upload/noten/20230914_094158_Leuchtturm-A.pdf', 'Leuchtturm-A.pdf', 1, '2023-09-14 09:41:58'),
(27, 19, '../media/file_upload/noten/20230921_182323_Nr._13_Lege_deine_Sorgen_nieder.sib', 'Nr. 13 Lege deine Sorgen nieder.sib', 1, '2023-09-21 18:23:23'),
(28, 19, '../media/file_upload/noten/20230921_182324_Lege_deine_Sorgen_nieder_-_Partitur.pdf', 'Lege deine Sorgen nieder - Partitur.pdf', 1, '2023-09-21 18:23:24'),
(29, 20, '../media/file_upload/noten/20231021_071957_Still_a_Bach_Lullaby.pdf', 'Still a Bach Lullaby.pdf', 1, '2023-10-21 07:19:57'),
(30, 21, '../media/file_upload/noten/20231202_171814_All_I_want_for_Christmas.pdf', 'All_I_want_for_Christmas.pdf', 1, '2023-12-02 17:18:15');

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
(4, 'Gerth Medien'),
(5, 'CCLI'),
(6, 'Jürgen Grote'),
(7, 'Jügen Grote'),
(8, 'Alfred Archive Edition'),
(9, 'alle-noten.de');

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
(4, 'Liedordner', '0', 0),
(5, 'Feiert Jesus - Chor', '1', 30);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_zusammenstellung_zuord`
--

CREATE TABLE `jumi_noten_zusammenstellung_zuord` (
  `zsnid` int(11) NOT NULL,
  `jndid` int(11) NOT NULL,
  `zsid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_zusammenstellung_zuord`
--

INSERT INTO `jumi_noten_zusammenstellung_zuord` (`zsnid`, `jndid`, `zsid`) VALUES
(17, 9, 4),
(20, 5, 4),
(21, 4, 4),
(22, 7, 4),
(23, 8, 4),
(24, 12, 4),
(27, 11, 4),
(31, 20, 4);

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
(11, 4, 2),
(12, 4, 3),
(13, 4, 1),
(14, 4, 12),
(15, 4, 15),
(16, 4, 20),
(17, 4, 34),
(18, 4, 27),
(19, 4, 31),
(20, 4, 9),
(21, 4, 35),
(22, 4, 33),
(23, 4, 30),
(24, 4, 29),
(25, 4, 38),
(26, 4, 18),
(27, 4, 22),
(28, 4, 36),
(29, 4, 28),
(30, 4, 13),
(31, 4, 5),
(32, 4, 7),
(33, 4, 6),
(34, 4, 26),
(35, 4, 17),
(36, 4, 25),
(37, 4, 23),
(38, 4, 21),
(39, 4, 8),
(40, 4, 37),
(41, 4, 24),
(42, 4, 14),
(43, 4, 16),
(44, 4, 39),
(45, 4, 19),
(46, 4, 32),
(47, 4, 41);

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
(1, 'Mailadressen Ansprechpartner', 'info@ju-and-mi.de', 1),
(2, 'Absenderkennung', 'Info JU & MI', 2),
(3, 'Mailbox Passwort', '!S3ge1gP', 3);

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
(41, 6, '8433176c534a07f43f545d84f97b6a20', '8d574221098bba4ade4d7ef5ce508242a8580e27', '2023-09-20 15:30:23'),
(43, 7, '02c2074375a5e86ee8989524df559b69', 'eb5dce6f4c90a6aaaaae01873250a93e8b304f25', '2023-09-22 13:03:59'),
(44, 1, '6cd4ce18e29a77a187bbfab667745b16', '49752c27e2a6a5f8c500bcdf5a34009aed65179c', '2023-09-27 05:32:56'),
(45, 1, 'd874db501149eefed930fcb3744e825c', 'c2687227002524f403bcb3c70b9c088deabbd123', '2023-09-27 07:00:29'),
(46, 1, 'c3fedde22506e7aef152e216dbeb0153', '1ca65e7ab0c164cd714daa9518a4a48f601c00c3', '2023-10-21 06:08:59'),
(47, 1, 'ca42300176b5cf18a0429409919ba960', '8ed3ba70504228272dc6ab3e5020b1a764fc7a1a', '2023-10-23 08:19:04'),
(48, 1, '5e7b7f6190808e9896d4b86d1c8e1e1f', '4765c10e276692e2a5cc47a52b1fe0e4d485c9e3', '2023-10-31 07:11:28'),
(49, 1, 'ded378806ba53ba33f2dcb084b75b9b4', '54b61dae306c62276f750235f116e6a8c0d1c3d7', '2023-11-20 12:24:26');

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
  `freitext_headline` varchar(255) NOT NULL,
  `uid` int(11) NOT NULL,
  `datum_erfasst` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen`
--

INSERT INTO `jumi_umfragen` (`umid`, `datum_von`, `datum_bis`, `headline`, `freitext`, `freitext_headline`, `uid`, `datum_erfasst`) VALUES
(4, '2023-09-24 09:30:00', '2023-09-27 23:00:00', 'Rückblick zum Kick-Off', '1', 'Was wünschst du dir für die zukünftigen Proben / Gottesdienste / Konzerte?', 1, '2023-09-13 08:21:14'),
(5, '2023-12-16 15:30:00', '2023-12-19 23:00:00', 'JU & MI Weihnachtskonzert', '1', 'Lob und Kritik zum Konzertwochenende', 1, '2023-12-16 15:50:19');

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
(25, 9, 'Ja, die Infos haben mir gerreicht', 0),
(26, 9, 'Nein, hätte mir mehr Infos gewünscht', 0),
(27, 9, 'keine Angabe', 0),
(28, 10, 'Sehr gut', 0),
(29, 10, 'Gut', 0),
(30, 10, 'Mittelmäßig', 0),
(31, 10, 'Schlecht', 0),
(32, 10, 'Sehr schlecht', 0),
(33, 11, 'Kennenlernen', 0),
(34, 11, 'Essen', 0),
(35, 11, 'Musizieren', 0),
(36, 11, 'Soloproben', 0),
(37, 11, 'Social-Media Aktionen', 0),
(38, 12, 'Sehr gut', 0),
(40, 12, 'Gut', 0),
(41, 12, 'Mittelmäßig', 0),
(42, 12, 'Schlecht', 0),
(43, 12, 'Sehr schlecht', 0),
(44, 13, '1', 0),
(45, 13, '2', 0),
(46, 13, '3', 0),
(47, 13, '4', 0),
(48, 13, '5', 0),
(49, 13, '6', 0),
(50, 14, '1', 0),
(51, 14, '2', 0),
(52, 14, '3', 0),
(53, 14, '4', 0),
(54, 14, '5', 0),
(55, 14, '6', 0);

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
(1, 4, '84.58.28.34', 'u2knhpjf4dcq1e250mslnd5bcq', '1'),
(2, 4, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', '1'),
(3, 4, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', '1'),
(4, 4, '93.235.5.207', 'j3cr87armqndues4fk064v9kv0', '1'),
(5, 4, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', '1'),
(6, 4, '89.246.97.25', 'd3brgp06tfe9d849vefc0j3tbl', '1'),
(7, 4, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', '1'),
(8, 4, '93.235.10.175', '9ooesutq61nlc8olpft2ec03l0', '1'),
(9, 4, '80.187.66.81', '0jn6q8mh9ijq10rl3vbnmcmbvr', '1'),
(10, 4, '79.216.73.227', '4i4gk1veri8loubiqso4paefc8', '1'),
(11, 4, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', '1'),
(12, 4, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', '1'),
(13, 4, '79.216.69.79', 'u9psq6k6idk7dnds6bpddndr34', '1'),
(14, 4, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', '1'),
(17, 5, '93.214.52.192', 'bndpj9v6li6t9ktm6qb8apdusm', '1'),
(18, 5, '93.214.53.211', 'toetvc43nqdob658mr8gtl0p53', '1'),
(19, 5, '93.214.53.211', 'ibf5lmbgs922e54tq0lbq7epde', '1'),
(20, 5, '93.235.4.45', 'mnjijrp85j78p6m6rlosscmtvd', '1'),
(21, 5, '80.187.66.27', 'bi43r24ngdssuqup5bqb35etbj', '1'),
(22, 5, '93.214.52.192', 'ud9hv6834e2663hcimsv052rh8', '1'),
(23, 5, '46.91.141.4', 'fcum8obk3hna418k3je1gl6u18', '1'),
(24, 5, '5.146.192.134', 'bus41jabeiq3l4ura4fkbnp9c3', '1'),
(25, 5, '217.85.201.65', '159kv7aopefc5d4biof6qc1vn1', '1'),
(26, 5, '93.214.52.192', 'et28qh90lc7knh1063tvth7ei4', '1'),
(27, 5, '91.38.255.78', '1qdjt33lvpu1macujkph82dv97', '1'),
(28, 5, '46.91.133.100', 'ufh541ted2s4bnlvdug3n2v42e', '1'),
(29, 5, '78.43.127.40', 'h3rvco6m82pafl7400fi4s8s4h', '1'),
(30, 5, '77.181.111.226', '87k70i60k4le20nf0cns1i48so', '1'),
(31, 5, '5.146.193.151', '47hjjpq5ksr0nhnjl209o9sg7r', '1'),
(32, 5, '79.198.15.8', 'nrd68n3j1p5gf11ts4575pfu6t', '1'),
(33, 5, '109.43.179.143', 'p6ste1gfmu49v9lkk9n4v7gcs8', '1');

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
(1, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 9, 26),
(2, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 10, 30),
(3, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 11, 33),
(4, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 11, 34),
(5, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 11, 35),
(6, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 12, 40),
(7, '84.58.28.34', 'u2knhpjf4dcq1e250mslnd5bcq', 9, 25),
(8, '84.58.28.34', 'u2knhpjf4dcq1e250mslnd5bcq', 10, 28),
(9, '84.58.28.34', 'u2knhpjf4dcq1e250mslnd5bcq', 11, 35),
(10, '84.58.28.34', 'u2knhpjf4dcq1e250mslnd5bcq', 12, 38),
(11, '46.114.217.232', '5hunk9u7k3f99arf1kpl233jrm', 9, 25),
(12, '84.143.251.186', 'vjdant3pu2f5rakprlsj33j4m4', 9, 0),
(13, '84.143.251.186', 'vjdant3pu2f5rakprlsj33j4m4', 10, 0),
(14, '84.143.251.186', 'vjdant3pu2f5rakprlsj33j4m4', 12, 0),
(15, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', 9, 26),
(16, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', 9, 26),
(17, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', 10, 29),
(18, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', 10, 29),
(19, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', 11, 35),
(20, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', 11, 36),
(21, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', 11, 35),
(22, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', 12, 40),
(23, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', 12, 40),
(26, '93.235.5.207', 'j3cr87armqndues4fk064v9kv0', 9, 25),
(28, '93.235.5.207', 'j3cr87armqndues4fk064v9kv0', 10, 28),
(29, '93.235.5.207', 'j3cr87armqndues4fk064v9kv0', 11, 35),
(30, '93.235.5.207', 'j3cr87armqndues4fk064v9kv0', 12, 38),
(31, '89.246.97.25', 'd3brgp06tfe9d849vefc0j3tbl', 9, 26),
(32, '89.246.97.25', 'd3brgp06tfe9d849vefc0j3tbl', 10, 29),
(34, '89.246.97.25', 'd3brgp06tfe9d849vefc0j3tbl', 12, 0),
(35, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', 9, 26),
(36, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', 10, 28),
(37, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', 11, 33),
(38, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', 11, 35),
(39, '80.187.64.98', 'jq1snsa3vng2bcfbv3ibqqaiu4', 12, 38),
(40, '93.235.10.175', '9ooesutq61nlc8olpft2ec03l0', 9, 26),
(41, '93.235.10.175', '9ooesutq61nlc8olpft2ec03l0', 10, 28),
(42, '93.235.10.175', '9ooesutq61nlc8olpft2ec03l0', 11, 35),
(43, '93.235.10.175', '9ooesutq61nlc8olpft2ec03l0', 12, 40),
(44, '80.187.66.81', '0jn6q8mh9ijq10rl3vbnmcmbvr', 9, 26),
(45, '80.187.66.81', '0jn6q8mh9ijq10rl3vbnmcmbvr', 10, 30),
(46, '80.187.66.81', '0jn6q8mh9ijq10rl3vbnmcmbvr', 11, 35),
(47, '80.187.66.81', '0jn6q8mh9ijq10rl3vbnmcmbvr', 12, 40),
(48, '79.216.73.227', '4i4gk1veri8loubiqso4paefc8', 9, 25),
(49, '79.216.73.227', '4i4gk1veri8loubiqso4paefc8', 10, 28),
(50, '79.216.73.227', '4i4gk1veri8loubiqso4paefc8', 11, 35),
(51, '79.216.73.227', '4i4gk1veri8loubiqso4paefc8', 12, 40),
(52, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', 9, 25),
(53, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', 10, 28),
(54, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', 11, 33),
(55, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', 11, 35),
(56, '79.216.73.227', '5n36gidrfejolh7sjbjog1ofku', 12, 38),
(57, '84.56.251.157', '9ala7cifhvni7jtk7iqv02suk0', 9, 26),
(58, '84.56.251.157', '9ala7cifhvni7jtk7iqv02suk0', 10, 29),
(59, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', 9, 26),
(60, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', 10, 29),
(61, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', 11, 35),
(62, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', 12, 40),
(63, '79.216.69.79', 'u9psq6k6idk7dnds6bpddndr34', 9, 25),
(64, '79.216.69.79', 'u9psq6k6idk7dnds6bpddndr34', 10, 29),
(65, '79.216.69.79', 'u9psq6k6idk7dnds6bpddndr34', 11, 35),
(66, '79.216.69.79', 'u9psq6k6idk7dnds6bpddndr34', 12, 38),
(67, '194.140.114.202', '3d367it4fovgh8rvk4isicr9a4', 9, 27),
(68, '194.140.114.202', '3d367it4fovgh8rvk4isicr9a4', 10, 28),
(69, '194.140.114.202', '3d367it4fovgh8rvk4isicr9a4', 12, 0),
(70, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', 9, 25),
(71, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', 10, 29),
(72, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', 11, 35),
(73, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', 12, 38),
(78, '93.235.2.219', 'idkgacfgn9bm8b19pa1jinrqvj', 13, 44),
(79, '93.235.2.219', 'idkgacfgn9bm8b19pa1jinrqvj', 14, 50),
(80, '93.214.53.211', 'toetvc43nqdob658mr8gtl0p53', 13, 44),
(81, '93.214.52.192', 'bndpj9v6li6t9ktm6qb8apdusm', 13, 44),
(82, '93.214.52.192', 'bndpj9v6li6t9ktm6qb8apdusm', 14, 50),
(83, '93.214.53.211', 'toetvc43nqdob658mr8gtl0p53', 14, 51),
(84, '93.214.53.211', 'ibf5lmbgs922e54tq0lbq7epde', 13, 44),
(85, '93.214.53.211', 'ibf5lmbgs922e54tq0lbq7epde', 14, 51),
(86, '80.187.66.27', 'bi43r24ngdssuqup5bqb35etbj', 13, 45),
(87, '80.187.66.27', 'bi43r24ngdssuqup5bqb35etbj', 14, 51),
(88, '93.235.4.45', 'mnjijrp85j78p6m6rlosscmtvd', 13, 45),
(89, '93.235.4.45', 'mnjijrp85j78p6m6rlosscmtvd', 14, 51),
(90, '93.214.52.192', 'ud9hv6834e2663hcimsv052rh8', 13, 44),
(91, '93.214.52.192', 'ud9hv6834e2663hcimsv052rh8', 14, 50),
(92, '46.91.141.4', 'fcum8obk3hna418k3je1gl6u18', 13, 44),
(93, '46.91.141.4', 'fcum8obk3hna418k3je1gl6u18', 14, 50),
(94, '5.146.192.134', 'bus41jabeiq3l4ura4fkbnp9c3', 13, 45),
(95, '5.146.192.134', 'bus41jabeiq3l4ura4fkbnp9c3', 14, 50),
(96, '217.85.201.65', '159kv7aopefc5d4biof6qc1vn1', 13, 44),
(97, '217.85.201.65', '159kv7aopefc5d4biof6qc1vn1', 14, 50),
(98, '93.214.52.192', 'et28qh90lc7knh1063tvth7ei4', 13, 44),
(99, '93.214.52.192', 'et28qh90lc7knh1063tvth7ei4', 14, 51),
(100, '91.38.255.78', '1qdjt33lvpu1macujkph82dv97', 13, 46),
(101, '91.38.255.78', '1qdjt33lvpu1macujkph82dv97', 14, 53),
(104, '46.91.133.100', 'ufh541ted2s4bnlvdug3n2v42e', 13, 45),
(105, '46.91.133.100', 'ufh541ted2s4bnlvdug3n2v42e', 14, 50),
(106, '78.43.127.40', 'h3rvco6m82pafl7400fi4s8s4h', 13, 44),
(107, '78.43.127.40', 'h3rvco6m82pafl7400fi4s8s4h', 14, 50),
(108, '89.15.237.67', 'fd3n8fdepp5mef9j59uac8l2ks', 13, 45),
(109, '89.15.237.67', 'fd3n8fdepp5mef9j59uac8l2ks', 14, 51),
(110, '77.181.111.226', '87k70i60k4le20nf0cns1i48so', 13, 45),
(111, '77.181.111.226', '87k70i60k4le20nf0cns1i48so', 14, 52),
(112, '46.91.133.100', 'j17n6ssd5dj4eoqc3bie41attf', 13, 44),
(113, '46.91.133.100', 'j17n6ssd5dj4eoqc3bie41attf', 14, 50),
(114, '5.146.193.151', '47hjjpq5ksr0nhnjl209o9sg7r', 13, 44),
(115, '5.146.193.151', '47hjjpq5ksr0nhnjl209o9sg7r', 14, 50),
(116, '79.198.15.8', 'nrd68n3j1p5gf11ts4575pfu6t', 13, 44),
(117, '79.198.15.8', 'nrd68n3j1p5gf11ts4575pfu6t', 14, 50),
(118, '109.43.179.143', 'p6ste1gfmu49v9lkk9n4v7gcs8', 13, 44),
(119, '109.43.179.143', 'p6ste1gfmu49v9lkk9n4v7gcs8', 14, 51);

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
(1, 4, '87.167.227.183', 'moh7ajktcogujcj96gh5ns4kos', 'Einen \"Briefkasten\" für Lied-Vorschläge aus der Jugend.'),
(2, 4, '83.242.55.164', 'bf8l3ucno8sa7e4nk0psss8rqm', 'Ein etwas ausführlicheres Einsingen wäre gut. \r\nZwischendurch z. B. nach der Mittagspause aktivierende Übungen wie Body Percussion, etc. '),
(3, 4, '83.242.55.164', 'm1i8i170fhhoboipuheft5vb8u', '- Bessere Mischung zwischen neuen und bekannten Lieder\r\n- mehr Zeit zum Einüben der Lieder, vor allem mit Registerproben '),
(4, 4, '77.12.32.139', '7il83u4a0qm9d5gmbn1tp00n0s', 'Gute Mischung aus bekannten& neuen Liedern. Mehr Kommunikation, z.B. frühzeitig Proben auf allen Kanälen ankündigen. Ansonsten weiterhin die ansteckende Motivation behalten, war ein super Auftakt!'),
(5, 4, '79.209.52.204', '026riq7msn26rvkh9i3thrnsln', 'Mehr Solostücke, höherliegende Stücke für den Sopran (evt. mit Vibrato arbeiten) Beim Gestalten des Gottesdienstes könnte man bessere und ausgiebigere Soundchecks machen, damit auch alles gleich passt. '),
(7, 5, '93.214.53.211', 'toetvc43nqdob658mr8gtl0p53', '.'),
(8, 5, '93.214.53.211', 'ibf5lmbgs922e54tq0lbq7epde', 'War sehr schön und hat richtig viel Spaß gemacht '),
(9, 5, '80.187.66.27', 'bi43r24ngdssuqup5bqb35etbj', 'Es war sehr sehr schön und hat viel Spaß gemacht. Ich fand die Liederauswahl gut, aber teilweise wurden die einzelnen Leider zu wenig geübt und auch die allgemeine Probenzeit fand ich etwas zu kurz, aber allgemein war es sehr schön und auch die Übernachtung hat mir viel Spaß gemacht.'),
(10, 5, '93.214.52.192', 'ud9hv6834e2663hcimsv052rh8', 'Man hätte mehr und früher Werbung machen können für das Konzert ☺️\r\nSonst war alles sehr schön und hat sehr viel Spaß gemacht ❤️ Danke !! \r\n'),
(11, 5, '5.146.192.134', 'bus41jabeiq3l4ura4fkbnp9c3', 'Es war MEGA!!!! Alle die nicht dabei waren haben echt was verpasst'),
(12, 5, '93.214.52.192', 'et28qh90lc7knh1063tvth7ei4', 'Hi, war eine echt coole Aktion und hat voll Spaß gemacht:) \r\nDie Musikwahl und die Geschichte waren auch mal was Neues und haben zu der Jugend gepasst.\r\nNoch etwas mehr Werbung wär glaub ich sinnvoll.'),
(13, 5, '91.38.255.78', '1qdjt33lvpu1macujkph82dv97', 'Das Krippenspiel war unnötig und ein bisschen albern. \r\nFür so wenig Probe waren es gute und machbare Lieder. \r\nHat Spaß gemacht!'),
(14, 5, '46.91.133.100', 'ufh541ted2s4bnlvdug3n2v42e', 'Ich fand die Probezeit genau richtig, da es nicht anstrengend wurde, aber wir dennoch alles geübt haben '),
(15, 5, '78.43.127.40', 'h3rvco6m82pafl7400fi4s8s4h', 'Ein Riesen Lob an das Ju&Mi Team, dass Wochenende war einfach der Hammer und es hat alles soo viel Spaß gemacht.\r\nIch würde mir wünschen, dass in Zukunft mit mehr Vorlauf geplant wird, die Termine frühzeitig bekannt sind und eingeplant werden können. Sodass noch mehr Jugendliche Zeit haben und mitmachen können.'),
(16, 5, '77.181.111.226', '87k70i60k4le20nf0cns1i48so', 'Alle Unsicherheiten vorne weg, wurden durch ein wunderschönes Wochenende und einem sehr stimmungsvollem Konzert aufgewogen. Hat richtig viel Spaß gemacht!'),
(17, 5, '5.146.193.151', '47hjjpq5ksr0nhnjl209o9sg7r', '- es war alles ausreichend da!\r\n- coole Idee mit Film, übernachten, Konzert, Weihnachtspulli\r\n- viel Gemeinschaft\r\n- neue und alte Musik\r\n- passender „Rahmen“\r\n- tolle Band \r\n- stimmungsvoller Weihnachtsmarkt\r\n- mega Technik!\r\n\r\n\r\n- schade, dass Jugendliche zu- aber nicht angesagt haben \r\n- zu wenig Zuschauer '),
(18, 5, '79.198.15.8', 'nrd68n3j1p5gf11ts4575pfu6t', 'Zu wenige Übernachter! Zu wenig Abbauer! Stimmung, Konzert, Zusammenhalt, -MEGA!!!!!');

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
(9, 4, 'Fandest du dich im Vorfeld zu JU & MI gut informiert?', '0'),
(10, 4, 'Wie hat dir die Musikauswahl gefallen?', '0'),
(11, 4, 'Welche Aktionen haben dir besonders gut gefallen', '1'),
(12, 4, 'Wie empfandest du die Gesamtorganisation des Kick-Off Wochenendes?', '0'),
(13, 5, 'Wie fandest du die Musikauswahl? (Schulnoten)', '0'),
(14, 5, 'Wie fandest du die Orga (Schulnoten)', '0');

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
-- Indizes für die Tabelle `jumi_mailverteiler`
--
ALTER TABLE `jumi_mailverteiler`
  ADD PRIMARY KEY (`mvid`);

--
-- Indizes für die Tabelle `jumi_mailverteiler_entries`
--
ALTER TABLE `jumi_mailverteiler_entries`
  ADD PRIMARY KEY (`mveid`);

--
-- Indizes für die Tabelle `jumi_mailverteiler_user_zuord`
--
ALTER TABLE `jumi_mailverteiler_user_zuord`
  ADD PRIMARY KEY (`mvzid`);

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
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `jumi_adminlog`
--
ALTER TABLE `jumi_adminlog`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rolle`
--
ALTER TABLE `jumi_admin_rolle`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_rechte_zuord`
--
ALTER TABLE `jumi_admin_rollen_rechte_zuord`
  MODIFY `roreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_user_zuord`
--
ALTER TABLE `jumi_admin_rollen_user_zuord`
  MODIFY `rozuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger`
--
ALTER TABLE `jumi_chor_saenger`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger_uploads`
--
ALTER TABLE `jumi_chor_saenger_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `jumi_finanzen`
--
ALTER TABLE `jumi_finanzen`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT für Tabelle `jumi_finanzen_uploads`
--
ALTER TABLE `jumi_finanzen_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT für Tabelle `jumi_mailverteiler`
--
ALTER TABLE `jumi_mailverteiler`
  MODIFY `mvid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `jumi_mailverteiler_entries`
--
ALTER TABLE `jumi_mailverteiler_entries`
  MODIFY `mveid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `jumi_mailverteiler_user_zuord`
--
ALTER TABLE `jumi_mailverteiler_user_zuord`
  MODIFY `mvzid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_entries`
--
ALTER TABLE `jumi_menu_entries`
  MODIFY `meid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_headline`
--
ALTER TABLE `jumi_menu_headline`
  MODIFY `mhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_daten`
--
ALTER TABLE `jumi_noten_daten`
  MODIFY `jndid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_uploads`
--
ALTER TABLE `jumi_noten_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_verlag`
--
ALTER TABLE `jumi_noten_verlag`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung`
--
ALTER TABLE `jumi_noten_zusammenstellung`
  MODIFY `zsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung_zuord`
--
ALTER TABLE `jumi_noten_zusammenstellung_zuord`
  MODIFY `zsnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zus_saenger_zuord`
--
ALTER TABLE `jumi_noten_zus_saenger_zuord`
  MODIFY `zszid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_securitytokens`
--
ALTER TABLE `jumi_securitytokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen`
--
ALTER TABLE `jumi_umfragen`
  MODIFY `umid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_antworten`
--
ALTER TABLE `jumi_umfragen_antworten`
  MODIFY `uaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ende`
--
ALTER TABLE `jumi_umfragen_ende`
  MODIFY `uenid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ergebnisse`
--
ALTER TABLE `jumi_umfragen_ergebnisse`
  MODIFY `ueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_erg_freitext`
--
ALTER TABLE `jumi_umfragen_erg_freitext`
  MODIFY `uefid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_fragen`
--
ALTER TABLE `jumi_umfragen_fragen`
  MODIFY `ufid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
