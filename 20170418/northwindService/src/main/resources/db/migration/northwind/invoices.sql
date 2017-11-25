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

-- Dumping structure for table northwind.invoices
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `due_date` datetime DEFAULT NULL,
  `tax` decimal(19,4) DEFAULT '0.0000',
  `shipping` decimal(19,4) DEFAULT '0.0000',
  `amount_due` decimal(19,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `fk_invoices_orders1_idx` (`order_id`),
  CONSTRAINT `fk_invoices_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.invoices: ~35 rows (approximately)
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(5, 31, '2006-03-22 16:08:59', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(6, 32, '2006-03-22 16:10:27', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(7, 40, '2006-03-24 10:41:41', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(8, 39, '2006-03-24 10:55:46', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(9, 38, '2006-03-24 10:56:57', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(10, 37, '2006-03-24 10:57:38', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(11, 36, '2006-03-24 10:58:40', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(12, 35, '2006-03-24 10:59:41', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(13, 34, '2006-03-24 11:00:55', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(14, 33, '2006-03-24 11:02:02', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(15, 30, '2006-03-24 11:03:00', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(16, 56, '2006-04-03 13:50:15', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(17, 55, '2006-04-04 11:05:04', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(18, 51, '2006-04-04 11:06:13', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(19, 50, '2006-04-04 11:06:56', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(20, 48, '2006-04-04 11:07:37', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(21, 47, '2006-04-04 11:08:14', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(22, 46, '2006-04-04 11:08:49', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(23, 45, '2006-04-04 11:09:24', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(24, 79, '2006-04-04 11:35:54', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(25, 78, '2006-04-04 11:36:21', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(26, 77, '2006-04-04 11:36:47', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(27, 76, '2006-04-04 11:37:09', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(28, 75, '2006-04-04 11:37:49', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(29, 74, '2006-04-04 11:38:11', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(30, 73, '2006-04-04 11:38:32', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(31, 72, '2006-04-04 11:38:53', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(32, 71, '2006-04-04 11:39:29', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(33, 70, '2006-04-04 11:39:53', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(34, 69, '2006-04-04 11:40:16', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(35, 67, '2006-04-04 11:40:38', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(36, 42, '2006-04-04 11:41:14', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(37, 60, '2006-04-04 11:41:45', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(38, 63, '2006-04-04 11:42:26', NULL, 0.0000, 0.0000, 0.0000);
INSERT INTO `invoices` (`id`, `order_id`, `invoice_date`, `due_date`, `tax`, `shipping`, `amount_due`) VALUES
	(39, 58, '2006-04-04 11:43:08', NULL, 0.0000, 0.0000, 0.0000);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
