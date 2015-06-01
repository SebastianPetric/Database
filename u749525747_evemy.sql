
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 01. Jun 2015 um 10:38
-- Server Version: 5.1.66
-- PHP-Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `u749525747_evemy`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event`
--

CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `owner` int(200) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `event`
--

INSERT INTO `event` (`event_id`, `name`, `location`, `date`, `owner`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Petric kommt mal nach Freiburg feiern', 'Freiburg', '3915-05-19', 10, 1, '2015-05-19 19:15:42', '0000-00-00 00:00:00'),
(6, 'Geburtstag Markus', 'Stadthalle Balingen', '3915-10-22', 9, 1, '2015-06-01 08:56:36', '0000-00-00 00:00:00'),
(5, 'Konzert', 'Jugendhaus Weingarten', '3915-05-20', 9, 1, '2015-05-26 13:22:07', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_history`
--

CREATE TABLE IF NOT EXISTS `event_history` (
  `event_history_id` int(200) NOT NULL AUTO_INCREMENT,
  `event_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `comment` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`event_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `event_history`
--

INSERT INTO `event_history` (`event_history_id`, `event_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(8, 5, 9, 'hat das Datum des Events von "01.01.70" auf "20.05.2015" geändert.', '2015-05-26 13:27:35', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `event_user`
--

CREATE TABLE IF NOT EXISTS `event_user` (
  `user_id` int(200) NOT NULL,
  `event_id` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `event_user`
--

INSERT INTO `event_user` (`user_id`, `event_id`, `created_at`, `updated_at`) VALUES
(10, 3, '2015-05-19 19:15:42', '0000-00-00 00:00:00'),
(9, 5, '2015-05-26 13:22:07', '0000-00-00 00:00:00'),
(9, 6, '2015-06-01 08:56:36', '0000-00-00 00:00:00'),
(10, 5, '2015-05-26 13:22:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `user_a` int(200) NOT NULL,
  `user_b` int(200) NOT NULL,
  `status` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `friends`
--

INSERT INTO `friends` (`user_a`, `user_b`, `status`, `created_at`, `updated_at`) VALUES
(8, 7, 2, '2015-05-15 10:21:32', '0000-00-00 00:00:00'),
(10, 9, 2, '2015-05-19 18:08:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `task_id` int(200) NOT NULL AUTO_INCREMENT,
  `event_id` int(200) NOT NULL,
  `task` varchar(100) NOT NULL,
  `quantity` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `percentage` double NOT NULL,
  `editor_id` int(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`task_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Daten für Tabelle `task`
--

INSERT INTO `task` (`task_id`, `event_id`, `task`, `quantity`, `cost`, `percentage`, `editor_id`, `created_at`, `updated_at`) VALUES
(8, 5, 'Mikrofon', '2 Stueck', 23, 50, 9, '2015-05-26 13:25:18', '0000-00-00 00:00:00'),
(7, 5, 'Bier', '2 Kaesten', 0, 0, 10, '2015-05-26 13:24:31', '0000-00-00 00:00:00'),
(6, 3, 'Petric schaut wann er kann und ändert den Termin dem entsprechend', '', 0, 0, -1, '2015-05-19 19:22:42', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `task_history`
--

CREATE TABLE IF NOT EXISTS `task_history` (
  `task_history_id` int(200) NOT NULL AUTO_INCREMENT,
  `task_id` int(200) NOT NULL,
  `user_id` int(200) NOT NULL,
  `comment` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`task_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Daten für Tabelle `task_history`
--

INSERT INTO `task_history` (`task_history_id`, `task_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(9, 8, 9, 'Von Gibson wenn moeglich!', '2015-05-26 13:25:18', '0000-00-00 00:00:00'),
(8, 7, 9, 'Bitte kein Becks!', '2015-05-26 13:24:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(200) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `prename` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`user_id`, `name`, `prename`, `email`, `password`, `created_at`, `updated_at`) VALUES
(10, 'Marvin', 'Franz', 'marvin.franz92@gmail.com', '0cd0a11ff1eacc0a8b5a6ccf49f8d040', '2015-05-19 18:05:24', '0000-00-00 00:00:00'),
(9, 'Petoecz', 'Sebastian', 'sebastian.petoecz@gmail.com', '19a2a3132ec59a11abd3e0a49513b47d', '2015-05-19 17:58:03', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
