-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 11, 2017 at 12:02 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `cashier`
--

DROP TABLE IF EXISTS `cashier`;
CREATE TABLE IF NOT EXISTS `cashier` (
  `cashierID` int(11) NOT NULL AUTO_INCREMENT,
  `cashierName` varchar(255) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`cashierID`),
  UNIQUE KEY `employeeID` (`cashierID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cashier`
--

INSERT INTO `cashier` (`cashierID`, `cashierName`, `salary`) VALUES
(1, 'Johnny Cash', 5000),
(2, 'Tony Stark', 15000),
(3, 'Digong Five', 10000),
(4, 'Bill Gates', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `customerID` int(11) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `contactNo` int(11) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `customerID` (`customerID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customerID`, `customerName`, `address`, `contactNo`) VALUES
(1, 'Thalita Pen', 'Camarines Gateway', 111111),
(2, 'Lewella Nessa', 'Baguio Benguet', 222222),
(3, 'Sybilla Mabelle', 'Manila', 333333),
(4, 'Aifric Wilburg', 'Dinagat Islands', 444444),
(5, 'Adele Noa', 'Poblacion Cebu City', 444444);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderQty` int(11) DEFAULT '0',
  `orderType` enum('Online','Cash') DEFAULT NULL,
  `orderStatus` enum('Claimed','Pending') DEFAULT NULL,
  `customerID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `cashierID` int(11) NOT NULL,
  PRIMARY KEY (`orderID`),
  UNIQUE KEY `orderID` (`orderID`),
  KEY `customerID` (`customerID`),
  KEY `productID` (`productID`),
  KEY `cashierID` (`cashierID`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `orderQty`, `orderType`, `orderStatus`, `customerID`, `productID`, `cashierID`) VALUES
(2, 50, 'Cash', 'Claimed', 1, 1, 1),
(3, 100, 'Cash', 'Claimed', 4, 4, 3),
(4, 50, 'Online', 'Claimed', 2, 5, 2),
(5, 75, 'Cash', 'Pending', 3, 6, 1),
(6, 200, 'Online', 'Pending', 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productNAME` varchar(255) NOT NULL,
  `productCategory` varchar(255) DEFAULT NULL,
  `productBrand` varchar(255) DEFAULT NULL,
  `productPrice` int(11) NOT NULL,
  `productQty` int(11) NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productID` (`productID`),
  UNIQUE KEY `productNAME` (`productNAME`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `productNAME`, `productCategory`, `productBrand`, `productPrice`, `productQty`) VALUES
(1, 'LG 40inch TV', 'Peripheral', 'LG', 21000, 500),
(4, '1.5L Mountain Dew', 'Softdrinks', 'Pepsi', 55, 1000),
(5, 'Garlic Chippy', 'Chips', 'Jack n Jill', 20, 1500),
(6, 'Whisper Napkin', 'Hygiene', 'Whisper', 15, 3000),
(7, 'Pilot Blue Ballpen', 'School Supply', 'Pilot', 25, 5000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
