-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 16 sep. 2021 à 14:06
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `Utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`Utilisateur_id`),
  KEY `fk_Administrateur_Utilisateur1_idx` (`Utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`Utilisateur_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur_has_mets`
--

DROP TABLE IF EXISTS `administrateur_has_mets`;
CREATE TABLE IF NOT EXISTS `administrateur_has_mets` (
  `Administrateur_Utilisateur_id` int(11) NOT NULL,
  `Mets_id` int(11) NOT NULL,
  PRIMARY KEY (`Administrateur_Utilisateur_id`,`Mets_id`),
  KEY `fk_Administrateur_has_Mets_Mets1_idx` (`Mets_id`),
  KEY `fk_Administrateur_has_Mets_Administrateur1_idx` (`Administrateur_Utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administrateur_has_mets`
--

INSERT INTO `administrateur_has_mets` (`Administrateur_Utilisateur_id`, `Mets_id`) VALUES
(2, 5),
(3, 7),
(1, 9);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `voie` varchar(200) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  `numeroMobile` varchar(45) NOT NULL,
  `Utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`Utilisateur_id`),
  KEY `fk_Client_Utilisateur1_idx` (`Utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`voie`, `codePostal`, `ville`, `numeroMobile`, `Utilisateur_id`) VALUES
('10 rue de France', 75001, 'Paris', '0712458769', 7),
('12 bis avenue de la victoire', 75016, 'Paris', '0612569806', 8),
('2 rue de la porte', 75020, 'Paris', '0756983412', 9);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Client_id` int(11) NOT NULL,
  `StatutCommande_id` int(11) NOT NULL,
  `Livreur_Utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Client_id`,`StatutCommande_id`,`Livreur_Utilisateur_id`),
  KEY `fk_Commande_StatutCommande1_idx` (`StatutCommande_id`),
  KEY `fk_Commande_Livreur1_idx` (`Livreur_Utilisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id`, `date`, `Client_id`, `StatutCommande_id`, `Livreur_Utilisateur_id`) VALUES
(1, '2021-09-16', 7, 2, 4),
(2, '2021-09-15', 8, 2, 5),
(3, '2021-09-14', 9, 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(100) NOT NULL,
  `quantite` int(11) NOT NULL,
  `montant` decimal(6,2) NOT NULL,
  `Mets_id` int(11) NOT NULL,
  `Commande_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`Mets_id`,`Commande_id`),
  KEY `fk_DetailCommande_Mets1_idx` (`Mets_id`),
  KEY `fk_DetailCommande_Commande1_idx` (`Commande_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `detailcommande`
--

INSERT INTO `detailcommande` (`id`, `contenu`, `quantite`, `montant`, `Mets_id`, `Commande_id`) VALUES
(1, '2 x Brownie', 2, '6.00', 9, 1),
(2, '1 x Soupe de champignons', 1, '9.00', 4, 2),
(3, '1 x Tiramisu', 1, '5.00', 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `statut` varchar(45) NOT NULL,
  `position` varchar(100) NOT NULL,
  `Utilisateur_id` int(11) NOT NULL,
  PRIMARY KEY (`Utilisateur_id`),
  KEY `fk_Livreur_Utilisateur1_idx` (`Utilisateur_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`statut`, `position`, `Utilisateur_id`) VALUES
('', '73 rue du faubourg saint martin, 75010 Paris', 4),
('', '10 rue du bac, 75005 Paris', 5),
('', '90 boulevard de strasbourg, 75010 Paris', 6);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `menu`
--

INSERT INTO `menu` (`id`, `date`) VALUES
(1, '2021-09-16'),
(2, '2021-09-15'),
(3, '2021-09-14');

-- --------------------------------------------------------

--
-- Structure de la table `mets`
--

DROP TABLE IF EXISTS `mets`;
CREATE TABLE IF NOT EXISTS `mets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `prix` decimal(4,2) NOT NULL,
  `TypeMets_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`TypeMets_id`),
  KEY `fk_Mets_TypeMets1_idx` (`TypeMets_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `mets`
--

INSERT INTO `mets` (`id`, `nom`, `description`, `prix`, `TypeMets_id`) VALUES
(1, 'Salade composée', 'Une salade délicieuse', '12.50', 1),
(2, 'Sandwich au poulet', 'Un sandwich délicieux', '5.50', 1),
(3, 'Ratatouille', 'Des légumes bien colorés', '6.50', 1),
(4, 'Soupe de champignons', 'Une soupe pour les journées froides', '9.00', 1),
(5, 'Couscous', 'De la semoule et des légumes !', '10.00', 1),
(6, 'Profiteroles', 'Des choux et du chocolat !', '5.00', 2),
(7, 'Tiramisu', 'Un dessert venu d\'Italie', '5.00', 2),
(8, 'Salade de fruits', 'Une salade sucrée ', '3.00', 2),
(9, 'Brownie', 'Un dessert chocolaté', '3.00', 2),
(10, 'Crumble aux pommes', 'Des pommes recouvertes d\'un crumble croquant', '5.00', 2);

-- --------------------------------------------------------

--
-- Structure de la table `metsmenu`
--

DROP TABLE IF EXISTS `metsmenu`;
CREATE TABLE IF NOT EXISTS `metsmenu` (
  `Menu_id` int(11) NOT NULL,
  `Mets_id` int(11) NOT NULL,
  PRIMARY KEY (`Menu_id`,`Mets_id`),
  KEY `fk_MetsMenu_Mets1_idx` (`Mets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `metsmenu`
--

INSERT INTO `metsmenu` (`Menu_id`, `Mets_id`) VALUES
(1, 2),
(1, 3),
(1, 9),
(1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `statutcommande`
--

DROP TABLE IF EXISTS `statutcommande`;
CREATE TABLE IF NOT EXISTS `statutcommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `statutcommande`
--

INSERT INTO `statutcommande` (`id`, `libelle`) VALUES
(1, 'En cours de livraison'),
(2, 'Livré'),
(3, 'En attente de livraison'),
(4, 'Panier');

-- --------------------------------------------------------

--
-- Structure de la table `typemets`
--

DROP TABLE IF EXISTS `typemets`;
CREATE TABLE IF NOT EXISTS `typemets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `typemets`
--

INSERT INTO `typemets` (`id`, `libelle`) VALUES
(1, 'Plat'),
(2, 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) NOT NULL,
  `prenom` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `motdepasse` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `email`, `motdepasse`) VALUES
(1, 'Jean', 'Phillipe', 'phillippe@gmail.com', 'Aoeovhzçg9869)àé\"_('),
(2, 'Martin', 'Bernard', 'bernard@hotmail.com', 'zEIFHZOEç_è78'),
(3, 'Armand', 'Loris', 'loris15@gmail.com', 'OIHGZOUH_-çèç78'),
(4, 'Marc', 'Harry', 'h_12@outlook.com', 'POIzeogih986-è_'),
(5, 'Paul', 'Smith', 'smith54@gmail.com', 'OZUHRFà_èIUG987'),
(6, 'Georges', 'Patrice', 'patrice98@gmail.com', '0824798IUGIG_-'),
(7, 'Renan', 'Christophe', 'renanc@gmail.com', '123124ohkjhh987è_-\'ù'),
(8, 'Maurice', 'Daniel', 'dmaurice@gmail.com', 'Apzoruv976(è_('),
(9, 'Renoir', 'Auguste', 'au_renoir@hotmail.fr', '12OUGIYàçèù095-');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `fk_Administrateur_Utilisateur1` FOREIGN KEY (`Utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `administrateur_has_mets`
--
ALTER TABLE `administrateur_has_mets`
  ADD CONSTRAINT `fk_Administrateur_has_Mets_Administrateur1` FOREIGN KEY (`Administrateur_Utilisateur_id`) REFERENCES `administrateur` (`Utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Administrateur_has_Mets_Mets1` FOREIGN KEY (`Mets_id`) REFERENCES `mets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_Client_Utilisateur1` FOREIGN KEY (`Utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_Commande_Livreur1` FOREIGN KEY (`Livreur_Utilisateur_id`) REFERENCES `livreur` (`Utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Commande_StatutCommande1` FOREIGN KEY (`StatutCommande_id`) REFERENCES `statutcommande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `fk_DetailCommande_Commande1` FOREIGN KEY (`Commande_id`) REFERENCES `commande` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DetailCommande_Mets1` FOREIGN KEY (`Mets_id`) REFERENCES `mets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_Livreur_Utilisateur1` FOREIGN KEY (`Utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `mets`
--
ALTER TABLE `mets`
  ADD CONSTRAINT `fk_Mets_TypeMets1` FOREIGN KEY (`TypeMets_id`) REFERENCES `typemets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `metsmenu`
--
ALTER TABLE `metsmenu`
  ADD CONSTRAINT `fk_MetsMenu_Menu` FOREIGN KEY (`Menu_id`) REFERENCES `menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_MetsMenu_Mets1` FOREIGN KEY (`Mets_id`) REFERENCES `mets` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
