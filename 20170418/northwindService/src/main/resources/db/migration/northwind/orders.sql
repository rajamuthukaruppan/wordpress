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

-- Dumping structure for table northwind.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  `shipper_id` int(11) DEFAULT NULL,
  `ship_name` varchar(50) DEFAULT NULL,
  `ship_address` longtext,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_state_province` varchar(50) DEFAULT NULL,
  `ship_zip_postal_code` varchar(50) DEFAULT NULL,
  `ship_country_region` varchar(50) DEFAULT NULL,
  `shipping_fee` decimal(19,4) DEFAULT '0.0000',
  `taxes` decimal(19,4) DEFAULT '0.0000',
  `payment_type` varchar(50) DEFAULT NULL,
  `paid_date` datetime DEFAULT NULL,
  `notes` longtext,
  `tax_rate` double DEFAULT '0',
  `tax_status_id` tinyint(4) DEFAULT NULL,
  `status_id` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `customer_id_2` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `employee_id_2` (`employee_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `shipper_id` (`shipper_id`),
  KEY `shipper_id_2` (`shipper_id`),
  KEY `id_3` (`id`),
  KEY `tax_status` (`tax_status_id`),
  KEY `ship_zip_postal_code` (`ship_zip_postal_code`),
  KEY `fk_orders_orders_status1` (`status_id`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_orders_status1` FOREIGN KEY (`status_id`) REFERENCES `orders_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_orders_tax_status1` FOREIGN KEY (`tax_status_id`) REFERENCES `orders_tax_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_shippers1` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.orders: ~48 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(30, 9, 27, '2006-01-15 00:00:00', '2006-01-22 00:00:00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-01-15 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(31, 3, 4, '2006-01-20 00:00:00', '2006-01-22 00:00:00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-01-20 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(32, 4, 12, '2006-01-22 00:00:00', '2006-01-22 00:00:00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-01-22 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(33, 6, 8, '2006-01-30 00:00:00', '2006-01-31 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Credit Card', '2006-01-30 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(34, 9, 4, '2006-02-06 00:00:00', '2006-02-07 00:00:00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 4.0000, 0.0000, 'Check', '2006-02-06 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(35, 3, 29, '2006-02-10 00:00:00', '2006-02-12 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 7.0000, 0.0000, 'Check', '2006-02-10 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(36, 4, 3, '2006-02-23 00:00:00', '2006-02-25 00:00:00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 7.0000, 0.0000, 'Cash', '2006-02-23 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(37, 8, 6, '2006-03-06 00:00:00', '2006-03-09 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 12.0000, 0.0000, 'Credit Card', '2006-03-06 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(38, 9, 28, '2006-03-10 00:00:00', '2006-03-11 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 10.0000, 0.0000, 'Check', '2006-03-10 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(39, 3, 8, '2006-03-22 00:00:00', '2006-03-24 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 5.0000, 0.0000, 'Check', '2006-03-22 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(40, 4, 10, '2006-03-24 00:00:00', '2006-03-24 00:00:00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 9.0000, 0.0000, 'Credit Card', '2006-03-24 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(41, 1, 7, '2006-03-24 00:00:00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(42, 1, 10, '2006-03-24 00:00:00', '2006-04-07 00:00:00', 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 2);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(43, 1, 11, '2006-03-24 00:00:00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(44, 1, 1, '2006-03-24 00:00:00', NULL, NULL, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(45, 1, 28, '2006-04-07 00:00:00', '2006-04-07 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 40.0000, 0.0000, 'Credit Card', '2006-04-07 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(46, 7, 9, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', 100.0000, 0.0000, 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(47, 6, 6, '2006-04-08 00:00:00', '2006-04-08 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 300.0000, 0.0000, 'Credit Card', '2006-04-08 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(48, 4, 8, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(50, 9, 25, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', 5.0000, 0.0000, 'Cash', '2006-04-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(51, 9, 26, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', 60.0000, 0.0000, 'Credit Card', '2006-04-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(55, 1, 29, '2006-04-05 00:00:00', '2006-04-05 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-04-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(56, 2, 6, '2006-04-03 00:00:00', '2006-04-03 00:00:00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 0.0000, 0.0000, 'Check', '2006-04-03 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(57, 9, 27, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-04-22 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(58, 3, 4, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-04-22 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(59, 4, 12, '2006-04-22 00:00:00', '2006-04-22 00:00:00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-04-22 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(60, 6, 8, '2006-04-30 00:00:00', '2006-04-30 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Credit Card', '2006-04-30 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(61, 9, 4, '2006-04-07 00:00:00', '2006-04-07 00:00:00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 4.0000, 0.0000, 'Check', '2006-04-07 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(62, 3, 29, '2006-04-12 00:00:00', '2006-04-12 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 7.0000, 0.0000, 'Check', '2006-04-12 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(63, 4, 3, '2006-04-25 00:00:00', '2006-04-25 00:00:00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 7.0000, 0.0000, 'Cash', '2006-04-25 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(64, 8, 6, '2006-05-09 00:00:00', '2006-05-09 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 12.0000, 0.0000, 'Credit Card', '2006-05-09 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(65, 9, 28, '2006-05-11 00:00:00', '2006-05-11 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 10.0000, 0.0000, 'Check', '2006-05-11 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(66, 3, 8, '2006-05-24 00:00:00', '2006-05-24 00:00:00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 5.0000, 0.0000, 'Check', '2006-05-24 00:00:00', NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(67, 4, 10, '2006-05-24 00:00:00', '2006-05-24 00:00:00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 9.0000, 0.0000, 'Credit Card', '2006-05-24 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(68, 1, 7, '2006-05-24 00:00:00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(69, 1, 10, '2006-05-24 00:00:00', NULL, 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(70, 1, 11, '2006-05-24 00:00:00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(71, 1, 1, '2006-05-24 00:00:00', NULL, 3, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(72, 1, 28, '2006-06-07 00:00:00', '2006-06-07 00:00:00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 40.0000, 0.0000, 'Credit Card', '2006-06-07 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(73, 7, 9, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', 100.0000, 0.0000, 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(74, 6, 6, '2006-06-08 00:00:00', '2006-06-08 00:00:00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 300.0000, 0.0000, 'Credit Card', '2006-06-08 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(75, 4, 8, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(76, 9, 25, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', 5.0000, 0.0000, 'Cash', '2006-06-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(77, 9, 26, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', 60.0000, 0.0000, 'Credit Card', '2006-06-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(78, 1, 29, '2006-06-05 00:00:00', '2006-06-05 00:00:00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-06-05 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(79, 2, 6, '2006-06-23 00:00:00', '2006-06-23 00:00:00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 0.0000, 0.0000, 'Check', '2006-06-23 00:00:00', NULL, 0, NULL, 3);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(80, 2, 4, '2006-04-25 17:03:55', NULL, NULL, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
INSERT INTO `orders` (`id`, `employee_id`, `customer_id`, `order_date`, `shipped_date`, `shipper_id`, `ship_name`, `ship_address`, `ship_city`, `ship_state_province`, `ship_zip_postal_code`, `ship_country_region`, `shipping_fee`, `taxes`, `payment_type`, `paid_date`, `notes`, `tax_rate`, `tax_status_id`, `status_id`) VALUES
	(81, 2, 3, '2006-04-25 17:26:53', NULL, NULL, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
