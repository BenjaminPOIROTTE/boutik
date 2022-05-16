-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 10 mai 2022 à 08:31
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `boutiq`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `idCategorie` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategorie` varchar(500) NOT NULL,
  PRIMARY KEY (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`idCategorie`, `nomCategorie`) VALUES
(1, 'Jeux vidéo & consoles'),
(2, 'Informatique & bureau'),
(3, 'Livres'),
(4, 'Musique, DVD & Blu-ray');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nomClient` varchar(500) NOT NULL,
  `prenomClient` varchar(500) NOT NULL,
  `emailClient` varchar(500) NOT NULL,
  `motDePasseClient` varchar(1000) NOT NULL,
  `rueClient` varchar(1000) NOT NULL,
  `cpClient` varchar(10) NOT NULL,
  `villeClient` varchar(500) NOT NULL,
  `telClient` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `emailClient`, `motDePasseClient`, `rueClient`, `cpClient`, `villeClient`, `telClient`) VALUES
(3, 'Lucas', 'Chevalot', 'lucas.chevalot@gmail.com', '$2y$10$qJZGoizlRObBHtcfHlNztOwjSumUsSqmJYAf.bKqIWzCq6W7VVp6C', '15 rue du gué', '55000', 'Bar le duc', '0648789090'),
(4, 'test', 'test', 'test@test.test', '$2y$10$lUZxEND.DoJVZgvYcRWJN.F16RhNp3d6uJo6OIr0k6QOC4.qTbb0y', 'testetetetet tete', '11111', 'tetetetet', '');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `numeroCommande` int(11) NOT NULL AUTO_INCREMENT,
  `dateCommande` date NOT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`numeroCommande`),
  KEY `commande_client_FK` (`idClient`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`numeroCommande`, `dateCommande`, `idClient`) VALUES
(15, '2020-11-13', 3),
(16, '2020-11-13', 3),
(17, '2020-11-13', 3);

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

DROP TABLE IF EXISTS `commander`;
CREATE TABLE IF NOT EXISTS `commander` (
  `numeroCommande` int(11) NOT NULL,
  `codeProduit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  PRIMARY KEY (`numeroCommande`,`codeProduit`),
  KEY `commander_produit0_FK` (`codeProduit`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commander`
--

INSERT INTO `commander` (`numeroCommande`, `codeProduit`, `quantite`) VALUES
(15, 7, 1),
(15, 8, 2),
(16, 9, 1),
(16, 10, 1),
(17, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

DROP TABLE IF EXISTS `devis`;
CREATE TABLE IF NOT EXISTS `devis` (
  `idDevis` int(11) NOT NULL AUTO_INCREMENT,
  `idClient` int(11) NOT NULL,
  `idArticle` int(11) NOT NULL,
  `description` varchar(999) NOT NULL,
  `isAcceptClient` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDevis`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `devis`
--

INSERT INTO `devis` (`idDevis`, `idClient`, `idArticle`, `description`, `isAcceptClient`) VALUES
(1, 4, 7, 'aaaaa', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) NOT NULL,
  `url` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `id_produit`, `url`) VALUES
(1, 7, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.ginjfo.com%2Fwp-content%2Fuploads%2F2019%2F06%2FHS35-04.jpg&f=1&nofb=1'),
(2, 7, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimg2.isleden.fr%2F241636-large_default%2Fcorsair-hs35-casque-de-gamer-stereo-bleu-ca-9011196-eu.jpg&f=1&nofb=1'),
(3, 8, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fimages-na.ssl-images-amazon.com%2Fimages%2FI%2F618f9UKaVmL._AC_SX679_.jpg&f=1&nofb=1'),
(4, 8, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.reference-gaming.com%2Fassets%2Fmedia%2Fproduct%2F36249%2Frazer-wolverine-ultimate-gaming-controller-xbox-one-xbox-one-59c107437ab25.jpg%3Fformat%3Dproduct-cover-large%26k%3D1505822529&f=1&nofb=1'),
(5, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.otec.com.uy%2Fimgs%2Fproductos%2Fproductos34_8476.jpg&f=1&nofb=1'),
(6, 4, 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fneptune.co.ke%2Fwp-content%2Fuploads%2F2019%2F04%2FSanDisk-Ultra-Memory-Card-microSDHC-microSDXC-UHS-I-128GB-micro-SD-card-class10-TransFLash-TF-card-1.jpg&f=1&nofb=1');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `codeProduit` int(11) NOT NULL AUTO_INCREMENT,
  `designationProduit` varchar(500) NOT NULL,
  `prixProduit` decimal(10,2) NOT NULL,
  `stockProduit` int(11) NOT NULL,
  `photoProduit` varchar(1000) NOT NULL,
  `idCategorie` int(11) NOT NULL,
  PRIMARY KEY (`codeProduit`),
  KEY `produit_categorie_FK` (`idCategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`codeProduit`, `designationProduit`, `prixProduit`, `stockProduit`, `photoProduit`, `idCategorie`) VALUES
(1, 'Skidamarink (Guillaume Musso)', '19.90', 45, '71aaz7oUpBL._AC._SR360,460.jpg', 3),
(2, 'Le Crépuscule et l\'Aube (Ken FOLLETT)', '24.50', 35, '514fHMab5eL._SX316_BO1,204,203,200_.jpg', 3),
(3, 'D\'un monde à l\'autre: Le temps des consciences (de Frédéric Lenoir, Nicolas Hulot)', '21.50', 64, '41vbzQVGIOL._SX311_BO1,204,203,200_.jpg', 3),
(4, 'SanDisk Carte Mémoire MicroSDHC Ultra 128 Go + Adaptateur SD Classe 10, U1, Homologuée A1', '30.39', 195, '617NtexaW2L._AC_SL1500_.jpg', 2),
(5, 'Logitech Webcam C920 HD Pro, Appels et Enregistrements Vidéo Full HD 1080p, Gaming Stream, Deux Microphones, Petite, Agile, Réglable, Noir', '109.00', 32, '51r+t90LYxL._AC_SL1023_.jpg', 2),
(6, 'Samsung SSD Interne 860 EVO 2.5\" (500 Go) - MZ-76E500B/EU', '70.12', 254, '91JA5-hAnoL._AC_SL1500_.jpg', 2),
(7, 'Corsair HS35 Casque de Gaming Stéréo', '43.65', 20, '619v-GUF7tL._AC._SR360,460.jpg', 1),
(8, 'Razer Wolverine Ultimate for Xbox One - Manette de Jeu pour Xbox One ', '179.99', 235, '618f9UKaVmL._AC._SR360,460.jpg', 1),
(9, 'Sign O’ The Times-Deluxe Edition 3CD', '19.99', 15, 'A1bbWtAHUtL._AC._SR360,460.jpg', 4),
(10, 'Batman - The Dark Knight, le Chevalier Noir - 4K Ultra HD', '20.00', 164, '81jSFtA8LOL._AC._SR360,460.jpg', 4),
(11, 'Game Of Thrones (Le Trône de Fer) - Saison 8', '39.99', 98, '71-we6++h2L._AC._SR360,460.jpg', 4);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_client_FK` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `commander`
--
ALTER TABLE `commander`
  ADD CONSTRAINT `commander_commande_FK` FOREIGN KEY (`numeroCommande`) REFERENCES `commande` (`numeroCommande`),
  ADD CONSTRAINT `commander_produit0_FK` FOREIGN KEY (`codeProduit`) REFERENCES `produit` (`codeProduit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_categorie_FK` FOREIGN KEY (`idCategorie`) REFERENCES `categorie` (`idCategorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
