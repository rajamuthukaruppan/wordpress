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

-- Dumping structure for table northwind.purchase_orders
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `submitted_date` datetime DEFAULT NULL,
  `creation_date` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT '0',
  `expected_date` datetime DEFAULT NULL,
  `shipping_fee` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `taxes` decimal(19,4) NOT NULL DEFAULT '0.0000',
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,4) DEFAULT '0.0000',
  `payment_method` varchar(50) DEFAULT NULL,
  `notes` longtext,
  `approved_by` int(11) DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `submitted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `created_by` (`created_by`),
  KEY `status_id` (`status_id`),
  KEY `id_2` (`id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `supplier_id_2` (`supplier_id`),
  CONSTRAINT `fk_purchase_orders_employees1` FOREIGN KEY (`created_by`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_orders_purchase_order_status1` FOREIGN KEY (`status_id`) REFERENCES `purchase_order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchase_orders_suppliers1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.purchase_orders: ~28 rows (approximately)
/*!40000 ALTER TABLE `purchase_orders` DISABLE KEYS */;
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(90, 1, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(91, 3, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(92, 2, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(93, 5, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(94, 6, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(95, 4, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(96, 1, 5, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #30', 2, '2006-01-22 00:00:00', 5);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(97, 2, 7, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #33', 2, '2006-01-22 00:00:00', 7);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(98, 2, 4, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #36', 2, '2006-01-22 00:00:00', 4);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(99, 1, 3, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #38', 2, '2006-01-22 00:00:00', 3);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(100, 2, 9, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #39', 2, '2006-01-22 00:00:00', 9);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(101, 1, 2, '2006-01-14 00:00:00', '2006-01-22 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #40', 2, '2006-01-22 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(102, 1, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #41', 2, '2006-04-04 00:00:00', 1);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(103, 2, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #42', 2, '2006-04-04 00:00:00', 1);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(104, 2, 1, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #45', 2, '2006-04-04 00:00:00', 1);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(105, 5, 7, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, 'Check', 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00', 7);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(106, 6, 7, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00', 7);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(107, 1, 6, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #47', 2, '2006-04-04 00:00:00', 6);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(108, 2, 4, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00', 4);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(109, 2, 4, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00', 4);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(110, 1, 3, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #49', 2, '2006-04-04 00:00:00', 3);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(111, 1, 2, '2006-03-31 00:00:00', '2006-03-31 00:00:00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #56', 2, '2006-04-04 00:00:00', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(140, 6, NULL, '2006-04-25 00:00:00', '2006-04-25 16:40:51', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-04-25 16:41:33', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(141, 8, NULL, '2006-04-25 00:00:00', '2006-04-25 17:10:35', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-04-25 17:10:55', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(142, 8, NULL, '2006-04-25 00:00:00', '2006-04-25 17:18:29', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, 'Check', NULL, 2, '2006-04-25 17:18:51', 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(146, 2, 2, '2006-04-26 18:26:37', '2006-04-26 18:26:37', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(147, 7, 2, '2006-04-26 18:33:28', '2006-04-26 18:33:28', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2);
INSERT INTO `purchase_orders` (`id`, `supplier_id`, `created_by`, `submitted_date`, `creation_date`, `status_id`, `expected_date`, `shipping_fee`, `taxes`, `payment_date`, `payment_amount`, `payment_method`, `notes`, `approved_by`, `approved_date`, `submitted_by`) VALUES
	(148, 5, 2, '2006-04-26 18:33:52', '2006-04-26 18:33:52', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2);
/*!40000 ALTER TABLE `purchase_orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
