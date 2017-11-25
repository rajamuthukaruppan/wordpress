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

-- Dumping structure for table northwind.sales_reports
CREATE TABLE IF NOT EXISTS `sales_reports` (
  `group_by` varchar(50) NOT NULL,
  `display` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `filter_row_source` longtext,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`group_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.sales_reports: ~5 rows (approximately)
/*!40000 ALTER TABLE `sales_reports` DISABLE KEYS */;
INSERT INTO `sales_reports` (`group_by`, `display`, `title`, `filter_row_source`, `default`) VALUES
	('Category', 'Category', 'Sales By Category', 'SELECT DISTINCT [Category] FROM [products] ORDER BY [Category];', 0);
INSERT INTO `sales_reports` (`group_by`, `display`, `title`, `filter_row_source`, `default`) VALUES
	('country_region', 'Country/Region', 'Sales By Country', 'SELECT DISTINCT [country_region] FROM [customers Extended] ORDER BY [country_region];', 0);
INSERT INTO `sales_reports` (`group_by`, `display`, `title`, `filter_row_source`, `default`) VALUES
	('Customer ID', 'Customer', 'Sales By Customer', 'SELECT DISTINCT [Company] FROM [customers Extended] ORDER BY [Company];', 0);
INSERT INTO `sales_reports` (`group_by`, `display`, `title`, `filter_row_source`, `default`) VALUES
	('employee_id', 'Employee', 'Sales By Employee', 'SELECT DISTINCT [Employee Name] FROM [employees Extended] ORDER BY [Employee Name];', 0);
INSERT INTO `sales_reports` (`group_by`, `display`, `title`, `filter_row_source`, `default`) VALUES
	('Product ID', 'Product', 'Sales by Product', 'SELECT DISTINCT [Product Name] FROM [products] ORDER BY [Product Name];', 1);
/*!40000 ALTER TABLE `sales_reports` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
