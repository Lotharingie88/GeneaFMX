-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 30 déc. 2021 à 18:35
-- Version du serveur :  8.0.21
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `adn`
--
CREATE DATABASE IF NOT EXISTS `adn` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;
USE `adn`;

-- --------------------------------------------------------

--
-- Structure de la table `departement`
--

DROP TABLE IF EXISTS `departement`;
CREATE TABLE IF NOT EXISTS `departement` (
  `iddept` int NOT NULL AUTO_INCREMENT,
  `dept` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `prefecture` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`iddept`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `joursession`
--

DROP TABLE IF EXISTS `joursession`;
CREATE TABLE IF NOT EXISTS `joursession` (
  `idsession` varchar(40) COLLATE utf8mb4_bin NOT NULL,
  `iduser` int NOT NULL,
  `debsess` datetime NOT NULL,
  `finsess` datetime NOT NULL,
  `datdebjours` date NOT NULL,
  `datefinjours` date NOT NULL,
  UNIQUE KEY `idsession` (`idsession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

DROP TABLE IF EXISTS `pays`;
CREATE TABLE IF NOT EXISTS `pays` (
  `idnation` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `codinter` char(3) COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `idmonnaie` int DEFAULT NULL,
  UNIQUE KEY `idnation` (`idnation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin PACK_KEYS=0;

-- --------------------------------------------------------

--
-- Structure de la table `personnes`
--

DROP TABLE IF EXISTS `personnes`;
CREATE TABLE IF NOT EXISTS `personnes` (
  `idperson` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `datnaiss` date NOT NULL,
  `datdec` date NOT NULL DEFAULT '0000-00-00',
  `idper` int NOT NULL,
  `idmer` int NOT NULL,
  `datmaria` date NOT NULL DEFAULT '0000-00-00',
  `idepou` int NOT NULL,
  `datmarbis` date NOT NULL,
  `idepoubis` int NOT NULL,
  `lieunaiss` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `lieudec` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `idnatnaiss` int NOT NULL,
  `idnatdec` int NOT NULL,
  `iddeptnaiss` int NOT NULL,
  `iddeptdec` int NOT NULL,
  `prenom2` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `prenom3` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `memo` mediumtext COLLATE utf8mb4_bin NOT NULL,
  `datmaj` date NOT NULL,
  PRIMARY KEY (`idperson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `cprofil` int NOT NULL AUTO_INCREMENT,
  `profil` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`cprofil`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `idsession` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `nom` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(20) COLLATE utf8mb4_bin NOT NULL,
  `limtime` int NOT NULL,
  `datdeb` datetime NOT NULL,
  UNIQUE KEY `idsession` (`idsession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `prenom` varchar(25) COLLATE utf8mb4_bin NOT NULL,
  `telephone` int NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_bin NOT NULL,
  `pwd` varchar(10) COLLATE utf8mb4_bin NOT NULL,
  `cprofil` int NOT NULL,
  `activite` int NOT NULL,
  `datdeb` date NOT NULL,
  `datfin` date NOT NULL,
  `datmaj` date NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
