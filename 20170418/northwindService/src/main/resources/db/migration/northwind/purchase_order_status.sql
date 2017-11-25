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

-- Dumping structure for table northwind.purchase_order_status
CREATE TABLE IF NOT EXISTS `purchase_order_status` (
  `id` int(11) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.purchase_order_status: ~4 rows (approximately)
/*!40000 ALTER TABLE `purchase_order_status` DISABLE KEYS */;
INSERT INTO `purchase_order_status` (`id`, `status`) VALUES
	(0, 'New');
INSERT INTO `purchase_order_status` (`id`, `status`) VALUES
	(1, 'Submitted');
INSERT INTO `purchase_order_status` (`id`, `status`) VALUES
	(2, 'Approved');
INSERT INTO `purchase_order_status` (`id`, `status`) VALUES
	(3, 'Closed');
/*!40000 ALTER TABLE `purchase_order_status` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
