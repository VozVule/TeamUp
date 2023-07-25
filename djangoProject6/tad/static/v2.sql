-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 17, 2023 at 02:44 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `v2`
--
CREATE DATABASE IF NOT EXISTS `v2` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `v2`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `IdAdmin` int NOT NULL,
  PRIMARY KEY (`IdAdmin`),
  KEY `IdAdmin` (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`IdAdmin`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

DROP TABLE IF EXISTS `korisnik`;
CREATE TABLE IF NOT EXISTS `korisnik` (
  `IdKor` int NOT NULL,
  `Nivo` int NOT NULL,
  PRIMARY KEY (`IdKor`),
  KEY `IdKor` (`IdKor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`IdKor`, `Nivo`) VALUES
(2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `ocena`
--

DROP TABLE IF EXISTS `ocena`;
CREATE TABLE IF NOT EXISTS `ocena` (
  `IdOcena` int NOT NULL AUTO_INCREMENT,
  `IdKor` int NOT NULL,
  `ocena` int NOT NULL,
  PRIMARY KEY (`IdOcena`),
  KEY `IdKor` (`IdKor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oglas`
--

DROP TABLE IF EXISTS `oglas`;
CREATE TABLE IF NOT EXISTS `oglas` (
  `IdOglas` int NOT NULL AUTO_INCREMENT,
  `Sport` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `vreme` time NOT NULL,
  `datum` date NOT NULL,
  `BrIgraca` int NOT NULL,
  `Lokacija` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Gotov` int NOT NULL,
  `IdOrg` int NOT NULL,
  PRIMARY KEY (`IdOglas`),
  KEY `IdOrg` (`IdOrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `oglas`(`IdOglas`, `Sport`, `vreme`, `datum`, `BrIgraca`, `Lokacija`, `Gotov`, `IdOrg`)  VALUES 
(1,'Fudbal','13:30:21','2023-04-15',2,'Atakante',0,3) ,
(2,'Basket','13:30:21','2023-04-15',5,'NeAtakante',0,3); 

-- --------------------------------------------------------

--
-- Table structure for table `organizator`
--

DROP TABLE IF EXISTS `organizator`;
CREATE TABLE IF NOT EXISTS `organizator` (
  `IdOrg` int NOT NULL,
  `JMBG` varchar(20) NOT NULL,
  PRIMARY KEY (`IdOrg`),
  UNIQUE KEY `JMBG` (`JMBG`),
  KEY `IdOrg` (`IdOrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `organizator`
--

INSERT INTO `organizator` (`IdOrg`, `JMBG`) VALUES
(3, '1111111111111');

-- --------------------------------------------------------

--
-- Table structure for table `prijave_organizatora`
--

DROP TABLE IF EXISTS `prijave_organizatora`;
CREATE TABLE IF NOT EXISTS `prijave_organizatora` (
  `IdPrijave` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Ime` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Prezime` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `datum` date NOT NULL,
  `pol` int NOT NULL,
  `JMBG` varchar(20) NOT NULL,
  PRIMARY KEY (`IdPrijave`),
  UNIQUE KEY `mail` (`mail`),
  UNIQUE KEY `JMBG` (`JMBG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prijave_za_oglas`
--

DROP TABLE IF EXISTS `prijave_za_oglas`;
CREATE TABLE IF NOT EXISTS `prijave_za_oglas` (
  `IdP` int NOT NULL AUTO_INCREMENT,
  `IdKor` int NOT NULL,
  `status` int NOT NULL,
  `IdOglas` int NOT NULL,
  PRIMARY KEY (`IdP`),
  KEY `IdOglas` (`IdOglas`),
  KEY `IdKor` (`IdKor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;



-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `IdUser` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Ime` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `Prezime` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `datum` date NOT NULL,
  `pol` varchar(1) NOT NULL,
  UNIQUE KEY `mail` (`mail`),
  PRIMARY KEY (`IdUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`IdUser`, `mail`, `Ime`, `Prezime`,`password`, `telefon`, `datum`, `pol`) VALUES
(1, 'bbb@gmail.com', 'Rke', 'Koke','Aabc123', '063333333', '2023-04-26', 'M'),
(2, 'rrr@gmail.com', 'DASJDKASLKd', 'AFASFASF','Aabc1234', '062222222', '2023-04-15', 'M'),
(3, 'aaa@gmail.com', 'Gde', 'Si','Aabc12345', '061111111', '2023-04-15', 'M'),
(4, 'sssssssss@gmail.com', 'aaa', 'bbb','Aabc123456', '065555555', '2023-04-15', 'M');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `akcija_1` FOREIGN KEY (`IdAdmin`) REFERENCES `user` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `akcija_3` FOREIGN KEY (`IdKor`) REFERENCES `user` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ocena`
--
ALTER TABLE `ocena`
  ADD CONSTRAINT `akcija_4` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `oglas`
--
ALTER TABLE `oglas`
  ADD CONSTRAINT `akcija_5` FOREIGN KEY (`IdOrg`) REFERENCES `organizator` (`IdOrg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `organizator`
--
ALTER TABLE `organizator`
  ADD CONSTRAINT `akcija_2` FOREIGN KEY (`IdOrg`) REFERENCES `user` (`IdUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `prijave_za_oglas`
--
ALTER TABLE `prijave_za_oglas`
  ADD CONSTRAINT `akcija_9` FOREIGN KEY (`IdOglas`) REFERENCES `oglas` (`IdOglas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `akcija_6` FOREIGN KEY (`IdKor`) REFERENCES `korisnik` (`IdKor`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
