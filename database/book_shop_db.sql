-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2022 at 12:05 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_shop_db`
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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_id`, `inventory_id`, `price`, `quantity`, `date_created`) VALUES
(15, 2, 9, 80000, 5, '2022-05-01 14:38:43');

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
(5, 'Sách ngoại ngữ', '', 1, '2022-02-25 14:32:54'),
(6, 'Sách cấp I', '', 1, '2022-02-25 14:33:07'),
(7, 'Sách cấp II', '', 1, '2022-02-25 14:33:19'),
(8, 'Sách cấp III', '', 1, '2022-02-25 14:33:45'),
(9, 'Sách thiếu nhi', '', 1, '2022-02-25 14:34:02'),
(10, 'Sách văn học', '', 1, '2022-02-25 14:34:13'),
(11, 'Sách kinh doanh', '', 1, '2022-02-25 14:41:45'),
(12, 'Từ điển', '', 1, '2022-02-25 14:41:54'),
(13, 'Văn Hóa Tâm Linh - Phong Thủy', '', 1, '2022-02-25 14:42:20'),
(14, 'Sách Đời Sống', '', 1, '2022-02-25 14:42:33'),
(15, 'Sách Luyện Thi THPT Quốc Gia', '', 1, '2022-02-25 14:42:55'),
(16, 'Sách Y Học', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 1, '2022-02-25 14:43:03');

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
(1, 'John', 'Smith', 'Male', '091023456789', 'jsmith@sample.com', '1254737c076cf867dc53d60a0364f38e', 'Sample Address', '2021-07-16 10:34:48'),
(2, 'Tạ Phạm', 'Đức Anh', 'Male', '0912345678', 'taphamducanh@gmail.com', 'ab775e0f387a7737ee34b72cd1d516be', '11 Vũ Ngọc Phan, Láng Hạ, Hà Nội', '2022-02-15 21:25:37'),
(3, 'Tạ Phạm', 'Anh', 'Nam', '0912345678', '1801040011@s.hanu.edu.vn', 'a695e77fd76251ba14f60a3d44674fc8', 'ádasfd', '2022-04-15 16:35:13'),
(4, 'Trần', 'Thị Minh', '', '0912890087', 'tathithanhxuan1963@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 'Hà Nội', '2022-04-27 15:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` double NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `quantity`, `price`, `date_created`, `date_updated`) VALUES
(5, 7, 50, 105000, '2022-02-26 11:57:17', '2022-02-26 11:57:42'),
(6, 8, 50, 35000, '2022-02-26 11:57:59', NULL),
(7, 9, 50, 85000, '2022-02-26 11:58:21', NULL),
(8, 10, 50, 70000, '2022-02-26 11:59:01', NULL),
(9, 11, 50, 80000, '2022-02-26 11:59:25', NULL),
(10, 12, 50, 79000, '2022-02-26 11:59:37', NULL),
(11, 13, 50, 125000, '2022-02-26 11:59:52', NULL),
(12, 14, 500, 100000, '2022-02-26 12:00:02', '2022-03-12 14:22:58');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `client_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  `order_type` tinyint(1) NOT NULL COMMENT '1= pickup,2= deliver',
  `amount` double NOT NULL,
  `status` tinyint(2) NOT NULL DEFAULT 0,
  `paid` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `client_id`, `delivery_address`, `payment_method`, `order_type`, `amount`, `status`, `paid`, `date_created`, `date_updated`) VALUES
(6, 2, '11 Vũ Ngọc Phan, Láng Hạ, Hà Nội', 'cod', 2, 105000, 0, 0, '2022-04-01 19:47:46', NULL),
(7, 2, '', 'cod', 2, 100000, 0, 0, '2022-04-01 19:48:28', NULL),
(8, 2, '', 'cod', 1, 245000, 3, 1, '2022-04-15 16:45:12', '2022-04-15 16:51:14'),
(9, 2, '11 Vũ Ngọc Phan, Láng Hạ, Hà Nội', 'cod', 2, 160000, 0, 0, '2022-05-01 14:33:59', NULL),
(10, 2, 'Hà Nội', 'cod', 1, 200000, 0, 0, '2022-05-01 14:37:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `quantity` int(30) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `quantity`, `price`, `total`) VALUES
(6, 6, 7, 1, 105000, 105000),
(7, 7, 14, 1, 100000, 100000),
(8, 8, 8, 3, 35000, 105000),
(9, 8, 10, 2, 70000, 140000),
(10, 9, 11, 2, 80000, 160000),
(11, 10, 14, 2, 100000, 200000);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `sub_category_id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `sub_category_id`, `title`, `author`, `description`, `status`, `date_created`) VALUES
(7, 5, 8, 'Ngữ pháp tiếng Anh (Lý thuyết và bài tập thực hành)', 'Trần Mạnh Tường', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Ngữ ph&aacute;p tiếng Anh l&yacute; thuyết v&agrave; b&agrave;i tập thực h&agrave;nh english grammar&amp;nbsp; đề cập đến những vấn đề ngữ ph&aacute;p th&ocirc;ng dụng, cần thiết cho người học tiếng Anh ở mọi tr&igrave;nh độ. Với lượng kiến thức đầy đủ, phương ph&aacute;p tr&igrave;nh b&agrave;y khoa học, r&otilde; r&agrave;ng, dễ hiểu, k&egrave;m theo phần ghi ch&uacute;, giải th&iacute;chục&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; - Chinh phục 22 chuy&ecirc;n đề ngữ ph&aacute;p tiếng Anh&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; - Luyện tập hơn 1000 b&agrave;i tập k&egrave;m đ&aacute;p &aacute;n&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; - Tr&igrave;nh b&agrave;y khoa học, r&otilde; r&agrave;ng, dễ hiểu&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; - D&agrave;nh cho c&aacute;c bạn học sinh, sinh vi&ecirc;n, luyện thi THPT Quốc gia&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; - T&agrave;i liệu tham khảo cho gi&aacute;o vi&ecirc;n&lt;/span&gt;&lt;/div&gt;', 1, '2022-02-26 11:40:06'),
(8, 5, 8, 'The langmaster - 360 động từ bất quy tắc và cách dùng thì tiếng Anh (tái bản lần thứ 04)', 'Nguyễn Thị Thu Huế', '&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Cuốn s&aacute;ch n&agrave;y sẽ cho c&aacute;c bạn một c&aacute;i nh&igrave;n cụ thể về động từ bất quy tắc trong tiếng Anh, c&aacute;ch sử dụng, c&aacute;ch ghi nhớ cũng như những động từ bất quy tắc th&ocirc;ng dụng nhất.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&lt;strong style=\\&quot;outline: none;\\&quot;&gt;Nội dung ch&iacute;nh của cuốn s&aacute;ch:&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&bull; Giới thiệu 360 động từ bất quy tắc v&agrave; c&aacute;ch sử dụng c&aacute;c th&igrave; trong tiếng Anh&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&bull; V&iacute; dụ minh họa cho 360 động từ bất quy tắc&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&bull; Gi&uacute;p người học c&oacute; thể vượt qua trở ngại về ngữ ph&aacute;p v&agrave; c&aacute;ch ứng dụng, từng bước n&acirc;ng cao khả năng tiếng Anh&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&bull; L&agrave; nguồn t&agrave;i liệu gi&uacute;p bạn đọc dễ d&agrave;ng tra cứu v&agrave; tham khảo&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;C&ugrave;ng tham khảo cuốn s&aacute;ch để nắm vững 360 động từ bất quy tắc trong tiếng Anh nh&eacute;.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&lt;em style=\\&quot;outline: none;\\&quot;&gt;Ch&uacute;c c&aacute;c bạn th&agrave;nh c&ocirc;ng!&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;', 1, '2022-02-26 11:42:55'),
(9, 5, 9, '301 câu đàm thoại tiếng hoa (tái bản)', 'Trần Thị Thanh Liêm', '&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp;- Gi&aacute;o tr&igrave;nh \\&quot;301 c&acirc;u đ&agrave;m thoại tiếng Hoa\\&quot; được bi&ecirc;n dịch v&agrave; bổ sung dựa tr&ecirc;n cơ sở cuốn s&aacute;ch gi&aacute;o khoa \\&quot; H&aacute;n ngữ hội thoại 301\\&quot; do c&aacute;c chuy&ecirc;n gia H&aacute;n ngữ của học viện ng&ocirc;n ngữ Bắc kinh bi&ecirc;n soạn.&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;&amp;nbsp;- Gi&aacute;o tr&igrave;nh gồm 48 b&agrave;i trong đ&oacute; c&oacute; 8 b&agrave;i &ocirc;n tập, bao qu&aacute;t tr&ecirc;n 800 từ thường d&ugrave;ng. Nội dung c&aacute;c b&agrave;i tập gồm c&aacute;c phần \\&quot;Mẫu c&acirc;u\\&quot;, \\&quot;Đ&agrave;m thoại\\&quot;, \\&quot;Từ mới\\&quot;, \\&quot;Ch&uacute; &yacute; từ ngữ\\&quot;, \\&quot;Ngữ ph&aacute;p\\&quot;, \\&quot;b&agrave;i tập\\&quot;...&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;- Gi&aacute;o tr&igrave;nh bi&ecirc;n soạn theo hướng \\&quot;mẫu c&acirc;u\\&quot; để đi v&agrave;o thực h&agrave;nh giao tiếp, nhưng cũng giới thiếu kh&aacute;i qu&aacute;t cấu tr&uacute;c ngữ ph&aacute;p của tiếng H&aacute;n hiện đại.&lt;/span&gt;&lt;/div&gt;', 1, '2022-02-26 11:46:00'),
(10, 5, 9, 'Vocabulary Khám phá từ vựng HSK - Cấp 1~3', 'Trung tâm nghiên cứu phát triển tiếng Hán Quốc Tế', '&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Bộ s&aacute;ch &ldquo;Hệ thống kh&aacute;m ph&aacute; từ vựng HSK&rdquo; từ khi xuất bản năm 2011 đ&atilde; nhận được sự y&ecirc;u th&iacute;ch của rất nhiều th&iacute; sinh thi HSK v&agrave; gi&aacute;o vi&ecirc;n giảng dạy. Lượng ti&ecirc;u thụ lu&ocirc;n đứng h&agrave;ng đầu trong d&ograve;ng s&aacute;ch &ocirc;n tập HSK, mỗi cấp đều được t&aacute;i bản nhiều lần. Để đ&aacute;p ứng theo y&ecirc;u cầu của đại cương mới, đồng thời kết hợp với nhiều &yacute; kiến đ&oacute;ng g&oacute;p qu&yacute; b&aacute;u của lượng lớn độc giả đối với bản in lần thứ nhất, ch&uacute;ng t&ocirc;i đ&atilde; chỉnh l&yacute; v&agrave; bi&ecirc;n tập lại bộ s&aacute;ch &ldquo;Hệ thống kh&aacute;m ph&aacute; từ vựng HSK&rdquo; bản thứ 2 n&agrave;y.&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Bộ sổ tay n&agrave;y do c&aacute;c gi&aacute;o vi&ecirc;n c&oacute; kinh nghiệm giảng dạy HSK phong ph&uacute; bi&ecirc;n tập, nội dung bao gồm c&aacute;c từ vựng từ cấp 1 đến cấp 6 trong đại cương từ vựng HSK.&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Nội dung v&agrave; trật tự sắp xếp trong cuốn &ldquo;Khai ph&aacute; từ vựng HSK cấp 1-3&rdquo; lu&ocirc;n t&iacute;nh to&aacute;n đến nhu cầu của người học. Về mặt nội dung, cuốn s&aacute;ch n&agrave;y tu&acirc;n thủ nghi&ecirc;m ngặt c&aacute;c từ vựng thu thập trong đại cương HSK cấp 1-3 bản mới, để c&oacute; thể đ&aacute;p ứng được nhu cầu chuẩn bị cho k&igrave; thi HSK cấp 1-3. Về mặt thể lệ thiết kế, cuốn s&aacute;ch đưa th&ecirc;m phần phi&ecirc;n &acirc;m tiếng H&aacute;n v&agrave; nghĩa tiếng Việt của từ mới, từ ngữ kết hợp thường d&ugrave;ng v&agrave; c&aacute;c c&acirc;u v&iacute; dụ. Một số từ mới c&ograve;n đưa th&ecirc;m cả phần từ mở rộng (từ ngữ r&uacute;t gọn), từ đồng nghĩa hoặc từ tr&aacute;i nghĩa. Trong đ&oacute;, từ ngữ kết hợp thường d&ugrave;ng c&oacute; nguồn gốc từ c&aacute;c đề thi thực tế của HSK, để tiện cho th&iacute; sinh l&agrave;m quen trước với việc thi cử. C&aacute;c c&acirc;u v&iacute; dụ cố gắng kh&ocirc;ng xuất hiện từ kh&oacute;, nhưng do lượng từ vựng m&agrave; HSK cấp 1-3 y&ecirc;u cầu nắm vững c&ograve;n &iacute;t n&ecirc;n trong c&acirc;u c&oacute; thể xuất hiện một số &iacute;t từ thường d&ugrave;ng trong cuộc sống, tuy nhi&ecirc;n những từ n&agrave;y đều c&oacute; phi&ecirc;n &acirc;m v&agrave; nghĩa tiếng Việt n&ecirc;n cũng kh&ocirc;ng tăng th&ecirc;m kh&oacute; khăn cho th&iacute; sinh trong học tập, m&agrave; tr&aacute;i lại c&ograve;n c&oacute; thể mở rộng lượng từ vựng cho th&iacute; sinh.&amp;nbsp;&lt;/span&gt;&lt;/div&gt;&lt;div style=\\&quot;outline: none; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Cuốn sổ tay từ vựng n&agrave;y như một cuốn từ điển nhỏ mang b&ecirc;n m&igrave;nh, kh&ocirc;ng những th&iacute;ch hợp cho th&iacute; sinh tham gia thi tuyển HSK tăng cường r&egrave;n luyện trước kỳ thi, m&agrave; c&ograve;n th&iacute;ch hợp cho những người học tiếng H&aacute;n kh&aacute;c tra từ, c&oacute; thể gi&uacute;p cho người học tiếng H&aacute;n nhanh ch&oacute;ng nắm vững được từ vựng tiếng H&aacute;n&lt;/span&gt;&lt;/div&gt;', 1, '2022-02-26 11:47:59'),
(11, 5, 10, 'Tiếng nhật dành cho nhân viên văn phòng', 'Hoàng Quỳnh', '&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;- C&aacute;c tuyệt chi&ecirc;u giao tiếp trong c&ocirc;ng việc&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;-C&aacute;c t&igrave;nh huống trong giao tiếp với đồng nghiệp v&agrave; đối t&aacute;c&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;-Ph&ugrave; hợp với nh&acirc;n vi&ecirc;n văn ph&ograve;ng&lt;/span&gt;&lt;/p&gt;', 1, '2022-02-26 11:49:36'),
(12, 5, 10, '5500 từ vựng tiếng Nhật thông dụng', 'Thanh Xuân', '&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Học tiếng Nhật bạn phải chăm học từ vựng v&agrave; phải c&oacute; phương ph&aacute;p học ph&ugrave; hợp, phải nhớ mặt chữ, nghĩa của từ v&agrave; biết c&aacute;ch viết sao cho đ&uacute;ng. Bạn sẽ dễ qu&ecirc;n ngay sau khi học nếu kh&ocirc;ng xem lại b&agrave;i.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Đọc l&agrave; một phương ph&aacute;p dễ thực hiện v&agrave; mang t&iacute;nh thư gi&atilde;n, n&oacute; sẽ gi&uacute;p bạn n&acirc;ng cao kỹ năng ng&ocirc;n ngữ của m&igrave;nh.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Hiểu ngữ cảnh: Vậy l&agrave; bạn đ&atilde; học được rất nhiều từ mới, nhưng nếu bạn kh&ocirc;ng hiểu phải sử dụng ch&uacute;ng như thế n&agrave;o v&agrave; khi n&agrave;o, th&igrave; bạn vẫn chưa ho&agrave;n to&agrave;n được coi l&agrave; đ&atilde; học được từ đ&oacute; đ&acirc;u.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Ghi ch&uacute;: Một b&iacute; quyết khi bạn nghe thấy một từ hoặc một c&acirc;u trong một bộ phim hoặc một b&agrave;i h&aacute;t m&agrave; bạn cảm thấy th&iacute;ch, bạn c&oacute; thể viết n&oacute; v&agrave;o sổ.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Ch&uacute;ng t&ocirc;i bi&ecirc;n soạn cuốn: 5500 từ vựng tiếng Nhật th&ocirc;ng dụng nhằm gi&uacute;p bạn n&acirc;ng cao vốn từ vựng của m&igrave;nh.&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Cuốn s&aacute;ch gồm c&aacute;c từ vựng th&ocirc;ng dụng v&agrave; cơ bản nhất, mỗi từ vựng lại c&oacute; c&aacute;c v&iacute; dụ minh hoạ gi&uacute;p bạn hiểu nghĩa s&acirc;u hơn.&lt;/span&gt;&lt;/p&gt;', 1, '2022-02-26 11:50:30'),
(13, 5, 11, 'Ngữ pháp tiếng hàn hiện đại', 'Nguyên Thảo', '', 1, '2022-02-26 11:54:16'),
(14, 5, 11, 'Học giao tiếp tiếng hàn qua tranh (sách bản quyền)', 'Baggeumju', '&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Khi nhu cầu nh&acirc;n lực tiếng h&agrave;n tăn l&ecirc;n , nhiều người muốn đi học tiếng H&agrave;n . Tuy nhi&ecirc;n , nếu muốn đi học để đem kết quả thực sự v&agrave; khả năng ứng dụng cao trong c&ocirc;ng việc đ&ograve;i hỏi cả một qu&aacute; tr&igrave;nh v&agrave; sự cố gắng . Ng&ocirc;n ngữ kh&ocirc;ng phải l&agrave; thứ dễ d&agrave;ng , nhất l&agrave; khi bạn kh&ocirc;ng s&ocirc;ng ở tại đất nước bản địa .&amp;nbsp;&lt;/span&gt;&lt;/p&gt;&lt;p style=\\&quot;outline: none; line-height: 18px; color: rgb(85, 85, 85); font-family: Arial, Helvetica, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\\&quot;&gt;&lt;span style=\\&quot;outline: none; font-size: 16px;\\&quot;&gt;Bạn đừng lo , c&oacute; ch&uacute;ng t&ocirc;i gi&uacute;p bạn giải quyết tất cả c&aacute;c l&yacute; do v&agrave; vấn đề đ&oacute; .&amp;nbsp;&lt;/span&gt;&lt;/p&gt;', 1, '2022-02-26 11:55:28');

-- --------------------------------------------------------

--
-- Table structure for table `products_rating`
--

CREATE TABLE `products_rating` (
  `review_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_rating` int(1) NOT NULL,
  `user_review` text NOT NULL,
  `datetime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_rating`
--

INSERT INTO `products_rating` (`review_id`, `user_name`, `user_rating`, `user_review`, `datetime`) VALUES
(7, 'Đức Anh', 5, 'Tốt', 1652004090),
(8, 'Đức Anh', 1, 'Tồi', 1652004105);

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
(1, 3, 8500, '2021-07-16 11:18:12'),
(4, 6, 105000, '2022-04-01 19:47:46'),
(5, 7, 100000, '2022-04-01 19:48:28'),
(6, 8, 245000, '2022-04-15 16:45:13'),
(7, 9, 160000, '2022-05-01 14:33:59'),
(8, 10, 200000, '2022-05-01 14:37:05');

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
(1, 1, 'Programming', '&lt;p&gt;Sample Sub Category&lt;/p&gt;', 1, '2021-07-16 09:10:44'),
(2, 1, 'Grammar', '&lt;p&gt;Sample Sub 102&lt;/p&gt;', 1, '2021-07-16 09:11:05'),
(3, 2, 'Literary', '&lt;p&gt;Sample Sub 103&lt;/p&gt;', 1, '2021-07-16 09:11:36'),
(4, 2, 'Historical', '&lt;p&gt;Sample 104&lt;/p&gt;', 1, '2021-07-16 09:12:51'),
(5, 3, 'Fantasy', '&lt;p&gt;Sample Sub 105&lt;/p&gt;', 1, '2021-07-16 09:13:28'),
(6, 3, 'Action and Adventure', '&lt;p&gt;Sample Sub 106&lt;/p&gt;', 1, '2021-07-16 09:13:49'),
(7, 4, 'Sub Cat 101', '&lt;p&gt;Sample Sub 107&lt;/p&gt;', 1, '2021-07-16 11:34:22'),
(8, 5, 'Tiếng Anh', '', 1, '2022-02-25 14:44:58'),
(9, 5, 'Tiếng Trung', '', 1, '2022-02-25 14:45:11'),
(10, 5, 'Tiếng Nhật', '', 1, '2022-02-25 14:45:19'),
(11, 5, 'Tiếng Hàn', '', 1, '2022-02-25 14:45:27'),
(12, 6, 'Sách Tiếng Anh', '', 1, '2022-02-25 14:46:24'),
(13, 6, 'Sách Toán', '', 1, '2022-02-25 14:46:32'),
(14, 7, 'Sách Tiếng Anh', '', 1, '2022-02-25 14:57:12'),
(15, 8, 'Sách Tiếng Anh', '', 1, '2022-02-26 10:43:41'),
(16, 8, 'Sách Toán', '', 1, '2022-02-26 10:43:51'),
(17, 8, 'Sách Ngữ Văn', '', 1, '2022-02-26 10:44:06'),
(18, 9, 'Truyện Tranh Cổ Tích Việt Nam', '', 1, '2022-02-26 10:45:16'),
(19, 9, 'Truyện Tranh Cổ Tích Thế Giới', '', 1, '2022-02-26 10:45:39'),
(20, 9, 'Khoa Học Dành Cho Thiếu Nhi', '', 1, '2022-02-26 10:46:05'),
(21, 9, 'Truyện Tranh Thiếu Nhi', '', 1, '2022-02-26 10:46:27'),
(22, 9, 'Vở Mai Em Vào Lớp 1', '', 1, '2022-02-26 10:46:48'),
(23, 9, 'Vở Tô Màu', '', 1, '2022-02-26 10:46:57'),
(24, 9, 'Vở Bé Chuẩn Bị Vào Lớp 1', '', 1, '2022-02-26 10:47:16'),
(25, 9, 'Hành Trang Cho Bé Vào Lớp 1', '', 1, '2022-02-26 10:47:36'),
(26, 9, 'Tranh Treo Tường Cho Bé', '', 1, '2022-02-26 10:47:52'),
(27, 9, 'Sticker Dán Hình Thiếu Nhi', '', 1, '2022-02-26 10:48:16'),
(28, 10, 'Sách Văn Học Nước Ngoài', '', 1, '2022-02-26 10:48:36'),
(29, 10, 'Sách Văn Học Việt Nam', '', 1, '2022-02-26 10:48:49'),
(30, 10, 'Truyện Cười Dân Gian Việt Nam', '', 1, '2022-02-26 10:49:08'),
(31, 12, 'Anh Việt - Việt Anh', '', 1, '2022-02-26 10:49:51'),
(32, 12, 'Nhật Việt - Việt Nhật', '', 1, '2022-02-26 10:50:11'),
(33, 12, 'Hán Việt - Việt Hán', '', 1, '2022-02-26 10:50:32'),
(34, 12, 'Hàn Việt - Việt Hàn', '', 1, '2022-02-26 10:50:46'),
(35, 13, 'Văn Hóa Tâm Linh', '', 1, '2022-02-26 10:51:40'),
(36, 13, 'Phong Thủy', '', 1, '2022-02-26 10:51:50'),
(37, 13, 'Phật Giáo', '', 1, '2022-02-26 10:52:02'),
(38, 13, 'Khảo Cứu', '', 1, '2022-02-26 10:52:14'),
(39, 14, 'Kỹ Năng Sống', '', 1, '2022-02-26 10:52:39'),
(40, 14, 'Nuôi Dạy Con', '', 1, '2022-02-26 10:52:50'),
(41, 14, 'Nữ Công Gia Chánh', '', 1, '2022-02-26 10:53:02'),
(42, 14, 'Giới Tính - Sức Khỏe - Gia Đình', '', 1, '2022-02-26 10:53:24'),
(43, 14, 'Thế Giới Kỳ Lạ', '', 1, '2022-02-26 10:53:41'),
(44, 14, 'Lịch Sử', '', 1, '2022-02-26 10:53:52');

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
(1, 'name', 'Nhà Sách Minh Thắng'),
(6, 'short_name', 'Nhà Sách Minh Thắng'),
(11, 'logo', 'uploads/1651046280_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1649389680_30497495.jpg');

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
(1, 'Tạ Phạm', 'Đức Anh', 'dragonquila2000', 'ab775e0f387a7737ee34b72cd1d516be', 'uploads/1647069600_48376085_114997342872419_7080341995062820864_o.jpg', NULL, 1, '2021-01-20 14:02:37', '2022-03-16 14:51:22'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

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
-- Indexes for table `products_rating`
--
ALTER TABLE `products_rating`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
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
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `products_rating`
--
ALTER TABLE `products_rating`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
