-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2021 at 11:03 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `daf`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) NOT NULL,
  `User Id` int(10) NOT NULL,
  `Total price` float NOT NULL,
  `Status` enum('accepted','rejected') COLLATE utf8_unicode_ci NOT NULL,
  `Created at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `User Id`, `Total price`, `Status`, `Created at`) VALUES
(1, 1, 200.2, 'accepted', '2021-05-17 20:09:37'),
(3, 1, 5000, 'rejected', '2021-05-17 20:44:10');

-- --------------------------------------------------------

--
-- Table structure for table `order details`
--

CREATE TABLE `order details` (
  `id` int(11) NOT NULL,
  `Order id` int(10) NOT NULL,
  `Quantity` int(10) NOT NULL,
  `Created at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order details`
--

INSERT INTO `order details` (`id`, `Order id`, `Quantity`, `Created at`) VALUES
(1, 1, 2, '2021-05-17 20:09:56');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `price` float NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `product_name`, `price`, `quantity`) VALUES
(1, 'labtop hp ', 5000, 100),
(2, 'labtop dell ', 8000, 200),
(3, 'mobile samsung ', 4500, 400),
(4, 'Iphone', 13000, 2000),
(6, 'tv', 5000, 200);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `First name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Middle name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Last name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Phone number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `Created at` datetime NOT NULL DEFAULT current_timestamp(),
  `Token` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `First name`, `Middle name`, `Last name`, `Email`, `password`, `Phone number`, `Created at`, `Token`) VALUES
(1, 'Amr', 'Hossam', 'Elfadiel', 'amrhossam60@hotmail.com', '1234', '01095047883', '2021-05-17 20:08:04', 'eyJhbGciOiJIUzI1NiJ9.YW1yaG9zc2FtNjBAaG90bWFpbC5jb20.hnlZFfzQAzn2szxrUKF6OopgpurHPZsxv68Q482RaXE'),
(2, 'aya', 'ali', 'ahmed', 'aya@test.com', '1234', '01020304050', '2021-05-17 21:31:35', 'eyJhbGciOiJIUzI1NiJ9.YXlhQHRlc3QuY29t.2m4L672GxION0zvrzLRHUL6qO1KXdvZUR39ZZeY_-GQ');

-- --------------------------------------------------------

--
-- Table structure for table `user orders`
--

CREATE TABLE `user orders` (
  `id` int(11) NOT NULL,
  `Order id` int(10) NOT NULL,
  `User id` int(10) NOT NULL,
  `Created at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user orders`
--

INSERT INTO `user orders` (`id`, `Order id`, `User id`, `Created at`) VALUES
(1, 1, 1, '2021-05-17 20:10:08');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `User Id` (`User Id`);

--
-- Indexes for table `order details`
--
ALTER TABLE `order details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order id` (`Order id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user orders`
--
ALTER TABLE `user orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order id` (`Order id`),
  ADD KEY `User id` (`User id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order details`
--
ALTER TABLE `order details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user orders`
--
ALTER TABLE `user orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`User Id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order details`
--
ALTER TABLE `order details`
  ADD CONSTRAINT `order details_ibfk_1` FOREIGN KEY (`Order id`) REFERENCES `order` (`id`);

--
-- Constraints for table `user orders`
--
ALTER TABLE `user orders`
  ADD CONSTRAINT `user orders_ibfk_1` FOREIGN KEY (`Order id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `user orders_ibfk_2` FOREIGN KEY (`User id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
