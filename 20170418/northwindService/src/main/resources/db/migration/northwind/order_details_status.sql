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

-- Dumping structure for table northwind.order_details_status
CREATE TABLE IF NOT EXISTS `order_details_status` (
  `id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.order_details_status: ~6 rows (approximately)
/*!40000 ALTER TABLE `order_details_status` DISABLE KEYS */;
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(0, 'None');
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(1, 'Allocated');
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(2, 'Invoiced');
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(3, 'Shipped');
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(4, 'On Order');
INSERT INTO `order_details_status` (`id`, `status_name`) VALUES
	(5, 'No Stock');
/*!40000 ALTER TABLE `order_details_status` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
