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

-- Dumping structure for table northwind.strings
CREATE TABLE IF NOT EXISTS `strings` (
  `string_id` int(11) NOT NULL AUTO_INCREMENT,
  `string_data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`string_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

-- Dumping data for table northwind.strings: ~62 rows (approximately)
/*!40000 ALTER TABLE `strings` DISABLE KEYS */;
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(2, 'Northwind Traders');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(3, 'Cannot remove posted inventory!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(4, 'Back ordered product filled for Order #|');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(5, 'Discounted price below cost!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(6, 'Insufficient inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(7, 'Insufficient inventory. Do you want to create a purchase order?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(8, 'Purchase orders were successfully created for | products');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(9, 'There are no products below their respective reorder levels');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(10, 'Must specify customer name!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(11, 'Restocking will generate purchase orders for all products below desired inventory levels.  Do you want to continue?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(12, 'Cannot create purchase order.  No suppliers listed for specified product');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(13, 'Discounted price is below cost!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(14, 'Do you want to continue?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(15, 'Order is already invoiced. Do you want to print the invoice?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(16, 'Order does not contain any line items');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(17, 'Cannot create invoice!  Inventory has not been allocated for each specified product.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(18, 'Sorry, there are no sales in the specified time period');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(19, 'Product successfully restocked.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(21, 'Product does not need restocking! Product is already at desired inventory level.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(22, 'Product restocking failed!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(23, 'Invalid login specified!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(24, 'Must first select reported!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(25, 'Changing supplier will remove purchase line items, continue?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(26, 'Purchase orders were successfully submitted for | products.  Do you want to view the restocking report?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(27, 'There was an error attempting to restock inventory levels.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(28, '| product(s) were successfully restocked.  Do you want to view the restocking report?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(29, 'You cannot remove purchase line items already posted to inventory!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(30, 'There was an error removing one or more purchase line items.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(31, 'You cannot modify quantity for purchased product already received or posted to inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(32, 'You cannot modify price for purchased product already received or posted to inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(33, 'Product has been successfully posted to inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(34, 'Sorry, product cannot be successfully posted to inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(35, 'There are orders with this product on back order.  Would you like to fill them now?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(36, 'Cannot post product to inventory without specifying received date!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(37, 'Do you want to post received product to inventory?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(38, 'Initialize purchase, orders, and inventory data?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(39, 'Must first specify employee name!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(40, 'Specified user must be logged in to approve purchase!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(41, 'Purchase order must contain completed line items before it can be approved');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(42, 'Sorry, you do not have permission to approve purchases.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(43, 'Purchase successfully approved');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(44, 'Purchase cannot be approved');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(45, 'Purchase successfully submitted for approval');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(46, 'Purchase cannot be submitted for approval');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(47, 'Sorry, purchase order does not contain line items');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(48, 'Do you want to cancel this order?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(49, 'Canceling an order will permanently delete the order.  Are you sure you want to cancel?');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(100, 'Your order was successfully canceled.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(101, 'Cannot cancel an order that has items received and posted to inventory.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(102, 'There was an error trying to cancel this order.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(103, 'The invoice for this order has not yet been created.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(104, 'Shipping information is not complete.  Please specify all shipping information and try again.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(105, 'Cannot mark as shipped.  Order must first be invoiced!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(106, 'Cannot cancel an order that has already shipped!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(107, 'Must first specify salesperson!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(108, 'Order is now marked closed.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(109, 'Order must first be marked shipped before closing.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(110, 'Must first specify payment information!');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(111, 'There was an error attempting to restock inventory levels.  | product(s) were successfully restocked.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(112, 'You must supply a Unit Cost.');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(113, 'Fill back ordered product, Order #|');
INSERT INTO `strings` (`string_id`, `string_data`) VALUES
	(114, 'Purchase generated based on Order #|');
/*!40000 ALTER TABLE `strings` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
