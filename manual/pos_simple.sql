-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: sql211.byetcluster.com
-- Tiempo de generación: 13-10-2020 a las 17:28:27
-- Versión del servidor: 5.6.48-88.0
-- Versión de PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ottos_26664359_pos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'General', 'no_image.png'),
(3, '002', 'bebibas', 'no_image.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_combo_items`
--

CREATE TABLE `tec_combo_items` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_customers`
--

CREATE TABLE `tec_customers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(1, 'Walk-in Client', '', '', '012345678', 'customer@tecdiary.com', NULL),
(2, 'Heysel', '', '', '04262384614', 'heysel.castillo16@gmail.com', NULL),
(3, 'Heysel', '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_login_attempts`
--

INSERT INTO `tec_login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(22, 0x3138312e3138382e3230312e3738, 'Administrador', 1602535896);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`) VALUES
(3, '2020-10-10 23:52:27', 3, 1, NULL, 'cash', '', '', '', '', '', '', '75.0000', NULL, 1, NULL, '', '175.0000', '100.0000', '', NULL, NULL, NULL, 3),
(4, '2020-10-11 01:49:06', 4, 2, NULL, 'cash', '', '', '', '', '', '', '1285.2000', NULL, 1, NULL, '', '1285.2000', '0.0000', '', NULL, NULL, NULL, 3),
(5, '2020-10-11 22:45:04', 5, 2, NULL, 'cash', '', '', '', '', '', '', '245.0000', NULL, 1, NULL, '', '245.0000', '0.0000', '', NULL, NULL, NULL, 2),
(6, '2020-10-13 15:26:53', 6, 2, NULL, 'cash', '', '', '', '', '', '', '710.3000', NULL, 1, NULL, '', '710.3000', '0.0000', '', NULL, NULL, NULL, 3),
(7, '2020-10-13 17:46:18', 7, 2, NULL, 'cash', '', '', '', '', '', '', '75.0000', NULL, 1, NULL, '', '75.0000', '0.0000', '', NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_printers`
--

CREATE TABLE `tec_printers` (
  `id` int(11) NOT NULL,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_printers`
--

INSERT INTO `tec_printers` (`id`, `title`, `type`, `profile`, `char_per_line`, `path`, `ip_address`, `port`) VALUES
(1, 'XPrinter', 'network', 'default', 45, '', 0x3139322e3136382e312e323030, '9100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_products`
--

CREATE TABLE `tec_products` (
  `id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT '1',
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT '1',
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text,
  `alert_quantity` decimal(10,4) DEFAULT '0.0000'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(4, '1010', 'Arroz', 1, '600.0000', 'no_image.png', '0', '500.0000', 0, '0.0000', 'code128', 'standard', '', '10.0000'),
(5, '001', 'Product 1', 1, '62.0000', '6483e39459e915b0c2599b9fa89d0920.jpg', '4', '50.0000', 1, '0.0000', 'code39', 'standard', '', '0.0000'),
(6, '12345', 'Balanceado', 1, '25.0000', 'no_image.png', '0', '20.0000', 0, '0.0000', 'code128', 'standard', '', '2.0000'),
(7, '00101', 'Item 001', 1, '12.0000', 'no_image.png', '12', '10.0000', 0, '0.0000', 'code128', 'standard', '', '1.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 1, 1, '0.0000', '1500.0000'),
(2, 2, 1, '29.0000', '600.0000'),
(3, 3, 1, '20.0000', '600.0000'),
(4, 4, 1, '50.0000', '0.0000'),
(5, 4, 2, '19.0000', '0.0000'),
(6, 5, 1, '0.0000', '0.0000'),
(7, 5, 2, '199.0000', '0.0000'),
(8, 5, 3, '-1.0000', '0.0000'),
(9, 6, 1, '10.0000', '20.0000'),
(10, 6, 2, '16.0000', '20.0000'),
(11, 6, 3, '-1.0000', '0.0000'),
(12, 7, 1, '0.0000', '0.0000'),
(13, 7, 2, '0.0000', '0.0000'),
(14, 7, 3, '-3.0000', '0.0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_purchase_items`
--

CREATE TABLE `tec_purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  `subtotal` decimal(25,4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2019-10-01 00:47:21', 1, '100.0000', 'close', '100.0000', 0, 0, '100.0000', 0, 0, '', '2020-10-09 07:42:08', NULL, 1, 1),
(2, '2020-10-09 07:42:53', 1, '20.0000', 'close', '1380.2000', 0, 0, '1380.2000', 0, 0, '', '2020-10-11 12:05:21', NULL, 1, 3),
(3, '2020-10-11 22:41:32', 1, '50000.0000', 'close', '50245.0000', 0, 0, '50245.0000', 0, 0, '', '2020-10-11 22:49:41', NULL, 1, 2),
(4, '2020-10-11 22:52:29', 1, '5899.0000', 'close', '6609.3000', 0, 0, '6609.3000', 0, 0, '', '2020-10-13 17:45:28', NULL, 1, 3),
(5, '2020-10-13 17:46:10', 1, '50.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sales`
--

CREATE TABLE `tec_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rounding` decimal(10,4) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1',
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(3, '2020-10-10 19:52:27', 1, 'Walk-in Client', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '75.0000', 2, '3.0000', '75.0000', 1, NULL, NULL, '', 'paid', '0.0000', 3, ''),
(4, '2020-10-10 21:49:06', 2, 'Heysel', '1221.4286', '0.0000', NULL, '0.0000', '0.0000', '2.5714', '5%', '61.2000', '63.7714', '1285.2000', 2, '4.0000', '1285.2000', 1, NULL, NULL, '', 'paid', '0.0000', 3, ''),
(5, '2020-10-11 18:45:04', 2, 'Heysel', '245.0000', '0.0000', NULL, '0.0000', '0.0000', '8.0000', NULL, '0.0000', '8.0000', '253.0000', 3, '3.0000', '245.0000', 1, NULL, NULL, '', 'partial', '0.0000', 2, ''),
(6, '2020-10-13 11:26:53', 2, 'Heysel', '672.7143', '0.0000', NULL, '0.0000', '0.0000', '3.7657', '5%', '33.8240', '37.5897', '710.3040', 3, '3.0000', '710.3000', 1, NULL, NULL, '', 'paid', '0.0000', 3, ''),
(7, '2020-10-13 13:46:18', 2, 'Heysel', '75.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', NULL, '0.0000', '0.0000', '75.0000', 1, '3.0000', '75.0000', 1, NULL, NULL, '', 'paid', '0.0000', 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sale_items`
--

CREATE TABLE `tec_sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT '0.0000',
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(5, 3, 6, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '20.0000', '12345', 'Balanceado', ''),
(4, 3, 4, '2.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '50.0000', '25.0000', '500.0000', '1010', 'Arroz', ''),
(6, 4, 4, '2.0000', '600.0000', '600.0000', '0', '0.0000', 0, '0.0000', '1200.0000', '600.0000', '500.0000', '1010', 'Arroz', ''),
(7, 4, 7, '2.0000', '12.0000', '10.7143', '0', '0.0000', 12, '2.5714', '24.0000', '12.0000', '10.0000', '00101', 'Item 001', ''),
(8, 5, 4, '1.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '25.0000', '25.0000', '500.0000', '1010', 'Arroz', ''),
(9, 5, 5, '1.0000', '200.0000', '200.0000', '0', '0.0000', 4, '8.0000', '208.0000', '200.0000', '50.0000', '001', 'Product 1', ''),
(10, 5, 6, '1.0000', '20.0000', '20.0000', '0', '0.0000', 0, '0.0000', '20.0000', '20.0000', '20.0000', '12345', 'Balanceado', ''),
(11, 6, 4, '1.0000', '600.0000', '600.0000', '0', '0.0000', 0, '0.0000', '600.0000', '600.0000', '500.0000', '1010', 'Arroz', ''),
(12, 6, 5, '1.0000', '62.0000', '62.0000', '0', '0.0000', 4, '2.4800', '64.4800', '62.0000', '50.0000', '001', 'Product 1', ''),
(13, 6, 7, '1.0000', '12.0000', '10.7143', '0', '0.0000', 12, '1.2857', '12.0000', '12.0000', '10.0000', '00101', 'Item 001', ''),
(14, 7, 6, '3.0000', '25.0000', '25.0000', '0', '0.0000', 0, '0.0000', '75.0000', '25.0000', '20.0000', '12345', 'Balanceado', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('d1b2f21eddaadbafcadf5d51f66f54ab56e3c463', '165.22.230.174', 1602611643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323631313634333b),
('dca764fb688daa02410abae08f86b88320034679', '165.22.230.174', 1602614823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323631343537393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363038333233223b6c6173745f69707c733a31323a223138362e33352e39332e3230223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a373a2235302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31332031333a34363a3130223b),
('8489aab52000b7f58b2e363c0b144fb024fa5286', '165.22.230.174', 1602615033, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323631343936333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363038333233223b6c6173745f69707c733a31323a223138362e33352e39332e3230223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2232223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2235223b636173685f696e5f68616e647c733a373a2235302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31332031333a34363a3130223b),
('be58ed34121338f85da95c73b677bd9a7fd6e7dd', '190.233.49.98', 1602613591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630383732353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353930313339223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('1bdbfde6bfb64ca638ca14c13b8906d6eb7fe9db', '186.35.93.20', 1602608333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630383239303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363036373135223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('61d12c55f537a307fbfa189938d31b1cf921cf5b', '190.233.49.98', 1602607484, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630373330363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353930313339223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('dc6af3d3045ba03f48190035e83d6cbe110c66a2', '165.22.230.174', 1602607007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630373030343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363036313736223b6c6173745f69707c733a31333a223139302e3233332e34392e3938223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('9c2d68052bf955dd273f679e216686c852dcf9f3', '165.22.230.174', 1602606729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630363639343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032363036313736223b6c6173745f69707c733a31333a223139302e3233332e34392e3938223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('8dbd4f71f1456cfa8ed0d4d634763217108f6237', '190.233.49.98', 1602606971, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630363634373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353930313339223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('93488fce92ca6a8db9b6c5421d348a7db578b629', '190.233.49.98', 1602606414, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630363233373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353930313339223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b726d73706f737c693a313b6d6573736167657c733a32343a2256656e74612061c3b1616469646120636f6e20657869746f223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d),
('2da060afb255d99cab1ac34656d9dad7ddf18dc2', '190.233.49.98', 1602606217, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323630353933353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353930313339223b6c6173745f69707c733a31343a223136352e32322e3233302e313734223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('c8cb6fdb19ef11250031b2c16db62a927611d738', '190.232.205.162', 1602559345, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323535393334343b),
('9770617901102cc85f591e41b5d7fe297a65416e', '165.22.230.174', 1602590191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323539303133323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353337313734223b6c6173745f69707c733a31353a223139302e3233322e3230352e313632223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('cff376f6756a6fa9089ad62486cc3fcd09abb521', '181.188.201.78', 1602535896, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323533353839303b6572726f727c733a35313a223c703e41636365736f2066616c6c69646f2e20506f72206661766f7220696e74656e7465206e756576616d656e74653c2f703e223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('fa490e080aa0896013fb37dd2daa8786a141e60d', '190.232.205.162', 1602537465, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323533373136313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353238353838223b6c6173745f69707c733a31343a223138362e37372e3234382e323431223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b),
('e9f80ffefced50480b79a2ee45bb8ce96fd0ac25', '190.232.205.162', 1602537508, 0x5f5f63695f6c6173745f726567656e65726174657c693a313630323533373437383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31383a2261646d696e4074656364696172792e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22576564203234204a756e20323031352031303a353920504d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231363032353238353838223b6c6173745f69707c733a31343a223138362e37372e3234382e323431223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2233223b6861735f73746f72655f69647c4e3b72656769737465725f69647c733a313a2234223b636173685f696e5f68616e647c733a393a22353839392e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032302d31302d31312031383a35323a3239223b);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_settings`
--

CREATE TABLE `tec_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `dateformat` varchar(20) DEFAULT NULL,
  `timeformat` varchar(20) DEFAULT NULL,
  `default_email` varchar(100) NOT NULL,
  `language` varchar(20) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `theme` varchar(20) NOT NULL,
  `timezone` varchar(255) NOT NULL DEFAULT '0',
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(255) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(5) DEFAULT NULL,
  `mmode` tinyint(1) NOT NULL,
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `mailpath` varchar(55) DEFAULT NULL,
  `currency_prefix` varchar(3) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_tax_rate` varchar(20) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `total_rows` int(2) NOT NULL,
  `header` varchar(1000) DEFAULT NULL,
  `footer` varchar(1000) DEFAULT NULL,
  `bsty` tinyint(4) NOT NULL,
  `display_kb` tinyint(4) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_discount` varchar(20) NOT NULL,
  `item_addition` tinyint(1) NOT NULL,
  `barcode_symbology` varchar(55) DEFAULT NULL,
  `pro_limit` tinyint(4) NOT NULL,
  `decimals` tinyint(1) NOT NULL DEFAULT '2',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_order` varchar(55) DEFAULT NULL,
  `print_bill` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `char_per_line` tinyint(4) DEFAULT '42',
  `rounding` tinyint(1) DEFAULT '0',
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT '1',
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT '2',
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
(1, 'logo1.png', 'Punto de Venta', '04262384614', 'D j M Y', 'h:i A', 'heysel.castillo16@gmail.com', 'english', '4.0.28', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'USD', 2, '5%', 10, 30, NULL, NULL, 3, 0, 1, '0', 1, NULL, 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, '2122', 0, '', '', '798cb9b0-5b7b-4890-a233-ad885f22a117', 'codigofuentefree', 'blue', 0, 0, 1, 2, '', 0, 0, 1, 1, 'null', 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_stores`
--

CREATE TABLE `tec_stores` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL,
  `logo` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(25) DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `receipt_header` text,
  `receipt_footer` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
(1, 'SimplePOS', 'POS', 'logo.png', 'store@tecdiary.com', '012345678', 'Address Line 1', '', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', 'MYR', NULL, 'This is receipt footer for store'),
(2, 'Sucursal 1', '0120', NULL, 'heysel.castillo16@gmail.com', '04262384614', 'Venezuela', 'Venezuela', 'Maracay', 'Aragua', '2123', 'Venezuela', NULL, '', ''),
(3, 'test', '0223', NULL, '', '98471562', '', '', '', '', '', '', NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_suppliers`
--

CREATE TABLE `tec_suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cf1` varchar(255) NOT NULL,
  `cf2` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_suppliers`
--

INSERT INTO `tec_suppliers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`) VALUES
(1, 'Test Supplier', '1', '2', '0123456789', 'supplier@tecdairy.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_suspended_items`
--

CREATE TABLE `tec_suspended_items` (
  `id` int(11) NOT NULL,
  `suspend_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `tax` int(20) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_suspended_sales`
--

CREATE TABLE `tec_suspended_sales` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(55) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` varchar(20) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_quantity` decimal(15,4) DEFAULT NULL,
  `paid` decimal(25,4) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `hold_ref` varchar(255) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_users`
--

CREATE TABLE `tec_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT '2',
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3136352e32322e3233302e313734, 0x3132372e302e302e31, 'Administrador', 'b420b17c03f86c1e37f84ad31363f7afdf9eafa7', NULL, 'admin@tecdiary.com', NULL, NULL, NULL, '93e1ad0171c5e0e479794de392129458b7bc670d', 1435204774, 1602614579, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', 'a7f50a21431a9e64106e3dedbdb7b7fa.jpg', 'female', 1, NULL),
(3, NULL, 0x3138362e39342e3133342e3736, 'admin', '009e4f927392e9953a174382f8d9b6f07774614e', NULL, 'heysel.castillo16@gmail.com', NULL, NULL, NULL, NULL, 1602164307, 1602164307, 1, 'Heysel', 'Castillo', NULL, '04262384614', NULL, 'female', 1, NULL),
(4, 0x3136352e32322e3233302e313734, 0x3136352e32322e3233302e313734, 'hey', 'cebed46e7999f3da3ed1b9f9a68c4f4ee5ecfd29', NULL, 'heysel.castillo@gmail.com', NULL, NULL, NULL, '999f21586906761d9566a64c9fc41916eb84ac91', 1602611615, 1602611633, 1, 'HEY', '1', NULL, '04262384614', NULL, 'female', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_user_logins`
--

CREATE TABLE `tec_user_logins` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tec_user_logins`
--

INSERT INTO `tec_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-09-30 22:39:57'),
(2, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-09-30 22:53:59'),
(3, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-09-30 22:56:15'),
(4, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-09-30 22:57:17'),
(5, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-10-01 02:02:33'),
(6, 1, NULL, 0x3a3a31, 'admin@tecdiary.com', '2019-10-01 02:17:38'),
(7, 2, NULL, 0x3a3a31, 'tusolutionweb@gmail.com', '2019-10-01 02:20:22'),
(8, 2, NULL, 0x3a3a31, 'tusolutionweb@gmail.com', '2020-09-30 14:58:16'),
(9, 2, NULL, 0x3138362e3136372e3234382e3734, 'tusolutionweb@gmail.com', '2020-10-08 11:47:01'),
(10, 1, NULL, 0x3138362e3136372e3234392e3931, 'Administrador', '2020-10-08 12:44:43'),
(11, 1, NULL, 0x3138362e3136372e3234392e3931, 'Administrador', '2020-10-08 12:50:42'),
(12, 1, NULL, 0x3139362e3230332e32352e3139, 'Administrador', '2020-10-08 13:18:49'),
(13, 1, NULL, 0x3138362e39342e3133342e3736, 'Administrador', '2020-10-08 13:37:00'),
(14, 1, NULL, 0x3138362e39342e3133342e3736, 'Administrador', '2020-10-08 13:41:11'),
(15, 1, NULL, 0x3139302e3230322e3133302e313136, 'Administrador', '2020-10-08 15:08:39'),
(16, 1, NULL, 0x3139362e3230332e32352e3139, 'Administrador', '2020-10-08 15:56:59'),
(17, 1, NULL, 0x3138312e3131352e3234392e313630, 'Administrador', '2020-10-08 21:00:41'),
(18, 1, NULL, 0x3138312e3131352e3234392e313630, 'Administrador', '2020-10-08 23:04:03'),
(19, 1, NULL, 0x3139302e3139382e3130392e313733, 'Administrador', '2020-10-09 07:23:17'),
(20, 1, NULL, 0x3139362e3230332e32352e3139, 'Administrador', '2020-10-09 08:05:41'),
(21, 1, NULL, 0x3139362e3230332e32352e3139, 'Administrador', '2020-10-09 08:05:58'),
(22, 1, NULL, 0x3137392e31322e36342e313138, 'Administrador', '2020-10-09 12:12:01'),
(23, 1, NULL, 0x3138362e3136372e3234322e3437, 'Administrador', '2020-10-09 13:04:22'),
(24, 1, NULL, 0x3138312e3232392e3138382e313635, 'administrador', '2020-10-09 21:00:58'),
(25, 1, NULL, 0x3139302e3139382e3130392e313733, 'Administrador', '2020-10-10 11:18:45'),
(26, 1, NULL, 0x3138312e3139392e35332e3734, 'administrador', '2020-10-10 11:55:25'),
(27, 1, NULL, 0x3138312e36372e3235352e313538, 'Administrador', '2020-10-10 12:08:16'),
(28, 1, NULL, 0x3139302e3233362e3131352e3236, 'Administrador', '2020-10-10 13:16:56'),
(29, 1, NULL, 0x3138312e3139382e3135342e3134, 'Administrador', '2020-10-10 16:36:29'),
(30, 1, NULL, 0x3138362e3136372e3234332e323136, 'Administrador', '2020-10-10 20:42:12'),
(31, 1, NULL, 0x3138362e38392e37332e3433, 'Administrador', '2020-10-11 00:38:16'),
(32, 1, NULL, 0x3139302e3234322e32372e323135, 'Administrador', '2020-10-11 02:06:54'),
(33, 1, NULL, 0x382e3234322e3232332e3932, 'Administrador', '2020-10-11 02:44:40'),
(34, 1, NULL, 0x382e3234322e3232332e3932, 'Administrador', '2020-10-11 02:45:20'),
(35, 1, NULL, 0x3139302e3139382e3130392e313733, 'Administrador', '2020-10-11 13:04:30'),
(36, 1, NULL, 0x38302e3137342e3137372e313736, 'administrador', '2020-10-11 15:47:04'),
(37, 1, NULL, 0x3139302e312e34372e313937, 'administrador', '2020-10-11 15:50:58'),
(38, 1, NULL, 0x3137302e38322e3139312e313636, 'Administrador', '2020-10-11 23:41:04'),
(39, 1, NULL, 0x3137302e38322e3139312e313636, 'Administrador', '2020-10-11 23:52:21'),
(40, 1, NULL, 0x3139302e3139382e3130392e313733, 'Administrador', '2020-10-12 11:55:10'),
(41, 1, NULL, 0x3139302e3233332e3233312e313734, 'Administrador', '2020-10-12 15:13:07'),
(42, 1, NULL, 0x3139302e3233352e3137302e3633, 'Administrador', '2020-10-12 15:13:21'),
(43, 1, NULL, 0x3138362e37372e3234382e323431, 'administrador', '2020-10-12 18:50:02'),
(44, 1, NULL, 0x3139302e3233322e3230352e313632, 'Administrador', '2020-10-12 21:13:08'),
(45, 1, NULL, 0x3136352e32322e3233302e313734, 'Administrador', '2020-10-13 11:55:53'),
(46, 1, NULL, 0x3139302e3233332e34392e3938, 'Administrador', '2020-10-13 16:23:10'),
(47, 1, NULL, 0x3136352e32322e3233302e313734, 'Administrador', '2020-10-13 16:32:08'),
(48, 1, NULL, 0x3138362e33352e39332e3230, 'Administrador', '2020-10-13 16:58:57'),
(49, 4, NULL, 0x3136352e32322e3233302e313734, 'hey', '2020-10-13 17:54:06'),
(50, 1, NULL, 0x3136352e32322e3233302e313734, 'Administrador', '2020-10-13 18:43:13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_customers`
--
ALTER TABLE `tec_customers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_expenses`
--
ALTER TABLE `tec_expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `card_no` (`card_no`);

--
-- Indices de la tabla `tec_groups`
--
ALTER TABLE `tec_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_printers`
--
ALTER TABLE `tec_printers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_products`
--
ALTER TABLE `tec_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indices de la tabla `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indices de la tabla `tec_purchases`
--
ALTER TABLE `tec_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_registers`
--
ALTER TABLE `tec_registers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_sales`
--
ALTER TABLE `tec_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_sessions`
--
ALTER TABLE `tec_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indices de la tabla `tec_settings`
--
ALTER TABLE `tec_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indices de la tabla `tec_stores`
--
ALTER TABLE `tec_stores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_users`
--
ALTER TABLE `tec_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indices de la tabla `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_combo_items`
--
ALTER TABLE `tec_combo_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_customers`
--
ALTER TABLE `tec_customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_expenses`
--
ALTER TABLE `tec_expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_gift_cards`
--
ALTER TABLE `tec_gift_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_groups`
--
ALTER TABLE `tec_groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tec_purchases`
--
ALTER TABLE `tec_purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_purchase_items`
--
ALTER TABLE `tec_purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tec_stores`
--
ALTER TABLE `tec_stores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_suppliers`
--
ALTER TABLE `tec_suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tec_suspended_items`
--
ALTER TABLE `tec_suspended_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_suspended_sales`
--
ALTER TABLE `tec_suspended_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
