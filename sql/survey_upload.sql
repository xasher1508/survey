-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 31. Mrz 2023 um 13:10
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
-- Tabellenstruktur für Tabelle `jumi_noten_daten`
--

CREATE TABLE `jumi_noten_daten` (
  `jndid` int(11) NOT NULL,
  `titel` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `verlag` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `anz_lizenzen` int(11) NOT NULL,
  `streamlizenz` enum('0','1') COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL,
  `datum` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

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
-- Indizes der exportierten Tabellen
--

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
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_daten`
--
ALTER TABLE `jumi_noten_daten`
  MODIFY `jndid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `jumi_noten_uploads`
--
ALTER TABLE `jumi_noten_uploads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
