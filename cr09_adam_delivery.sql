-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2020 at 04:04 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_adam_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_adam_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_adam_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL,
  `country` varchar(55) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `zip` int(8) DEFAULT NULL,
  `street` varchar(55) DEFAULT NULL,
  `buildingNr` int(4) DEFAULT NULL,
  `floor` int(2) DEFAULT NULL,
  `doorNr` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`addressId`, `country`, `city`, `zip`, `street`, `buildingNr`, `floor`, `doorNr`) VALUES
(1, 'USA', 'Philadelphia', 19103, ' 3859 Pheasant Ridge Road', 25, NULL, NULL),
(2, 'USA', 'Westbury', 11590, '3182  Jarvisville Road', 13, NULL, NULL),
(3, 'USA', 'West Glacier', 59936, '623  Coolidge Street', 120, 3, 301),
(4, 'USA', 'Branson', 65616, '1216  Lighthouse Drive', 97, 5, 505),
(5, 'USA', 'Louisville', 40211, '3533  Earnhardt Drive', 33, 3, 312),
(6, 'USA', 'Russell', 41139, '1076  North Bend River Road', 67, 6, 609),
(7, 'USA', 'Tampa', 33602, '2593  Badger Pond Lane', 22, 4, 420),
(8, 'USA', 'Minot', 58701, '3214  Findley Avenue', 86, 2, 28),
(9, 'USA', 'Lake Charles', 70601, '911  Willow Oaks Lane', 29, 4, 438),
(10, 'USA', 'Arlington', 75760, '4396  Waldeck Street', 52, 2, 229);

-- --------------------------------------------------------

--
-- Table structure for table `collect`
--

CREATE TABLE `collect` (
  `collectId` int(11) NOT NULL,
  `dateOfCollecting` datetime DEFAULT NULL,
  `fk_collecting_employeeId` int(11) DEFAULT NULL,
  `fk_packageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `collect`
--

INSERT INTO `collect` (`collectId`, `dateOfCollecting`, `fk_collecting_employeeId`, `fk_packageId`) VALUES
(1, '2020-11-02 08:27:00', 2, 1),
(2, '2020-10-28 12:42:00', 2, 2),
(3, '2020-11-04 11:30:00', 2, 3),
(4, '2020-10-31 17:30:00', 2, 4),
(5, '2020-11-02 18:00:00', 2, 5),
(6, '2020-10-29 17:51:00', 2, 6),
(7, '2020-10-28 14:00:00', 2, 7),
(8, '2020-10-25 16:30:00', 2, 8),
(9, '2020-11-02 18:30:00', 2, 9),
(10, '2020-11-04 08:10:00', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `companyId` int(11) NOT NULL,
  `companyName` varchar(55) DEFAULT NULL,
  `telNr` int(8) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `fk_company_addressId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`companyId`, `companyName`, `telNr`, `email`, `fk_company_addressId`) VALUES
(1, 'TopMailDelivery', 81746591, 'topdelivery@email.com', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerId` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `telNr` int(8) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `fk_customer_addressId` int(11) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerId`, `firstName`, `lastName`, `telNr`, `email`, `fk_customer_addressId`, `gender`) VALUES
(1, 'Ashley ', 'Andrews', 5019835, 'ashleyand@email.com', 10, 'female'),
(2, 'John', 'Andrews', 5019835, 'johnandrews@email.com', 10, 'male'),
(3, 'Marion ', 'Thompson', 6804726, 'mariontom@email.com', 6, 'female'),
(4, 'Charles ', 'Reid', 5019276, 'charreid@email.com', 7, 'male'),
(5, 'Mildred ', 'Britt', 5692451, 'mildredbritt@email.com', 8, 'female'),
(6, 'Carlos', 'Britt', 5692451, 'carbritt@email.com', 8, 'male'),
(7, 'Morris ', 'Mitchell', 5454025, 'morrismit@email.com', 9, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryId` int(11) NOT NULL,
  `dateOfDelivering` datetime DEFAULT NULL,
  `dateOfArriving` datetime DEFAULT NULL,
  `fk_delivery_employeeId` int(11) DEFAULT NULL,
  `fk_packageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryId`, `dateOfDelivering`, `dateOfArriving`, `fk_delivery_employeeId`, `fk_packageId`) VALUES
(1, '2020-11-03 12:06:00', '2020-11-03 12:06:00', 4, 1),
(2, '2020-11-02 13:00:00', '2020-11-02 13:00:00', 4, 2),
(3, '2020-11-05 15:10:00', '2020-11-05 15:11:00', 4, 3),
(4, '2020-11-02 14:45:00', '2020-11-02 14:45:00', 4, 4),
(5, '2020-11-05 12:00:00', '2020-11-05 12:05:00', 4, 5),
(6, '2020-11-02 17:44:00', '2020-11-02 17:44:00', 4, 6),
(7, '2020-10-30 15:45:00', '2020-10-30 15:45:00', 4, 7),
(8, '2020-10-27 16:00:00', '2020-10-27 16:00:00', 4, 8),
(9, '2020-11-04 13:45:00', NULL, 4, 9),
(10, NULL, NULL, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` int(11) NOT NULL,
  `firstName` varchar(55) DEFAULT NULL,
  `lastName` varchar(55) DEFAULT NULL,
  `telNr` int(8) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `fk_employee_addressId` int(11) DEFAULT NULL,
  `fk_companyId` int(11) DEFAULT NULL,
  `monthSalary` int(6) DEFAULT NULL,
  `gender` enum('male','female') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employeeId`, `firstName`, `lastName`, `telNr`, `email`, `fk_employee_addressId`, `fk_companyId`, `monthSalary`, `gender`) VALUES
(1, 'Mary', 'Hunter', 81746585, 'maryhunter@email.com', 2, 1, 2500, 'female'),
(2, 'Gonzalo', 'Campbell', 76422252, 'goncam@email.com', 3, 1, 2700, 'male'),
(3, 'Eileen', 'Banach', 2738086, 'eileenbanach@email.com', 4, 1, 2400, 'female'),
(4, 'Leonard', 'Gage', 6299667, 'leogage@email.com', 5, 1, 3000, 'male');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `packageId` int(11) NOT NULL,
  `dateOfarriving` datetime DEFAULT NULL,
  `dateOfShipping` datetime DEFAULT NULL,
  `fk_sender_customer` int(11) DEFAULT NULL,
  `fk_receiver_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`packageId`, `dateOfarriving`, `dateOfShipping`, `fk_sender_customer`, `fk_receiver_customer`) VALUES
(1, '2020-11-02 09:12:24', '2020-11-03 10:00:00', 1, 6),
(2, '2020-10-28 14:13:28', '2020-11-02 12:00:00', 3, 2),
(3, '2020-11-04 12:25:00', '2020-11-05 12:00:00', 2, 5),
(4, '2020-10-31 18:06:00', '2020-11-02 12:00:00', 7, 6),
(5, '2020-11-03 08:08:00', '2020-11-05 09:00:00', 7, 4),
(6, '2020-10-30 08:09:00', '2020-11-02 12:00:00', 1, 3),
(7, '2020-10-28 15:13:00', '2020-10-30 12:00:00', 1, 5),
(8, '2020-10-25 17:13:28', '2020-10-27 12:00:00', 6, 1),
(9, '2020-11-03 08:05:00', '2020-11-04 12:00:00', 6, 7),
(10, '2020-11-04 09:14:00', NULL, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `processing`
--

CREATE TABLE `processing` (
  `processingId` int(11) NOT NULL,
  `dateOfProcessing` datetime DEFAULT NULL,
  `fk_processing_employeeId` int(11) DEFAULT NULL,
  `fk_packageId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing`
--

INSERT INTO `processing` (`processingId`, `dateOfProcessing`, `fk_processing_employeeId`, `fk_packageId`) VALUES
(1, '2020-11-03 08:00:00', 1, 1),
(2, '2020-11-02 09:15:00', 1, 2),
(3, '2020-11-05 10:00:00', 1, 3),
(4, '2020-11-02 10:30:00', 1, 4),
(5, '2020-11-05 08:00:00', 3, 5),
(6, '2020-11-02 09:00:00', 3, 6),
(7, '2020-10-30 10:00:00', 3, 7),
(8, '2020-10-27 09:00:00', 3, 8),
(9, '2020-11-04 09:30:00', 1, 9),
(10, '2020-11-06 08:00:00', 3, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressId`);

--
-- Indexes for table `collect`
--
ALTER TABLE `collect`
  ADD PRIMARY KEY (`collectId`),
  ADD KEY `fk_collecting_employeeId` (`fk_collecting_employeeId`),
  ADD KEY `fk_packageId` (`fk_packageId`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`companyId`),
  ADD KEY `fk_company_addressId` (`fk_company_addressId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerId`),
  ADD KEY `fk_customer_addressId` (`fk_customer_addressId`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryId`),
  ADD KEY `fk_delivery_employeeId` (`fk_delivery_employeeId`),
  ADD KEY `fk_packageId` (`fk_packageId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD KEY `fk_employee_addressId` (`fk_employee_addressId`),
  ADD KEY `fk_companyId` (`fk_companyId`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`packageId`),
  ADD KEY `fk_sender_customer` (`fk_sender_customer`),
  ADD KEY `fk_receiver_customer` (`fk_receiver_customer`);

--
-- Indexes for table `processing`
--
ALTER TABLE `processing`
  ADD PRIMARY KEY (`processingId`),
  ADD KEY `fk_processing_employeeId` (`fk_processing_employeeId`),
  ADD KEY `fk_packageId` (`fk_packageId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `addressId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `collect`
--
ALTER TABLE `collect`
  MODIFY `collectId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `companyId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employeeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `packageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `processing`
--
ALTER TABLE `processing`
  MODIFY `processingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collect`
--
ALTER TABLE `collect`
  ADD CONSTRAINT `collect_ibfk_1` FOREIGN KEY (`fk_collecting_employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `collect_ibfk_2` FOREIGN KEY (`fk_packageId`) REFERENCES `package` (`packageId`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`fk_company_addressId`) REFERENCES `address` (`addressId`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_customer_addressId`) REFERENCES `address` (`addressId`);

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`fk_delivery_employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`fk_packageId`) REFERENCES `package` (`packageId`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_employee_addressId`) REFERENCES `address` (`addressId`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`fk_companyId`) REFERENCES `company` (`companyId`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_sender_customer`) REFERENCES `customer` (`customerId`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_receiver_customer`) REFERENCES `customer` (`customerId`);

--
-- Constraints for table `processing`
--
ALTER TABLE `processing`
  ADD CONSTRAINT `processing_ibfk_1` FOREIGN KEY (`fk_processing_employeeId`) REFERENCES `employee` (`employeeId`),
  ADD CONSTRAINT `processing_ibfk_2` FOREIGN KEY (`fk_packageId`) REFERENCES `package` (`packageId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
