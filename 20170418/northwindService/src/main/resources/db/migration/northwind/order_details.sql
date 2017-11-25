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

-- Dumping structure for table northwind.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` decimal(18,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(19,4) DEFAULT '0.0000',
  `discount` double NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT NULL,
  `date_allocated` datetime DEFAULT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `inventory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `inventory_id` (`inventory_id`),
  KEY `id_2` (`id`),
  KEY `id_3` (`id`),
  KEY `id_4` (`id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `id_5` (`id`),
  KEY `fk_order_details_orders1_idx` (`order_id`),
  KEY `fk_order_details_order_details_status1_idx` (`status_id`),
  CONSTRAINT `fk_order_details_order_details_status1` FOREIGN KEY (`status_id`) REFERENCES `order_details_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.order_details: ~58 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(27, 30, 34, 100.0000, 14.0000, 0, 2, NULL, 96, 83);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(28, 30, 80, 30.0000, 3.5000, 0, 2, NULL, NULL, 63);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(29, 31, 7, 10.0000, 30.0000, 0, 2, NULL, NULL, 64);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(30, 31, 51, 10.0000, 53.0000, 0, 2, NULL, NULL, 65);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(31, 31, 80, 10.0000, 3.5000, 0, 2, NULL, NULL, 66);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(32, 32, 1, 15.0000, 18.0000, 0, 2, NULL, NULL, 67);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(33, 32, 43, 20.0000, 46.0000, 0, 2, NULL, NULL, 68);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(34, 33, 19, 30.0000, 9.2000, 0, 2, NULL, 97, 81);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(35, 34, 19, 20.0000, 9.2000, 0, 2, NULL, NULL, 69);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(36, 35, 48, 10.0000, 12.7500, 0, 2, NULL, NULL, 70);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(37, 36, 41, 200.0000, 9.6500, 0, 2, NULL, 98, 79);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(38, 37, 8, 17.0000, 40.0000, 0, 2, NULL, NULL, 71);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(39, 38, 43, 300.0000, 46.0000, 0, 2, NULL, 99, 77);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(40, 39, 48, 100.0000, 12.7500, 0, 2, NULL, 100, 75);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(41, 40, 81, 200.0000, 2.9900, 0, 2, NULL, 101, 73);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(42, 41, 43, 300.0000, 46.0000, 0, 1, NULL, 102, 104);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(43, 42, 6, 10.0000, 25.0000, 0, 2, NULL, NULL, 84);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(44, 42, 4, 10.0000, 22.0000, 0, 2, NULL, NULL, 85);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(45, 42, 19, 10.0000, 9.2000, 0, 2, NULL, 103, 110);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(46, 43, 80, 20.0000, 3.5000, 0, 1, NULL, NULL, 86);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(47, 43, 81, 50.0000, 2.9900, 0, 1, NULL, NULL, 87);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(48, 44, 1, 25.0000, 18.0000, 0, 1, NULL, NULL, 88);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(49, 44, 43, 25.0000, 46.0000, 0, 1, NULL, NULL, 89);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(50, 44, 81, 25.0000, 2.9900, 0, 1, NULL, NULL, 90);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(51, 45, 41, 50.0000, 9.6500, 0, 2, NULL, 104, 116);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(52, 45, 40, 50.0000, 18.4000, 0, 2, NULL, NULL, 91);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(53, 46, 57, 100.0000, 19.5000, 0, 2, NULL, 105, 101);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(54, 46, 72, 50.0000, 34.8000, 0, 2, NULL, 106, 114);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(55, 47, 34, 300.0000, 14.0000, 0, 2, NULL, 107, 108);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(56, 48, 8, 25.0000, 40.0000, 0, 2, NULL, 108, 106);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(57, 48, 19, 25.0000, 9.2000, 0, 2, NULL, 109, 112);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(59, 50, 21, 20.0000, 10.0000, 0, 2, NULL, NULL, 92);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(60, 51, 5, 25.0000, 21.3500, 0, 2, NULL, NULL, 93);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(61, 51, 41, 30.0000, 9.6500, 0, 2, NULL, NULL, 94);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(62, 51, 40, 30.0000, 18.4000, 0, 2, NULL, NULL, 95);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(66, 56, 48, 10.0000, 12.7500, 0, 2, NULL, 111, 99);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(67, 55, 34, 87.0000, 14.0000, 0, 2, NULL, NULL, 117);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(68, 79, 7, 30.0000, 30.0000, 0, 2, NULL, NULL, 119);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(69, 79, 51, 30.0000, 53.0000, 0, 2, NULL, NULL, 118);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(70, 78, 17, 40.0000, 39.0000, 0, 2, NULL, NULL, 120);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(71, 77, 6, 90.0000, 25.0000, 0, 2, NULL, NULL, 121);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(72, 76, 4, 30.0000, 22.0000, 0, 2, NULL, NULL, 122);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(73, 75, 48, 40.0000, 12.7500, 0, 2, NULL, NULL, 123);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(74, 74, 48, 40.0000, 12.7500, 0, 2, NULL, NULL, 124);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(75, 73, 41, 10.0000, 9.6500, 0, 2, NULL, NULL, 125);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(76, 72, 43, 5.0000, 46.0000, 0, 2, NULL, NULL, 126);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(77, 71, 40, 40.0000, 18.4000, 0, 2, NULL, NULL, 127);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(78, 70, 8, 20.0000, 40.0000, 0, 2, NULL, NULL, 128);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(79, 69, 80, 15.0000, 3.5000, 0, 2, NULL, NULL, 129);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(80, 67, 74, 20.0000, 10.0000, 0, 2, NULL, NULL, 130);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(81, 60, 72, 40.0000, 34.8000, 0, 2, NULL, NULL, 131);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(82, 63, 3, 50.0000, 10.0000, 0, 2, NULL, NULL, 132);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(83, 63, 8, 3.0000, 40.0000, 0, 2, NULL, NULL, 133);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(84, 58, 20, 40.0000, 81.0000, 0, 2, NULL, NULL, 134);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(85, 58, 52, 40.0000, 7.0000, 0, 2, NULL, NULL, 135);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(86, 80, 56, 10.0000, 38.0000, 0, 1, NULL, NULL, 136);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(90, 81, 81, 0.0000, 2.9900, 0, 5, NULL, NULL, NULL);
INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `discount`, `status_id`, `date_allocated`, `purchase_order_id`, `inventory_id`) VALUES
	(91, 81, 56, 0.0000, 38.0000, 0, 0, NULL, NULL, NULL);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
