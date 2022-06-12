-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2022 at 05:10 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `searchsarisaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `BUYER_ID` int(10) NOT NULL,
  `UR_ID` int(10) NOT NULL,
  `B_FULLNAME` varchar(100) NOT NULL,
  `B_MPHONE_NUM` int(11) NOT NULL,
  `B_EMAIL_ADD` varchar(30) NOT NULL,
  `B_USERNAME` varchar(30) NOT NULL,
  `B_PASSWORD` varchar(30) NOT NULL,
  `B_ADDRESS` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `ORDER_ID` int(10) NOT NULL,
  `STATUS` enum('S','P','C','R') NOT NULL,
  `SELLER_ID` int(10) NOT NULL,
  `BUYER_ID` int(10) NOT NULL,
  `OVERALL_AMOUNT` decimal(10,0) NOT NULL,
  `PICKUP_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `PRODUCT_ID` int(10) NOT NULL,
  `PRODUCT_NAME` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `SELLER_ID` int(10) NOT NULL,
  `UR_ID` int(10) NOT NULL,
  `S_FULLNAME` varchar(100) NOT NULL,
  `S_MPHONE_NUM` int(11) NOT NULL,
  `B_EMAIL_ADD` varchar(30) NOT NULL,
  `B_USERNAME` varchar(30) NOT NULL,
  `B_PASSWORD` varchar(30) NOT NULL,
  `S_COORDINATES` varchar(200) NOT NULL,
  `STORE_INFO` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seller_products`
--

CREATE TABLE `seller_products` (
  `PRODUCT_ID` int(10) NOT NULL,
  `SELLER_ID` int(10) NOT NULL,
  `QTY` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `UR_ID` int(10) NOT NULL,
  `ROLE` enum('B','S') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`BUYER_ID`),
  ADD KEY `UR_ID` (`UR_ID`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`ORDER_ID`),
  ADD KEY `BUYER_ID` (`BUYER_ID`),
  ADD KEY `SELLER_ID` (`SELLER_ID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PRODUCT_ID`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`SELLER_ID`),
  ADD KEY `UR_ID` (`UR_ID`);

--
-- Indexes for table `seller_products`
--
ALTER TABLE `seller_products`
  ADD KEY `PRODUCT_ID` (`PRODUCT_ID`),
  ADD KEY `SELLER_ID` (`SELLER_ID`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`UR_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buyer`
--
ALTER TABLE `buyer`
  MODIFY `BUYER_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `ORDER_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `PRODUCT_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seller`
--
ALTER TABLE `seller`
  MODIFY `SELLER_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `UR_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`UR_ID`) REFERENCES `user_role` (`UR_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_status`
--
ALTER TABLE `order_status`
  ADD CONSTRAINT `order_status_ibfk_1` FOREIGN KEY (`BUYER_ID`) REFERENCES `buyer` (`BUYER_ID`),
  ADD CONSTRAINT `order_status_ibfk_2` FOREIGN KEY (`SELLER_ID`) REFERENCES `seller` (`SELLER_ID`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`UR_ID`) REFERENCES `user_role` (`UR_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `seller_products`
--
ALTER TABLE `seller_products`
  ADD CONSTRAINT `seller_products_ibfk_1` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`PRODUCT_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seller_products_ibfk_2` FOREIGN KEY (`SELLER_ID`) REFERENCES `seller` (`SELLER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
