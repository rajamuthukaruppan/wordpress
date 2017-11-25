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

-- Dumping structure for table northwind.inventory_transactions
CREATE TABLE IF NOT EXISTS `inventory_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_type` tinyint(4) NOT NULL,
  `transaction_created_date` datetime DEFAULT NULL,
  `transaction_modified_date` datetime DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `purchase_order_id` int(11) DEFAULT NULL,
  `customer_order_id` int(11) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_order_id` (`customer_order_id`),
  KEY `customer_order_id_2` (`customer_order_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`),
  KEY `purchase_order_id` (`purchase_order_id`),
  KEY `purchase_order_id_2` (`purchase_order_id`),
  KEY `transaction_type` (`transaction_type`),
  CONSTRAINT `fk_inventory_transactions_inventory_transaction_types1` FOREIGN KEY (`transaction_type`) REFERENCES `inventory_transaction_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_transactions_orders1` FOREIGN KEY (`customer_order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_transactions_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_transactions_purchase_orders1` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.inventory_transactions: ~102 rows (approximately)
/*!40000 ALTER TABLE `inventory_transactions` DISABLE KEYS */;
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(35, 1, '2006-03-22 16:02:28', '2006-03-22 16:02:28', 80, 75, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(36, 1, '2006-03-22 16:02:48', '2006-03-22 16:02:48', 72, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(37, 1, '2006-03-22 16:03:04', '2006-03-22 16:03:04', 52, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(38, 1, '2006-03-22 16:03:09', '2006-03-22 16:03:09', 56, 120, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(39, 1, '2006-03-22 16:03:14', '2006-03-22 16:03:14', 57, 80, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(40, 1, '2006-03-22 16:03:40', '2006-03-22 16:03:40', 6, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(41, 1, '2006-03-22 16:03:47', '2006-03-22 16:03:47', 7, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(42, 1, '2006-03-22 16:03:54', '2006-03-22 16:03:54', 8, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(43, 1, '2006-03-22 16:04:02', '2006-03-22 16:04:02', 14, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(44, 1, '2006-03-22 16:04:07', '2006-03-22 16:04:07', 17, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(45, 1, '2006-03-22 16:04:12', '2006-03-22 16:04:12', 19, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(46, 1, '2006-03-22 16:04:17', '2006-03-22 16:04:17', 20, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(47, 1, '2006-03-22 16:04:20', '2006-03-22 16:04:20', 21, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(48, 1, '2006-03-22 16:04:24', '2006-03-22 16:04:24', 40, 120, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(49, 1, '2006-03-22 16:04:28', '2006-03-22 16:04:28', 41, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(50, 1, '2006-03-22 16:04:31', '2006-03-22 16:04:31', 48, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(51, 1, '2006-03-22 16:04:38', '2006-03-22 16:04:38', 51, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(52, 1, '2006-03-22 16:04:41', '2006-03-22 16:04:41', 74, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(53, 1, '2006-03-22 16:04:45', '2006-03-22 16:04:45', 77, 60, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(54, 1, '2006-03-22 16:05:07', '2006-03-22 16:05:07', 3, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(55, 1, '2006-03-22 16:05:11', '2006-03-22 16:05:11', 4, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(56, 1, '2006-03-22 16:05:14', '2006-03-22 16:05:14', 5, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(57, 1, '2006-03-22 16:05:26', '2006-03-22 16:05:26', 65, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(58, 1, '2006-03-22 16:05:32', '2006-03-22 16:05:32', 66, 80, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(59, 1, '2006-03-22 16:05:47', '2006-03-22 16:05:47', 1, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(60, 1, '2006-03-22 16:05:51', '2006-03-22 16:05:51', 34, 60, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(61, 1, '2006-03-22 16:06:00', '2006-03-22 16:06:00', 43, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(62, 1, '2006-03-22 16:06:03', '2006-03-22 16:06:03', 81, 125, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(63, 2, '2006-03-22 16:07:56', '2006-03-24 11:03:00', 80, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(64, 2, '2006-03-22 16:08:19', '2006-03-22 16:08:59', 7, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(65, 2, '2006-03-22 16:08:29', '2006-03-22 16:08:59', 51, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(66, 2, '2006-03-22 16:08:37', '2006-03-22 16:08:59', 80, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(67, 2, '2006-03-22 16:09:46', '2006-03-22 16:10:27', 1, 15, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(68, 2, '2006-03-22 16:10:06', '2006-03-22 16:10:27', 43, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(69, 2, '2006-03-22 16:11:39', '2006-03-24 11:00:55', 19, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(70, 2, '2006-03-22 16:11:56', '2006-03-24 10:59:41', 48, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(71, 2, '2006-03-22 16:12:29', '2006-03-24 10:57:38', 8, 17, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(72, 1, '2006-03-24 10:41:30', '2006-03-24 10:41:30', 81, 200, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(73, 2, '2006-03-24 10:41:33', '2006-03-24 10:41:42', 81, 200, NULL, NULL, 'Fill Back Ordered product, Order #40');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(74, 1, '2006-03-24 10:53:13', '2006-03-24 10:53:13', 48, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(75, 2, '2006-03-24 10:53:16', '2006-03-24 10:55:46', 48, 100, NULL, NULL, 'Fill Back Ordered product, Order #39');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(76, 1, '2006-03-24 10:53:36', '2006-03-24 10:53:36', 43, 300, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(77, 2, '2006-03-24 10:53:39', '2006-03-24 10:56:57', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #38');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(78, 1, '2006-03-24 10:54:04', '2006-03-24 10:54:04', 41, 200, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(79, 2, '2006-03-24 10:54:07', '2006-03-24 10:58:40', 41, 200, NULL, NULL, 'Fill Back Ordered product, Order #36');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(80, 1, '2006-03-24 10:54:33', '2006-03-24 10:54:33', 19, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(81, 2, '2006-03-24 10:54:35', '2006-03-24 11:02:02', 19, 30, NULL, NULL, 'Fill Back Ordered product, Order #33');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(82, 1, '2006-03-24 10:54:58', '2006-03-24 10:54:58', 34, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(83, 2, '2006-03-24 10:55:02', '2006-03-24 11:03:00', 34, 100, NULL, NULL, 'Fill Back Ordered product, Order #30');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(84, 2, '2006-03-24 14:48:15', '2006-04-04 11:41:14', 6, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(85, 2, '2006-03-24 14:48:23', '2006-04-04 11:41:14', 4, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(86, 3, '2006-03-24 14:49:16', '2006-03-24 14:49:16', 80, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(87, 3, '2006-03-24 14:49:20', '2006-03-24 14:49:20', 81, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(88, 3, '2006-03-24 14:50:09', '2006-03-24 14:50:09', 1, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(89, 3, '2006-03-24 14:50:14', '2006-03-24 14:50:14', 43, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(90, 3, '2006-03-24 14:50:18', '2006-03-24 14:50:18', 81, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(91, 2, '2006-03-24 14:51:03', '2006-04-04 11:09:24', 40, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(92, 2, '2006-03-24 14:55:03', '2006-04-04 11:06:56', 21, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(93, 2, '2006-03-24 14:55:39', '2006-04-04 11:06:13', 5, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(94, 2, '2006-03-24 14:55:52', '2006-04-04 11:06:13', 41, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(95, 2, '2006-03-24 14:56:09', '2006-04-04 11:06:13', 40, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(96, 3, '2006-03-30 16:46:34', '2006-03-30 16:46:34', 34, 12, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(97, 3, '2006-03-30 17:23:27', '2006-03-30 17:23:27', 34, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(98, 3, '2006-03-30 17:24:33', '2006-03-30 17:24:33', 34, 1, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(99, 2, '2006-04-03 13:50:08', '2006-04-03 13:50:15', 48, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(100, 1, '2006-04-04 11:00:54', '2006-04-04 11:00:54', 57, 100, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(101, 2, '2006-04-04 11:00:56', '2006-04-04 11:08:49', 57, 100, NULL, NULL, 'Fill Back Ordered product, Order #46');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(102, 1, '2006-04-04 11:01:14', '2006-04-04 11:01:14', 34, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(103, 1, '2006-04-04 11:01:35', '2006-04-04 11:01:35', 43, 250, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(104, 3, '2006-04-04 11:01:37', '2006-04-04 11:01:37', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #41');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(105, 1, '2006-04-04 11:01:55', '2006-04-04 11:01:55', 8, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(106, 2, '2006-04-04 11:01:58', '2006-04-04 11:07:37', 8, 25, NULL, NULL, 'Fill Back Ordered product, Order #48');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(107, 1, '2006-04-04 11:02:17', '2006-04-04 11:02:17', 34, 300, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(108, 2, '2006-04-04 11:02:19', '2006-04-04 11:08:14', 34, 300, NULL, NULL, 'Fill Back Ordered product, Order #47');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(109, 1, '2006-04-04 11:02:37', '2006-04-04 11:02:37', 19, 25, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(110, 2, '2006-04-04 11:02:39', '2006-04-04 11:41:14', 19, 10, NULL, NULL, 'Fill Back Ordered product, Order #42');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(111, 1, '2006-04-04 11:02:56', '2006-04-04 11:02:56', 19, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(112, 2, '2006-04-04 11:02:58', '2006-04-04 11:07:37', 19, 25, NULL, NULL, 'Fill Back Ordered product, Order #48');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(113, 1, '2006-04-04 11:03:12', '2006-04-04 11:03:12', 72, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(114, 2, '2006-04-04 11:03:14', '2006-04-04 11:08:49', 72, 50, NULL, NULL, 'Fill Back Ordered product, Order #46');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(115, 1, '2006-04-04 11:03:38', '2006-04-04 11:03:38', 41, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(116, 2, '2006-04-04 11:03:39', '2006-04-04 11:09:24', 41, 50, NULL, NULL, 'Fill Back Ordered product, Order #45');
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(117, 2, '2006-04-04 11:04:55', '2006-04-04 11:05:04', 34, 87, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(118, 2, '2006-04-04 11:35:50', '2006-04-04 11:35:54', 51, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(119, 2, '2006-04-04 11:35:51', '2006-04-04 11:35:54', 7, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(120, 2, '2006-04-04 11:36:15', '2006-04-04 11:36:21', 17, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(121, 2, '2006-04-04 11:36:39', '2006-04-04 11:36:47', 6, 90, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(122, 2, '2006-04-04 11:37:06', '2006-04-04 11:37:09', 4, 30, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(123, 2, '2006-04-04 11:37:45', '2006-04-04 11:37:49', 48, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(124, 2, '2006-04-04 11:38:07', '2006-04-04 11:38:11', 48, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(125, 2, '2006-04-04 11:38:27', '2006-04-04 11:38:32', 41, 10, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(126, 2, '2006-04-04 11:38:48', '2006-04-04 11:38:53', 43, 5, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(127, 2, '2006-04-04 11:39:12', '2006-04-04 11:39:29', 40, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(128, 2, '2006-04-04 11:39:50', '2006-04-04 11:39:53', 8, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(129, 2, '2006-04-04 11:40:13', '2006-04-04 11:40:16', 80, 15, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(130, 2, '2006-04-04 11:40:32', '2006-04-04 11:40:38', 74, 20, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(131, 2, '2006-04-04 11:41:39', '2006-04-04 11:41:45', 72, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(132, 2, '2006-04-04 11:42:17', '2006-04-04 11:42:26', 3, 50, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(133, 2, '2006-04-04 11:42:24', '2006-04-04 11:42:26', 8, 3, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(134, 2, '2006-04-04 11:42:48', '2006-04-04 11:43:08', 20, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(135, 2, '2006-04-04 11:43:05', '2006-04-04 11:43:08', 52, 40, NULL, NULL, NULL);
INSERT INTO `inventory_transactions` (`id`, `transaction_type`, `transaction_created_date`, `transaction_modified_date`, `product_id`, `quantity`, `purchase_order_id`, `customer_order_id`, `comments`) VALUES
	(136, 3, '2006-04-25 17:04:05', '2006-04-25 17:04:57', 56, 110, NULL, NULL, NULL);
/*!40000 ALTER TABLE `inventory_transactions` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
