-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Apr 2023 um 16:35
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `survey`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin`
--

CREATE TABLE `jumi_admin` (
  `uid` int(11) NOT NULL,
  `vorname` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `nachname` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `mail` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `passwort` varchar(32) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `passwortcode` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Passwort vergessen',
  `passwortcode_time` timestamp NULL DEFAULT NULL COMMENT 'Passwort vergessen',
  `aktiv` enum('0','1') COLLATE utf8mb4_bin NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Benutzer';

--
-- Daten für Tabelle `jumi_admin`
--

INSERT INTO `jumi_admin` (`uid`, `vorname`, `nachname`, `mail`, `passwort`, `passwortcode`, `passwortcode_time`, `aktiv`) VALUES
(1, 'Alexander', 'Schwarz', 'ali@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', NULL, NULL, '1'),
(2, 'Jeannette', 'Schwarz', 'jeannette@ju-and-mi.de', '31f1aef382261ee0df1fe1ba218f1ec1', NULL, NULL, '1'),
(3, 'Nadine', 'Schubert', 'nadine@ju-and-mi.de', '507e1f06de7db173ea9c3c41f7ff8d33', NULL, NULL, '1'),
(4, 'Björn', 'Idler', 'bjoern@ju-and-mi.de', 'c4308bb58d24e4feafa4300c18ddd2e8', NULL, NULL, '1'),
(5, 'Anica', 'Müller', 'anica@ju-and-mi.de', 'f073d3cb403aa5f7c3dd4ed49de33f64', NULL, NULL, '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_adminlog`
--

CREATE TABLE `jumi_adminlog` (
  `lid` int(11) NOT NULL,
  `Datum` datetime NOT NULL,
  `IP` varchar(15) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8mb4_bin NOT NULL,
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
(83, '2023-04-04 11:31:50', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_admin_rolle`
--

CREATE TABLE `jumi_admin_rolle` (
  `rid` int(11) NOT NULL,
  `bezeichnung` varchar(200) COLLATE utf8mb4_bin NOT NULL
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
(20, 1, 15);

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
(5, 1, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_chor_saenger`
--

CREATE TABLE `jumi_chor_saenger` (
  `csid` int(11) NOT NULL,
  `vorname` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `nachname` varchar(200) COLLATE utf8mb4_bin NOT NULL,
  `mail` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `singstimme` int(1) NOT NULL COMMENT '1=Sopran,2=Alt,3=Tenor,4=Bass',
  `bemerkung` text COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_chor_saenger`
--

INSERT INTO `jumi_chor_saenger` (`csid`, `vorname`, `nachname`, `mail`, `singstimme`, `bemerkung`) VALUES
(2, 'Nele', 'Müller', 'netblack@gmx.de', 2, '<p>asdf</p>');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_chor_saenger_uploads`
--

CREATE TABLE `jumi_chor_saenger_uploads` (
  `id` int(11) NOT NULL,
  `csid` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `originalname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_chor_saenger_uploads`
--

INSERT INTO `jumi_chor_saenger_uploads` (`id`, `csid`, `filename`, `originalname`, `uid`, `datum`) VALUES
(1, 2, '../media/file_upload/member/20230404_130259_20230321_Serveruebersicht_Physisch_und_Virtuell_PTLS.xlsx', '20230321 Serverübersicht Physisch und Virtuell_PTLS.xlsx', 1, '2023-04-04 13:02:59'),
(2, 2, '../media/file_upload/member/20230404_130301_Nebentaetigkeit_Jaehresmeldung.pdf', 'Nebentätigkeit Jähresmeldung.pdf', 1, '2023-04-04 13:03:01');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_menu_entries`
--

CREATE TABLE `jumi_menu_entries` (
  `meid` int(11) NOT NULL,
  `headline` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `link` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `mhid` int(11) NOT NULL COMMENT 'Headline',
  `fontawesome` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `sup` int(11) NOT NULL COMMENT 'Übergeordnete Menüpunkt'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_menu_entries`
--

INSERT INTO `jumi_menu_entries` (`meid`, `headline`, `link`, `mhid`, `fontawesome`, `sup`) VALUES
(1, 'Home', 'index.php', 1, 'fas fa-house', 1),
(2, 'Erstellen', 'survey_erfassen.php', 2, 'fas fa-pie-chart', 2),
(3, 'Bearbeiten', 'survey_edit.php', 2, 'fas fa-edit', 3),
(4, 'Systemparameter', 'parameter.php', 3, 'fas fa-cog', 4),
(5, 'Benutzerverwaltung', '#', 3, 'fas fa-user', 5),
(6, 'Benutzer erstellen', 'create_user.php', 3, '', 5),
(7, 'Benutzer bearbeiten', 'edit_user.php', 3, '', 5),
(8, 'Rollen / Rechte', 'rollen.php', 3, '', 5),
(9, 'Noten', '#', 4, 'fa fa-upload', 9),
(10, 'Notenupload', 'notenupload.php', 4, '', 9),
(11, 'Chor', '#', 4, 'fa-solid fa-music', 11),
(12, 'Erfassung', 'create_member.php', 4, '', 11),
(13, 'Bearbeiten', 'edit_member.php', 4, '', 11),
(14, 'Bearbeiten', 'edit_noten.php', 4, '', 9),
(15, 'Notenbuch', 'notenbuch.php', 4, '', 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_menu_headline`
--

CREATE TABLE `jumi_menu_headline` (
  `mhid` int(11) NOT NULL,
  `headline` varchar(250) COLLATE utf8mb4_bin NOT NULL,
  `visible` enum('0','1') COLLATE utf8mb4_bin NOT NULL DEFAULT '1' COMMENT '0=unsichbar;1=sichtbar'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_menu_headline`
--

INSERT INTO `jumi_menu_headline` (`mhid`, `headline`, `visible`) VALUES
(1, 'Top', '0'),
(2, 'Umfrage', '1'),
(3, 'Administration', '1'),
(4, 'Verwaltung', '1');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_daten`
--

CREATE TABLE `jumi_noten_daten` (
  `jndid` int(11) NOT NULL,
  `titel` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `vid` int(11) NOT NULL,
  `sbid` int(11) NOT NULL,
  `anz_lizenzen` int(11) NOT NULL,
  `streamlizenz` enum('0','1') COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_daten`
--

INSERT INTO `jumi_noten_daten` (`jndid`, `titel`, `vid`, `sbid`, `anz_lizenzen`, `streamlizenz`, `uid`, `datum`) VALUES
(2, 'Heimat, heimat glanzumflossen', 3, 4, 20, '1', 1, '2023-04-04 16:07:17');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_songbook`
--

CREATE TABLE `jumi_noten_songbook` (
  `sbid` int(11) NOT NULL,
  `bezeichnung` varchar(255) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_songbook`
--

INSERT INTO `jumi_noten_songbook` (`sbid`, `bezeichnung`) VALUES
(4, 'Chorbuch');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_uploads`
--

CREATE TABLE `jumi_noten_uploads` (
  `id` int(11) NOT NULL,
  `jndid` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `originalname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_uploads`
--

INSERT INTO `jumi_noten_uploads` (`id`, `jndid`, `filename`, `originalname`, `uid`, `datum`) VALUES
(5, 2, '../media/file_upload/noten/20230404_160717_Nebentaetigkeit_Jaehresmeldung.pdf', 'Nebentätigkeit Jähresmeldung.pdf', 1, '2023-04-04 16:07:17'),
(6, 2, '../media/file_upload/noten/20230404_160719_Uebersicht_Datenbanken_C7000.pptx', 'Uebersicht Datenbanken C7000.pptx', 1, '2023-04-04 16:07:19');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_noten_verlag`
--

CREATE TABLE `jumi_noten_verlag` (
  `vid` int(11) NOT NULL,
  `bezeichnung` varchar(255) COLLATE utf8mb4_bin NOT NULL
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
  `bezeichnung` varchar(200) COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Daten für Tabelle `jumi_noten_zusammenstellung`
--

INSERT INTO `jumi_noten_zusammenstellung` (`zsid`, `bezeichnung`) VALUES
(1, 'Notenbuch JU & MI');

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
(7, 2, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_parameter`
--

CREATE TABLE `jumi_parameter` (
  `pid` int(11) NOT NULL,
  `beschreibung` varchar(250) NOT NULL,
  `wert` varchar(250) NOT NULL,
  `sort` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `securitytoken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `jumi_securitytokens`
--

INSERT INTO `jumi_securitytokens` (`id`, `uid`, `identifier`, `securitytoken`, `created_at`) VALUES
(2, 1, '5eff76410d548f759aa073551999a8af', '385eea6bacd849b58d97ecc31f610a5571754470', '2023-03-30 08:45:43'),
(4, 1, 'e9e4b3708da92db2c26c63ed3a915979', '5843001abab217bef6f0993b11532b4d6307da15', '2023-03-30 15:06:02'),
(5, 1, '6d77a079ab6bce8c51bc94e24a9a1c33', '68a7bdb644e58e252b2163d0870a03e5917e6e5e', '2023-03-31 11:24:37'),
(6, 1, '76c6bd2bed1fc1f0e19889eee9108c4e', 'da6daca0bb914fed390ee471145493fcbda7a5a8', '2023-03-31 11:54:25'),
(7, 1, '8bd5bf8daa9727befb9b2536de59eada', '1b3a9cc7b6ba703be48e036bc9e1efa7585367e9', '2023-03-31 14:57:47'),
(8, 1, '095ee0ddd4bdd740852d37effc6e630e', '0a3eae920e5ebb4ffde629803f8a8d749fdb3247', '2023-04-01 08:09:45'),
(9, 1, 'ff4efdb0b7f6f0a999a96ba75cb12e08', '4315e11f1b63dadfad346a87ca14c8abc12aebf8', '2023-04-01 08:11:48'),
(10, 1, 'bb3addec338ca0ca7562df8fbae931a3', '32a6448baf44679e1389b6505726ab9ac05bfa5f', '2023-04-03 12:44:51'),
(11, 1, '022d32941170b3f9639b8ebe0df280f4', '93500ad9d1f9768867484968a06bbb52bc305705', '2023-04-04 05:18:57'),
(12, 1, 'b4f6accd2eb77a751817e39ac3fdc18f', '975fddf7ea79dcca8ac5dafea96f3006b3d97e44', '2023-04-04 09:31:50');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `ip` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `session` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `freitext` text COLLATE utf8mb4_bin NOT NULL
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Indizes für die Tabelle `jumi_noten_songbook`
--
ALTER TABLE `jumi_noten_songbook`
  ADD PRIMARY KEY (`sbid`);

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
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rolle`
--
ALTER TABLE `jumi_admin_rolle`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_rechte_zuord`
--
ALTER TABLE `jumi_admin_rollen_rechte_zuord`
  MODIFY `roreid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `jumi_admin_rollen_user_zuord`
--
ALTER TABLE `jumi_admin_rollen_user_zuord`
  MODIFY `rozuid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger`
--
ALTER TABLE `jumi_chor_saenger`
  MODIFY `csid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `jumi_chor_saenger_uploads`
--
ALTER TABLE `jumi_chor_saenger_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_entries`
--
ALTER TABLE `jumi_menu_entries`
  MODIFY `meid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT für Tabelle `jumi_menu_headline`
--
ALTER TABLE `jumi_menu_headline`
  MODIFY `mhid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_daten`
--
ALTER TABLE `jumi_noten_daten`
  MODIFY `jndid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_songbook`
--
ALTER TABLE `jumi_noten_songbook`
  MODIFY `sbid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_uploads`
--
ALTER TABLE `jumi_noten_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_verlag`
--
ALTER TABLE `jumi_noten_verlag`
  MODIFY `vid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung`
--
ALTER TABLE `jumi_noten_zusammenstellung`
  MODIFY `zsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_zusammenstellung_zuord`
--
ALTER TABLE `jumi_noten_zusammenstellung_zuord`
  MODIFY `zsnid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `jumi_securitytokens`
--
ALTER TABLE `jumi_securitytokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
