SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `shop_shoes_test` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_shoes_test`;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `mdp` varchar(8) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `admin` (`mdp`) VALUES
('x45');

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `chemin` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_images` int NOT NULL,
  `numero` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `images` (`chemin`, `nombre_images`, `numero`) VALUES
('/product/04_03_2023_357277_1.jpg', 1, '357277'),
('/product/04_03_2023_101580_1.jpg', 1, '101580'),
('/product/04_03_2023_492923_1.jpg', 1, '492923'),
('/product/04_03_2023_499383_1.jpg', 1, '499383'),
('/product/05_03_2023_659971_1.jpg', 1, '659971'),
('/product/05_03_2023_229640_1.jpg', 1, '229640'),
('/product/05_03_2023_528663_1.jpg', 1, '528663'),
('/product/05_03_2023_689174_1.jpg', 1, '689174'),
('/product/06_03_2023_228380_1.jpg', 1, '228380'),
('/product/06_03_2023_478767_1.jpg', 3, '478767'),
('/product/06_03_2023_232457_1.jpg', 1, '232457'),
('/product/07_03_2023_506816_1.jpg', 1, '506816'),
('/product/07_03_2023_395370_1.jpg', 1, '395370'),
('/product/07_03_2023_059221_1.jpg', 1, '059221'),
('/product/07_03_2023_372270_1.jpg', 1, '372270'),
('/product/07_03_2023_694450_1.jpg', 3, '694450'),
('/product/07_03_2023_875643_1.jpg', 1, '875643'),
('/product/07_03_2023_478942_1.jpg', 1, '478942'),
('/product/07_03_2023_190659_1.jpg', 1, '190659'),
('/product/07_03_2023_615968_1.jpg', 1, '615968'),
('/product/07_03_2023_175612_1.jpg', 1, '175612'),
('/product/07_03_2023_045252_1.jpg', 1, '045252'),
('/product/07_03_2023_597283_1.jpg', 1, '597283'),
('/product/07_03_2023_365484_1.jpg', 1, '365484'),
('/product/07_03_2023_579795_1.jpg', 1, '579795'),
('/product/07_03_2023_440617_1.jpg', 1, '440617'),
('/product/07_03_2023_215810_1.jpg', 1, '215810'),
('/product/07_03_2023_728063_1.jpg', 1, '728063'),
('/product/07_03_2023_416949_1.jpg', 1, '416949'),
('/product/07_03_2023_365765_1.jpg', 1, '365765'),
('/product/07_03_2023_534875_1.jpg', 1, '534875'),
('/product/07_03_2023_544757_1.jpg', 1, '544757'),
('/product/07_03_2023_120806_1.jpg', 1, '120806'),
('/product/07_03_2023_980402_1.jpg', 1, '980402'),
('/product/07_03_2023_245329_1.jpg', 1, '245329'),
('/product/07_03_2023_668715_1.jpg', 1, '668715'),
('/product/07_03_2023_172850_1.jpg', 1, '172850'),
('/product/07_03_2023_540805_1.jpg', 1, '540805'),
('/product/07_03_2023_208066_1.jpg', 1, '208066'),
('/product/07_03_2023_769423_1.jpg', 1, '769423'),
('/product/08_03_2023_361276_1.jpg', 4, '361276'),
('/product/08_03_2023_853973_1.jpg', 3, '853973'),
('/product/08_03_2023_923639_1.jpg', 1, '923639'),
('/product/08_03_2023_566465_1.jpg', 1, '566465'),
('/product/08_03_2023_730945_1.jpg', 2, '730945'),
('/product/08_03_2023_174057_1.jpg', 1, '174057');

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `numero` varchar(8) COLLATE utf8mb4_general_ci NOT NULL,
  `titre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prix` int NOT NULL,
  `categorie` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `genre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `marque` varchar(25) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'en stock',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `produit` (`numero`, `titre`, `prix`, `categorie`, `genre`, `type`, `marque`, `description`, `status`, `date`) VALUES
('045252', '2500', 14000, 'chaussures', 'homme', 'autres', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'vendu', '2023-03-07 12:08:26'),
('059221', 'chaussures basket a vendre au Senegal', 11000, 'chaussures', 'homme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:45:59'),
('101580', 'Chaussures bottes au Senegal', 7000, 'chaussures', 'homme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-04 21:13:30'),
('120806', 'chaussures sandales a vendre a Dakar', 3000, 'chaussures', 'homme-femme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:44:30'),
('172850', 'chaussures basket a vendre a Dakar', 9000, 'chaussures', 'homme-femme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:57:07'),
('174057', 'trousseau a vendre au Senegal', 2000, 'accessoires', 'femme', 'trousses', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:19:08'),
('175612', 'chaussures simples a Dakar', 2000, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:01:01'),
('190659', 'chaussures simple adidas a vendre a Dakar', 2000, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:53:53'),
('208066', 'chaussures mocassins a vendre a Dakar', 11000, 'chaussures', 'homme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:58:37'),
('215810', 'chaussures bottines a vendre a Dakar', 8000, 'chaussures', 'homme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:40:39'),
('228380', 'chaussures enfants au Senegal', 1500, 'chaussures', 'enfant-bebe', NULL, NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-06 00:29:57'),
('229640', 'chaussures toilettes a vendre au Senegal', 17000, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-05 13:04:55'),
('232457', 'espadrilles pour enfants', 1700, 'chaussures', 'enfant-bebe', '', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-06 08:43:12'),
('245329', 'chaussures derbies a vendre a Dakar', 20000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:45:49'),
('357277', 'vente mocassins au Senegal', 25000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-04 21:08:20'),
('361276', 'des valises pour homme & femme', 7000, 'accessoires', 'homme-femme', 'valises', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:14:52'),
('365484', 'chaussures bottes noir a vendre a Dakar', 14000, 'chaussures', 'homme-femme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:12:20'),
('365765', 'chaussures mocassins a vendre a Dakar', 12000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:42:38'),
('372270', 'chaussures mocassins a vendre a Dakar', 15000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:46:43'),
('395370', 'chaussures bottines a vendre a Dakar', 12000, 'chaussures', 'homme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:45:17'),
('416949', 'chaussures bottines a vendre a Dakar', 14000, 'chaussures', 'homme-femme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:42:00'),
('440617', 'vente chaussures traditionnel africain au Sénégal', 1700, 'chaussures', 'homme', 'traditionnel-africain', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:19:54'),
('478767', 'vente mocassins original au Senegal', 25000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-06 08:23:15'),
('478942', 'chaussures derbies noir a vendre a Dakar', 17000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:51:58'),
('492923', 'chaussures bottes a vendre au Senegal', 7000, 'chaussures', 'homme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-04 21:15:54'),
('499383', 'chaussures espadrilles a vendre a Dakar', 3000, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-04 21:18:20'),
('506816', 'chaussures derbies a vendre au Sénégal', 8000, 'chaussures', 'homme-femme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:44:05'),
('528663', 'chaussures bottes neuf', 8000, 'chaussures', 'homme-femme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-05 15:32:00'),
('534875', 'chaussures richelieux a vendre a Dakar', 17000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:43:13'),
('540805', 'chaussures basket a vendre a Dakar', 17000, 'chaussures', 'homme-femme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:57:48'),
('544757', 'chaussures mocassins a vendre a Dakar', 13000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:43:51'),
('566465', 'vente de sacs pour ordinateurs au Senegal', 3000, 'accessoires', 'homme-femme', 'sacs ordinateur', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:17:35'),
('579795', 'vente mocassins au Senegal', 14000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:14:23'),
('597283', 'chaussures traditionnel africain', 3000, 'chaussures', 'homme', 'autres', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:10:33'),
('615968', 'vente mocassins au Senegal', 14000, 'chaussures', 'homme', 'mocassins-richelieux-derbies', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:54:49'),
('659971', 'chaussures original a vendre', 0, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-05 13:02:36'),
('668715', 'chaussures bottes a vendre a Dakar', 14000, 'chaussures', 'homme-femme', 'bottes-bottines', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:46:48'),
('689174', 'Sac à dos à vendre au Sénégal ', 7000, 'accessoires', 'homme', NULL, NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. \r\nFacile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ...\r\n\r\nAppelez-nous ou commander sur WHATSAPP.\r\n', 'en stock', '2023-03-05 16:08:44'),
('694450', 'chaussures espadrilles a vendre a Dakar', 2400, 'chaussures', 'homme-femme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:48:33'),
('728063', 'chaussures nu-pieds a vendre a Dakar', 2000, 'chaussures', 'homme-femme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:41:25'),
('730945', 'vente de porte monnaie pour homme et femme au Senegal', 3000, 'accessoires', 'homme-femme', 'portefeuilles-porte monnaie', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:18:27'),
('769423', 'chaussures derbies a vendre a Dakar', 7000, 'chaussures', 'homme', 'basket-sport', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:59:19'),
('853973', 'vente de bijoux au Senegal', 2500, 'accessoires', 'femme', 'bracelets-chaines-bijoux', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:15:57'),
('875643', 'chaussures sandales adidas a vendre a Dakar', 8000, 'chaussures', 'homme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 11:51:04'),
('923639', 'pochettes pour femmes', 1500, 'accessoires', 'femme', 'pochettes-sacoches', NULL, 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. \r\nRepellendus beatae voluptatem iste quasi nulla magni numquam quibusdam sequi optio nesciunt vel, \r\nhic amet, temporibus dolorem. Quis sed explicabo officia. Totam.', 'en stock', '2023-03-08 01:16:37'),
('980402', 'chaussures sandales simple a vendre a Dakar', 1500, 'chaussures', 'homme-femme', 'sandales-nu-pieds-pantoufles-espadrilles', NULL, 'Une chaussure formidable et de très bonne qualité qui peut durer plus de 6ans avec une bonne entretien. Facile a porter et a enlever, chaussure qui peut aller avec plusieurs de vos activités SPORT, DINE DE GALA, en classe, a l\'université ... Appelez-nous ou commander sur WHATSAPP.', 'en stock', '2023-03-07 12:45:22');


ALTER TABLE `produit` ADD FULLTEXT KEY `titre` (`titre`);
ALTER TABLE `produit` ADD FULLTEXT KEY `type` (`type`);
ALTER TABLE `produit` ADD FULLTEXT KEY `description` (`description`);


ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `produit` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
