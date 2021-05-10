-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 10 mai 2021 à 09:39
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `listearticles`
--

INSERT INTO `listearticles` (`idArticle`, `titreArticle`, `statutArticle`, `dateCreationArticle`, `datePublicationtionArticle`, `ContenuArticle`, `idCategorie`) VALUES
(1, 'Candy pudding', 'Brouillon', '2021-05-06', '2021-05-06', 'Bien protéiné', 1),
(2, 'Cookie', 'Publi', '2021-05-01', '2021-05-01', 'Bien protéiné', 2),
(3, 'Danish Chupa', 'Corbeille', '2021-04-25', '2021-05-24', 'Bien protéiné', 2),
(29, 'Fruitcake', 'Brouillon', '2021-05-09', '2021-05-09', 'Bien protéiné', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `listecategories`
--

INSERT INTO `listecategories` (`idCategorie`, `nomCategorie`, `descriptionCategorie`) VALUES
(1, 'Cake', 'Gâteau '),
(2, 'Sweets', 'Gâteau ');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `listetags`
--

INSERT INTO `listetags` (`idTag`, `nomTag`, `descriptionTag`) VALUES
(1, 'Jelly', ''),
(2, 'Fudge', ''),
(3, 'Sugar', ''),
(4, 'Beans', '');

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
-- Déchargement des données de la table `posseder`
--

INSERT INTO `posseder` (`idTag`, `idArticle`) VALUES
(1, 1),
(3, 2),
(2, 3),
(2, 29);

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
