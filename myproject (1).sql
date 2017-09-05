-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2017 at 11:26 AM
-- Server version: 10.1.25-MariaDB
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
-- Database: `myproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `acl_id` int(11) NOT NULL,
  `acl_module` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_controller` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_action` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `acl_status` tinyint(1) NOT NULL,
  `acl_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `acl_parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`acl_id`, `acl_module`, `acl_controller`, `acl_action`, `acl_status`, `acl_name`, `acl_parent`) VALUES
(1, 'admin', 'index', 'index', 1, 'Trang chủ', 0),
(7, '', '', '', 1, 'Nhóm quản trị', 0),
(8, 'admin', 'groupadmin', 'index', 1, 'Danh sách', 7),
(9, 'admin', 'groupadmin', 'add', 1, 'Thêm', 7),
(10, 'admin', 'groupadmin', 'edit', 1, 'Cập nhật', 7),
(11, 'admin', 'groupadmin', 'delete', 1, 'Xóa', 7),
(12, '', '', '', 1, 'Tài khoản quản trị', 0),
(13, 'admin', 'admin', 'index', 1, 'Danh sách', 12),
(14, 'admin', 'admin', 'add', 1, 'Thêm', 12),
(15, 'admin', 'admin', 'delete', 1, 'Xóa', 12),
(16, 'admin', 'admin', 'edit', 1, 'Cập nhật', 12),
(17, '', '', '', 1, 'Menu CMS', 0),
(18, 'admin', 'menu', 'index', 1, 'Danh sách', 17),
(19, 'admin', 'menu', 'add', 1, 'Thêm', 17),
(20, 'admin', 'menu', 'delete', 1, 'Xóa', 17),
(21, 'admin', 'menu', 'edit', 1, 'Cập nhật', 17),
(22, '', '', '', 1, 'Quyền', 0),
(23, 'admin', 'acl', 'index', 1, 'Danh sách', 22),
(24, 'admin', 'acl', 'add', 1, 'Thêm', 22),
(25, 'admin', 'acl', 'delete', 1, 'Xóa', 22),
(26, 'admin', 'acl', 'edit', 1, 'Cập nhật', 22),
(35, 'admin', 'groupadmin', 'acl', 1, 'Phân quyền', 7),
(36, '', '', '', 1, 'Menu', 0),
(37, 'admin', 'navigation', 'index', 1, 'Danh sách', 36),
(38, 'admin', 'navigation', 'add', 1, 'Thêm', 36),
(39, 'admin', 'navigation', 'delete', 1, 'Xóa', 36),
(40, 'admin', 'navigation', 'edit', 1, 'Cập nhật', 36),
(41, '', '', '', 1, 'Trang nội dung', 0),
(42, 'admin', 'page', 'index', 1, 'Danh sách', 41),
(43, 'admin', 'page', 'add', 1, 'Thêm', 41),
(44, 'admin', 'page', 'delete', 1, 'Xóa', 41),
(45, 'admin', 'page', 'edit', 1, 'Cập nhật', 41),
(46, '', '', '', 1, 'Danh mục bài viết', 0),
(47, 'admin', 'newscategory', 'index', 1, 'Danh sách', 46),
(48, 'admin', 'newscategory', 'add', 1, 'Thêm', 46),
(49, 'admin', 'newscategory', 'delete', 1, 'Xóa', 46),
(50, 'admin', 'newscategory', 'edit', 1, 'Cập nhật', 46),
(51, '', '', '', 1, 'Tin tức', 0),
(52, 'admin', 'news', 'index', 1, 'Danh sách', 51),
(53, 'admin', 'news', 'add', 1, 'Thêm', 51),
(54, 'admin', 'news', 'delete', 1, 'Xóa', 51),
(55, 'admin', 'news', 'edit', 1, 'Cập nhật', 51),
(56, 'admin', 'news', 'delete-picture', 1, 'Xóa hình đại diện', 51),
(57, '', '', '', 1, 'Danh mục sản phẩm', 0),
(58, 'admin', 'productcategory', 'index', 1, 'Danh sách', 57),
(59, 'admin', 'productcategory', 'add', 1, 'Thêm', 57),
(60, 'admin', 'productcategory', 'delete', 1, 'Xóa', 57),
(61, 'admin', 'productcategory', 'edit', 1, 'Cập nhật', 57),
(62, '', '', '', 1, 'Sản phẩm', 0),
(63, 'admin', 'product', 'index', 1, 'Danh sách', 62),
(64, 'admin', 'product', 'add', 1, 'Thêm', 62),
(65, 'admin', 'product', 'delete', 1, 'Xóa', 62),
(66, 'admin', 'product', 'edit', 1, 'Cập nhật', 62),
(67, 'admin', 'product', 'delete-picture', 1, 'Xóa hình đại diện', 62),
(68, '', '', '', 1, 'Đơn hàng', 0),
(69, 'admin', 'order', 'index', 1, 'Danh sách', 68),
(70, 'admin', 'order', 'edit', 1, 'Cập nhật', 68),
(71, '', '', '', 1, 'Giao diện', 0),
(72, 'admin', 'template', 'index', 1, 'Danh sách', 71),
(73, 'admin', 'template', 'edit', 1, 'Cập nhật', 71),
(90, '', '', '', 1, 'Cấu hình Website', 0),
(91, 'admin', 'website', 'edit', 1, 'Cập nhật thông tin website', 90),
(92, 'admin', 'website', 'delete-picture', 1, 'Xóa icon Website', 90),
(93, 'admin', 'template', 'delete-picture', 1, 'Xóa hình', 71),
(94, '', '', '', 1, 'Email khách hàng đăng ký', 0),
(95, 'admin', 'emailcustomer', 'index', 1, 'Danh sách', 94),
(96, 'admin', 'emailcustomer', 'export', 1, 'Xuất Excel', 94),
(97, '', '', '', 1, 'Liên hệ', 0),
(98, 'admin', 'contact', 'index', 1, 'Danh sách', 97),
(99, 'admin', 'contact', 'export', 1, 'Xuất Excel', 97),
(100, 'admin', 'contact', 'delete', 1, 'Xóa', 97),
(111, '', '', '', 1, 'Nhóm menu', 0),
(112, 'admin', 'groupnavigation', 'index', 1, 'Danh sách', 111),
(113, 'admin', 'groupnavigation', 'add', 1, 'Thêm', 111),
(114, 'admin', 'groupnavigation', 'delete', 1, 'Xóa', 111),
(115, 'admin', 'groupnavigation', 'edit', 1, 'Cập nhật', 111),
(116, '', '', '', 1, 'Nhóm giao diện', 0),
(117, 'admin', 'grouptemplate', 'index', 1, 'Danh sách', 116),
(118, 'admin', 'grouptemplate', 'add', 1, 'Thêm', 116),
(119, 'admin', 'grouptemplate', 'edit', 1, 'Cập nhật', 116),
(120, 'admin', 'grouptemplate', 'delete', 1, 'Xóa', 116),
(121, 'admin', 'template', 'delete', 1, 'Xóa', 71),
(122, 'admin', 'template', 'add', 1, 'Thêm', 71),
(123, 'admin', 'order', 'delete', 1, 'Xóa', 68),
(124, '', '', '', 1, 'Post get', 0),
(125, 'admin', 'postget', 'index', 1, 'Danh sách', 124),
(126, 'admin', 'postget', 'outsite', 1, 'Lấy tin', 124);

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `group_admin_id` int(11) NOT NULL,
  `admin_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_password`, `admin_name`, `admin_picture`, `group_admin_id`, `admin_status`) VALUES
(1, 'anhtuan150787@gmail.com', '550e1bafe077ff0b0b67f4e32f29d751', 'Anh Tuấn', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `contact_id` int(11) NOT NULL,
  `contact_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_phone` int(11) NOT NULL,
  `contact_content` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `contact_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `contact_fullname`, `contact_email`, `contact_phone`, `contact_content`, `contact_date`) VALUES
(7, 'test', 'anhtuan150787@yahoo.com', 944112211, '234234', '2017-07-07 19:32:06'),
(8, 'Test test', 'anhtuan150787@yahoo.com', 944112211, 'test test', '2017-07-10 19:48:06'),
(9, 'Test test', 'anhtuan150787@yahoo.com', 944112211, 'test test', '2017-07-10 19:49:02');

-- --------------------------------------------------------

--
-- Table structure for table `email_customer`
--

CREATE TABLE `email_customer` (
  `email_customer_id` int(11) NOT NULL,
  `email_customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_customer`
--

INSERT INTO `email_customer` (`email_customer_id`, `email_customer_name`) VALUES
(1, 'anhtuan150787@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `group_acl`
--

CREATE TABLE `group_acl` (
  `group_acl_id` int(11) NOT NULL,
  `acl_id` int(11) NOT NULL,
  `group_admin_id` int(11) NOT NULL,
  `group_acl_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_acl`
--

INSERT INTO `group_acl` (`group_acl_id`, `acl_id`, `group_admin_id`, `group_acl_status`) VALUES
(1, 2, 1, 0),
(2, 1, 1, 1),
(3, 4, 1, 0),
(4, 5, 1, 0),
(5, 6, 1, 0),
(6, 8, 1, 1),
(7, 9, 1, 1),
(8, 10, 1, 1),
(9, 11, 1, 1),
(10, 13, 1, 1),
(11, 14, 1, 1),
(12, 15, 1, 1),
(13, 16, 1, 1),
(14, 18, 1, 1),
(15, 19, 1, 1),
(16, 20, 1, 1),
(17, 21, 1, 1),
(18, 23, 1, 1),
(19, 24, 1, 1),
(20, 25, 1, 1),
(21, 26, 1, 1),
(22, 30, 1, 0),
(23, 31, 1, 0),
(24, 32, 1, 0),
(25, 33, 1, 0),
(26, 35, 1, 1),
(27, 7, 1, 1),
(28, 12, 1, 1),
(29, 3, 1, 0),
(30, 17, 1, 1),
(31, 22, 1, 1),
(32, 29, 1, 0),
(33, 36, 1, 1),
(34, 37, 1, 1),
(35, 38, 1, 1),
(36, 39, 1, 1),
(37, 40, 1, 1),
(38, 41, 1, 1),
(39, 42, 1, 1),
(40, 43, 1, 1),
(41, 44, 1, 1),
(42, 45, 1, 1),
(43, 46, 1, 1),
(44, 47, 1, 1),
(45, 48, 1, 1),
(46, 49, 1, 1),
(47, 50, 1, 1),
(48, 51, 1, 1),
(49, 52, 1, 1),
(50, 53, 1, 1),
(51, 54, 1, 1),
(52, 55, 1, 1),
(53, 56, 1, 1),
(54, 57, 1, 1),
(55, 58, 1, 1),
(56, 59, 1, 1),
(57, 60, 1, 1),
(58, 61, 1, 1),
(59, 62, 1, 1),
(60, 63, 1, 1),
(61, 64, 1, 1),
(62, 65, 1, 1),
(63, 66, 1, 1),
(64, 67, 1, 1),
(129, 68, 1, 1),
(130, 69, 1, 1),
(131, 70, 1, 1),
(132, 71, 1, 1),
(133, 72, 1, 1),
(134, 73, 1, 1),
(135, 74, 1, 0),
(136, 75, 1, 0),
(137, 76, 1, 0),
(138, 77, 1, 0),
(139, 78, 1, 0),
(140, 79, 1, 0),
(141, 80, 1, 0),
(142, 81, 1, 0),
(143, 82, 1, 0),
(144, 83, 1, 0),
(145, 84, 1, 0),
(146, 85, 1, 0),
(147, 87, 1, 0),
(148, 88, 1, 0),
(149, 89, 1, 0),
(150, 90, 1, 1),
(151, 91, 1, 1),
(152, 92, 1, 1),
(153, 93, 1, 1),
(154, 94, 1, 1),
(155, 95, 1, 1),
(156, 96, 1, 1),
(157, 97, 1, 1),
(158, 98, 1, 1),
(159, 99, 1, 1),
(160, 100, 1, 1),
(161, 101, 1, 0),
(162, 102, 1, 0),
(163, 103, 1, 0),
(164, 104, 1, 0),
(165, 105, 1, 0),
(166, 106, 1, 0),
(167, 107, 1, 0),
(168, 108, 1, 0),
(169, 109, 1, 0),
(170, 110, 1, 0),
(171, 111, 1, 1),
(172, 112, 1, 1),
(173, 113, 1, 1),
(174, 114, 1, 1),
(175, 115, 1, 1),
(176, 116, 1, 1),
(177, 117, 1, 1),
(178, 118, 1, 1),
(179, 119, 1, 1),
(180, 120, 1, 1),
(181, 121, 1, 1),
(182, 122, 1, 1),
(183, 123, 1, 1),
(184, 124, 1, 1),
(185, 125, 1, 1),
(186, 126, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_admin`
--

CREATE TABLE `group_admin` (
  `group_admin_id` int(11) NOT NULL,
  `group_admin_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_admin_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_admin`
--

INSERT INTO `group_admin` (`group_admin_id`, `group_admin_name`, `group_admin_status`) VALUES
(1, 'Admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_menu`
--

CREATE TABLE `group_menu` (
  `group_menu_id` bigint(20) NOT NULL,
  `group_admin_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `group_menu_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_menu`
--

INSERT INTO `group_menu` (`group_menu_id`, `group_admin_id`, `menu_id`, `group_menu_status`) VALUES
(1, 1, 10, 1),
(2, 1, 6, 1),
(3, 1, 7, 1),
(4, 1, 8, 1),
(5, 1, 9, 1),
(6, 1, 12, 0),
(7, 1, 13, 0),
(8, 1, 14, 1),
(9, 1, 15, 0),
(10, 1, 16, 1),
(11, 1, 17, 1),
(12, 1, 18, 1),
(13, 1, 19, 1),
(14, 1, 20, 1),
(15, 1, 21, 1),
(16, 1, 22, 1),
(26, 1, 23, 1),
(27, 1, 24, 1),
(28, 1, 25, 0),
(29, 1, 26, 0),
(30, 1, 27, 0),
(31, 1, 28, 1),
(32, 1, 29, 1),
(33, 1, 30, 1),
(34, 1, 31, 1),
(35, 1, 32, 1),
(36, 1, 33, 1),
(37, 1, 34, 0),
(38, 1, 35, 1),
(39, 1, 36, 1),
(40, 1, 37, 1),
(41, 1, 38, 1),
(42, 1, 39, 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_navigation`
--

CREATE TABLE `group_navigation` (
  `group_navigation_id` int(11) NOT NULL,
  `group_navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_navigation`
--

INSERT INTO `group_navigation` (`group_navigation_id`, `group_navigation_name`, `group_navigation_status`) VALUES
(12, 'Menu top', 1);

-- --------------------------------------------------------

--
-- Table structure for table `group_template`
--

CREATE TABLE `group_template` (
  `group_template_id` int(11) NOT NULL,
  `group_template_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `group_template`
--

INSERT INTO `group_template` (`group_template_id`, `group_template_name`, `group_template_status`) VALUES
(6, 'Header', 1),
(7, 'Banner slide', 1),
(8, 'Footer', 1),
(9, 'Liên hê', 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_parent` int(11) DEFAULT '0',
  `menu_status` tinyint(1) NOT NULL,
  `menu_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `menu_name`, `menu_parent`, `menu_status`, `menu_url`) VALUES
(6, 'Nhóm quản trị', 10, 1, 'admin/group-admin'),
(7, 'Tài khoản quản trị', 10, 1, 'admin/admin'),
(8, 'Menu', 10, 1, 'admin/menu'),
(9, 'Quyền', 10, 1, 'admin/acl'),
(10, 'Cấu hình CMS', 0, 1, ''),
(14, 'Giao diện', 0, 1, ''),
(16, 'Bài viết', 0, 1, ''),
(17, 'Trang nội dung', 16, 1, 'admin/page'),
(18, 'Danh mục bài viết', 16, 1, 'admin/news-category'),
(19, 'Bài viết', 16, 1, 'admin/news'),
(20, 'Sản phẩm', 0, 1, ''),
(21, 'Danh mục sản phẩm', 20, 1, 'admin/product-category'),
(22, 'Sản phẩm', 20, 1, 'admin/product'),
(23, 'Giỏ hàng', 0, 1, ''),
(24, 'Quản lý đơn hàng', 23, 1, 'admin/order'),
(28, 'Thông tin Website', 29, 1, 'admin/website'),
(29, 'Cấu hình Website', 0, 1, ''),
(30, 'Khách hàng', 0, 1, ''),
(31, 'Email đăng ký', 30, 1, 'admin/email-customer'),
(32, 'Liên hệ', 30, 1, 'admin/contact'),
(33, 'Nhóm menu', 14, 1, 'admin/group-navigation'),
(35, 'Nhóm giao diện', 14, 1, 'admin/group-template'),
(36, 'Giao diện', 35, 1, 'admin/template'),
(37, 'Menu', 33, 1, 'admin/navigation'),
(38, 'Draw project', 0, 1, ''),
(39, 'Danh sách', 38, 1, 'admin/post-get');

-- --------------------------------------------------------

--
-- Table structure for table `navigation`
--

CREATE TABLE `navigation` (
  `navigation_id` int(11) NOT NULL,
  `navigation_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `navigation_status` tinyint(1) NOT NULL,
  `navigation_parent` int(11) NOT NULL,
  `navigation_position` int(11) NOT NULL,
  `navigation_url_select` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group_navigation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `navigation`
--

INSERT INTO `navigation` (`navigation_id`, `navigation_name`, `navigation_url`, `navigation_status`, `navigation_parent`, `navigation_position`, `navigation_url_select`, `group_navigation_id`) VALUES
(24, 'Trang chủ', '/', 1, 0, 1, '', 12),
(25, 'Giới thiệu', '', 1, 0, 2, 'gioi-thieu-nc-2', 12),
(26, 'Sản phẩm', 'san-pham', 1, 0, 3, '', 12),
(27, 'Tin tức', '', 1, 0, 4, 'tin-tuc-nc-1', 12),
(28, 'Liên hệ', 'lien-he', 1, 0, 5, '', 12);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `news_quote` text COLLATE utf8_unicode_ci,
  `news_content` longtext COLLATE utf8_unicode_ci,
  `news_status` int(1) NOT NULL,
  `news_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `news_category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news_category`
--

CREATE TABLE `news_category` (
  `news_category_id` int(11) NOT NULL,
  `news_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `news_category_parent` int(11) NOT NULL,
  `news_category_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `news_category`
--

INSERT INTO `news_category` (`news_category_id`, `news_category_name`, `news_category_parent`, `news_category_status`) VALUES
(1, 'Tin tức', 0, 1),
(2, 'Giới thiệu', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `order_fullname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_phone` int(11) NOT NULL,
  `order_note` text COLLATE utf8_unicode_ci NOT NULL,
  `order_status` tinyint(4) NOT NULL,
  `order_amount` int(11) NOT NULL,
  `order_fee` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `order_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order_district` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`order_id`, `order_fullname`, `order_email`, `order_address`, `order_phone`, `order_note`, `order_status`, `order_amount`, `order_fee`, `order_date`, `order_code`, `order_district`) VALUES
(1, 'Anh Tuấn', 'anhtuan1507@gmail.com', 'test địa chỉ', 944518822, 'giao hàng trong giờ hành chính', 1, 2800000, 0, '2017-04-11 15:57:43', '', ''),
(2, 'Anh Tuan', 'anhtuan1507@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 09:33:11', '', ''),
(3, 'asd', 'anhtuan1507@gmail.com', 'tes', 1234033187, 'ttest', 0, 600000, 0, '2017-04-20 09:41:43', '', ''),
(4, 'tu nguyen', 'anhtuan1507@gmail.com', '71', 1234033187, 'sd', 0, 900000, 0, '2017-04-20 09:43:13', '', ''),
(5, 'anh tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'asd', 0, 900000, 0, '2017-04-20 10:02:55', '', ''),
(6, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 11:24:19', '', ''),
(7, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518811, 'test', 0, 800000, 0, '2017-04-20 13:06:49', '', ''),
(8, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518822, 'test', 0, 800000, 0, '2017-04-20 13:09:46', '', ''),
(9, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944517722, 'test', 0, 1000000, 0, '2017-04-20 13:15:36', '', ''),
(10, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 944518822, 'test', 0, 800000, 0, '2017-04-20 13:18:17', '', ''),
(11, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 944112211, 'test', 0, 600000, 0, '2017-04-20 14:33:26', '', ''),
(12, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 900000, 0, '2017-04-20 14:34:05', '', ''),
(13, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 1234033187, 'test', 0, 600000, 0, '2017-04-20 14:35:17', '', ''),
(14, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 800000, 0, '2017-04-20 14:41:01', '', ''),
(15, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 600000, 0, '2017-04-20 14:42:15', '', ''),
(16, 'Anh Tuan', 'anhtuan150787@gmail.com', 'test', 9112211, 'test', 0, 600000, 0, '2017-04-20 14:52:28', '', ''),
(17, 'Anh Tuấn', 'anhtuan150787@gmail.com', 'test', 9112211, 'test', 0, 900000, 0, '2017-04-20 14:53:39', '', ''),
(18, 'Anh', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 900000, 0, '2017-04-20 15:06:23', '', ''),
(19, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'test', 0, 800000, 0, '2017-04-20 15:25:15', 'QZ71519', ''),
(20, 'Anh Tuan', 'anhtuan150787@gmail.com', '19/9 Cầm Bá THước, P.7, Q.Phú Nhuận', 1234033187, 'tet', 0, 900000, 0, '2017-04-20 15:29:39', 'QP97920', '');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `order_detail_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_price` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`order_detail_id`, `order_id`, `product_name`, `product_price`, `quality`, `product_id`, `product_picture`, `product_code`) VALUES
(1, 1, 'ANKLE BOOT HEELS', 700000, 4, 1, 'product_1491120796_2017-L2-CK1-90280010-22-5.jpg', 'CK1-90280010_CAMEL'),
(2, 2, 'BASIC PENNY LOAFERS', 600000, 1, 9, 'product_1492000106_2017-L3-CK1-70380574-08-2.jpg', 'CK1-70380574_RED'),
(3, 3, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(4, 4, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(5, 5, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(6, 6, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 7, 'product_1491995964_2016-L2-CK1-80190043-01-3-500.jpg', 'CK1-80190043_BROWN'),
(7, 7, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(8, 8, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(9, 9, 'ANKLE BOOT HEELS', 1000000, 1, 5, 'product_1491312145_2016-L7-SL1-90900002-02-1.jpg', 'CK1-90280010_CAMEL'),
(10, 10, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(11, 11, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(12, 12, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(13, 13, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(14, 14, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(15, 15, 'ESPADRILLE FLATFORM SLIP-ONS', 600000, 1, 6, 'product_1491995659_2016-L2-CK1-80190043-02-2-500.jpg', 'CK1-80190043_BROWN'),
(16, 16, 'BASIC PENNY LOAFERS', 600000, 1, 8, 'product_1491999897_2017-L3-CK1-70380574-23-3.jpg', 'CK1-70380574_YELLOW'),
(17, 17, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(18, 18, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL'),
(19, 19, 'ANKLE BOOT HEELS', 800000, 1, 3, 'product_1491311946_2016-L7-SL1-90300043-01-5.jpg', 'CK1-90280010_CAMEL'),
(20, 20, 'ANKLE BOOT HEELS', 900000, 1, 4, 'product_1491312032_2016-L7-SL1-90360039-01-5.jpg', 'CK1-90280010_CAMEL');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `page_id` int(11) NOT NULL,
  `page_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_price` int(11) DEFAULT NULL,
  `product_description` longtext COLLATE utf8_unicode_ci,
  `product_status` tinyint(1) NOT NULL,
  `product_picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_category_id` int(11) DEFAULT NULL,
  `product_price_old` int(11) DEFAULT NULL,
  `product_type_new` int(1) NOT NULL,
  `product_type_sale` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_code`, `product_price`, `product_description`, `product_status`, `product_picture`, `product_category_id`, `product_price_old`, `product_type_new`, `product_type_sale`) VALUES
(1, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499349159_X1.jpg', 1, 0, 1, 1),
(2, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261717_TP-129-G09V.jpg', 1, 0, 1, 1),
(3, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261731_TP-141-G07D_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(4, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261744_TP-141-G07G_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(5, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261755_TP-165-G16V_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(6, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261771_TP-1001-G06G_GẠCH TERRAZZO.jpg', 1, 0, 1, 1),
(7, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499349126_TP-2046-G18D GHÉP 8 VIÊN (1).JPG', 1, 0, 1, 1),
(8, 'Gạch bê tông', '', 0, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499261800_TP-5393-G17X.jpg', 1, 0, 1, 1),
(9, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949803_17dp113-228_188.88888888889x185.jpg', 2, NULL, 1, 1),
(10, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949820_gachterrazzo40x40qp151-274_189.16666666667x185.jpg', 2, NULL, 1, 1),
(11, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949839_images-8-124_185x185.jpg', 2, NULL, 1, 1),
(12, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499949857_untitled1-547_186.26712328767x185.png', 2, NULL, 1, 1),
(13, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950002_15-532_175.6420233463x185.png', 1, NULL, 1, 1),
(14, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950017_gach-terrazzo1-640_188.88888888889x185.jpg', 1, NULL, 1, 1),
(15, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950033_php1384790747-412_185x185.jpg', 1, NULL, 1, 1),
(16, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950045_1234-977_178.36322869955x185.png', 1, NULL, 1, 1),
(17, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950057_img72340414-459_185x185.jpg', 1, NULL, 1, 1),
(18, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950074_img72427622-740_185x185.jpg', 1, NULL, 1, 1),
(19, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950093_php1384790747-412_185x185.jpg', 1, NULL, 1, 1),
(20, 'Gạch bê tông', NULL, NULL, '<p>K&iacute;ch Thước: 30x30 cm/ 40x40 cm<br />M&agrave;u: Xanh</p>\r\n<p>Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.Gạch nội thất l&agrave; loại gạch phẳng c&oacute; nổi mặt đ&aacute; thường được d&ugrave;ng cho c&aacute;c hội trường lớn, h&agrave;nh lang v&agrave; thậm ch&iacute; ph&ograve;ng l&agrave;m việc tại c&aacute;c t&ograve;a nh&agrave; lớn hoặc c&aacute;c địa điểm c&ocirc;ng cộng như bệnh viện, trường học, cơ quan h&agrave;nh ch&iacute;nh &hellip;. Ưu điểm của loại gạch n&agrave;y l&agrave; dễ lau ch&ugrave;i v&agrave; v&acirc;n đ&aacute; s&aacute;ng đẹp.</p>', 1, 'product_1499950103_gachconsaumaccao640223-889_253.53319057816x185.jpg', 1, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_category_id` int(11) NOT NULL,
  `product_category_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_category_parent` int(11) NOT NULL,
  `product_category_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_category_id`, `product_category_name`, `product_category_parent`, `product_category_status`) VALUES
(1, 'Gạch nội thất', 0, 1),
(2, 'Gạch ngoại thất', 0, 1),
(3, 'Gạch Block', 0, 1),
(4, 'Gạch Tezzarro', 0, 1),
(5, 'Gạch ốp Taluy', 0, 1),
(6, 'Gạch bờ kè', 0, 1),
(7, 'Gạch xây không nung', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE `template` (
  `template_id` int(11) NOT NULL,
  `template_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_content` text COLLATE utf8_unicode_ci NOT NULL,
  `template_picture` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `group_template_id` int(11) NOT NULL,
  `template_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`template_id`, `template_name`, `template_content`, `template_picture`, `template_url`, `template_type`, `group_template_id`, `template_status`) VALUES
(10, 'Logo', '', 'template_1499951114_l.png', '', '', 6, '1'),
(11, 'Nội dung footer', '<p style=\"text-align: center;\"><strong>C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</strong><br /> Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM<br /> Điện thoại: (08) 6274 0626 - 0909 849 626<br /> Email: <a href=\"mailto:quocvinhbp2@yahoo.com\">quocvinh_bp2@yahoo.com</a><br />Website: gachbetongtuchen.vn</p>', '', '', '', 8, '1'),
(12, 'Banner 1', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260735_banner1.jpg', '', '', 7, '1'),
(13, 'Banner 2', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260916_banner2.png', '', '', 7, '1'),
(14, 'Banner 3', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260926_banner3.jpg', '', '', 7, '1'),
(15, 'Banner 4', '<p>Bề mặt b&oacute;ng đẹp, nổi khối, v&acirc;n c&oacute; chiều s&acirc;u. Mẫu m&atilde; đa dạng, tinh tế về kiểu d&aacute;ng : rẻ quạt, mai r&ugrave;a, cữ thập.... Ph&ugrave; hợp với xu hướng thiết kế hiện đại với mức gi&aacute; hợp l&yacute;. Gạch To&agrave;n Ph&aacute;t lu&ocirc;n th&acirc;n thiện với mọi c&ocirc;ng tr&igrave;nh</p>', 'news_1499260937_banner4.jpg', '', '', 7, '1'),
(16, 'Thông tin liên hệ', '<p><strong>C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</strong></p>\r\n<p>Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM</p>\r\n<p>Điện thoại: (08) 6274 0626 - 0909 849 626</p>\r\n<p>Email: <a href=\"mailto:quocvinhbp2@yahoo.com\">quocvinh_bp2@yahoo.com</a></p>\r\n<p>Website: gachbetongtuchen.vn</p>', '', '', '', 9, '1'),
(17, 'Banner top', '<p style=\"text-align: center;\">&nbsp;</p>\r\n<p style=\"text-align: center;\"><span style=\"font-size: 18pt;\"><strong><span style=\"color: #ff0000;\">C&Ocirc;NG TY TNHH MTV SX TM XD VĨNH PH&Aacute;T</span></strong></span></p>\r\n<p style=\"text-align: center;\"><strong><span style=\"font-size: 14pt; color: #0000ff;\">Địa chỉ: 151/54 Li&ecirc;n khu 4-5, P. B&igrave;nh Hưng H&ograve;a B, Quận B&igrave;nh T&acirc;n, HCM</span></strong></p>\r\n<p style=\"text-align: center;\"><strong><span style=\"font-size: 14pt; color: #0000ff;\">Điện thoại: (08) 6274 0626 - 0909 849 626</span></strong></p>', '', '', '', 6, '1');

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE `website` (
  `website_id` int(11) NOT NULL,
  `website_title` text COLLATE utf8_unicode_ci NOT NULL,
  `website_description` text COLLATE utf8_unicode_ci NOT NULL,
  `website_keyword` text COLLATE utf8_unicode_ci NOT NULL,
  `website_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website_icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `website`
--

INSERT INTO `website` (`website_id`, `website_title`, `website_description`, `website_keyword`, `website_name`, `website_icon`) VALUES
(1, 'Gạch bê tông', 'Gạch bê tông', 'Gạch bê tông', 'Gạch bê tông', 'favico_1495428489_17438229_191890364645222_7140066770898911232_n.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`acl_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `email_customer`
--
ALTER TABLE `email_customer`
  ADD PRIMARY KEY (`email_customer_id`),
  ADD UNIQUE KEY `email_customer_name` (`email_customer_name`);

--
-- Indexes for table `group_acl`
--
ALTER TABLE `group_acl`
  ADD PRIMARY KEY (`group_acl_id`);

--
-- Indexes for table `group_admin`
--
ALTER TABLE `group_admin`
  ADD PRIMARY KEY (`group_admin_id`);

--
-- Indexes for table `group_menu`
--
ALTER TABLE `group_menu`
  ADD PRIMARY KEY (`group_menu_id`);

--
-- Indexes for table `group_navigation`
--
ALTER TABLE `group_navigation`
  ADD PRIMARY KEY (`group_navigation_id`);

--
-- Indexes for table `group_template`
--
ALTER TABLE `group_template`
  ADD PRIMARY KEY (`group_template_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Indexes for table `navigation`
--
ALTER TABLE `navigation`
  ADD PRIMARY KEY (`navigation_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`news_category_id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`order_detail_id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`product_category_id`);

--
-- Indexes for table `template`
--
ALTER TABLE `template`
  ADD PRIMARY KEY (`template_id`);

--
-- Indexes for table `website`
--
ALTER TABLE `website`
  ADD PRIMARY KEY (`website_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `acl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `email_customer`
--
ALTER TABLE `email_customer`
  MODIFY `email_customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_acl`
--
ALTER TABLE `group_acl`
  MODIFY `group_acl_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;
--
-- AUTO_INCREMENT for table `group_admin`
--
ALTER TABLE `group_admin`
  MODIFY `group_admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group_menu`
--
ALTER TABLE `group_menu`
  MODIFY `group_menu_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `group_navigation`
--
ALTER TABLE `group_navigation`
  MODIFY `group_navigation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `group_template`
--
ALTER TABLE `group_template`
  MODIFY `group_template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `navigation`
--
ALTER TABLE `navigation`
  MODIFY `navigation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `news_category`
--
ALTER TABLE `news_category`
  MODIFY `news_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `order_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `product_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `template`
--
ALTER TABLE `template`
  MODIFY `template_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `website`
--
ALTER TABLE `website`
  MODIFY `website_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
