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

-- Dumping structure for table northwind.inventory_transaction_types
CREATE TABLE IF NOT EXISTS `inventory_transaction_types` (
  `id` tinyint(4) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.inventory_transaction_types: ~4 rows (approximately)
/*!40000 ALTER TABLE `inventory_transaction_types` DISABLE KEYS */;
INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES
	(1, 'Purchased');
INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES
	(2, 'Sold');
INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES
	(3, 'On Hold');
INSERT INTO `inventory_transaction_types` (`id`, `type_name`) VALUES
	(4, 'Waste');
/*!40000 ALTER TABLE `inventory_transaction_types` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
