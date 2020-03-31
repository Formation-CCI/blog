-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 31 mars 2020 à 14:48
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `blogdemo`
--
CREATE DATABASE IF NOT EXISTS `blogdemo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blogdemo`;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` varchar(100) NOT NULL,
  `contenu` text NOT NULL,
  `dateParution` datetime NOT NULL DEFAULT current_timestamp(),
  `idRedacteurs` tinyint(3) UNSIGNED DEFAULT NULL,
  `idThemes` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titre` (`titre`),
  KEY `idRedacteurs` (`idRedacteurs`),
  KEY `idThemes` (`idThemes`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `contenu`, `dateParution`, `idRedacteurs`, `idThemes`) VALUES
(37, 'Article 2', 'azae', '2020-03-31 16:46:40', 1, 3),
(38, 'Article 3', 'rferc', '2020-03-31 16:47:40', 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

DROP TABLE IF EXISTS `commentaires`;
CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pseudoAuteur` varchar(30) NOT NULL,
  `contenu` varchar(255) NOT NULL,
  `dateAjout` datetime NOT NULL DEFAULT current_timestamp(),
  `idArticle` tinyint(3) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idArticle` (`idArticle`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `idArticles` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idArticle` (`idArticles`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `image`, `idArticles`) VALUES
(9, '1-37_5e8357d0c73a6.jpg', 37),
(10, '1-37_5e8357d0c76ed.jpg', 37),
(11, '1-38_5e83580cd1d25.jpg', 38);

-- --------------------------------------------------------

--
-- Structure de la table `redacteurs`
--

DROP TABLE IF EXISTS `redacteurs`;
CREATE TABLE IF NOT EXISTS `redacteurs` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(30) NOT NULL,
  `motDePasse` char(60) NOT NULL,
  `dateInscription` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `redacteurs`
--

INSERT INTO `redacteurs` (`id`, `pseudo`, `motDePasse`, `dateInscription`) VALUES
(1, 'admin', '$2y$12$gdzuTYTxE/648PeZDveHmeC0OXk8tkAiBvFah3zAFtbglKBevspB2', '2020-03-18 16:33:45'),
(2, 'CCI', '$2y$12$PEe2eUr6f.EtdzQCxKx.SOy5BD1XlfM53a1u3.mHhR8/4MGFoCxVC', '2020-03-18 16:44:02'),
(4, 'Pierre', '$2y$12$70oA176F96TMHft2rqeK/eO9KZjIRZOH/EJO.IbgsX0Zqlrmiv3jy', '2020-03-26 17:09:45');

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

DROP TABLE IF EXISTS `themes`;
CREATE TABLE IF NOT EXISTS `themes` (
  `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `libelle` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id`, `libelle`) VALUES
(1, 'Sport'),
(2, 'Musique'),
(3, 'Santé');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`idRedacteurs`) REFERENCES `redacteurs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Contraintes pour la table `commentaires`
--
ALTER TABLE `commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`idArticle`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `idArticle` FOREIGN KEY (`idArticles`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
