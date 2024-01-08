-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 23. Mrz 2023 um 14:31
-- Server-Version: 10.4.27-MariaDB
-- PHP-Version: 8.0.25

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
  `vorname` varchar(20) NOT NULL DEFAULT '',
  `nachname` varchar(20) NOT NULL DEFAULT '',
  `mail` varchar(100) NOT NULL,
  `passwort` varchar(32) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Benutzer';

--
-- Daten für Tabelle `jumi_admin`
--

INSERT INTO `jumi_admin` (`uid`, `vorname`, `nachname`, `mail`, `passwort`) VALUES
(1, 'Alexander', 'Schwarz', 'ali@ju-and-mi.de', 'f5df16d9bd60b0894064b5777139de79'),
(2, 'Anica', 'Müller', 'anica@ju-and-mi.de', 'e92adb8d4d6f37703623244fd5bb2e85');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logins der Anwender';

--
-- Daten für Tabelle `jumi_adminlog`
--

INSERT INTO `jumi_adminlog` (`lid`, `Datum`, `IP`, `user_agent`, `uid`) VALUES
(1, '2023-03-22 16:16:35', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 0),
(2, '2023-03-22 16:18:23', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(3, '2023-03-22 16:23:28', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(4, '2023-03-22 16:23:38', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(5, '2023-03-22 16:41:27', '::1', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 1),
(6, '2023-03-22 16:45:14', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1),
(7, '2023-03-22 16:45:56', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 2),
(8, '2023-03-22 16:59:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1),
(9, '2023-03-23 07:11:29', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1),
(10, '2023-03-23 10:17:39', '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 1),
(11, '2023-03-23 13:57:28', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/111.0', 1);

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
(1, 'Mailadressen Ansprechpartner', '', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen`
--

CREATE TABLE `jumi_umfragen` (
  `umid` int(11) NOT NULL,
  `datum_von` datetime NOT NULL,
  `datum_bis` datetime NOT NULL,
  `headline` varchar(255) NOT NULL,
  `freitext` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Kein Frextextfeld;1=Freitextfeld',
  `uid` int(11) NOT NULL,
  `datum_erfasst` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen`
--

INSERT INTO `jumi_umfragen` (`umid`, `datum_von`, `datum_bis`, `headline`, `freitext`, `uid`, `datum_erfasst`) VALUES
(5, '2023-03-23 00:00:00', '2023-04-07 00:00:00', 'Fragen zum Konzert', '1', 1, '2023-03-23 13:25:29');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_antworten`
--

CREATE TABLE `jumi_umfragen_antworten` (
  `uaid` int(11) NOT NULL,
  `ufid` int(11) NOT NULL,
  `antwort` varchar(250) NOT NULL,
  `userorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_antworten`
--

INSERT INTO `jumi_umfragen_antworten` (`uaid`, `ufid`, `antwort`, `userorder`) VALUES
(22, 7, 'jeder selbst', 0),
(23, 7, 'Gemeinsam mit der Bahn', 0),
(24, 7, 'Brauche Abholer', 0),
(25, 8, 'Sonntag', 0),
(26, 8, 'Freitag', 0),
(27, 8, 'Samstag', 0);

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
(3, 5, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', '1');

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
(4, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', 7, 22),
(5, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', 8, 25),
(6, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', 8, 26),
(7, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', 8, 27);

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
(3, 5, '127.0.0.1', 'mhvvfj57p9kk4vsj7fh9hm8hej', 'Danke');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_fragen`
--

CREATE TABLE `jumi_umfragen_fragen` (
  `ufid` int(11) NOT NULL,
  `umid` int(11) NOT NULL,
  `frage` varchar(255) NOT NULL,
  `multiple` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Einfachantwort,1=Mehrfachantworten '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Daten für Tabelle `jumi_umfragen_fragen`
--

INSERT INTO `jumi_umfragen_fragen` (`ufid`, `umid`, `frage`, `multiple`) VALUES
(7, 5, 'Wie kommen wir nach Stuttgart-Ost', '0'),
(8, 5, 'Welcher Probentag passt bei euch?', '1');

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
-- Indizes für die Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  ADD PRIMARY KEY (`pid`);

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
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `jumi_adminlog`
--
ALTER TABLE `jumi_adminlog`
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen`
--
ALTER TABLE `jumi_umfragen`
  MODIFY `umid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_antworten`
--
ALTER TABLE `jumi_umfragen_antworten`
  MODIFY `uaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ende`
--
ALTER TABLE `jumi_umfragen_ende`
  MODIFY `uenid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ergebnisse`
--
ALTER TABLE `jumi_umfragen_ergebnisse`
  MODIFY `ueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_erg_freitext`
--
ALTER TABLE `jumi_umfragen_erg_freitext`
  MODIFY `uefid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_fragen`
--
ALTER TABLE `jumi_umfragen_fragen`
  MODIFY `ufid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
