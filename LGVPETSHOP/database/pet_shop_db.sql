-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2023 at 12:30 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_shop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `inventory_id` int(30) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `category` varchar(250) NOT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`, `status`, `date_created`) VALUES
(1, 'Food', 'Sample Description', 1, '2021-06-21 10:17:41'),
(4, 'Accessories', '&lt;p&gt;Sample Category&lt;/p&gt;', 1, '2021-06-21 16:34:04'),
(5, 'Dog', '&lt;p&gt;dog dog&lt;/p&gt;', 1, '2023-02-10 12:04:03'),
(6, 'Cats', '&lt;p&gt;&amp;nbsp;cat cat&lt;/p&gt;', 1, '2023-02-10 12:04:10');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(30) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `default_delivery_address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `firstname`, `lastname`, `gender`, `contact`, `email`, `password`, `default_delivery_address`, `date_created`) VALUES
(1, 'John', 'Smith', 'Male', '09123456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-06-21 16:00:23'),
(2, 'sorar', 'sorar', 'Male', '345345', 'eksiprime@gmail.com\r\n', '29f2cff5b14239e3df4c2ac279f05712', 'asdasdasdasda', '2023-02-10 14:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` float NOT NULL,
  `size` varchar(250) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `unit`, `price`, `size`, `date_created`, `date_updated`) VALUES
(1, 1, 50, 'pcs', 250, 'M', '2021-06-21 13:01:30', '2021-06-21 13:05:23'),
(2, 1, 20, 'Sample', 300, 'L', '2021-06-21 13:07:00', NULL),
(3, 4, 150, 'pcs', 500, 'M', '2021-06-21 16:50:37', NULL),
(4, 3, 50, 'pack', 150, 'M', '2021-06-21 16:51:12', NULL),
(5, 5, 30, 'pcs', 50, 'M', '2021-06-21 16:51:35', NULL),
(6, 4, 10, 'pcs', 550, 'L', '2021-06-21 16:51:54', NULL),
(7, 6, 100, 'pcs', 150, 'S', '2021-06-22 15:50:47', NULL),
(8, 6, 150, 'pcs', 180, 'M', '2021-06-22 15:51:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `transaction_id` text NOT NULL,
  `image` text NOT NULL,
  `reference` text NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` date NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `yearly` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `transaction_id`, `image`, `reference`, `client_id`, `delivery_address`, `payment_method`, `amount`, `status`, `paid`, `date_created`, `date_updated`, `yearly`) VALUES
(28, '1063e60b70aa803', 'uploads/images (2).png', '33333', 2, 'asdasdasdasda', 'cod', 500, 3, 1, '2023-02-10', '2023-02-10 18:19:39', 2023),
(29, '1063e60bec9fbe6', 'uploads/index.jpg', '3333333', 2, 'asdasdasdasda', 'gcash', 500, 3, 1, '2023-02-22', '2023-02-10 18:19:51', 2023),
(30, '1063e60c10afe3d', 'uploads/index.jpg', '122222222222', 2, 'asdasdasdasda', 'gcash', 50, 0, 1, '2023-02-10', '2023-02-10 18:19:41', 2023),
(31, '1063e619a2f019c', 'uploads/index.jpg', '324234234', 2, 'asdasdasdasda', 'gcash', 500, 0, 1, '2023-02-10', '2023-02-10 18:17:18', 2011),
(32, '1063e619c760297', '', '', 2, 'asdasdasdasda', 'cod', 500, 0, 0, '2023-02-10', NULL, 2023),
(33, '1063e619d4d5563', 'uploads/index.jpg', '345353535', 2, 'asdasdasdasda', 'gcash', 500, 3, 1, '2023-04-12', '2023-02-10 18:19:14', 2023),
(34, '1063e790f543236', 'uploads/businessman-icon-vector-male-avatar-profile-image-profile-businessman-icon-vector-male-avatar-profile-image-182095609.jpg', '123456789', 2, 'asdasdasdasda', 'gcash', 500, 0, 1, '2023-02-11', '2023-02-11 20:59:10', 2023),
(35, '1063e888918eb35', '', '', 2, 'asdasdasdasda', 'gcash', 1000, 0, 0, '2023-02-12', NULL, 2023),
(36, '1063e888d200ed3', '', '', 2, 'asdasdasdasda', '', 500, 0, 0, '2023-02-12', NULL, 2023),
(37, '1063e96cee0a388', '', '', 2, 'asdasdasdasda', '', 150, 0, 0, '2023-02-13', NULL, 2023);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(20) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `size`, `unit`, `quantity`, `price`, `total`) VALUES
(21, 20, 1, 'M', 'pcs', 1, 250, 250),
(22, 21, 4, 'M', 'pcs', 1, 500, 500),
(23, 22, 4, 'M', 'pcs', 1, 500, 500),
(24, 23, 4, 'M', 'pcs', 1, 500, 500),
(25, 24, 4, 'M', 'pcs', 1, 500, 500),
(26, 25, 4, 'M', 'pcs', 1, 500, 500),
(27, 26, 4, 'M', 'pcs', 1, 500, 500),
(28, 27, 4, 'M', 'pcs', 1, 500, 500),
(29, 28, 4, 'M', 'pcs', 1, 500, 500),
(30, 29, 4, 'M', 'pcs', 1, 500, 500),
(31, 30, 5, 'M', 'pcs', 1, 50, 50),
(32, 31, 4, 'M', 'pcs', 1, 500, 500),
(33, 32, 4, 'M', 'pcs', 1, 500, 500),
(34, 33, 4, 'M', 'pcs', 1, 500, 600),
(35, 33, 4, 'M', 'pcs', 1, 500, 500),
(36, 33, 4, 'M', 'pcs', 2, 500, 1000),
(37, 36, 4, 'M', 'pcs', 1, 500, 500),
(38, 37, 6, 'S', 'pcs', 1, 150, 150);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `product_name`, `description`, `status`, `date_created`) VALUES
(1, 1, 1, 'Dog Food 101', '&lt;p&gt;Sample Product&amp;nbsp;&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dolor felis, mattis sit amet turpis eu, porta efficitur arcu. Ut orci est, posuere a mi sed, sollicitudin volutpat nisl. Vestibulum aliquam condimentum dictum. Sed a lobortis dolor, nec molestie nulla. Quisque purus justo, fermentum sed commodo in, hendrerit non nisi. In eleifend diam at pellentesque tempor. Mauris a augue ultrices, vulputate ipsum ac, lobortis eros. Nulla tempor odio sit amet magna finibus dignissim vitae eu turpis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Proin nec semper nisi. Aenean varius purus at eros aliquam, non luctus eros interdum. Etiam non nisl ut lacus semper ornare sed iaculis justo. Mauris justo mauris, faucibus sit amet pharetra at, accumsan quis felis. Nulla gravida elementum porttitor. Vestibulum blandit semper ligula sit amet laoreet. Aliquam a est consectetur, blandit odio ultricies, finibus enim. Sed gravida pretium elit, et bibendum est dignissim sed. Aliquam ultrices felis a arcu feugiat, vel porta neque luctus. Vivamus dignissim porttitor nulla, non pulvinar nulla blandit a. Sed nisi leo, volutpat in nibh sit amet, laoreet semper massa.&lt;/p&gt;', 1, '2021-06-21 11:19:31'),
(3, 1, 3, 'Cat Food 101', '&lt;p&gt;Cat Food 101&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Sed interdum odio a efficitur volutpat. Etiam porta erat ut quam feugiat iaculis. Nam tincidunt sem metus, quis mattis nisl iaculis id. Aliquam vehicula auctor facilisis. Etiam tincidunt id velit sed pulvinar. Mauris mi est, varius in mauris ut, rhoncus congue nisi. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Fusce mollis arcu mauris, tempor fermentum odio vehicula nec. Morbi sit amet dui mollis, sodales dolor vel, efficitur tortor. Nam vel pretium lectus. Morbi ultricies magna eget libero bibendum posuere. Ut ultrices tellus ac enim egestas feugiat.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Mauris faucibus, erat porta auctor porttitor, ligula leo ornare sem, eu dignissim diam massa a purus. Praesent et faucibus metus. Nulla iaculis enim nec efficitur consectetur. Sed vehicula purus neque, quis luctus odio varius non. Sed hendrerit leo et velit ultricies, eget venenatis elit ornare. Pellentesque nec tincidunt nunc. Donec fringilla tristique lectus, vitae malesuada massa mollis ut. Nulla eleifend ac ligula vel rutrum.&lt;/p&gt;', 1, '2021-06-21 16:48:16'),
(4, 4, 4, 'Dog bed', '&lt;p&gt;Sample&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Proin nec semper nisi. Aenean varius purus at eros aliquam, non luctus eros interdum. Etiam non nisl ut lacus semper ornare sed iaculis justo. Mauris justo mauris, faucibus sit amet pharetra at, accumsan quis felis. Nulla gravida elementum porttitor. Vestibulum blandit semper ligula sit amet laoreet. Aliquam a est consectetur, blandit odio ultricies, finibus enim. Sed gravida pretium elit, et bibendum est dignissim sed. Aliquam ultrices felis a arcu feugiat, vel porta neque luctus. Vivamus dignissim porttitor nulla, non pulvinar nulla blandit a. Sed nisi leo, volutpat in nibh sit amet, laoreet semper massa.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:49:07'),
(5, 4, 5, 'Cat  Plates 623', '&lt;p&gt;&lt;span style=&quot;text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras dolor felis, mattis sit amet turpis eu, porta efficitur arcu. Ut orci est, posuere a mi sed, sollicitudin volutpat nisl. Vestibulum aliquam condimentum dictum. Sed a lobortis dolor, nec molestie nulla. Quisque purus justo, fermentum sed commodo in, hendrerit non nisi. In eleifend diam at pellentesque tempor. Mauris a augue ultrices, vulputate ipsum ac, lobortis eros. Nulla tempor odio sit amet magna finibus dignissim vitae eu turpis.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 1, '2021-06-21 16:50:11'),
(6, 4, 4, 'Dog Belt', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas dui nulla, tincidunt in arcu at, vulputate volutpat velit. Quisque volutpat gravida erat, gravida porttitor magna malesuada sed. Curabitur massa est, ullamcorper a diam vitae, tincidunt sagittis justo. Nam eu orci ligula. Duis ullamcorper dui at nisi consequat, sed suscipit sapien lacinia. Praesent ut lacus id arcu bibendum egestas. Cras ullamcorper dictum mi, non commodo mauris iaculis a. Pellentesque porta sem id dapibus tincidunt. Aenean metus tellus, efficitur ut feugiat in, euismod et arcu. In pharetra, dolor in fermentum facilisis, metus urna lacinia metus, in maximus justo tellus et tortor. Nam pulvinar eu enim auctor pellentesque.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;&quot;&gt;Nam ut quam velit. Suspendisse commodo non urna nec dictum. Pellentesque eget enim id velit bibendum auctor vel id lectus. Maecenas dolor nibh, ultricies eget metus vel, efficitur varius tellus. Donec semper eros sit amet urna bibendum scelerisque. Interdum et malesuada fames ac ante ipsum primis in faucibus. Integer cursus est in sapien sodales, quis pulvinar nisl aliquet. Pellentesque blandit diam lobortis pulvinar ornare. Sed venenatis imperdiet massa, ut mollis sapien sagittis a. Nulla dignissim ultrices metus a mattis. Nunc egestas mattis nisl at posuere. Donec malesuada ut justo sed aliquam. Sed venenatis sit amet tortor et semper. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus sit amet massa at massa malesuada volutpat quis nec libero.&lt;/p&gt;', 1, '2021-06-22 15:50:16');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `order_id`, `total_amount`, `date_created`) VALUES
(1, 1, 1100, '2021-06-22 13:48:54'),
(2, 2, 750, '2021-06-22 15:26:07'),
(4, 4, 500, '2023-02-10 14:21:14'),
(5, 5, 500, '2023-02-10 14:22:07'),
(6, 6, 500, '2023-02-10 14:33:18'),
(7, 7, 500, '2023-02-10 14:34:19'),
(8, 8, 500, '2023-02-10 14:34:53'),
(9, 9, 500, '2023-02-10 14:35:20'),
(10, 10, 500, '2023-02-10 14:37:14'),
(11, 11, 500, '2023-02-10 14:37:47'),
(12, 12, 500, '2023-02-10 14:57:03'),
(13, 13, 500, '2023-02-10 15:18:56'),
(14, 14, 500, '2023-02-10 15:21:34'),
(15, 15, 500, '2023-02-10 15:40:19'),
(16, 16, 500, '2023-02-10 15:41:23'),
(17, 17, 500, '2023-02-10 15:56:07'),
(18, 18, 500, '2023-02-10 15:58:28'),
(19, 19, 500, '2023-02-10 16:19:17'),
(20, 20, 250, '2023-02-10 16:22:13'),
(21, 21, 500, '2023-02-10 17:02:35'),
(22, 22, 500, '2023-02-10 17:03:39'),
(23, 23, 500, '2023-02-10 17:09:37'),
(24, 24, 500, '2023-02-10 17:12:42'),
(25, 25, 500, '2023-02-10 17:13:26'),
(26, 26, 500, '2023-02-10 17:14:15'),
(27, 27, 500, '2023-02-10 17:15:38'),
(28, 28, 500, '2023-02-10 17:16:34'),
(29, 29, 500, '2023-02-10 17:18:38'),
(30, 30, 50, '2023-02-10 17:19:17'),
(31, 31, 500, '2023-02-10 18:17:09'),
(32, 32, 500, '2023-02-10 18:17:45'),
(33, 33, 500, '2023-02-10 18:17:58'),
(34, 34, 500, '2023-02-11 20:58:44'),
(35, 35, 1000, '2023-02-12 14:34:59'),
(36, 36, 500, '2023-02-12 14:36:03'),
(37, 37, 150, '2023-02-13 06:49:20');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(30) NOT NULL,
  `size` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`) VALUES
(1, 'xs'),
(2, 's'),
(3, 'm'),
(4, 'l'),
(5, 'xl'),
(6, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(30) NOT NULL,
  `parent_id` int(30) NOT NULL,
  `sub_category` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `parent_id`, `sub_category`, `description`, `status`, `date_created`) VALUES
(1, 1, 'Dog Food', '&lt;p&gt;Sample only&lt;/p&gt;', 1, '2021-06-21 10:58:32'),
(3, 1, 'Cat Food', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:34:59'),
(4, 4, 'Dog Needs', '&lt;p&gt;Sample&amp;nbsp;&lt;/p&gt;', 1, '2021-06-21 16:35:26'),
(5, 4, 'Cat Needs', '&lt;p&gt;Sample&lt;/p&gt;', 1, '2021-06-21 16:35:36'),
(6, 5, 'dog', '&lt;p&gt;dogdog&lt;br&gt;&lt;/p&gt;', 1, '2023-02-10 12:04:26'),
(7, 6, 'cats', '&lt;p&gt;cats&amp;nbsp;cats&lt;br&gt;&lt;/p&gt;', 1, '2023-02-10 12:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Pet Shop Food and Accessories Shop'),
(6, 'short_name', 'LGV'),
(11, 'logo', 'uploads/1624240440_paw.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1676016900_328657780_606676501268243_7721424924316346506_n.jpg', NULL, 1, '2021-01-20 14:02:37', '2023-02-10 16:15:04'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23'),
(11, 'admin2', 'admin2', 'admin2', 'c84258e9c39059a89ab77d846ddab909', NULL, NULL, 1, '2023-02-11 20:56:47', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
