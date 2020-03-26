-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 26 mars 2020 à 16:51
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id`, `titre`, `contenu`, `dateParution`, `image`, `idRedacteurs`, `idThemes`) VALUES
(1, 'Quel entrainement musculation avec élastique?', 'L’élastique musculation offre une alternative pratique et efficace quand le travail en salle avec des machines ou des haltères n’est pas possible ou souhaité. L’élastique permet un travail musculaire complet chez soi à condition d’appliquer quelques règles et d’utiliser une méthode appropriée. Il peut être emmené partout facilement et permet de s’entraîner dans un espace restreint. \r\n\r\nA l’inverse des dispositifs classiques, l’élastique a la particularité d’augmenter sa résistance au fur et à mesure qu’il se tend. Cette résistance progressive nécessite un peu de pratique pour une parfaite maitrise des mouvements. Pour cette raison, il existe des bandes élastiques ou tubes élastiques qui proposent des résistances différentes. Il est donc important de bien les choisir en fonction de son niveau et / ou de la zone musculaire travaillée.\r\n\r\nIMPORTANT\r\n\r\nPour que le travail avec élastique soit efficace, le bon réglage initial est essentiel. Choisir un point de fixation stable ou placer sous les pieds. Régler une tension égale sur la partie gauche et droite de l’élastique afin d’exercer les muscles sur un même niveau de tension. Tenir en ligne de compte que la tension augmente au fur et à mesure que la contraction concentrique s’opère. Lors de la contraction excentrique, maitriser le geste sans supprimer la tension de l’élastique.', '2020-03-26 17:03:33', '1-5e7cd2552727a.jpg', 1, 1),
(2, 'Brownie protéiné au chocolat et noix', 'Pour les adeptes de chocolat noir, cette semaine voici une recette gourmande de Brownie au chocolat et noix de pécan protéiné.\r\n\r\nCe brownie chocolat, riche en protéine pourra être dégusté en dessert ou en collation et vous apportera moins de 300 calories par portion.\r\n\r\nRapide à préparer, il vous suffira de l’enfourner un quart d’heure pour obtenir un dessert qui plaira au plus grand nombre.', '2020-03-26 17:05:22', '1-5e7cd2c2a8e18.jpg', 1, 1),
(3, 'Comment créer sa musique ?', 'La musique est omniprésente dans notre vie, mais chez certains, elle est essentielle, parfois vitale. Si vous êtes musicien et que vous aimez écrire et chanter des chansons, vous avez certainement envie d’apprendre à enregistrer comme un pro. Beaucoup de musiciens pensent encore qu’il faut des quantités incroyables de matériel pour enregistrer un album. C’était vrai, il y a encore 20 ans. Mais aujourd’hui, la création musicale s’imagine et se règle avant tout sur de puissants logiciels MAO.', '2020-03-26 17:06:34', '1-5e7cd30ac8676.jpg', 1, 2),
(4, 'Kit de communication - Alerte coronavirus', 'Télécharger le kit sur Wetransfer ou sur Fromsmash\r\n\r\n Le kit communication est composé de :\r\n\r\n5 visuels / infographies \r\n1 spot TV : signes de la maladie\r\n1 spot TV : signes de la maladie + mesures de confinement\r\n1 spot audio : signes de la maladie\r\n1 spot audio : signes de la maladie + mesures de confinement\r\nVous pouvez également télécharger ci-dessous les affiches des gestes barrières, en différentes langues', '2020-03-26 17:08:11', '1-5e7cd36b08a65.png', 1, 3),
(5, 'Apprendre le solfège par internet, c\'est possible et facile', 'Le solfège, c\'est l\'apprentissage de la théorie musicale. Même si le solfège n\'est pas obligatoire, il est fortement recommandé quand on veut jouer d\'un instrument de musique. Il est vraiment souhaitable d\'avoir un minimun de connaissances, ne serait-ce que savoir lire et écrire des notes de musique sur une partition de musique. De plus, le solfège vous permettra d\'apprendre un langage musical universel grâce auquel vous pourrez jouer et donc vous entendre avec d\'autres musiciens. Si vous êtes débutant en solfège, je vous conseille de suivre les cours dans l\'ordre présenté ci-dessous.\r\n\r\nPour aller plus loin que le solfège, je vous propose des cours d\'harmonie. Ces derniers vous seront utiles pour mieux comprendre la formation des accords, les gammes majeures et mineures, les degrés, les tensions et les résolutions...\r\n\r\nN\'oubliez pas que votre apprentissage musical et plus particulièrement de la théorie musicale sera surement long mais vos connaissances en solfège vous permettront d\'aller plus vite (meilleure lecture de notes et de rythmes, déchiffrage d\'une partition, meilleure compréhension de ce que vous jouez...).\r\n\r\nVous pouvez évaluer votre niveau en solfège en jouant gratuitement au quiz solfège de 20 questions.', '2020-03-26 17:10:30', '4-5e7cd3f6aa7e2.jpg', 4, 2),
(6, 'Perdre du poids', 'Depuis des années déjà, perdre du poids est devenu une préoccupation prioritaire pour de nombreuses personnes, notamment celles des pays développés comme la France. Si l’IMC (Indice de Masse Corporelle) peut vous aider à anticiper une prise de poids, cette page a été créé dans le but de vous aiguiller sur les différentes manières de perdre du poids.', '2020-03-26 17:14:12', '4-5e7cd4d49345a.png', 4, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
