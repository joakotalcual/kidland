-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-04-2024 a las 05:36:55
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos_n`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_alquiler_salones`
--

CREATE TABLE `tec_alquiler_salones` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) DEFAULT NULL,
  `id_salon` int(11) DEFAULT NULL,
  `nombre_salon` varchar(255) DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `items` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `metodo_pago` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_alquiler_salones`
--

INSERT INTO `tec_alquiler_salones` (`id`, `id_cliente`, `nombre_cliente`, `id_salon`, `nombre_salon`, `hora_entrada`, `hora_salida`, `total`, `items`, `created_at`, `updated_at`, `metodo_pago`) VALUES
(1, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-04-18 02:33:22', '2024-04-18 02:33:22', 'cash'),
(2, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"2\"},{\"id\":\"3\",\"cantidad\":\"5\"}]', '2024-04-18 03:18:46', '2024-04-18 03:18:46', 'cash'),
(3, 2, 'Heysel', 3, 'salon 1 ', '10:00:00', '16:00:00', 50.00, '[{\"id\":\"2\",\"cantidad\":\"10\"},{\"id\":\"4\",\"cantidad\":\"20\"}]', '2024-04-18 03:33:11', '2024-04-18 03:33:11', 'cash');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_categories`
--

CREATE TABLE `tec_categories` (
  `id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(100) DEFAULT 'no_image.png'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_categories`
--

INSERT INTO `tec_categories` (`id`, `code`, `name`, `image`) VALUES
(1, 'G01', 'General', 'no_image.png'),
(3, '002', 'bebibas', 'no_image.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_cliente_tiene_pedidos`
--

CREATE TABLE `tec_cliente_tiene_pedidos` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_cliente_tiene_pedidos`
--

INSERT INTO `tec_cliente_tiene_pedidos` (`id`, `id_pedido`, `id_cliente`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2024-04-12 14:29:27', '2024-04-12 14:29:27'),
(4, 2, 2, '2024-04-12 20:24:00', '2024-04-12 20:24:00'),
(5, 3, 2, '2024-04-12 20:24:22', '2024-04-12 20:24:22');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_customers`
--

INSERT INTO `tec_customers` (`id`, `name`, `cf1`, `cf2`, `phone`, `email`, `store_id`) VALUES
(2, 'Heysel', '', '', '04262384614', 'heysel.castillo16@gmail.com', NULL),
(1, 'Prueba', '', '', '04262384614', 'heysel.castillo16@gmail.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_expenses`
--

CREATE TABLE `tec_expenses` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_gift_cards`
--

CREATE TABLE `tec_gift_cards` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_groups`
--

CREATE TABLE `tec_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_groups`
--

INSERT INTO `tec_groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'staff', 'Staff');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_horarios`
--

CREATE TABLE `tec_horarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `hora_entrada` time DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_horarios`
--

INSERT INTO `tec_horarios` (`id`, `nombre`, `hora_entrada`, `hora_salida`, `created_at`, `updated_at`) VALUES
(1, '4pm a 10pm', '16:00:00', '22:00:00', '2024-04-17 22:52:46', '2024-04-17 22:59:09'),
(2, 'de 10am a 4pm', '10:00:00', '16:00:00', '2024-04-18 03:31:52', '2024-04-18 03:31:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_insumos`
--

CREATE TABLE `tec_insumos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `tipo_medida` varchar(50) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_insumos`
--

INSERT INTO `tec_insumos` (`id`, `nombre`, `cantidad`, `tipo_medida`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 'tomate', 49.50, 'kg', 1, '2024-04-12 14:27:52', '2024-04-13 18:25:28'),
(2, 'cebolla', 70.00, 'kg', 1, '2024-04-13 01:31:07', '2024-04-13 13:51:32');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_inventario_salones`
--

CREATE TABLE `tec_inventario_salones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` float(22,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_inventario_salones`
--

INSERT INTO `tec_inventario_salones` (`id`, `nombre`, `cantidad`, `store_id`, `created_at`, `updated_at`, `precio`) VALUES
(2, 'sillas', 50, 1, '2024-04-17 22:31:03', '2024-04-17 22:31:03', NULL),
(4, 'bebida', 100, 1, '2024-04-18 03:30:45', '2024-04-18 03:30:45', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_juegos`
--

CREATE TABLE `tec_juegos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_login_attempts`
--

CREATE TABLE `tec_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_mesas`
--

CREATE TABLE `tec_mesas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_mesas`
--

INSERT INTO `tec_mesas` (`id`, `nombre`, `store_id`, `created_at`, `updated_at`) VALUES
(2, 'Nueva', 1, '2024-04-12 20:06:29', '2024-04-12 20:06:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_payments`
--

CREATE TABLE `tec_payments` (
  `id` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
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
  `pos_paid` decimal(25,4) DEFAULT 0.0000,
  `pos_balance` decimal(25,4) DEFAULT 0.0000,
  `gc_no` varchar(20) DEFAULT NULL,
  `reference` varchar(50) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_payments`
--

INSERT INTO `tec_payments` (`id`, `date`, `sale_id`, `customer_id`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `note`, `pos_paid`, `pos_balance`, `gc_no`, `reference`, `updated_by`, `updated_at`, `store_id`) VALUES
(3, '2020-10-10 23:52:27', 3, 1, NULL, 'cash', '', '', '', '', '', '', 75.0000, NULL, 1, NULL, '', 175.0000, 100.0000, '', NULL, NULL, NULL, 3),
(4, '2020-10-11 01:49:06', 4, 2, NULL, 'cash', '', '', '', '', '', '', 1285.2000, NULL, 1, NULL, '', 1285.2000, 0.0000, '', NULL, NULL, NULL, 3),
(5, '2020-10-11 22:45:04', 5, 2, NULL, 'cash', '', '', '', '', '', '', 245.0000, NULL, 1, NULL, '', 245.0000, 0.0000, '', NULL, NULL, NULL, 2),
(6, '2020-10-13 15:26:53', 6, 2, NULL, 'cash', '', '', '', '', '', '', 710.3000, NULL, 1, NULL, '', 710.3000, 0.0000, '', NULL, NULL, NULL, 3),
(7, '2020-10-13 17:46:18', 7, 2, NULL, 'cash', '', '', '', '', '', '', 75.0000, NULL, 1, NULL, '', 75.0000, 0.0000, '', NULL, NULL, NULL, 2),
(8, '2024-03-27 03:32:37', 8, 2, NULL, 'cash', '', '', '', '', '', '', 21.0000, NULL, 1, NULL, '', 21.0000, 0.0000, '', NULL, NULL, NULL, 2),
(9, '2024-03-27 03:33:47', 9, 2, NULL, 'cash', '', '', '', '', '', '', 26.2500, NULL, 1, NULL, '', 26.2500, 0.0000, '', NULL, NULL, NULL, 1),
(10, '2024-03-27 03:34:19', 10, 2, NULL, 'cash', '', '', '', '', '', '', 26.2500, NULL, 1, NULL, '', 26.2500, 0.0000, '', NULL, NULL, NULL, 1),
(11, '2024-03-27 03:35:29', 11, 2, NULL, 'cash', '', '', '', '', '', '', 21.0000, NULL, 1, NULL, '', 21.0000, 0.0000, '', NULL, NULL, NULL, 1),
(12, '2024-03-27 03:38:33', 12, 2, NULL, 'cash', '', '', '', '', '', '', 21.0000, NULL, 1, NULL, '', 21.0000, 0.0000, '', NULL, NULL, NULL, 1),
(16, '2024-04-03 00:41:09', 16, 2, NULL, 'cash', '', '', '', '', '', '', 12.6000, NULL, 1, NULL, '', 12.6000, 0.0000, '', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_pedidos`
--

CREATE TABLE `tec_pedidos` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(255) NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_pedidos`
--

INSERT INTO `tec_pedidos` (`id`, `id_cliente`, `total`, `created_at`, `updated_at`, `estado`) VALUES
(1, 2, 40.00, '2024-04-12 14:29:27', '2024-04-12 14:30:32', 'completado'),
(2, 2, 20.00, '2024-04-12 20:24:00', '2024-04-12 20:28:09', 'completado'),
(3, 2, 100.00, '2024-04-12 20:24:22', '2024-04-12 20:24:22', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_pedido_tiene_recetas`
--

CREATE TABLE `tec_pedido_tiene_recetas` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `cantidad` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_pedido_tiene_recetas`
--

INSERT INTO `tec_pedido_tiene_recetas` (`id`, `id_receta`, `id_pedido`, `cantidad`, `created_at`, `updated_at`, `precio`) VALUES
(1, 1, 1, '2', '2024-04-12 14:29:26', '2024-04-12 14:29:27', '20.00'),
(4, 1, 2, '1', '2024-04-12 20:24:00', '2024-04-12 20:24:00', '20.00'),
(5, 1, 3, '5', '2024-04-12 20:24:22', '2024-04-12 20:24:22', '20.00');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `category_id` int(11) NOT NULL DEFAULT 1,
  `price` decimal(25,4) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.png',
  `tax` varchar(20) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `tax_method` tinyint(1) DEFAULT 1,
  `quantity` decimal(15,4) DEFAULT 0.0000,
  `barcode_symbology` varchar(20) NOT NULL DEFAULT 'code39',
  `type` varchar(20) NOT NULL DEFAULT 'standard',
  `details` text DEFAULT NULL,
  `alert_quantity` decimal(10,4) DEFAULT 0.0000
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_products`
--

INSERT INTO `tec_products` (`id`, `code`, `name`, `category_id`, `price`, `image`, `tax`, `cost`, `tax_method`, `quantity`, `barcode_symbology`, `type`, `details`, `alert_quantity`) VALUES
(4, '1010', 'Arroz', 1, 600.0000, 'no_image.png', '0', 500.0000, 0, 0.0000, 'code128', 'standard', '', 10.0000),
(5, '001', 'Product 1', 1, 62.0000, '6483e39459e915b0c2599b9fa89d0920.jpg', '4', 50.0000, 1, 0.0000, 'code39', 'standard', '', 0.0000),
(6, '12345', 'Balanceado', 1, 25.0000, 'no_image.png', '0', 20.0000, 0, 0.0000, 'code128', 'standard', '', 14.0000),
(7, '00101', 'Item 001', 1, 12.0000, 'no_image.png', '12', 10.0000, 0, 0.0000, 'code128', 'standard', '', 1.0000),
(8, '63632', 'prueba12', 1, 20.0000, 'no_image.png', '0', 10.0000, 0, 0.0000, 'code128', 'standard', '', 18.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_product_store_qty`
--

CREATE TABLE `tec_product_store_qty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(25,4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_product_store_qty`
--

INSERT INTO `tec_product_store_qty` (`id`, `product_id`, `store_id`, `quantity`, `price`) VALUES
(1, 1, 1, 0.0000, 1500.0000),
(2, 2, 1, 29.0000, 600.0000),
(3, 3, 1, 20.0000, 600.0000),
(4, 4, 1, 50.0000, 0.0000),
(5, 4, 2, 19.0000, 0.0000),
(6, 5, 1, 0.0000, 0.0000),
(7, 5, 2, 199.0000, 0.0000),
(8, 5, 3, -1.0000, 0.0000),
(9, 6, 1, 13.0000, 25.0000),
(10, 6, 2, 15.0000, 20.0000),
(11, 6, 3, -1.0000, 0.0000),
(12, 7, 1, 19.0000, 12.0000),
(13, 7, 2, 0.0000, 0.0000),
(14, 7, 3, -3.0000, 0.0000),
(15, 8, 1, 19.0000, 20.0000),
(16, 8, 2, 0.0000, 20.0000),
(17, 8, 3, 0.0000, 20.0000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_purchases`
--

CREATE TABLE `tec_purchases` (
  `id` int(11) NOT NULL,
  `reference` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) NOT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_recetas`
--

CREATE TABLE `tec_recetas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `store_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_recetas`
--

INSERT INTO `tec_recetas` (`id`, `nombre`, `precio`, `store_id`) VALUES
(1, 'hamburguesa', 20.00, '1'),
(2, 'perro', 50.00, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_receta_tiene_insumos`
--

CREATE TABLE `tec_receta_tiene_insumos` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_receta_tiene_insumos`
--

INSERT INTO `tec_receta_tiene_insumos` (`id`, `id_receta`, `id_insumo`, `cantidad`) VALUES
(1, 1, 1, 1),
(4, 2, 1, 50),
(5, 2, 2, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_registers`
--

CREATE TABLE `tec_registers` (
  `id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_registers`
--

INSERT INTO `tec_registers` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`, `store_id`) VALUES
(1, '2019-10-01 00:47:21', 1, 100.0000, 'close', 100.0000, 0, 0, 100.0000, 0, 0, '', '2020-10-09 07:42:08', NULL, 1, 1),
(2, '2020-10-09 07:42:53', 1, 20.0000, 'close', 1380.2000, 0, 0, 1380.2000, 0, 0, '', '2020-10-11 12:05:21', NULL, 1, 3),
(3, '2020-10-11 22:41:32', 1, 50000.0000, 'close', 50245.0000, 0, 0, 50245.0000, 0, 0, '', '2020-10-11 22:49:41', NULL, 1, 2),
(4, '2020-10-11 22:52:29', 1, 5899.0000, 'close', 6609.3000, 0, 0, 6609.3000, 0, 0, '', '2020-10-13 17:45:28', NULL, 1, 3),
(5, '2020-10-13 17:46:10', 1, 50.0000, 'close', 219.5000, 0, 0, 219.5000, 0, 0, '', '2024-03-27 03:37:38', NULL, 1, 2),
(6, '2024-03-27 03:37:56', 1, 0.0000, 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

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
  `store_id` int(11) NOT NULL DEFAULT 1,
  `hold_ref` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_sales`
--

INSERT INTO `tec_sales` (`id`, `date`, `customer_id`, `customer_name`, `total`, `product_discount`, `order_discount_id`, `order_discount`, `total_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `grand_total`, `total_items`, `total_quantity`, `paid`, `created_by`, `updated_by`, `updated_at`, `note`, `status`, `rounding`, `store_id`, `hold_ref`) VALUES
(3, '2020-10-10 19:52:27', 1, 'Walk-in Client', 75.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 75.0000, 2, 3.0000, 75.0000, 1, NULL, NULL, '', 'paid', 0.0000, 3, ''),
(4, '2020-10-10 21:49:06', 2, 'Heysel', 1221.4286, 0.0000, NULL, 0.0000, 0.0000, 2.5714, '5%', 61.2000, 63.7714, 1285.2000, 2, 4.0000, 1285.2000, 1, NULL, NULL, '', 'paid', 0.0000, 3, ''),
(5, '2020-10-11 18:45:04', 2, 'Heysel', 245.0000, 0.0000, NULL, 0.0000, 0.0000, 8.0000, NULL, 0.0000, 8.0000, 253.0000, 3, 3.0000, 245.0000, 1, NULL, NULL, '', 'partial', 0.0000, 2, ''),
(6, '2020-10-13 11:26:53', 2, 'Heysel', 672.7143, 0.0000, NULL, 0.0000, 0.0000, 3.7657, '5%', 33.8240, 37.5897, 710.3040, 3, 3.0000, 710.3000, 1, NULL, NULL, '', 'paid', 0.0000, 3, ''),
(7, '2020-10-13 13:46:18', 2, 'Heysel', 75.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, NULL, 0.0000, 0.0000, 75.0000, 1, 3.0000, 75.0000, 1, NULL, NULL, '', 'paid', 0.0000, 2, ''),
(8, '2024-03-26 21:32:37', 2, 'Heysel', 20.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, '5%', 1.0000, 1.0000, 21.0000, 1, 1.0000, 21.0000, 1, NULL, NULL, '', 'paid', 0.0000, 2, ''),
(9, '2024-03-26 21:33:47', 2, 'Heysel', 25.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, '5%', 1.2500, 1.2500, 26.2500, 1, 1.0000, 26.2500, 1, NULL, NULL, '', 'paid', 0.0000, 1, ''),
(10, '2024-03-26 21:34:19', 2, 'Heysel', 25.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, '5%', 1.2500, 1.2500, 26.2500, 1, 1.0000, 26.2500, 1, NULL, NULL, '', 'paid', 0.0000, 1, ''),
(11, '2024-03-26 21:35:29', 2, 'Heysel', 20.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, '5%', 1.0000, 1.0000, 21.0000, 1, 1.0000, 21.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, ''),
(12, '2024-03-26 21:38:33', 2, 'Heysel', 20.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, '5%', 1.0000, 1.0000, 21.0000, 1, 1.0000, 21.0000, 1, NULL, NULL, '', 'paid', 0.0000, 1, ''),
(16, '2024-04-02 20:41:09', 2, 'Heysel', 10.7143, 0.0000, NULL, 0.0000, 0.0000, 1.2857, '5%', 0.6000, 1.8857, 12.6000, 1, 1.0000, 12.6000, 1, NULL, NULL, '', 'paid', 0.0000, 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sales_juegos`
--

CREATE TABLE `tec_sales_juegos` (
  `id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `qr` longtext DEFAULT NULL,
  `juego_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sales_juegos_personas`
--

CREATE TABLE `tec_sales_juegos_personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `sale_juego_id` int(11) DEFAULT NULL,
  `tipo_persona` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `cost` decimal(25,4) DEFAULT 0.0000,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(50) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_sale_items`
--

INSERT INTO `tec_sale_items` (`id`, `sale_id`, `product_id`, `quantity`, `unit_price`, `net_unit_price`, `discount`, `item_discount`, `tax`, `item_tax`, `subtotal`, `real_unit_price`, `cost`, `product_code`, `product_name`, `comment`) VALUES
(5, 3, 6, 1.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 25.0000, 25.0000, 20.0000, '12345', 'Balanceado', ''),
(4, 3, 4, 2.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 50.0000, 25.0000, 500.0000, '1010', 'Arroz', ''),
(6, 4, 4, 2.0000, 600.0000, 600.0000, '0', 0.0000, 0, 0.0000, 1200.0000, 600.0000, 500.0000, '1010', 'Arroz', ''),
(7, 4, 7, 2.0000, 12.0000, 10.7143, '0', 0.0000, 12, 2.5714, 24.0000, 12.0000, 10.0000, '00101', 'Item 001', ''),
(8, 5, 4, 1.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 25.0000, 25.0000, 500.0000, '1010', 'Arroz', ''),
(9, 5, 5, 1.0000, 200.0000, 200.0000, '0', 0.0000, 4, 8.0000, 208.0000, 200.0000, 50.0000, '001', 'Product 1', ''),
(10, 5, 6, 1.0000, 20.0000, 20.0000, '0', 0.0000, 0, 0.0000, 20.0000, 20.0000, 20.0000, '12345', 'Balanceado', ''),
(11, 6, 4, 1.0000, 600.0000, 600.0000, '0', 0.0000, 0, 0.0000, 600.0000, 600.0000, 500.0000, '1010', 'Arroz', ''),
(12, 6, 5, 1.0000, 62.0000, 62.0000, '0', 0.0000, 4, 2.4800, 64.4800, 62.0000, 50.0000, '001', 'Product 1', ''),
(13, 6, 7, 1.0000, 12.0000, 10.7143, '0', 0.0000, 12, 1.2857, 12.0000, 12.0000, 10.0000, '00101', 'Item 001', ''),
(14, 7, 6, 3.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 75.0000, 25.0000, 20.0000, '12345', 'Balanceado', ''),
(15, 8, 6, 1.0000, 20.0000, 20.0000, '0', 0.0000, 0, 0.0000, 20.0000, 20.0000, 20.0000, '12345', 'Balanceado', ''),
(16, 9, 6, 1.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 25.0000, 25.0000, 20.0000, '12345', 'Balanceado', ''),
(17, 10, 6, 1.0000, 25.0000, 25.0000, '0', 0.0000, 0, 0.0000, 25.0000, 25.0000, 20.0000, '12345', 'Balanceado', ''),
(18, 11, 8, 1.0000, 20.0000, 20.0000, '0', 0.0000, 0, 0.0000, 20.0000, 20.0000, 10.0000, '63632', 'prueba12', ''),
(19, 12, 8, 1.0000, 20.0000, 20.0000, '0', 0.0000, 0, 0.0000, 20.0000, 20.0000, 10.0000, '63632', 'prueba12', ''),
(23, 16, 7, 1.0000, 12.0000, 10.7143, '0', 0.0000, 12, 1.2857, 12.0000, 12.0000, 10.0000, '00101', 'Item 001', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_salones`
--

CREATE TABLE `tec_salones` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `store_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` float(22,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_salones`
--

INSERT INTO `tec_salones` (`id`, `nombre`, `store_id`, `created_at`, `updated_at`, `precio`) VALUES
(2, 'prueba', 1, '2024-04-17 23:50:54', '2024-04-17 23:50:54', 20.00),
(3, 'salon 1 ', 1, '2024-04-18 03:30:27', '2024-04-18 03:30:27', 50.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_sessions`
--

CREATE TABLE `tec_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_sessions`
--

INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('8nina5gamcmchv9fgqa70jh6qu0utb1s', '::1', 1713411191, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333431303938383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('pc5na2h807gin8uotrf9rohdunuv1he6', '::1', 1713410988, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333431303938383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('2egibt992sojnvjb3eulrl43ubng2554', '::1', 1713410615, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333431303631353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('c763b6okbejitjoqf9kcvkofv5j9bnf2', '::1', 1713410311, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333431303331313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ir145mvsl1bp907kfanso9ga6420gcc2', '::1', 1713403499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430333439393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('cnlbuho66v0ihq8r5mopdjio5il8itje', '::1', 1713403194, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430333139343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('0shc3vvfblvgauf3qcmh4me1v9j8ge4r', '::1', 1713402867, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430323836373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('rcc9g9v49ihurpjn9pog6e40efca353k', '::1', 1713402333, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430323333333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('vlfihqvjbsmsbmtf2hldkp6lvrt6iti0', '::1', 1713401055, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430313035353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('asd0cbguv5tl0055b9r89nmvoc788ksi', '::1', 1713400741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430303734313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('n4smf43sqlqhv12u3mrclfuuuej5lcqj', '::1', 1713400378, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430303337383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('rl4lvuk2823ifkfg7vd8q06ctd5j42c3', '::1', 1713400045, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333430303034353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ag4ikcj5vbqggggu1sj0ok00erpe3mlm', '::1', 1713399670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339393637303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('pf8qj9iu21n9oohmsguejpleutq5pcan', '::1', 1713399348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339393334383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('5nqfme7er8nioikun2bdv43uk62qjpgu', '::1', 1713398125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339383132353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ianb12hig6mpffjf7e4kf23m6iiog9ai', '::1', 1713397800, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339373830303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31353a2273616c6f6e65732075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('hmage3b080ja8sbr34t2vtrep25j59g4', '::1', 1713394664, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339343636343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('q783g7i9aq0t5ab6qt2p63o0a1rrd0hq', '::1', 1713394299, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339343239393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('r8svhl95ashu3rc4tmcbngjcphl1dh1r', '::1', 1713393907, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339333930373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('d33qd08jbqvgc9fmcvsad4ioaqbj5urc', '::1', 1713392824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339323832343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31353a2273616c6f6e65732064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('l6fa2sf6s1f2j3lqvbmpoifmaqreler2', '::1', 1713391809, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339313830393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('imi7atlu36obeg6iv70v3jrr4lqv809m', '::1', 1713390858, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339303835383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('s15438ep33d4mlt019435c326gamrrit', '::1', 1713032741, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333033323632363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303133323037223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mqm2m7tira43nevrnros92sntthptr26', '::1', 1713016256, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333031363235363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393731323035223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('qfrsgh57j5vll5k1u0cnm1kjsqjc6sn8', '::1', 1713016296, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333031363235363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393731323035223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('oankcott83hdfu1tp4d4mk2q6gku69ao', '::1', 1713015547, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333031353534373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393731323035223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('k4ej5hnbue9eum007ecqlg47ll7v153c', '::1', 1713013530, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333031333533303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393731323035223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ft0m87109sno15kff678jt0jrdv1apj8', '::1', 1712981737, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938313635343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('emb7ofnbnaifen3kkso31rsggkof25fo', '::1', 1712981654, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938313635343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('e3gik6thpuvs513uj8i3dr4p95mffe9v', '::1', 1712981348, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938313334383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('0ch1banu9ossj4v1vlmp4kebf67939a2', '::1', 1712981007, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938313030373b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('f27alvhfaea4r87tbrrt2jekmmk7e916', '::1', 1712980699, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938303639393b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('6ddbuk9suolfeaqbal4lgngbl2jhtp8o', '::1', 1712980086, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323938303038363b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('8fqb6rderi0pcquh2hh7tmi5al9v5l22', '::1', 1712978935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937383933353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('2g4vvr1j4r0ks5jt6ucliio7cn0lbvnf', '::1', 1712978041, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937383034313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('om8gb15kmve077boqar75lq2l0a94d73', '::1', 1712977706, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937373730363b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('2v6n9s8fp23nh32lrn425iejo73cng9n', '::1', 1712977243, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937373234333b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('92hq21dapi15c0lus8q6icsea31o0ua1', '::1', 1712976744, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937363734343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('t3nd0eio8ll8898pvcbu6k50fkg7210n', '::1', 1712975644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937353634343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('7vkifmdltqcvl6gf1ak1rims6b0ul0i1', '::1', 1712973365, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937333336353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('bsrrde67sbcsjkgsjq181vbgs6fflh8j', '::1', 1712972976, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937323937363b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('du0nshl0sf9kkflven9bc6t9l2ugrs6p', '::1', 1712971710, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937313731303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('qmeq9hspj9q3eqr73u957l2ifak427lu', '::1', 1712959224, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935383934343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('f9gkaaqvdlrnldkkls020ogdd548gfs4', '::1', 1712958944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935383934343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('e45a5i7dsl79lvtt0r26k1dquvqofol6', '::1', 1712958513, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935383531333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('72g6c28o050sfvvh11hkrqefeniuvni8', '::1', 1712958108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935383130383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('vdb174712e0avaovot9bf5lm6bbva35j', '::1', 1712953585, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935333538353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mmrn978048cb8khe5pg20umgu6oskv70', '::1', 1712953267, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935333236373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('q7p178v5u1f4reml65epjqp9sagmlh8h', '::1', 1712952956, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935323935363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('a21n3ghnp48pgukc78pvv35qc078rqc8', '::1', 1712952362, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323935323336323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393330353838223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('7rohhrsvcaqo32jjdhqqqiq1ujeo1tu4', '::1', 1712932047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933323034373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383734383535223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ot6ia7kgcoucjcd9b5coo478sbfp1usl', '::1', 1712932300, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933323034373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383734383535223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ssabbnva33n9vaadhipa35sjq1v817bg', '::1', 1712931693, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933313639333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383734383535223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('bq1nnil11ku7oe3emdn8iklrj8osffr7', '::1', 1712929073, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932393037333b),
('u681jak6vobn5ji0f2kp00ijriaqk2mq', '::1', 1712929383, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932393338333b),
('iahadv0hcfeahgfoptb57331e2sh1q26', '::1', 1712929690, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932393639303b),
('kjpvot43j7dlre1n9locnqdha0potr3t', '::1', 1712930090, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933303039303b),
('8u8oeqjeef6q4ulc83psrmk1gm1vkdkf', '::1', 1712930575, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933303537353b),
('dt0hs3nuj2f4d03irehpg5o20ujkt397', '::1', 1712931201, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323933313230313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383734383535223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('2to4m8u7rba39gn1ck6g6sn94j51j73h', '::1', 1712927887, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932373838373b),
('996jkh76u2rbfjr2alpirhim5eefccvb', '::1', 1712928432, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932383433323b),
('1o7b8lno1u5kfe4c35pif73pcjdvetck', '::1', 1712928748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323932383734383b),
('q0u5n2g2holsgrpv8en7aj2p3vt23j05', '::1', 1712905261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930353236313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('div6oam05vt0sen2u1f51s94n4gm8i7v', '::1', 1712905722, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930353236313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('hnk5sr9bairqk1tbpmmcn2n89jvcsfna', '::1', 1712904941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930343934313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('b8cm1ckoo57qjm819bdc1uv5u5l7s4bb', '::1', 1712904570, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930343537303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('985hfu40onq19b6vcp2toe3og80mktnr', '::1', 1712903278, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930333237383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('9hi4emjvvgsufd8og0evqcq5v22f9oss', '::1', 1712902960, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930323936303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('v9ipgjfbq25pd22pq81j8a8bpvnananh', '::1', 1712902577, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930323537373b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('hleau5i38n3shoqkidrkq9bfbnse764b', '::1', 1712902270, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930323237303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ruinj6mp3mcnpappvsinoqdk7ci1i3os', '::1', 1712900603, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930303630333b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ogicvj3i8ksoimhbmcpt2om0remmi64e', '::1', 1712899807, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839393830373b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('s3lkn8qv5kqr5uuqm8fhb8jdsl4j3j9m', '::1', 1712900152, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930303135323b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ch9h48baekinog7epmok72so5f44ofma', '::1', 1712892241, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839323234313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('5rif2l6v051ngmsg7b9i0e5hbsglgjo5', '::1', 1712892865, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839323836353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('tjf4nee53385ku1sriemvu6vc6kmpv9u', '::1', 1712893542, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839333534323b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mtc41rjp7bk8gavirepug5o6gboopq3m', '::1', 1712894018, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839343031383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('51ukuhsv5usjchn6o3qjsrn141vvsjqn', '::1', 1712895150, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839353135303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('6nfo1mm5r8eao6vm4caeqmerrfnfa1m6', '::1', 1712894670, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839343637303b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mmnk4krps45h54ob6pbesfh6q220tjnk', '::1', 1712895496, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839353439363b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('kc7a5c4qot5vhnfrep033guvu73oo9b4', '::1', 1712895915, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839353931353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('vber7hndt58355c06etfkuln9c7c51uv', '::1', 1712898215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839383231353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('b97a6mfg4qqgjb8lm3teh301kt4p29dj', '::1', 1712898538, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839383533383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('elik5jb8gbvdd1uejh4fbpq50ttfbr1p', '::1', 1712898854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839383835343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('q663q8ashb50iciep8vkvi7dpja3nohi', '::1', 1712899155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839393135353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('gta5e5rb9uq02omhs7vo8dllim5hic4q', '::1', 1712899498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839393439383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);

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
  `captcha` tinyint(1) NOT NULL DEFAULT 1,
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
  `decimals` tinyint(1) NOT NULL DEFAULT 2,
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
  `char_per_line` tinyint(4) DEFAULT 42,
  `rounding` tinyint(1) DEFAULT 0,
  `pin_code` varchar(20) DEFAULT NULL,
  `stripe` tinyint(1) DEFAULT NULL,
  `stripe_secret_key` varchar(100) DEFAULT NULL,
  `stripe_publishable_key` varchar(100) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `theme_style` varchar(25) DEFAULT 'green',
  `after_sale_page` tinyint(1) DEFAULT NULL,
  `overselling` tinyint(1) DEFAULT 1,
  `multi_store` tinyint(1) DEFAULT NULL,
  `qty_decimals` tinyint(1) DEFAULT 2,
  `symbol` varchar(55) DEFAULT NULL,
  `sac` tinyint(1) DEFAULT 0,
  `display_symbol` tinyint(1) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT 1,
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT 0,
  `local_printers` tinyint(1) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT NULL,
  `print_img` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_settings`
--

INSERT INTO `tec_settings` (`setting_id`, `logo`, `site_name`, `tel`, `dateformat`, `timeformat`, `default_email`, `language`, `version`, `theme`, `timezone`, `protocol`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `mmode`, `captcha`, `mailpath`, `currency_prefix`, `default_customer`, `default_tax_rate`, `rows_per_page`, `total_rows`, `header`, `footer`, `bsty`, `display_kb`, `default_category`, `default_discount`, `item_addition`, `barcode_symbology`, `pro_limit`, `decimals`, `thousands_sep`, `decimals_sep`, `focus_add_item`, `add_customer`, `toggle_category_slider`, `cancel_sale`, `suspend_sale`, `print_order`, `print_bill`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `java_applet`, `receipt_printer`, `pos_printers`, `cash_drawer_codes`, `char_per_line`, `rounding`, `pin_code`, `stripe`, `stripe_secret_key`, `stripe_publishable_key`, `purchase_code`, `envato_username`, `theme_style`, `after_sale_page`, `overselling`, `multi_store`, `qty_decimals`, `symbol`, `sac`, `display_symbol`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `local_printers`, `rtl`, `print_img`) VALUES
(1, 'logo1.png', 'Punto de Venta', '04262384614', 'D j M Y', 'h:i A', 'heysel.castillo16@gmail.com', 'english', '4.0.28', 'default', 'Asia/Kuala_Lumpur', 'mail', 'pop.gmail.com', 'noreply@spos.tecdiary.my', '', '25', '', 0, 0, NULL, 'USD', 2, '5%', 10, 30, NULL, NULL, 3, 0, 1, '0', 1, NULL, 10, 2, ',', '.', 'ALT+F1', 'ALT+F2', 'ALT+F10', 'ALT+F5', 'ALT+F6', 'ALT+F11', 'ALT+F12', 'ALT+F8', 'Ctrl+F1', 'Ctrl+F2', 'ALT+F7', 0, '', '', '', 42, 1, '2122', 0, '', '', '798cb9b0-5b7b-4890-a233-ad885f22a117', 'codigofuentefree', 'blue', 0, 0, 0, 2, '', 0, 0, 1, 1, 'null', 1, 1, 0, 0);

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
  `receipt_header` text DEFAULT NULL,
  `receipt_footer` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_stores`
--

INSERT INTO `tec_stores` (`id`, `name`, `code`, `logo`, `email`, `phone`, `address1`, `address2`, `city`, `state`, `postal_code`, `country`, `currency_code`, `receipt_header`, `receipt_footer`) VALUES
(1, 'SimplePOS', 'POS', 'logo.png', 'hey@gmail.com', '012345678', 'Address Line 1', '', 'Petaling Jaya', 'Selangor', '46000', 'Malaysia', 'MYR', NULL, 'This is receipt footer for store');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `store_id` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_tipos`
--

CREATE TABLE `tec_tipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `precio_adicional` decimal(10,2) DEFAULT NULL,
  `tiempo` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 2,
  `store_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_users`
--

INSERT INTO `tec_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `store_id`) VALUES
(1, 0x3a3a31, 0x3132372e302e302e31, 'Administrador', 'b420b17c03f86c1e37f84ad31363f7afdf9eafa7', NULL, 'hey@gmail.com', NULL, NULL, NULL, '93e1ad0171c5e0e479794de392129458b7bc670d', 1435204774, 1713390430, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', 'a7f50a21431a9e64106e3dedbdb7b7fa.jpg', 'female', 1, NULL),
(3, NULL, 0x3138362e39342e3133342e3736, 'admin', '009e4f927392e9953a174382f8d9b6f07774614e', NULL, 'heysel.castillo16@gmail.com', NULL, NULL, NULL, NULL, 1602164307, 1602164307, 1, 'Heysel', 'Castillo', NULL, '04262384614', NULL, 'female', 1, NULL);

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
  `time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(50, 1, NULL, 0x3136352e32322e3233302e313734, 'Administrador', '2020-10-13 18:43:13'),
(51, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:32:17'),
(52, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:36:39'),
(53, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:41:09'),
(54, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:42:58'),
(55, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:47:11'),
(56, 1, NULL, 0x34352e3137392e3136372e3634, 'Administrador', '2024-03-27 00:51:36'),
(57, 1, NULL, 0x3a3a31, 'Administrador', '2024-03-28 19:23:22'),
(58, 1, NULL, 0x3a3a31, 'Administrador', '2024-03-29 18:57:18'),
(59, 1, NULL, 0x3a3a31, 'Administrador', '2024-03-30 02:09:57'),
(60, 1, NULL, 0x3a3a31, 'Administrador', '2024-03-30 04:42:42'),
(61, 1, NULL, 0x3a3a31, 'Administrador', '2024-03-30 16:57:49'),
(62, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-01 20:44:01'),
(63, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-01 23:41:07'),
(64, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-02 02:02:36'),
(65, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-02 11:36:09'),
(66, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-02 20:56:13'),
(67, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-02 22:52:15'),
(68, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-02 22:52:19'),
(69, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-03 14:16:57'),
(70, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-03 16:22:03'),
(71, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-08 23:40:45'),
(72, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-11 03:55:53'),
(73, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-11 11:02:09'),
(74, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-11 14:38:23'),
(75, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-11 20:20:11'),
(76, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-11 22:34:15'),
(77, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-12 14:03:08'),
(78, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-12 19:47:48'),
(79, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-13 01:20:05'),
(80, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-13 13:00:07'),
(81, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-13 18:23:47'),
(82, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-17 21:47:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_ventas_restaurante`
--

CREATE TABLE `tec_ventas_restaurante` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `tipo_pago` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_ventas_restaurante`
--

INSERT INTO `tec_ventas_restaurante` (`id`, `id_cliente`, `id_pedido`, `total`, `tipo_pago`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 40.00, 'cash', '2024-04-12 14:30:32', '2024-04-12 14:30:32'),
(2, 2, 2, 20.00, 'cash', '2024-04-12 20:28:09', '2024-04-12 20:28:09');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tec_alquiler_salones`
--
ALTER TABLE `tec_alquiler_salones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_cliente_tiene_pedidos`
--
ALTER TABLE `tec_cliente_tiene_pedidos`
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
-- Indices de la tabla `tec_horarios`
--
ALTER TABLE `tec_horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_insumos`
--
ALTER TABLE `tec_insumos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_inventario_salones`
--
ALTER TABLE `tec_inventario_salones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_juegos`
--
ALTER TABLE `tec_juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_mesas`
--
ALTER TABLE `tec_mesas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_payments`
--
ALTER TABLE `tec_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_pedidos`
--
ALTER TABLE `tec_pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_pedido_tiene_recetas`
--
ALTER TABLE `tec_pedido_tiene_recetas`
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
-- Indices de la tabla `tec_recetas`
--
ALTER TABLE `tec_recetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_receta_tiene_insumos`
--
ALTER TABLE `tec_receta_tiene_insumos`
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
-- Indices de la tabla `tec_sales_juegos`
--
ALTER TABLE `tec_sales_juegos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_sales_juegos_personas`
--
ALTER TABLE `tec_sales_juegos_personas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tec_salones`
--
ALTER TABLE `tec_salones`
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
-- Indices de la tabla `tec_tipos`
--
ALTER TABLE `tec_tipos`
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
-- Indices de la tabla `tec_ventas_restaurante`
--
ALTER TABLE `tec_ventas_restaurante`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tec_alquiler_salones`
--
ALTER TABLE `tec_alquiler_salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_cliente_tiene_pedidos`
--
ALTER TABLE `tec_cliente_tiene_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT de la tabla `tec_horarios`
--
ALTER TABLE `tec_horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_insumos`
--
ALTER TABLE `tec_insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_inventario_salones`
--
ALTER TABLE `tec_inventario_salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tec_juegos`
--
ALTER TABLE `tec_juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_login_attempts`
--
ALTER TABLE `tec_login_attempts`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tec_mesas`
--
ALTER TABLE `tec_mesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_payments`
--
ALTER TABLE `tec_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tec_pedidos`
--
ALTER TABLE `tec_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_pedido_tiene_recetas`
--
ALTER TABLE `tec_pedido_tiene_recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tec_printers`
--
ALTER TABLE `tec_printers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tec_products`
--
ALTER TABLE `tec_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tec_product_store_qty`
--
ALTER TABLE `tec_product_store_qty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
-- AUTO_INCREMENT de la tabla `tec_recetas`
--
ALTER TABLE `tec_recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_receta_tiene_insumos`
--
ALTER TABLE `tec_receta_tiene_insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tec_registers`
--
ALTER TABLE `tec_registers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tec_sales`
--
ALTER TABLE `tec_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tec_sales_juegos`
--
ALTER TABLE `tec_sales_juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_sales_juegos_personas`
--
ALTER TABLE `tec_sales_juegos_personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tec_salones`
--
ALTER TABLE `tec_salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT de la tabla `tec_tipos`
--
ALTER TABLE `tec_tipos`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `tec_ventas_restaurante`
--
ALTER TABLE `tec_ventas_restaurante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
