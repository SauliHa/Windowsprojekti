-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09.01.2017 klo 11:22
-- Palvelimen versio: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projektikanta`
--

-- --------------------------------------------------------

--
-- Rakenne taululle `asiakas`
--

CREATE TABLE IF NOT EXISTS `asiakas` (
  `asiakasnumero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nimi` varchar(60) NOT NULL,
  `lahiosoite` varchar(80) DEFAULT NULL,
  `postinumero` varchar(5) DEFAULT NULL,
  `postitoimipaikka` varchar(30) DEFAULT NULL,
  `puh` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`asiakasnumero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `asiakas`
--

INSERT INTO `asiakas` (`asiakasnumero`, `nimi`, `lahiosoite`, `postinumero`, `postitoimipaikka`, `puh`) VALUES
(1, 'Meikäläinen Matti', 'Kotikuja 5 c 7', '50100', 'Mikkeli', '050-123456'),
(2, 'Meikäläinen Maija', 'Kirkkokatu 15', '50100', 'Mikkeli', '050-454545'),
(3, 'Ahonen Aimo', 'Satamakatu 17 a 10', '52500', 'Kerava', '040-176543'),
(4, 'Öhman Taisto', 'Rantatie 10 b 3', '50600', 'Rauma', '044-222333');

-- --------------------------------------------------------

--
-- Rakenne taululle `tilaus`
--

CREATE TABLE IF NOT EXISTS `tilaus` (
  `tilausnumero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pvm` date NOT NULL,
  `asiakasnumero` int(10) unsigned DEFAULT NULL,
  `tuotenumero` int(10) unsigned DEFAULT NULL,
  `maara` int(11) DEFAULT NULL,
  PRIMARY KEY (`tilausnumero`),
  KEY `tilaus_pvm` (`pvm`),
  KEY `viiteeheys_asiakkaisiin` (`asiakasnumero`),
  KEY `viiteeheys_tuotteisiin` (`tuotenumero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Vedos taulusta `tilaus`
--

INSERT INTO `tilaus` (`tilausnumero`, `pvm`, `asiakasnumero`, `tuotenumero`, `maara`) VALUES
(1, '2010-10-05', 2, 1, 6),
(2, '2010-09-15', 1, 1, 8),
(3, '2010-09-18', 1, 2, 3),
(4, '2010-09-22', 1, 3, 2),
(5, '2010-10-01', 3, 2, 1),
(6, '2010-10-05', 3, 1, 3);

-- --------------------------------------------------------

--
-- Rakenne taululle `tuote`
--

CREATE TABLE IF NOT EXISTS `tuote` (
  `tuotenumero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tuote` varchar(60) NOT NULL,
  `hinta` decimal(10,2) DEFAULT NULL,
  `varasto` int(11) DEFAULT NULL,
  PRIMARY KEY (`tuotenumero`),
  KEY `tuotteet` (`tuote`,`hinta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Vedos taulusta `tuote`
--

INSERT INTO `tuote` (`tuotenumero`, `tuote`, `hinta`, `varasto`) VALUES
(1, 'Saha', '40.20', 15),
(2, 'Kirves', '130.50', 22),
(3, 'Potkukelkka', '420.00', 7),
(4, 'testi', '999.00', 222);

--
-- Rajoitteet vedostauluille
--

--
-- Rajoitteet taululle `tilaus`
--
ALTER TABLE `tilaus`
  ADD CONSTRAINT `viiteeheys_asiakkaisiin` FOREIGN KEY (`asiakasnumero`) REFERENCES `asiakas` (`asiakasnumero`),
  ADD CONSTRAINT `viiteeheys_tuotteisiin` FOREIGN KEY (`tuotenumero`) REFERENCES `tuote` (`tuotenumero`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
