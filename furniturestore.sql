-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2022 at 05:32 AM
-- Server version: 5.7.9
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `furniturestore`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_about`
--

DROP TABLE IF EXISTS `tbl_about`;
CREATE TABLE IF NOT EXISTS `tbl_about` (
  `id` int(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  `detail` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_about`
--

INSERT INTO `tbl_about` (`id`, `name`, `detail`) VALUES
(1, 'Anjali ', 'Since the inception we have focused on delightful user experience by providing a range of hardware products. Products that have helped people build their lavish home. We have constantly invented & innovated new products by finding gaps in the market & solving customer problems.\r\n\r\nOur ranges of Hinges, Tower Bolts, Fittings & Glass Fittings have stood the test of time & performance with that confidence & trust we have embarked on a new journey of Bathroom Accessories to provide delightful bath experience...');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_addtocart`
--

DROP TABLE IF EXISTS `tbl_addtocart`;
CREATE TABLE IF NOT EXISTS `tbl_addtocart` (
  `cart_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL,
  `pro_id` int(5) NOT NULL,
  `pro_name` varchar(50) NOT NULL,
  `pro_price` int(6) NOT NULL,
  `image` varchar(50) NOT NULL,
  `quantity` int(10) NOT NULL,
  `size` varchar(50) NOT NULL,
  `totle` int(10) NOT NULL,
  `date` varchar(30) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_addtocart`
--

INSERT INTO `tbl_addtocart` (`cart_id`, `user_id`, `pro_id`, `pro_name`, `pro_price`, `image`, `quantity`, `size`, `totle`, `date`) VALUES
(59, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(82, 3, 9, 'Rectangle Towerbolt', 300, 'images/T-22rectangletowerbolt.jpg', 1, '12"', 300, '2022-03-21'),
(58, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(57, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(56, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(55, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(54, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(53, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(52, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(51, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(50, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(49, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(48, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(47, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(46, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(45, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(44, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(43, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(60, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(61, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(62, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(63, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(64, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(65, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(66, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(67, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(68, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(69, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(70, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(71, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20'),
(72, 3, 16, 'Cloth Hooks(Brass)', 500, 'images/S02-clothhooks.jpg', 1, '2"', 500, '2022-03-20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

DROP TABLE IF EXISTS `tbl_admin`;
CREATE TABLE IF NOT EXISTS `tbl_admin` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin'),
(2, 'sanjay', 'sanjay');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_billing`
--

DROP TABLE IF EXISTS `tbl_billing`;
CREATE TABLE IF NOT EXISTS `tbl_billing` (
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `product_id` varchar(5) NOT NULL,
  `name` varchar(40) NOT NULL,
  `image` varchar(40) NOT NULL,
  `price` int(10) NOT NULL,
  `pay-type` varchar(50) NOT NULL,
  `user_id` int(5) NOT NULL,
  `quentity` int(10) NOT NULL,
  `size` varchar(50) NOT NULL,
  `totle` int(10) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_billing`
--

INSERT INTO `tbl_billing` (`order_id`, `product_id`, `name`, `image`, `price`, `pay-type`, `user_id`, `quentity`, `size`, `totle`, `date`) VALUES
(2, '9', 'Rectangle Towerbolt', 'images/T-22rectangletowerbolt.jpg', 300, 'COD (case on Delivery)', 1, 1, '12"', 300, '2022-03-09'),
(3, '9', 'Rectangle Towerbolt', 'images/T-22rectangletowerbolt.jpg', 300, 'COD (case on Delivery)', 1, 1, '12"', 300, '2022-03-09'),
(13, '18', 'Bathroom Brass Hooks(v)', 'images/bathroomhooks-brasshooks5.jpg', 1500, 'COD (case on Delivery)', 2, 20, '5"', 1500, '2022-03-21'),
(14, '5', 'whinge', 'images/whinge.jpg', 500, 'COD (case on Delivery)', 2, 20, '52"', 500, '2022-03-21'),
(19, '8', 'Xylo Towerbolt', 'images/T-21xylotowerbolt.jpg', 500, 'Pay Later', 1, 50, '15"', 500, '2022-03-22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE IF NOT EXISTS `tbl_category` (
  `category_id` int(5) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_category`
--

INSERT INTO `tbl_category` (`category_id`, `category_name`) VALUES
(1, 'Hinges'),
(2, 'Towe Bolt'),
(3, 'Hooks'),
(4, 'Door Fitings'),
(9, 'Glass');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_contactus`
--

DROP TABLE IF EXISTS `tbl_contactus`;
CREATE TABLE IF NOT EXISTS `tbl_contactus` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `detail` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_contactus`
--

INSERT INTO `tbl_contactus` (`id`, `name`, `email`, `contact_no`, `detail`) VALUES
(1, 'frreree', 'refrefrer@ew.efe', 323234232, 'dfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(2, 'frreree', 'refrefrer@ew.efe', 323234232, 'dfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(3, 'frreree', 'refrefrer@ew.efe', 323234232, 'dfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(4, 'frreree', 'refrefrer@ew.efe', 323234232, 'dfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee'),
(5, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(6, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(7, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(8, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(9, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(10, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(11, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(12, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(13, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(14, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(15, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(16, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(17, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(18, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(19, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(20, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(21, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(22, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(23, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(24, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr'),
(25, 'hghghgfh', 'gfhgg@effef.efe', 4345435435, 'rtrtrtretrrrrrrrrrrrrr');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE IF NOT EXISTS `tbl_product` (
  `product_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `price` int(6) NOT NULL,
  `size` varchar(50) NOT NULL,
  `quantity` int(6) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(5) NOT NULL,
  `subcat_id` int(5) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `name`, `image`, `price`, `size`, `quantity`, `description`, `category_id`, `subcat_id`) VALUES
(1, 'Grand Hinges', 'images/grandhinges.jpg', 200, '12"', 3940, 'Using For Furniture', 1, 2),
(2, 'Lock washer Hinges', 'images/lockwasherhinges2.jpg', 450, '12"', 3240, 'Using for Door', 1, 1),
(3, 'lhinge', 'images/lhinge.jpg', 400, '12"', 500, 'Using Door Fitiong', 1, 1),
(5, 'whinge', 'images/whinge.jpg', 500, '52"', 15000, 'Using Door Fitiong', 1, 2),
(6, 'halfoverlayhinge', 'images/halfoverlayhinge.jpg', 500, '22"', 150, 'Using Door Fitiong', 1, 3),
(7, 'Georgean Towerbolt', 'images/T-15georgeantowerbolt.jpg', 500, '15"', 1500, 'Using Door Fitiong', 2, 4),
(8, 'Xylo Towerbolt', 'images/T-21xylotowerbolt.jpg', 500, '15"', 5450, 'Using Door', 2, 4),
(9, 'Rectangle Towerbolt', 'images/T-22rectangletowerbolt.jpg', 300, '12"', 100, 'Using Door Fitiong', 2, 5),
(10, 'Barrelbolt', 'images/T-26barrelbolt.jpg', 500, '52"', 1500, 'Using Door Fitiong', 2, 3),
(11, 'Skeletonbolt', 'images/T-28skeletonbolt.jpg', 650, '12"', 550, 'Using Door Fitiong', 2, 3),
(12, 'Marble', 'images/T-29marble.jpg', 400, '12"', 150, 'Using Door Fitiong', 2, 3),
(13, 'Cloth Hooks', 'images/D04-clothhooks.jpg', 500, '52"', 1500, 'Using Furniture Decoretion', 3, 1),
(14, 'Cloth Hooks(S.S)', 'images/D01-clothhooks.jpg', 400, '5"', 150, 'Using Furniture Decoretion', 3, 1),
(15, 'mmGlass', 'images/GC01-8mmglass.jpg', 450, '6"', 150, 'Using Furniture Decoretion', 3, 1),
(16, 'Cloth Hooks(Brass)', 'images/S02-clothhooks.jpg', 500, '2"', 500, 'Using Door Fitiong', 3, 3),
(17, 'Bathroom Brass Hooks', 'images/bathroomhooks-brasshooks.jpg', 1500, '5"', 500, 'Using Door Fitiong', 3, 3),
(18, 'Bathroom Brass Hooks(v)', 'images/bathroomhooks-brasshooks5.jpg', 1500, '5"', 500, 'Using Door Fitiong', 3, 3),
(28, 'Grand Hinges', 'images/grandhinges.jpg', 200, '12"', 4000, 'Using For Furniture', 1, 2),
(22, 'hyjt', 'images/', 65, '56', 5555, 'mjjmj', 7, 1),
(25, 'Agriyo', 'images/F-1aldrop.jpg', 500, '30', 300, 'using door loak', 2, 2),
(26, 'Agriyo', 'images/F-1aldrop.jpg', 500, '30', 300, 'using door loak', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subcategory`
--

DROP TABLE IF EXISTS `tbl_subcategory`;
CREATE TABLE IF NOT EXISTS `tbl_subcategory` (
  `subcategory_id` int(5) NOT NULL AUTO_INCREMENT,
  `category_id` int(5) NOT NULL,
  `subcat_name` varchar(50) NOT NULL,
  PRIMARY KEY (`subcategory_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subcategory`
--

INSERT INTO `tbl_subcategory` (`subcategory_id`, `category_id`, `subcat_name`) VALUES
(1, 1, 'Brass'),
(2, 1, 'S.S.'),
(4, 2, 'Brass(T)'),
(5, 2, 'S.S.(T)'),
(6, 3, 'Glass'),
(7, 3, 'Mate'),
(3, 1, 'Simple');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

DROP TABLE IF EXISTS `tbl_supplier`;
CREATE TABLE IF NOT EXISTS `tbl_supplier` (
  `sup_id` int(3) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`sup_id`, `sup_name`, `email`, `password`, `address`, `contact_no`) VALUES
(2, 'Syam', 'sup@gmail.com', '123', 'jamanger', 983483905);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_fullname` varchar(50) NOT NULL,
  `user_name` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact_no` bigint(20) NOT NULL,
  `address` text NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `user_fullname`, `user_name`, `password`, `email`, `contact_no`, `address`) VALUES
(1, 'Kaushal Tarpara', 'kdCode', '123', 'kasuhal@hotmail.com', 9924384635, '3/B pusherdham Soc,Ranjit Sager Road,Jamanger ,Gujrat-3610077'),
(2, 'Abhi Zakariya', 'abhi', '111', 'abhi@gmail.com', 9924384634, 'Jamnager'),
(3, 'Isha Chikliya', 'Isha', '12', 'isac12@gmail.com', 9924384635, 'Mota thavriya,Tower pase'),
(20, 'syam bhayani', 'Sam', '123', 'Sayambhayno@sam.com', 992333201, 'DevBhumi DaWarka'),
(22, 'Paranv Kanzariya', 'Paranv', '123', 'Parnavkanzariya@hotmail.com', 9923438434, 'null'),
(23, 'null', 'supplier1', '123', 'sup@gmai.com', 999, 'null');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
