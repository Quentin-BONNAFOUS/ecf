-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 07 mai 2021 à 09:29
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
-- Structure de la table `listearticles`
--

DROP TABLE IF EXISTS `listearticles`;
CREATE TABLE IF NOT EXISTS `listearticles` (
  `idArticle` int(11) NOT NULL AUTO_INCREMENT,
  `titreArticle` varchar(255) NOT NULL,
  `statutArticle` enum('Publi','Corbeille','Brouillon') NOT NULL,
  `dateCreationArticle` date NOT NULL,
  `datePublicationtionArticle` date NOT NULL,
  `ContenuArticle` text NOT NULL,
  `idCategorie` int(11) DEFAULT NULL,
  PRIMARY KEY (`idArticle`),
  KEY `listeArticles_listeCategories_FK` (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `listecategories`
--

DROP TABLE IF EXISTS `listecategories`;
CREATE TABLE IF NOT EXISTS `listecategories` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(255) NOT NULL,
  `descriptionCategorie` text NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `listetags`
--

DROP TABLE IF EXISTS `listetags`;
CREATE TABLE IF NOT EXISTS `listetags` (
  `idTag` int(11) NOT NULL AUTO_INCREMENT,
  `nomTag` varchar(255) NOT NULL,
  `descriptionTag` varchar(255) NOT NULL,
  PRIMARY KEY (`idTag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
CREATE TABLE IF NOT EXISTS `posseder` (
  `idTag` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL,
  PRIMARY KEY (`idTag`,`idArticle`),
  KEY `Posseder_listeArticles0_FK` (`idArticle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `listearticles`
--
ALTER TABLE `listearticles`
  ADD CONSTRAINT `listeArticles_listeCategories_FK` FOREIGN KEY (`idCategorie`) REFERENCES `listecategories` (`idCategorie`);

--
-- Contraintes pour la table `posseder`
--
ALTER TABLE `posseder`
  ADD CONSTRAINT `Posseder_listeArticles0_FK` FOREIGN KEY (`idArticle`) REFERENCES `listearticles` (`idArticle`),
  ADD CONSTRAINT `Posseder_listeTags_FK` FOREIGN KEY (`idTag`) REFERENCES `listetags` (`idTag`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
