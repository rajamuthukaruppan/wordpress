-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table northwind.purchase_order_details
CREATE TABLE IF NOT EXISTS `purchase_order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL,
  `unit_cost` decimal(19,4) NOT NULL,
  `date_received` datetime DEFAULT NULL,
  `posted_to_inventory` tinyint(1) NOT NULL DEFAULT '0',
  `inventory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `inventory_id` (`inventory_id`),
  KEY `inventory_id_2` (`inventory_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `purchase_order_id_2` (`purchase_order_id`),
  CONSTRAINT `fk_purchase_order_details_inventory_transactions1` FOREIGN KEY (`inventory_id`) REFERENCES `inventory_transactions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_details_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_order_details_purchase_orders1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.purchase_order_details: ~55 rows (approximately)
/*!40000 ALTER TABLE `purchase_order_details` DISABLE KEYS */;
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(238, 90, 1, 40.0000, 14.0000, '2006-01-22 00:00:00', 1, 59);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(239, 91, 3, 100.0000, 8.0000, '2006-01-22 00:00:00', 1, 54);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(240, 91, 4, 40.0000, 16.0000, '2006-01-22 00:00:00', 1, 55);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(241, 91, 5, 40.0000, 16.0000, '2006-01-22 00:00:00', 1, 56);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(242, 92, 6, 100.0000, 19.0000, '2006-01-22 00:00:00', 1, 40);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(243, 92, 7, 40.0000, 22.0000, '2006-01-22 00:00:00', 1, 41);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(244, 92, 8, 40.0000, 30.0000, '2006-01-22 00:00:00', 1, 42);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(245, 92, 14, 40.0000, 17.0000, '2006-01-22 00:00:00', 1, 43);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(246, 92, 17, 40.0000, 29.0000, '2006-01-22 00:00:00', 1, 44);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(247, 92, 19, 20.0000, 7.0000, '2006-01-22 00:00:00', 1, 45);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(248, 92, 20, 40.0000, 61.0000, '2006-01-22 00:00:00', 1, 46);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(249, 92, 21, 20.0000, 8.0000, '2006-01-22 00:00:00', 1, 47);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(250, 90, 34, 60.0000, 10.0000, '2006-01-22 00:00:00', 1, 60);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(251, 92, 40, 120.0000, 14.0000, '2006-01-22 00:00:00', 1, 48);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(252, 92, 41, 40.0000, 7.0000, '2006-01-22 00:00:00', 1, 49);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(253, 90, 43, 100.0000, 34.0000, '2006-01-22 00:00:00', 1, 61);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(254, 92, 48, 100.0000, 10.0000, '2006-01-22 00:00:00', 1, 50);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(255, 92, 51, 40.0000, 40.0000, '2006-01-22 00:00:00', 1, 51);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(256, 93, 52, 100.0000, 5.0000, '2006-01-22 00:00:00', 1, 37);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(257, 93, 56, 120.0000, 28.0000, '2006-01-22 00:00:00', 1, 38);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(258, 93, 57, 80.0000, 15.0000, '2006-01-22 00:00:00', 1, 39);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(259, 91, 65, 40.0000, 16.0000, '2006-01-22 00:00:00', 1, 57);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(260, 91, 66, 80.0000, 13.0000, '2006-01-22 00:00:00', 1, 58);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(261, 94, 72, 40.0000, 26.0000, '2006-01-22 00:00:00', 1, 36);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(262, 92, 74, 20.0000, 8.0000, '2006-01-22 00:00:00', 1, 52);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(263, 92, 77, 60.0000, 10.0000, '2006-01-22 00:00:00', 1, 53);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(264, 95, 80, 75.0000, 3.0000, '2006-01-22 00:00:00', 1, 35);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(265, 90, 81, 125.0000, 2.0000, '2006-01-22 00:00:00', 1, 62);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(266, 96, 34, 100.0000, 10.0000, '2006-01-22 00:00:00', 1, 82);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(267, 97, 19, 30.0000, 7.0000, '2006-01-22 00:00:00', 1, 80);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(268, 98, 41, 200.0000, 7.0000, '2006-01-22 00:00:00', 1, 78);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(269, 99, 43, 300.0000, 34.0000, '2006-01-22 00:00:00', 1, 76);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(270, 100, 48, 100.0000, 10.0000, '2006-01-22 00:00:00', 1, 74);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(271, 101, 81, 200.0000, 2.0000, '2006-01-22 00:00:00', 1, 72);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(272, 102, 43, 300.0000, 34.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(273, 103, 19, 10.0000, 7.0000, '2006-04-17 00:00:00', 1, 111);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(274, 104, 41, 50.0000, 7.0000, '2006-04-06 00:00:00', 1, 115);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(275, 105, 57, 100.0000, 15.0000, '2006-04-05 00:00:00', 1, 100);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(276, 106, 72, 50.0000, 26.0000, '2006-04-05 00:00:00', 1, 113);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(277, 107, 34, 300.0000, 10.0000, '2006-04-05 00:00:00', 1, 107);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(278, 108, 8, 25.0000, 30.0000, '2006-04-05 00:00:00', 1, 105);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(279, 109, 19, 25.0000, 7.0000, '2006-04-05 00:00:00', 1, 109);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(280, 110, 43, 250.0000, 34.0000, '2006-04-10 00:00:00', 1, 103);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(281, 90, 1, 40.0000, 14.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(282, 92, 19, 20.0000, 7.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(283, 111, 34, 50.0000, 10.0000, '2006-04-04 00:00:00', 1, 102);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(285, 91, 3, 50.0000, 8.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(286, 91, 4, 40.0000, 16.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(288, 140, 85, 10.0000, 9.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(289, 141, 6, 10.0000, 18.7500, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(290, 142, 1, 1.0000, 13.5000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(292, 146, 20, 40.0000, 60.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(293, 146, 51, 40.0000, 39.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(294, 147, 40, 120.0000, 13.0000, NULL, 0, NULL);
INSERT INTO `purchase_order_details` (`id`, `purchase_order_id`, `product_id`, `quantity`, `unit_cost`, `date_received`, `posted_to_inventory`, `inventory_id`) VALUES
	(295, 148, 72, 40.0000, 26.0000, NULL, 0, NULL);
/*!40000 ALTER TABLE `purchase_order_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
