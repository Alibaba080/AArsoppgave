-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 03, 2024 at 09:53 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klokkedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL,
  `person` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `total_amount`, `person`) VALUES
(1, '2024-05-23 23:13:35', 100.00, 'nora'),
(2, '2024-05-23 23:36:23', 200.00, 'nora'),
(3, '2024-05-23 23:54:47', 100.00, 'nora'),
(4, '2024-05-24 00:03:23', 100.00, 'nora'),
(5, '2024-05-24 00:04:25', 300.00, 'nora'),
(6, '2024-05-24 01:01:40', 1000.00, 'nora'),
(7, '2024-05-24 01:06:36', 10000.00, 'nora'),
(8, '2024-05-24 01:07:15', 18000.00, 'nora'),
(9, '2024-05-24 01:16:34', 100.00, 'nora'),
(10, '2024-05-24 02:59:20', 100.00, 'nora'),
(11, '2024-05-24 03:09:27', 200.00, 'nora'),
(12, '2024-05-24 03:09:42', 200.00, 'nora'),
(13, '2024-05-24 10:21:23', 200.00, 'nora'),
(14, '2024-05-24 11:13:26', 300.00, 'nora'),
(15, '2024-05-24 11:17:01', 200.00, 'nora');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`) VALUES
(13, 10, 1, 1),
(14, 11, 1, 2),
(15, 12, 1, 2),
(16, 13, 3, 1),
(17, 13, 2, 1),
(18, 14, 1, 2),
(19, 14, 3, 1),
(20, 15, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `produkt`
--

CREATE TABLE `produkt` (
  `id` int(11) NOT NULL,
  `merke` varchar(45) DEFAULT NULL,
  `storrelse_mm` int(11) DEFAULT NULL,
  `farge` varchar(45) DEFAULT NULL,
  `materiale` varchar(45) DEFAULT NULL,
  `bilde` varchar(45) DEFAULT NULL,
  `pris` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `produkt`
--

INSERT INTO `produkt` (`id`, `merke`, `storrelse_mm`, `farge`, `materiale`, `bilde`, `pris`) VALUES
(1, 'Rolex', 40, 'sølv', 'rustfritt stål', 'rolex_silver.jpg', 10000.00),
(2, 'Omega', 42, 'svart', 'rustfritt stål', 'omega_black.jpg', 8000.00),
(3, 'Tag Heuer', 32, 'hvit', 'rustfritt stål', 'tagheuer_white.jpg', 6000.00),
(4, 'Breitling', 41, 'hvit', 'gull', 'breitling_white.jpg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `produkt` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
