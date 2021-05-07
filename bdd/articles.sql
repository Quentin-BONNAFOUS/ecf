-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 07 mai 2021 à 08:26
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `articles`
--

-- --------------------------------------------------------

--
-- Structure de la table `creerarticle`
--

DROP TABLE IF EXISTS `creerarticle`;
CREATE TABLE IF NOT EXISTS `creerarticle` (
  `id` int(11) NOT NULL,
  `titreArticle` varchar(255) NOT NULL,
  `nomCategorie` varchar(255) NOT NULL,
  `nomTags` varchar(255) NOT NULL,
  `contenuArticle` text NOT NULL,
  `dateCreationArticle` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `listesarticles`
--

DROP TABLE IF EXISTS `listesarticles`;
CREATE TABLE IF NOT EXISTS `listesarticles` (
  `idArticle` int(11) NOT NULL,
  `titreArticle` varchar(255) NOT NULL,
  `datePublicationtionArticle` date NOT NULL,
  `statutArticle` enum('Publié','Corbeille','Brouillon') NOT NULL,
  `nomCategorie` varchar(255) NOT NULL,
  `nomTags` varchar(255) NOT NULL,
  PRIMARY KEY (`idArticle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
