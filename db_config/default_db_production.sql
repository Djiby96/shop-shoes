SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `shop_shoes` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_shoes`;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `mdp` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin` (`mdp`) VALUES
('x45');

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `chemin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_images` int NOT NULL,
  `numero` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `images` (`chemin`, `nombre_images`, `numero`) VALUES
('/product/04_03_2023_492923_1.jpg', 1, '492923'),
('/product/08_03_2023_361276_1.jpg', 4, '361276');

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `numero` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `titre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prix` int NOT NULL,
  `categorie` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marque` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en stock',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produit` (`numero`, `titre`, `prix`, `categorie`, `genre`, `type`, `marque`, `description`, `status`, `date`) VALUES
('361276', 'des valises pour homme & femme', 7000, 'accessoires', 'homme-femme', 'valises', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:14:52'),
('492923', 'chaussures bottes a vendre au Senegal', 7000, 'chaussures', 'homme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-04 21:15:54');


ALTER TABLE `produit` ADD FULLTEXT KEY `titre` (`titre`);
ALTER TABLE `produit` ADD FULLTEXT KEY `type` (`type`);
ALTER TABLE `produit` ADD FULLTEXT KEY `description` (`description`);


ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `produit` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
