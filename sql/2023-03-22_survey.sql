-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 22. Mrz 2023 um 17:05
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
  `vorname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nachname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `passwort` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
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
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
(8, '2023-03-22 16:59:27', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/109.0', 1);

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
(1, 'Mailadressen Ansprechpartner', 'info@ju-and-mi.de', 1),
(2, 'Warnung, wenn Anzahl der Haushalte Pro Gottesdienst überschritten wird', '50', 2),
(3, 'Automatischer Registrierungsstopp in Std. vor einem GD', '16', 4),
(4, 'Sperrung, wenn Anzahl der Haushalte Pro Gottesdienst überschritten wird ', '52', 3),
(5, 'Empfängermailadressen der Gottesdienstteilnehmer', 'service@nak-btb.de, joerg.keefer@gmx.de, steffen-kai.schober@schober-logistik.de, busch.rainer@gmx.de, Flip199@web.de, juergen.sellmaier@web.de', 5),
(6, 'Mehrfachbelegung versch. Familien zulassen (0 nein | 1 ja)', '1', 6);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `jumi_umfragen`
--

INSERT INTO `jumi_umfragen` (`umid`, `datum_von`, `datum_bis`, `headline`, `freitext`, `uid`, `datum_erfasst`) VALUES
(1, '2023-03-21 00:00:00', '2023-03-22 00:00:00', 'Jugendchor am 17.03.2023', '1', 1, '2023-03-21 08:37:07'),
(2, '2023-03-27 00:00:00', '2023-03-28 00:00:00', 'Umfrage zur Singstunde', '1', 0, '2023-03-22 14:46:09'),
(3, '2023-03-31 00:00:00', '2023-04-01 00:00:00', 'Umfrage zur Singstunde gestern', '1', 1, '2023-03-22 14:56:42'),
(4, '2023-03-31 00:00:00', '2023-04-01 00:00:00', 'Umfrage zur Singstunde gestern', '1', 1, '2023-03-22 15:24:03'),
(5, '2023-03-22 00:00:00', '2023-03-23 00:00:00', 'Umfrage zur Singstunde am Freitag', '1', 1, '2023-03-22 15:24:53');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_antworten`
--

CREATE TABLE `jumi_umfragen_antworten` (
  `uaid` int(11) NOT NULL,
  `ufid` int(11) NOT NULL,
  `antwort` varchar(250) NOT NULL,
  `userorder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `jumi_umfragen_antworten`
--

INSERT INTO `jumi_umfragen_antworten` (`uaid`, `ufid`, `antwort`, `userorder`) VALUES
(1, 1, 'gut', 1),
(2, 1, 'mega', 0),
(3, 1, 'mäßig', 2),
(4, 1, 'schlecht', 3),
(5, 1, 'widerlich', 4),
(6, 1, 'asdf', 0),
(7, 2, 'Freitag', 1),
(8, 2, 'Samstag', 2),
(9, 2, 'Sonntag', 3),
(10, 2, 'Dienstag', 0),
(11, 3, 'ja', 0),
(12, 3, 'nein', 0),
(13, 4, 'ja', 0),
(14, 4, 'nein', 0),
(15, 4, 'keine Meinung', 0),
(17, 5, 'mega', 0),
(18, 5, 'schlecht', 0),
(19, 6, '1', 0),
(20, 6, '2', 1),
(21, 6, '3', 2),
(22, 5, 'geht so', 0),
(28, 8, '1234', 0),
(29, 8, '12', 1);

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
(1, 1, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', '1'),
(2, 1, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', '1'),
(7, 1, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', '1'),
(8, 1, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', '1'),
(9, 1, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', '1');

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
(1, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 1, 5),
(2, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 2, 7),
(3, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 2, 9),
(4, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 2, 10),
(5, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 3, 12),
(6, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 4, 13),
(7, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 1, 5),
(8, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 2, 7),
(9, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 2, 8),
(10, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 3, 11),
(11, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 4, 15),
(43, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 1, 5),
(44, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 2, 7),
(45, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 2, 9),
(46, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 3, 11),
(47, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 4, 13),
(48, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', 1, 5),
(49, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', 2, 10),
(50, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', 3, 11),
(51, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', 4, 13),
(55, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', 1, 5),
(56, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', 2, 8),
(57, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', 2, 9),
(58, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', 3, 11),
(59, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', 4, 15);

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
(1, 1, '127.0.0.1', 'sdha59d369vn72hj48chj81ddg', 'Vielen Dank, hat wirklich Spaß gemacht'),
(2, 1, '93.235.5.44', '5facsea9o6djs2e72ada2did5g', 'Erster Online Test'),
(4, 1, '93.235.5.44', '6blot3vph8rl8n534492bosjk3', 'Hat Spaß gemacht 😘😘'),
(5, 1, '93.235.5.44', '1uqd6oshnd9krglfqt3b9natgj', 'Freu mich aufs nächste Mal'),
(6, 1, '80.187.97.213', 's8m4bq6q5h57vtncduhjs6shkc', '👍🏽');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `jumi_umfragen_fragen`
--

CREATE TABLE `jumi_umfragen_fragen` (
  `ufid` int(11) NOT NULL,
  `umid` int(11) NOT NULL,
  `frage` varchar(255) NOT NULL,
  `multiple` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=Einfachantwort,1=Mehrfachantworten '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `jumi_umfragen_fragen`
--

INSERT INTO `jumi_umfragen_fragen` (`ufid`, `umid`, `frage`, `multiple`) VALUES
(1, 1, 'Wie fandet ihr das Lied \"Dona nobis Pacem\"?', '0'),
(2, 1, 'An welchem Wochentag würdet ihr gerne proben?', '1'),
(3, 1, 'Ging die Singstunde zu lange', '0'),
(4, 1, 'War der Standort Beutelsbach in Ordnung', '0'),
(5, 2, 'Wie gefällt euch das Lied \"Wo zwei oder drei\"?', '0'),
(6, 3, 'Wie viele Sterne würdet ihr für die Singstunde vergeben?', '0'),
(8, 5, 'Wie fandet ihr \"Wo 2 oder 3\"?', '0');

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
  MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `jumi_parameter`
--
ALTER TABLE `jumi_parameter`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen`
--
ALTER TABLE `jumi_umfragen`
  MODIFY `umid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_antworten`
--
ALTER TABLE `jumi_umfragen_antworten`
  MODIFY `uaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ende`
--
ALTER TABLE `jumi_umfragen_ende`
  MODIFY `uenid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `jumi_umfragen_ergebnisse`
--
ALTER TABLE `jumi_umfragen_ergebnisse`
  MODIFY `ueid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

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
