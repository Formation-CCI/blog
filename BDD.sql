-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 26 mars 2020 à 13:35
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
  `image` varchar(255) DEFAULT NULL,
  `idRedacteurs` tinyint(3) UNSIGNED DEFAULT NULL,
  `idThemes` tinyint(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `titre` (`titre`),
  KEY `idRedacteurs` (`idRedacteurs`),
  KEY `idThemes` (`idThemes`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `contenu`, `dateParution`, `image`, `idRedacteurs`, `idThemes`) VALUES
(1, 'Article 1 : Mon premier blog', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id quam sit amet nulla convallis fermentum id tincidunt felis. Donec varius ligula eu pellentesque commodo. Vestibulum felis nisl, consectetur eu ultricies at, pharetra a erat. Etiam imperdiet congue libero nec lobortis. Duis vehicula leo in augue malesuada feugiat. Nullam nec ex felis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Praesent dapibus sem at purus eleifend pretium eu quis ex. Aenean dapibus elit sem. Cras eget ex risus. Nunc ultrices, augue ac volutpat efficitur, sem turpis volutpat enim, in tincidunt magna sem at sem. Nunc mattis, risus blandit commodo rutrum, purus quam mattis mauris, vitae finibus ante leo ut lectus.\r\n\r\nVivamus sem sem, commodo ac elementum et, viverra at velit. Nunc eros ante, commodo vitae nibh in, cursus interdum velit. Sed sed porta sapien, vel tristique est. Phasellus molestie, sem a pretium euismod, metus nisi varius metus, sit amet facilisis risus mi sed libero. Vestibulum blandit risus lacus, in vehicula magna pulvinar id. Vivamus auctor efficitur turpis, consectetur aliquet leo eleifend sed. Pellentesque elementum dolor ut dolor lobortis, vitae vehicula lectus auctor. Etiam quis feugiat ligula.\r\n\r\nVestibulum justo tellus, consectetur non ligula in, bibendum tempus leo. Curabitur a orci mi. Phasellus lacinia ultricies quam a bibendum. Quisque orci ipsum, commodo at eros scelerisque, viverra tincidunt diam. Donec vel velit scelerisque, lobortis magna ut, dictum nisl. Proin sit amet quam tristique, tempor purus quis, ullamcorper sem. Sed vel purus vel erat malesuada pharetra. Mauris placerat blandit quam, nec viverra neque tincidunt sit amet. Praesent vulputate purus nibh. Sed dapibus neque urna, in pharetra nibh ullamcorper porttitor. Morbi in dapibus quam. Vestibulum bibendum est eget consequat consectetur.\r\n\r\nPellentesque dapibus, nisi eu auctor consectetur, risus lectus ultricies felis, non scelerisque tellus nibh eget dolor. Sed convallis est vel arcu finibus tincidunt accumsan tincidunt leo. Donec placerat ornare nunc id pellentesque. Sed elementum erat risus. Vestibulum iaculis nisi et viverra mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In quis venenatis neque, sed porta magna. Sed ultrices mattis nunc, sed iaculis sem efficitur quis. Phasellus risus dui, vestibulum eu felis eget, hendrerit consequat dolor. Duis facilisis consectetur ante ac congue. Cras vel dapibus ex. Ut aliquet non felis et pellentesque. Mauris gravida accumsan eleifend.\r\n\r\nSed commodo ut metus consectetur hendrerit. Fusce ex tortor, iaculis vel sem eu, rhoncus elementum nulla. Nulla mattis erat tellus, vitae gravida lorem laoreet sed. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vivamus ac leo consequat, semper mi sit amet, placerat est. Vestibulum id dui rhoncus, vulputate metus vel, tincidunt enim. Morbi commodo tincidunt enim id rutrum. Nam ac urna imperdiet, interdum arcu id, tempor diam. Morbi nec viverra leo. Morbi faucibus ornare elit ac volutpat. Nullam vel tellus eget elit malesuada interdum vitae id lacus. Integer lacus arcu, volutpat eu sem non, pellentesque hendrerit elit. Integer eget nunc vel mi facilisis porta. Nullam at ligula ut magna lobortis egestas sit amet non felis. Nam fringilla, dolor id consequat semper, augue tortor porta erat, a vehicula libero erat vitae ligula. Nunc auctor, est fermentum venenatis ultrices, turpis mi condimentum sem, et rhoncus ante erat sed tortor.', '2020-03-18 16:35:46', '1-5e723fd250e4d.jpg', 1, 2),
(7, 'Sport', 'Muscu', '2020-03-26 14:19:08', '1-5e7cabcc84fda.jpg', 1, 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `redacteurs`
--

INSERT INTO `redacteurs` (`id`, `pseudo`, `motDePasse`, `dateInscription`) VALUES
(1, 'admin', '$2y$12$gdzuTYTxE/648PeZDveHmeC0OXk8tkAiBvFah3zAFtbglKBevspB2', '2020-03-18 16:33:45'),
(2, 'CCI', '$2y$12$PEe2eUr6f.EtdzQCxKx.SOy5BD1XlfM53a1u3.mHhR8/4MGFoCxVC', '2020-03-18 16:44:02');

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
