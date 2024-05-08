-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-05-2024 a las 07:36:28
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
  `metodo_pago` varchar(255) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `qr` text DEFAULT NULL,
  `capacidad` int(11) DEFAULT 110
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_alquiler_salones`
--

INSERT INTO `tec_alquiler_salones` (`id`, `id_cliente`, `nombre_cliente`, `id_salon`, `nombre_salon`, `hora_entrada`, `hora_salida`, `total`, `items`, `created_at`, `updated_at`, `metodo_pago`, `fecha`, `qr`, `capacidad`) VALUES
(1, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-04-18 02:33:22', '2024-04-18 02:33:22', 'cash', NULL, NULL, 110),
(2, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"2\"},{\"id\":\"3\",\"cantidad\":\"5\"}]', '2024-04-18 03:18:46', '2024-04-18 03:18:46', 'cash', NULL, NULL, 110),
(3, 2, 'Heysel', 3, 'salon 1 ', '10:00:00', '16:00:00', 50.00, '[{\"id\":\"2\",\"cantidad\":\"10\"},{\"id\":\"4\",\"cantidad\":\"20\"}]', '2024-04-18 03:33:11', '2024-04-18 03:33:11', 'cash', NULL, NULL, 110),
(4, 2, 'Heysel', 2, 'prueba', '10:00:00', '16:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"10\"}]', '2024-04-21 22:33:14', '2024-04-21 22:33:14', 'cash', NULL, NULL, 110),
(5, 2, 'Heysel', 2, 'prueba', '10:00:00', '16:00:00', 0.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-05-03 02:24:02', '2024-05-03 02:24:02', 'CC', '2024-05-02', NULL, 110),
(6, 2, 'Heysel', 2, 'prueba', '10:00:00', '16:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-05-08 03:25:05', '2024-05-08 03:25:05', 'cash', '2024-05-07', NULL, 110),
(7, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-05-08 03:36:11', '2024-05-08 03:36:11', 'cash', '2024-05-07', NULL, 110),
(8, 2, 'Heysel', 2, 'prueba', '16:00:00', '22:00:00', 20.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-05-08 03:36:50', '2024-05-08 03:36:50', 'cash', '2024-05-07', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L10 1L10 2L8 2L8 3L9 3L9 4L10 4L10 5L9 5L9 6L8 6L8 8L4 8L4 9L3 9L3 8L0 8L0 9L2 9L2 10L0 10L0 11L1 11L1 12L0 12L0 13L1 13L1 14L0 14L0 15L1 15L1 17L2 17L2 19L1 19L1 18L0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L2 20L2 21L5 21L5 20L6 20L6 21L8 21L8 25L10 25L10 26L12 26L12 24L14 24L14 26L13 26L13 27L14 27L14 26L15 26L15 25L17 25L17 26L18 26L18 22L17 22L17 21L18 21L18 20L20 20L20 22L19 22L19 23L20 23L20 26L19 26L19 27L17 27L17 29L18 29L18 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 24L28 24L28 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8L26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 17L20 17L20 19L18 19L18 18L17 18L17 17L18 17L18 15L17 15L17 13L18 13L18 12L19 12L19 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L18 1L18 2L19 2L19 3L18 3L18 4L19 4L19 6L18 6L18 7L17 7L17 5L16 5L16 4L17 4L17 3L14 3L14 5L13 5L13 6L12 6L12 8L11 8L11 6L10 6L10 5L11 5L11 4L12 4L12 3L13 3L13 2L14 2L14 1L15 1L15 2L16 2L16 0L14 0L14 1L13 1L13 0L12 0L12 1L10 1L10 0ZM11 2L11 3L12 3L12 2ZM9 6L9 7L10 7L10 6ZM13 6L13 7L14 7L14 9L13 9L13 8L12 8L12 10L10 10L10 8L9 8L9 9L8 9L8 10L7 10L7 9L4 9L4 12L3 12L3 10L2 10L2 12L1 12L1 13L2 13L2 14L3 14L3 13L5 13L5 16L7 16L7 17L4 17L4 16L2 16L2 17L4 17L4 19L5 19L5 18L8 18L8 16L7 16L7 15L8 15L8 14L9 14L9 17L10 17L10 18L9 18L9 20L11 20L11 21L9 21L9 22L11 22L11 21L12 21L12 20L13 20L13 21L14 21L14 22L13 22L13 23L14 23L14 22L15 22L15 24L16 24L16 23L17 23L17 22L16 22L16 21L15 21L15 19L16 19L16 20L17 20L17 18L16 18L16 17L14 17L14 16L12 16L12 15L11 15L11 13L12 13L12 12L13 12L13 10L14 10L14 11L15 11L15 13L13 13L13 14L14 14L14 15L15 15L15 16L16 16L16 13L17 13L17 12L16 12L16 9L15 9L15 7L16 7L16 8L17 8L17 7L16 7L16 6L15 6L15 7L14 7L14 6ZM19 6L19 8L18 8L18 10L17 10L17 11L18 11L18 10L19 10L19 8L20 8L20 9L21 9L21 8L20 8L20 6ZM5 10L5 11L7 11L7 10ZM8 10L8 12L6 12L6 13L9 13L9 11L10 11L10 10ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM11 11L11 12L12 12L12 11ZM2 12L2 13L3 13L3 12ZM6 14L6 15L7 15L7 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM25 15L25 16L26 16L26 15ZM11 16L11 18L10 18L10 19L11 19L11 20L12 20L12 19L11 19L11 18L12 18L12 16ZM21 17L21 19L20 19L20 20L22 20L22 17ZM13 18L13 19L14 19L14 18ZM6 19L6 20L8 20L8 19ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM10 23L10 24L12 24L12 23ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM8 26L8 29L9 29L9 26ZM20 26L20 27L21 27L21 26ZM27 26L27 27L28 27L28 26ZM11 27L11 28L10 28L10 29L11 29L11 28L12 28L12 29L13 29L13 28L12 28L12 27ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 110),
(9, 2, 'Heysel', 3, 'salon 1 ', '10:00:00', '16:00:00', 50.00, '[{\"id\":\"2\",\"cantidad\":\"20\"}]', '2024-05-08 05:02:41', '2024-05-08 05:31:38', 'cash', '2024-05-08', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 4L16 4L16 5L14 5L14 7L15 7L15 8L13 8L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 9L1 9L1 11L0 11L0 12L1 12L1 11L2 11L2 14L1 14L1 15L0 15L0 21L1 21L1 17L2 17L2 19L3 19L3 21L5 21L5 20L6 20L6 21L8 21L8 23L9 23L9 24L8 24L8 29L12 29L12 27L13 27L13 26L11 26L11 23L10 23L10 22L9 22L9 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L15 25L15 24L14 24L14 23L16 23L16 24L17 24L17 25L18 25L18 26L19 26L19 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 5L17 5L17 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM16 1L16 2L17 2L17 1ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM19 5L19 7L18 7L18 6L17 6L17 7L16 7L16 6L15 6L15 7L16 7L16 8L15 8L15 9L14 9L14 10L16 10L16 11L15 11L15 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L11 13L11 17L8 17L8 16L10 16L10 15L9 15L9 13L8 13L8 14L7 14L7 13L6 13L6 12L7 12L7 11L8 11L8 12L9 12L9 10L7 10L7 9L6 9L6 10L3 10L3 9L2 9L2 10L3 10L3 12L5 12L5 13L4 13L4 14L5 14L5 13L6 13L6 14L7 14L7 15L6 15L6 16L7 16L7 17L5 17L5 16L4 16L4 15L3 15L3 14L2 14L2 15L1 15L1 16L2 16L2 17L4 17L4 18L3 18L3 19L4 19L4 20L5 20L5 19L4 19L4 18L7 18L7 17L8 17L8 18L10 18L10 20L11 20L11 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 19L16 19L16 20L14 20L14 19L15 19L15 18L16 18L16 17L17 17L17 16L18 16L18 17L19 17L19 16L18 16L18 15L20 15L20 14L16 14L16 13L15 13L15 12L16 12L16 11L17 11L17 12L18 12L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 7L20 7L20 5ZM17 8L17 9L16 9L16 10L17 10L17 9L18 9L18 11L19 11L19 12L20 12L20 11L19 11L19 9L18 9L18 8ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM6 10L6 11L5 11L5 12L6 12L6 11L7 11L7 10ZM23 10L23 11L24 11L24 10ZM13 12L13 13L12 13L12 14L13 14L13 15L12 15L12 17L13 17L13 18L15 18L15 17L14 17L14 16L15 16L15 15L16 15L16 16L17 16L17 15L16 15L16 14L14 14L14 12ZM28 13L28 14L29 14L29 13ZM2 15L2 16L3 16L3 15ZM7 15L7 16L8 16L8 15ZM13 15L13 16L14 16L14 15ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM6 19L6 20L7 20L7 19ZM21 21L21 24L24 24L24 21ZM18 22L18 23L17 23L17 24L18 24L18 25L20 25L20 24L18 24L18 23L19 23L19 22ZM22 22L22 23L23 23L23 22ZM9 24L9 28L10 28L10 27L11 27L11 26L10 26L10 24ZM25 24L25 25L26 25L26 24ZM15 26L15 27L14 27L14 28L15 28L15 29L18 29L18 28L15 28L15 27L17 27L17 26ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 0);

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
(2, 'de 10am a 4pm', '10:00:00', '16:00:00', '2024-04-18 03:31:52', '2024-04-18 03:31:52'),
(3, '4pm a 10pm', '16:00:00', '22:00:00', '2024-04-21 22:30:09', '2024-04-21 22:30:09');

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
(1, 'tomate', 407.70, 'kg', 1, '2024-04-12 14:27:52', '2024-05-03 04:30:09'),
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
(2, 'sillas', 16, 1, '2024-04-17 22:31:03', '2024-05-08 05:02:39', NULL),
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

--
-- Volcado de datos para la tabla `tec_juegos`
--

INSERT INTO `tec_juegos` (`id`, `nombre`, `tipo`, `store_id`, `created_at`, `updated_at`) VALUES
(1, 'prueba', '1', 1, '2024-04-21 21:43:24', '2024-04-21 21:43:24'),
(2, 'nuevo', '1', 1, '2024-05-03 00:24:03', '2024-05-03 00:24:03'),
(3, 'prueba t', '2', 1, '2024-05-07 21:20:52', '2024-05-07 21:20:52');

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
(2, 'perro', 50.00, '1'),
(3, 'huevos con carne', 10.00, '1'),
(4, 'pepito', 50.00, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tec_receta_tiene_insumos`
--

CREATE TABLE `tec_receta_tiene_insumos` (
  `id` int(11) NOT NULL,
  `id_receta` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad` float(22,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_receta_tiene_insumos`
--

INSERT INTO `tec_receta_tiene_insumos` (`id`, `id_receta`, `id_insumo`, `cantidad`) VALUES
(4, 2, 1, 50.00),
(5, 2, 2, 20.00),
(6, 3, 1, 1.00),
(8, 4, 1, 0.20),
(9, 1, 1, 0.10);

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

--
-- Volcado de datos para la tabla `tec_sales_juegos`
--

INSERT INTO `tec_sales_juegos` (`id`, `created_at`, `updated_at`, `qr`, `juego_id`, `precio`, `tiempo`, `store_id`) VALUES
(1, '2024-05-07 21:36:41', '2024-05-07 21:36:42', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L10 1L10 2L8 2L8 3L9 3L9 4L10 4L10 5L9 5L9 6L8 6L8 8L4 8L4 10L2 10L2 12L1 12L1 10L0 10L0 12L1 12L1 14L0 14L0 17L2 17L2 18L5 18L5 19L1 19L1 18L0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L2 20L2 21L3 21L3 20L6 20L6 21L7 21L7 20L6 20L6 19L7 19L7 18L9 18L9 19L10 19L10 20L9 20L9 21L8 21L8 25L10 25L10 26L8 26L8 29L9 29L9 28L12 28L12 29L13 29L13 28L12 28L12 27L11 27L11 26L12 26L12 24L14 24L14 26L13 26L13 27L14 27L14 26L15 26L15 24L17 24L17 25L16 25L16 26L17 26L17 27L16 27L16 28L15 28L15 29L19 29L19 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 24L28 24L28 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8L26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 15L15 15L15 13L16 13L16 14L18 14L18 12L19 12L19 11L14 11L14 10L13 10L13 12L12 12L12 11L11 11L11 12L12 12L12 13L11 13L11 14L10 14L10 13L9 13L9 12L8 12L8 14L10 14L10 15L12 15L12 16L10 16L10 18L9 18L9 17L7 17L7 16L8 16L8 15L7 15L7 14L6 14L6 13L7 13L7 12L6 12L6 13L5 13L5 15L4 15L4 12L5 12L5 11L4 11L4 10L5 10L5 9L7 9L7 10L6 10L6 11L10 11L10 10L12 10L12 8L13 8L13 9L15 9L15 8L16 8L16 7L17 7L17 9L16 9L16 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L16 1L16 0L15 0L15 3L14 3L14 4L15 4L15 6L14 6L14 7L13 7L13 6L12 6L12 8L11 8L11 6L10 6L10 5L11 5L11 4L12 4L12 3L13 3L13 2L14 2L14 1L13 1L13 0L12 0L12 1L10 1L10 0ZM17 1L17 2L16 2L16 3L15 3L15 4L16 4L16 6L15 6L15 7L14 7L14 8L15 8L15 7L16 7L16 6L17 6L17 7L18 7L18 9L19 9L19 8L20 8L20 9L21 9L21 8L20 8L20 6L19 6L19 5L17 5L17 4L18 4L18 3L19 3L19 2L18 2L18 1ZM11 2L11 3L12 3L12 2ZM9 6L9 7L10 7L10 6ZM18 6L18 7L19 7L19 6ZM0 8L0 9L3 9L3 8ZM9 8L9 9L8 9L8 10L10 10L10 8ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM3 11L3 12L2 12L2 15L1 15L1 16L2 16L2 15L3 15L3 12L4 12L4 11ZM13 14L13 15L14 15L14 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM6 15L6 16L3 16L3 17L5 17L5 18L7 18L7 17L6 17L6 16L7 16L7 15ZM25 15L25 16L26 16L26 15ZM12 16L12 18L11 18L11 19L12 19L12 20L10 20L10 21L12 21L12 20L13 20L13 21L14 21L14 22L13 22L13 23L14 23L14 22L15 22L15 23L16 23L16 21L15 21L15 19L16 19L16 20L17 20L17 18L16 18L16 16L15 16L15 17L14 17L14 16ZM18 16L18 19L20 19L20 20L18 20L18 21L17 21L17 22L18 22L18 23L19 23L19 24L18 24L18 25L19 25L19 26L20 26L20 27L21 27L21 26L20 26L20 23L19 23L19 22L20 22L20 20L22 20L22 17L21 17L21 19L20 19L20 17L19 17L19 16ZM13 18L13 19L14 19L14 18ZM21 21L21 24L24 24L24 21ZM9 22L9 24L12 24L12 23L10 23L10 22ZM22 22L22 23L23 23L23 22ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM27 26L27 27L28 27L28 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(2, '2024-05-07 21:38:15', '2024-05-07 21:38:15', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L10 1L10 2L8 2L8 3L9 3L9 4L10 4L10 5L9 5L9 6L8 6L8 8L4 8L4 9L3 9L3 8L0 8L0 9L2 9L2 10L4 10L4 11L1 11L1 12L0 12L0 13L2 13L2 14L1 14L1 15L0 15L0 16L1 16L1 17L2 17L2 19L1 19L1 18L0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L3 20L3 21L5 21L5 20L6 20L6 21L7 21L7 20L6 20L6 19L7 19L7 18L5 18L5 17L7 17L7 16L10 16L10 15L12 15L12 16L11 16L11 17L10 17L10 20L12 20L12 21L9 21L9 20L8 20L8 25L9 25L9 26L8 26L8 29L11 29L11 28L12 28L12 29L13 29L13 28L12 28L12 27L11 27L11 26L12 26L12 24L14 24L14 26L13 26L13 27L14 27L14 26L15 26L15 24L17 24L17 25L16 25L16 26L17 26L17 27L16 27L16 28L15 28L15 29L19 29L19 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 24L28 24L28 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8L26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 15L15 15L15 13L16 13L16 14L18 14L18 12L19 12L19 11L14 11L14 10L13 10L13 12L12 12L12 11L11 11L11 12L12 12L12 13L11 13L11 14L9 14L9 11L10 11L10 10L12 10L12 8L13 8L13 9L15 9L15 8L16 8L16 7L17 7L17 9L16 9L16 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L16 1L16 0L15 0L15 3L14 3L14 4L15 4L15 6L14 6L14 7L13 7L13 6L12 6L12 8L11 8L11 6L10 6L10 5L11 5L11 4L12 4L12 3L13 3L13 2L14 2L14 1L13 1L13 0L12 0L12 1L10 1L10 0ZM17 1L17 2L16 2L16 3L15 3L15 4L16 4L16 6L15 6L15 7L14 7L14 8L15 8L15 7L16 7L16 6L17 6L17 7L18 7L18 9L19 9L19 8L20 8L20 9L21 9L21 8L20 8L20 6L19 6L19 5L17 5L17 4L18 4L18 3L19 3L19 2L18 2L18 1ZM11 2L11 3L12 3L12 2ZM9 6L9 7L10 7L10 6ZM18 6L18 7L19 7L19 6ZM9 8L9 9L4 9L4 10L5 10L5 12L4 12L4 13L5 13L5 12L7 12L7 11L8 11L8 10L10 10L10 8ZM6 10L6 11L7 11L7 10ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM6 13L6 14L7 14L7 13ZM4 14L4 15L5 15L5 14ZM8 14L8 15L9 15L9 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM1 15L1 16L2 16L2 17L3 17L3 18L4 18L4 17L3 17L3 15ZM6 15L6 16L7 16L7 15ZM14 15L14 16L12 16L12 18L11 18L11 19L12 19L12 20L13 20L13 21L14 21L14 22L13 22L13 23L14 23L14 22L15 22L15 23L16 23L16 21L15 21L15 19L16 19L16 20L17 20L17 18L16 18L16 16L15 16L15 15ZM25 15L25 16L26 16L26 15ZM14 16L14 17L15 17L15 16ZM18 16L18 19L20 19L20 20L18 20L18 21L17 21L17 22L18 22L18 23L19 23L19 24L18 24L18 25L19 25L19 26L20 26L20 27L21 27L21 26L20 26L20 23L19 23L19 22L20 22L20 20L22 20L22 17L21 17L21 19L20 19L20 17L19 17L19 16ZM8 17L8 18L9 18L9 17ZM13 18L13 19L14 19L14 18ZM4 19L4 20L5 20L5 19ZM21 21L21 24L24 24L24 21ZM10 22L10 24L9 24L9 25L10 25L10 24L12 24L12 23L11 23L11 22ZM22 22L22 23L23 23L23 22ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM27 26L27 27L28 27L28 26ZM9 27L9 28L10 28L10 27ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(3, '2024-05-07 21:38:40', '2024-05-07 21:38:40', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 3L9 3L9 4L8 4L8 8L6 8L6 9L4 9L4 8L3 8L3 10L2 10L2 11L1 11L1 9L2 9L2 8L0 8L0 11L1 11L1 16L0 16L0 17L2 17L2 16L3 16L3 17L4 17L4 18L2 18L2 20L4 20L4 21L8 21L8 23L9 23L9 25L8 25L8 26L9 26L9 27L8 27L8 29L9 29L9 28L10 28L10 29L11 29L11 28L12 28L12 29L14 29L14 28L12 28L12 24L14 24L14 25L13 25L13 27L15 27L15 24L17 24L17 26L18 26L18 27L16 27L16 28L15 28L15 29L16 29L16 28L17 28L17 29L21 29L21 27L22 27L22 26L24 26L24 28L23 28L23 29L24 29L24 28L25 28L25 29L26 29L26 28L25 28L25 26L28 26L28 27L27 27L27 29L28 29L28 27L29 27L29 26L28 26L28 25L25 25L25 20L24 20L24 17L22 17L22 16L24 16L24 15L25 15L25 17L26 17L26 15L27 15L27 17L28 17L28 18L27 18L27 20L26 20L26 22L27 22L27 23L26 23L26 24L28 24L28 22L29 22L29 21L27 21L27 20L29 20L29 17L28 17L28 15L29 15L29 14L27 14L27 13L29 13L29 12L28 12L28 10L29 10L29 9L28 9L28 8L26 8L26 9L25 9L25 8L22 8L22 9L21 9L21 6L20 6L20 5L19 5L19 3L21 3L21 2L19 2L19 1L21 1L21 0L17 0L17 1L18 1L18 2L17 2L17 3L18 3L18 4L15 4L15 3L16 3L16 0L15 0L15 2L14 2L14 4L13 4L13 5L14 5L14 7L15 7L15 8L18 8L18 7L19 7L19 9L16 9L16 11L15 11L15 12L14 12L14 11L13 11L13 12L12 12L12 13L10 13L10 14L12 14L12 16L11 16L11 17L10 17L10 19L9 19L9 16L10 16L10 15L9 15L9 14L8 14L8 15L7 15L7 14L6 14L6 15L5 15L5 17L4 17L4 16L3 16L3 15L4 15L4 14L5 14L5 11L4 11L4 12L2 12L2 11L3 11L3 10L6 10L6 11L7 11L7 10L6 10L6 9L8 9L8 11L11 11L11 10L12 10L12 9L11 9L11 8L10 8L10 7L11 7L11 6L12 6L12 8L13 8L13 9L14 9L14 8L13 8L13 6L12 6L12 5L11 5L11 6L10 6L10 5L9 5L9 4L12 4L12 3L13 3L13 0L12 0L12 1L11 1L11 2L9 2L9 1L10 1L10 0ZM18 2L18 3L19 3L19 2ZM14 4L14 5L15 5L15 4ZM16 5L16 6L15 6L15 7L16 7L16 6L17 6L17 7L18 7L18 6L19 6L19 7L20 7L20 6L19 6L19 5L18 5L18 6L17 6L17 5ZM9 6L9 7L10 7L10 6ZM8 8L8 9L9 9L9 10L10 10L10 8ZM23 9L23 11L22 11L22 10L20 10L20 11L19 11L19 10L17 10L17 12L18 12L18 15L19 15L19 16L18 16L18 17L17 17L17 16L15 16L15 18L14 18L14 17L13 17L13 16L12 16L12 17L11 17L11 19L12 19L12 20L13 20L13 21L14 21L14 22L15 22L15 23L14 23L14 24L15 24L15 23L17 23L17 24L18 24L18 25L20 25L20 20L23 20L23 19L22 19L22 17L20 17L20 14L19 14L19 13L21 13L21 12L20 12L20 11L22 11L22 12L23 12L23 13L22 13L22 15L21 15L21 16L22 16L22 15L24 15L24 14L25 14L25 15L26 15L26 13L27 13L27 12L26 12L26 13L25 13L25 12L23 12L23 11L24 11L24 10L25 10L25 9ZM26 9L26 10L28 10L28 9ZM18 11L18 12L19 12L19 11ZM6 12L6 13L7 13L7 12ZM2 13L2 15L3 15L3 14L4 14L4 13ZM13 13L13 14L14 14L14 15L17 15L17 13L15 13L15 14L14 14L14 13ZM6 15L6 16L7 16L7 17L5 17L5 18L7 18L7 19L4 19L4 20L8 20L8 21L9 21L9 20L8 20L8 16L9 16L9 15L8 15L8 16L7 16L7 15ZM16 17L16 18L17 18L17 19L15 19L15 20L14 20L14 18L13 18L13 20L14 20L14 21L16 21L16 22L17 22L17 23L18 23L18 24L19 24L19 23L18 23L18 22L17 22L17 20L19 20L19 19L18 19L18 18L17 18L17 17ZM0 18L0 19L1 19L1 18ZM20 18L20 19L21 19L21 18ZM25 18L25 19L26 19L26 18ZM0 20L0 21L1 21L1 20ZM21 21L21 24L24 24L24 21ZM9 22L9 23L10 23L10 25L9 25L9 26L11 26L11 23L10 23L10 22ZM22 22L22 23L23 23L23 22ZM21 25L21 26L22 26L22 25ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(4, '2024-05-07 21:39:44', '2024-05-07 21:39:44', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M10 0L10 2L11 2L11 0ZM12 0L12 1L13 1L13 0ZM14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 2L12 2L12 4L14 4L14 5L11 5L11 6L10 6L10 4L11 4L11 3L8 3L8 4L9 4L9 5L8 5L8 7L9 7L9 8L6 8L6 9L7 9L7 10L5 10L5 11L4 11L4 9L5 9L5 8L0 8L0 12L2 12L2 13L0 13L0 14L2 14L2 15L1 15L1 16L2 16L2 17L0 17L0 21L1 21L1 18L2 18L2 17L3 17L3 18L5 18L5 17L7 17L7 18L6 18L6 19L5 19L5 20L4 20L4 19L3 19L3 20L2 20L2 21L3 21L3 20L4 20L4 21L7 21L7 20L8 20L8 23L9 23L9 24L8 24L8 29L10 29L10 28L11 28L11 27L10 27L10 28L9 28L9 26L11 26L11 25L12 25L12 26L13 26L13 27L12 27L12 29L13 29L13 28L14 28L14 29L15 29L15 28L14 28L14 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L28 24L28 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0ZM8 1L8 2L9 2L9 1ZM15 2L15 5L14 5L14 6L13 6L13 7L12 7L12 6L11 6L11 7L12 7L12 9L11 9L11 8L10 8L10 9L8 9L8 11L5 11L5 13L6 13L6 14L8 14L8 15L6 15L6 16L8 16L8 15L10 15L10 17L8 17L8 18L7 18L7 19L6 19L6 20L7 20L7 19L8 19L8 20L10 20L10 21L9 21L9 23L11 23L11 22L13 22L13 23L12 23L12 25L15 25L15 26L16 26L16 25L15 25L15 24L14 24L14 23L15 23L15 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM15 5L15 6L14 6L14 7L15 7L15 9L16 9L16 10L14 10L14 8L13 8L13 9L12 9L12 10L13 10L13 11L12 11L12 13L14 13L14 15L15 15L15 17L16 17L16 18L14 18L14 17L12 17L12 15L13 15L13 14L10 14L10 15L11 15L11 17L12 17L12 18L13 18L13 19L12 19L12 21L13 21L13 20L14 20L14 21L15 21L15 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 9L18 9L18 8L16 8L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM9 6L9 7L10 7L10 6ZM15 6L15 7L16 7L16 6ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM1 9L1 10L2 10L2 9ZM10 9L10 11L11 11L11 9ZM23 10L23 11L24 11L24 10ZM2 11L2 12L3 12L3 11ZM13 11L13 12L14 12L14 13L15 13L15 14L16 14L16 13L17 13L17 12L14 12L14 11ZM19 11L19 12L20 12L20 11ZM6 12L6 13L7 13L7 12ZM9 12L9 13L11 13L11 12ZM28 13L28 14L29 14L29 13ZM3 14L3 15L2 15L2 16L4 16L4 17L5 17L5 16L4 16L4 14ZM16 16L16 17L17 17L17 16ZM28 17L28 18L29 18L29 17ZM8 18L8 19L10 19L10 20L11 20L11 18ZM21 18L21 19L22 19L22 18ZM14 19L14 20L15 20L15 19ZM10 21L10 22L11 22L11 21ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM26 23L26 24L25 24L25 25L26 25L26 24L27 24L27 23ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(5, '2024-05-07 21:40:34', '2024-05-07 21:40:34', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 3L9 3L9 4L8 4L8 8L6 8L6 9L8 9L8 10L5 10L5 9L4 9L4 8L3 8L3 10L2 10L2 8L0 8L0 10L1 10L1 11L2 11L2 12L3 12L3 10L5 10L5 11L4 11L4 14L2 14L2 13L1 13L1 12L0 12L0 13L1 13L1 14L2 14L2 15L1 15L1 16L0 16L0 17L1 17L1 16L4 16L4 14L6 14L6 15L7 15L7 16L5 16L5 17L2 17L2 19L3 19L3 20L4 20L4 19L5 19L5 20L6 20L6 21L8 21L8 23L9 23L9 25L8 25L8 26L9 26L9 27L8 27L8 29L11 29L11 28L12 28L12 29L14 29L14 28L12 28L12 24L14 24L14 25L13 25L13 27L15 27L15 24L17 24L17 26L18 26L18 27L16 27L16 28L15 28L15 29L16 29L16 28L17 28L17 29L21 29L21 27L22 27L22 26L24 26L24 28L23 28L23 29L24 29L24 28L25 28L25 29L26 29L26 28L25 28L25 26L28 26L28 27L27 27L27 29L28 29L28 27L29 27L29 26L28 26L28 25L25 25L25 20L24 20L24 17L22 17L22 16L24 16L24 15L25 15L25 17L26 17L26 15L27 15L27 17L28 17L28 18L27 18L27 20L26 20L26 22L27 22L27 23L26 23L26 24L28 24L28 22L29 22L29 21L27 21L27 20L29 20L29 17L28 17L28 15L29 15L29 14L27 14L27 13L29 13L29 12L28 12L28 10L29 10L29 9L28 9L28 8L26 8L26 9L25 9L25 8L22 8L22 9L21 9L21 6L20 6L20 5L19 5L19 3L21 3L21 2L19 2L19 1L21 1L21 0L17 0L17 1L18 1L18 2L17 2L17 3L18 3L18 4L15 4L15 3L16 3L16 0L15 0L15 2L14 2L14 4L13 4L13 5L14 5L14 7L15 7L15 8L18 8L18 7L19 7L19 9L16 9L16 11L15 11L15 12L14 12L14 11L13 11L13 12L12 12L12 13L10 13L10 15L9 15L9 16L8 16L8 15L7 15L7 14L6 14L6 13L8 13L8 14L9 14L9 13L8 13L8 12L9 12L9 11L11 11L11 10L12 10L12 9L11 9L11 8L10 8L10 7L11 7L11 6L12 6L12 8L13 8L13 9L14 9L14 8L13 8L13 6L12 6L12 5L11 5L11 6L10 6L10 5L9 5L9 4L12 4L12 3L13 3L13 0L12 0L12 1L11 1L11 2L9 2L9 1L10 1L10 0ZM18 2L18 3L19 3L19 2ZM14 4L14 5L15 5L15 4ZM16 5L16 6L15 6L15 7L16 7L16 6L17 6L17 7L18 7L18 6L19 6L19 7L20 7L20 6L19 6L19 5L18 5L18 6L17 6L17 5ZM9 6L9 7L10 7L10 6ZM8 8L8 9L9 9L9 10L10 10L10 8ZM23 9L23 11L22 11L22 10L20 10L20 11L19 11L19 10L17 10L17 12L18 12L18 15L19 15L19 16L18 16L18 17L17 17L17 16L15 16L15 18L14 18L14 17L13 17L13 16L12 16L12 14L11 14L11 15L10 15L10 16L9 16L9 17L6 17L6 18L5 18L5 19L6 19L6 20L8 20L8 18L9 18L9 19L12 19L12 20L13 20L13 21L14 21L14 22L15 22L15 23L14 23L14 24L15 24L15 23L17 23L17 24L18 24L18 25L20 25L20 20L23 20L23 19L22 19L22 17L20 17L20 14L19 14L19 13L21 13L21 12L20 12L20 11L22 11L22 12L23 12L23 13L22 13L22 15L21 15L21 16L22 16L22 15L24 15L24 14L25 14L25 15L26 15L26 13L27 13L27 12L26 12L26 13L25 13L25 12L23 12L23 11L24 11L24 10L25 10L25 9ZM26 9L26 10L28 10L28 9ZM6 11L6 12L8 12L8 11ZM18 11L18 12L19 12L19 11ZM13 13L13 15L14 15L14 13ZM15 13L15 15L17 15L17 13ZM10 16L10 17L12 17L12 16ZM16 17L16 18L17 18L17 19L15 19L15 20L14 20L14 18L13 18L13 20L14 20L14 21L16 21L16 22L17 22L17 23L18 23L18 24L19 24L19 23L18 23L18 22L17 22L17 20L19 20L19 19L18 19L18 18L17 18L17 17ZM0 18L0 19L1 19L1 18ZM6 18L6 19L7 19L7 18ZM20 18L20 19L21 19L21 18ZM25 18L25 19L26 19L26 18ZM0 20L0 21L1 21L1 20ZM10 20L10 21L9 21L9 23L11 23L11 22L10 22L10 21L11 21L11 20ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM9 25L9 26L11 26L11 25ZM21 25L21 26L22 26L22 25ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(6, '2024-05-07 21:40:56', '2024-05-07 21:40:56', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M10 0L10 2L11 2L11 0ZM12 0L12 1L13 1L13 0ZM14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 2L12 2L12 4L14 4L14 5L11 5L11 6L10 6L10 4L11 4L11 3L8 3L8 4L9 4L9 5L8 5L8 7L9 7L9 8L6 8L6 9L5 9L5 8L0 8L0 9L2 9L2 11L3 11L3 13L2 13L2 14L3 14L3 13L4 13L4 15L3 15L3 16L4 16L4 18L2 18L2 16L1 16L1 13L0 13L0 16L1 16L1 17L0 17L0 21L1 21L1 18L2 18L2 19L3 19L3 20L2 20L2 21L3 21L3 20L4 20L4 19L5 19L5 18L6 18L6 19L7 19L7 18L6 18L6 17L7 17L7 16L6 16L6 15L8 15L8 16L9 16L9 17L8 17L8 18L9 18L9 17L10 17L10 16L9 16L9 15L8 15L8 14L10 14L10 13L11 13L11 12L9 12L9 11L8 11L8 10L9 10L9 9L10 9L10 11L11 11L11 9L12 9L12 10L13 10L13 11L12 11L12 13L14 13L14 14L11 14L11 17L12 17L12 18L13 18L13 19L12 19L12 21L13 21L13 20L14 20L14 21L15 21L15 20L16 20L16 19L18 19L18 18L21 18L21 19L22 19L22 20L20 20L20 21L18 21L18 20L17 20L17 21L16 21L16 22L15 22L15 23L14 23L14 24L15 24L15 25L12 25L12 23L13 23L13 22L11 22L11 20L10 20L10 19L11 19L11 18L10 18L10 19L8 19L8 20L5 20L5 21L8 21L8 23L9 23L9 21L10 21L10 24L8 24L8 29L10 29L10 28L11 28L11 27L10 27L10 28L9 28L9 26L11 26L11 25L12 25L12 26L13 26L13 27L12 27L12 29L13 29L13 28L14 28L14 29L15 29L15 28L14 28L14 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L28 24L28 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0ZM8 1L8 2L9 2L9 1ZM15 2L15 5L14 5L14 6L13 6L13 7L12 7L12 6L11 6L11 7L12 7L12 9L13 9L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L13 11L13 12L14 12L14 13L15 13L15 14L16 14L16 13L17 13L17 16L16 16L16 17L15 17L15 15L12 15L12 17L14 17L14 18L16 18L16 17L17 17L17 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM9 6L9 7L10 7L10 6ZM10 8L10 9L11 9L11 8ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM3 9L3 11L4 11L4 10L5 10L5 9ZM6 9L6 10L8 10L8 9ZM0 10L0 11L1 11L1 10ZM23 10L23 11L24 11L24 10ZM6 11L6 12L4 12L4 13L5 13L5 14L7 14L7 13L8 13L8 11ZM19 11L19 12L20 12L20 11ZM6 12L6 13L7 13L7 12ZM17 12L17 13L18 13L18 12ZM25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L22 18L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13ZM28 13L28 14L29 14L29 13ZM4 15L4 16L5 16L5 17L6 17L6 16L5 16L5 15ZM17 16L17 17L18 17L18 16ZM28 17L28 18L29 18L29 17ZM14 19L14 20L15 20L15 19ZM8 20L8 21L9 21L9 20ZM21 21L21 24L24 24L24 21ZM16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22ZM22 22L22 23L23 23L23 22ZM26 23L26 24L25 24L25 25L26 25L26 24L27 24L27 23ZM10 24L10 25L11 25L11 24ZM15 25L15 26L16 26L16 25ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(7, '2024-05-07 21:41:19', '2024-05-07 21:41:20', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L10 1L10 2L8 2L8 3L9 3L9 4L10 4L10 5L9 5L9 6L8 6L8 8L4 8L4 10L2 10L2 9L3 9L3 8L0 8L0 9L1 9L1 11L0 11L0 13L1 13L1 14L0 14L0 17L1 17L1 14L2 14L2 17L4 17L4 18L6 18L6 19L7 19L7 18L8 18L8 15L9 15L9 14L10 14L10 13L9 13L9 11L10 11L10 10L12 10L12 8L13 8L13 9L15 9L15 8L16 8L16 7L17 7L17 9L16 9L16 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L16 1L16 0L15 0L15 3L14 3L14 4L15 4L15 6L14 6L14 7L13 7L13 6L12 6L12 8L11 8L11 6L10 6L10 5L11 5L11 4L12 4L12 3L13 3L13 2L14 2L14 1L13 1L13 0L12 0L12 1L10 1L10 0ZM17 1L17 2L16 2L16 3L15 3L15 4L16 4L16 6L15 6L15 7L14 7L14 8L15 8L15 7L16 7L16 6L17 6L17 7L18 7L18 9L19 9L19 8L20 8L20 9L21 9L21 8L20 8L20 6L19 6L19 5L17 5L17 4L18 4L18 3L19 3L19 2L18 2L18 1ZM11 2L11 3L12 3L12 2ZM9 6L9 7L10 7L10 6ZM18 6L18 7L19 7L19 6ZM9 8L9 9L8 9L8 10L7 10L7 9L6 9L6 10L7 10L7 11L6 11L6 12L8 12L8 10L10 10L10 8ZM26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 15L14 15L14 14L15 14L15 13L16 13L16 14L18 14L18 12L19 12L19 11L14 11L14 10L13 10L13 12L12 12L12 11L11 11L11 12L12 12L12 13L11 13L11 15L12 15L12 16L11 16L11 18L12 18L12 16L14 16L14 17L15 17L15 16L16 16L16 18L17 18L17 20L16 20L16 19L15 19L15 21L16 21L16 23L15 23L15 22L14 22L14 21L13 21L13 20L12 20L12 19L10 19L10 18L9 18L9 19L10 19L10 20L8 20L8 25L10 25L10 26L8 26L8 29L10 29L10 28L12 28L12 29L13 29L13 28L12 28L12 27L11 27L11 26L12 26L12 24L14 24L14 26L13 26L13 27L14 27L14 26L15 26L15 24L17 24L17 25L16 25L16 26L17 26L17 27L16 27L16 28L15 28L15 29L19 29L19 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 24L28 24L28 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8ZM4 10L4 11L2 11L2 12L1 12L1 13L2 13L2 14L3 14L3 13L4 13L4 15L3 15L3 16L4 16L4 17L6 17L6 18L7 18L7 17L6 17L6 16L7 16L7 15L8 15L8 14L9 14L9 13L5 13L5 12L4 12L4 11L5 11L5 10ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM2 12L2 13L3 13L3 12ZM5 14L5 15L4 15L4 16L5 16L5 15L7 15L7 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM25 15L25 16L26 16L26 15ZM18 16L18 19L20 19L20 20L18 20L18 21L17 21L17 22L18 22L18 23L19 23L19 24L18 24L18 25L19 25L19 26L20 26L20 27L21 27L21 26L20 26L20 23L19 23L19 22L20 22L20 20L22 20L22 17L21 17L21 19L20 19L20 17L19 17L19 16ZM0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L2 20L2 21L3 21L3 20L4 20L4 21L7 21L7 20L5 20L5 19L3 19L3 20L2 20L2 19L1 19L1 18ZM13 18L13 19L14 19L14 18ZM11 20L11 21L12 21L12 20ZM9 21L9 24L10 24L10 25L11 25L11 24L12 24L12 23L11 23L11 22L10 22L10 21ZM21 21L21 24L24 24L24 21ZM13 22L13 23L14 23L14 22ZM22 22L22 23L23 23L23 22ZM10 23L10 24L11 24L11 23ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM27 26L27 27L28 27L28 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(8, '2024-05-07 21:42:38', '2024-05-07 21:42:38', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L10 1L10 2L8 2L8 3L9 3L9 4L10 4L10 5L9 5L9 6L8 6L8 8L4 8L4 10L2 10L2 11L4 11L4 10L5 10L5 12L4 12L4 13L3 13L3 14L4 14L4 16L5 16L5 18L6 18L6 19L8 19L8 18L6 18L6 17L8 17L8 16L9 16L9 18L10 18L10 17L11 17L11 18L12 18L12 16L14 16L14 17L15 17L15 16L16 16L16 18L17 18L17 20L16 20L16 19L15 19L15 21L16 21L16 23L15 23L15 22L14 22L14 21L13 21L13 20L12 20L12 19L9 19L9 20L10 20L10 21L8 21L8 25L9 25L9 26L8 26L8 29L10 29L10 28L12 28L12 29L13 29L13 28L12 28L12 27L11 27L11 26L12 26L12 24L14 24L14 26L13 26L13 27L14 27L14 26L15 26L15 24L17 24L17 25L16 25L16 26L17 26L17 27L16 27L16 28L15 28L15 29L19 29L19 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 24L28 24L28 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8L26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 15L15 15L15 13L16 13L16 14L18 14L18 12L19 12L19 11L14 11L14 10L13 10L13 12L12 12L12 11L11 11L11 12L12 12L12 13L11 13L11 15L12 15L12 16L9 16L9 15L10 15L10 13L8 13L8 11L10 11L10 10L12 10L12 8L13 8L13 9L15 9L15 8L16 8L16 7L17 7L17 9L16 9L16 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L16 1L16 0L15 0L15 3L14 3L14 4L15 4L15 6L14 6L14 7L13 7L13 6L12 6L12 8L11 8L11 6L10 6L10 5L11 5L11 4L12 4L12 3L13 3L13 2L14 2L14 1L13 1L13 0L12 0L12 1L10 1L10 0ZM17 1L17 2L16 2L16 3L15 3L15 4L16 4L16 6L15 6L15 7L14 7L14 8L15 8L15 7L16 7L16 6L17 6L17 7L18 7L18 9L19 9L19 8L20 8L20 9L21 9L21 8L20 8L20 6L19 6L19 5L17 5L17 4L18 4L18 3L19 3L19 2L18 2L18 1ZM11 2L11 3L12 3L12 2ZM9 6L9 7L10 7L10 6ZM18 6L18 7L19 7L19 6ZM0 8L0 10L1 10L1 9L3 9L3 8ZM9 8L9 10L10 10L10 8ZM5 9L5 10L7 10L7 11L6 11L6 12L5 12L5 14L7 14L7 13L6 13L6 12L7 12L7 11L8 11L8 10L7 10L7 9ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM0 11L0 12L1 12L1 13L0 13L0 14L1 14L1 13L2 13L2 12L1 12L1 11ZM13 13L13 15L14 15L14 16L15 16L15 15L14 15L14 13ZM8 14L8 15L5 15L5 16L8 16L8 15L9 15L9 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM25 15L25 16L26 16L26 15ZM2 16L2 18L3 18L3 19L4 19L4 20L3 20L3 21L4 21L4 20L5 20L5 19L4 19L4 18L3 18L3 16ZM18 16L18 19L20 19L20 20L18 20L18 21L17 21L17 22L18 22L18 23L19 23L19 24L18 24L18 25L19 25L19 26L20 26L20 27L21 27L21 26L20 26L20 23L19 23L19 22L20 22L20 20L22 20L22 17L21 17L21 19L20 19L20 17L19 17L19 16ZM0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L2 20L2 19L1 19L1 18ZM13 18L13 19L14 19L14 18ZM6 20L6 21L7 21L7 20ZM11 20L11 21L12 21L12 20ZM21 21L21 24L24 24L24 21ZM9 22L9 23L10 23L10 24L9 24L9 25L10 25L10 26L11 26L11 25L10 25L10 24L12 24L12 23L10 23L10 22ZM13 22L13 23L14 23L14 22ZM22 22L22 23L23 23L23 22ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM27 26L27 27L28 27L28 26ZM9 27L9 28L10 28L10 27ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(9, '2024-05-07 21:43:01', '2024-05-07 21:43:01', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 3L9 3L9 4L8 4L8 8L6 8L6 9L5 9L5 10L3 10L3 9L4 9L4 8L3 8L3 9L2 9L2 8L0 8L0 9L2 9L2 10L3 10L3 11L2 11L2 12L1 12L1 10L0 10L0 14L2 14L2 15L0 15L0 17L1 17L1 16L2 16L2 17L3 17L3 16L4 16L4 17L5 17L5 18L6 18L6 19L4 19L4 18L3 18L3 19L4 19L4 20L5 20L5 21L8 21L8 23L9 23L9 25L8 25L8 26L9 26L9 27L8 27L8 29L9 29L9 28L12 28L12 29L14 29L14 28L12 28L12 24L14 24L14 25L13 25L13 27L15 27L15 24L17 24L17 26L18 26L18 27L16 27L16 28L15 28L15 29L16 29L16 28L17 28L17 29L21 29L21 27L22 27L22 26L24 26L24 28L23 28L23 29L24 29L24 28L25 28L25 29L26 29L26 28L25 28L25 26L28 26L28 27L27 27L27 29L28 29L28 27L29 27L29 26L28 26L28 25L25 25L25 20L24 20L24 17L22 17L22 16L24 16L24 15L25 15L25 17L26 17L26 15L27 15L27 17L28 17L28 18L27 18L27 20L26 20L26 22L27 22L27 23L26 23L26 24L28 24L28 22L29 22L29 21L27 21L27 20L29 20L29 17L28 17L28 15L29 15L29 14L27 14L27 13L29 13L29 12L28 12L28 10L29 10L29 9L28 9L28 8L26 8L26 9L25 9L25 8L22 8L22 9L21 9L21 6L20 6L20 5L19 5L19 3L21 3L21 2L19 2L19 1L21 1L21 0L17 0L17 1L18 1L18 2L17 2L17 3L18 3L18 4L15 4L15 3L16 3L16 0L15 0L15 2L14 2L14 4L13 4L13 5L14 5L14 7L15 7L15 8L18 8L18 7L19 7L19 9L16 9L16 11L15 11L15 12L14 12L14 11L13 11L13 12L12 12L12 13L9 13L9 11L11 11L11 10L12 10L12 9L11 9L11 8L10 8L10 7L11 7L11 6L12 6L12 8L13 8L13 9L14 9L14 8L13 8L13 6L12 6L12 5L11 5L11 6L10 6L10 5L9 5L9 4L12 4L12 3L13 3L13 0L12 0L12 1L11 1L11 2L9 2L9 1L10 1L10 0ZM18 2L18 3L19 3L19 2ZM14 4L14 5L15 5L15 4ZM16 5L16 6L15 6L15 7L16 7L16 6L17 6L17 7L18 7L18 6L19 6L19 7L20 7L20 6L19 6L19 5L18 5L18 6L17 6L17 5ZM9 6L9 7L10 7L10 6ZM8 8L8 10L7 10L7 9L6 9L6 10L7 10L7 11L6 11L6 12L7 12L7 13L6 13L6 14L5 14L5 15L4 15L4 13L5 13L5 11L4 11L4 12L2 12L2 13L3 13L3 15L4 15L4 16L12 16L12 17L10 17L10 18L9 18L9 17L6 17L6 18L9 18L9 20L10 20L10 21L11 21L11 20L10 20L10 19L12 19L12 20L13 20L13 21L14 21L14 22L15 22L15 23L14 23L14 24L15 24L15 23L17 23L17 24L18 24L18 25L20 25L20 20L23 20L23 19L22 19L22 17L20 17L20 14L19 14L19 13L21 13L21 12L20 12L20 11L22 11L22 12L23 12L23 13L22 13L22 15L21 15L21 16L22 16L22 15L24 15L24 14L25 14L25 15L26 15L26 13L27 13L27 12L26 12L26 13L25 13L25 12L23 12L23 11L24 11L24 10L25 10L25 9L23 9L23 11L22 11L22 10L20 10L20 11L19 11L19 10L17 10L17 12L18 12L18 15L19 15L19 16L18 16L18 17L17 17L17 16L15 16L15 18L14 18L14 17L13 17L13 16L12 16L12 14L11 14L11 15L10 15L10 14L9 14L9 13L8 13L8 10L10 10L10 8ZM26 9L26 10L28 10L28 9ZM18 11L18 12L19 12L19 11ZM15 13L15 14L13 14L13 15L17 15L17 13ZM6 14L6 15L7 15L7 14ZM8 14L8 15L9 15L9 14ZM16 17L16 18L17 18L17 19L15 19L15 20L14 20L14 18L13 18L13 20L14 20L14 21L16 21L16 22L17 22L17 23L18 23L18 24L19 24L19 23L18 23L18 22L17 22L17 20L19 20L19 19L18 19L18 18L17 18L17 17ZM0 18L0 19L1 19L1 18ZM20 18L20 19L21 19L21 18ZM25 18L25 19L26 19L26 18ZM6 19L6 20L8 20L8 19ZM0 20L0 21L1 21L1 20ZM21 21L21 24L24 24L24 21ZM10 22L10 25L9 25L9 26L10 26L10 25L11 25L11 22ZM22 22L22 23L23 23L23 22ZM21 25L21 26L22 26L22 25ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 3, 10.00, 2, 1),
(10, '2024-05-07 21:45:29', '2024-05-07 21:45:29', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 9L1 9L1 10L0 10L0 12L2 12L2 14L0 14L0 15L2 15L2 17L0 17L0 21L1 21L1 18L2 18L2 17L3 17L3 18L4 18L4 19L2 19L2 20L5 20L5 19L8 19L8 20L6 20L6 21L8 21L8 23L9 23L9 22L10 22L10 21L8 21L8 20L10 20L10 19L8 19L8 17L7 17L7 16L9 16L9 15L8 15L8 14L9 14L9 13L10 13L10 14L11 14L11 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 18L15 18L15 20L16 20L16 19L18 19L18 18L21 18L21 19L22 19L22 20L20 20L20 21L18 21L18 20L17 20L17 21L16 21L16 22L14 22L14 21L12 21L12 19L13 19L13 18L11 18L11 17L9 17L9 18L11 18L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L13 13L13 12L14 12L14 13L15 13L15 14L16 14L16 13L17 13L17 16L16 16L16 17L15 17L15 16L14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM3 9L3 10L1 10L1 11L2 11L2 12L3 12L3 14L5 14L5 13L4 13L4 11L6 11L6 12L7 12L7 13L6 13L6 14L8 14L8 13L9 13L9 12L7 12L7 11L8 11L8 10L9 10L9 9L6 9L6 10L5 10L5 9ZM3 10L3 11L4 11L4 10ZM6 10L6 11L7 11L7 10ZM23 10L23 11L24 11L24 10ZM19 11L19 12L20 12L20 11ZM10 12L10 13L11 13L11 12ZM17 12L17 13L18 13L18 12ZM25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L22 18L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13ZM28 13L28 14L29 14L29 13ZM3 15L3 17L5 17L5 18L7 18L7 17L5 17L5 16L4 16L4 15ZM6 15L6 16L7 16L7 15ZM17 16L17 17L18 17L18 16ZM28 17L28 18L29 18L29 17ZM21 21L21 24L24 24L24 21ZM16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22ZM22 22L22 23L23 23L23 22ZM10 23L10 24L8 24L8 29L9 29L9 27L11 27L11 29L12 29L12 27L13 27L13 26L11 26L11 23ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM9 25L9 26L10 26L10 25ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(11, '2024-05-07 21:46:33', '2024-05-07 21:46:33', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 10L3 10L3 11L4 11L4 12L6 12L6 13L7 13L7 14L5 14L5 13L3 13L3 15L2 15L2 12L0 12L0 14L1 14L1 15L0 15L0 16L1 16L1 17L0 17L0 21L1 21L1 18L2 18L2 20L3 20L3 21L4 21L4 20L3 20L3 18L4 18L4 17L5 17L5 20L6 20L6 21L8 21L8 23L10 23L10 24L11 24L11 23L10 23L10 22L11 22L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L9 13L9 14L8 14L8 15L10 15L10 16L7 16L7 15L6 15L6 16L5 16L5 17L6 17L6 18L7 18L7 17L8 17L8 18L9 18L9 19L6 19L6 20L10 20L10 19L11 19L11 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM4 9L4 11L5 11L5 9ZM6 9L6 10L7 10L7 11L6 11L6 12L7 12L7 11L8 11L8 12L9 12L9 9ZM23 10L23 11L24 11L24 10ZM19 11L19 12L20 12L20 11ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 18L15 18L15 19L14 19L14 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM10 13L10 15L11 15L11 13ZM28 13L28 14L29 14L29 13ZM4 14L4 15L5 15L5 14ZM3 16L3 17L2 17L2 18L3 18L3 17L4 17L4 16ZM6 16L6 17L7 17L7 16ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM10 17L10 18L11 18L11 17ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM8 24L8 29L10 29L10 28L11 28L11 29L12 29L12 27L13 27L13 26L10 26L10 25L9 25L9 24ZM25 24L25 25L26 25L26 24ZM9 26L9 27L10 27L10 26ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(12, '2024-05-07 21:47:04', '2024-05-07 21:47:04', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L8 9L8 10L6 10L6 11L5 11L5 12L6 12L6 13L5 13L5 14L4 14L4 13L3 13L3 12L2 12L2 10L5 10L5 8L0 8L0 9L2 9L2 10L1 10L1 11L0 11L0 13L1 13L1 14L4 14L4 17L3 17L3 19L2 19L2 21L7 21L7 20L8 20L8 23L9 23L9 24L8 24L8 29L10 29L10 27L9 27L9 24L11 24L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L11 13L11 14L9 14L9 12L8 12L8 11L9 11L9 10L8 10L8 11L6 11L6 12L8 12L8 15L9 15L9 16L7 16L7 15L6 15L6 14L7 14L7 13L6 13L6 14L5 14L5 16L7 16L7 17L6 17L6 18L4 18L4 20L7 20L7 19L6 19L6 18L7 18L7 17L8 17L8 19L9 19L9 17L11 17L11 18L10 18L10 21L11 21L11 18L14 18L14 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM23 10L23 11L24 11L24 10ZM19 11L19 12L20 12L20 11ZM1 12L1 13L2 13L2 12ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 18L15 18L15 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM28 13L28 14L29 14L29 13ZM2 15L2 16L1 16L1 17L0 17L0 21L1 21L1 17L2 17L2 16L3 16L3 15ZM10 15L10 16L11 16L11 15ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM9 22L9 23L10 23L10 22ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM10 25L10 26L11 26L11 29L12 29L12 27L13 27L13 26L11 26L11 25ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(13, '2024-05-07 21:48:19', '2024-05-07 21:48:19', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L8 9L8 10L5 10L5 8L0 8L0 11L2 11L2 10L3 10L3 9L4 9L4 10L5 10L5 12L4 12L4 14L5 14L5 13L7 13L7 12L6 12L6 11L9 11L9 12L8 12L8 13L9 13L9 14L10 14L10 15L8 15L8 14L6 14L6 15L7 15L7 16L6 16L6 17L7 17L7 18L6 18L6 19L5 19L5 18L4 18L4 17L3 17L3 18L2 18L2 21L3 21L3 19L4 19L4 21L7 21L7 20L8 20L8 19L10 19L10 21L8 21L8 23L9 23L9 24L8 24L8 29L9 29L9 27L10 27L10 28L11 28L11 29L12 29L12 27L13 27L13 26L11 26L11 27L10 27L10 25L11 25L11 22L10 22L10 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L11 13L11 16L7 16L7 17L8 17L8 18L10 18L10 19L11 19L11 18L14 18L14 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM1 9L1 10L2 10L2 9ZM23 10L23 11L24 11L24 10ZM19 11L19 12L20 12L20 11ZM1 12L1 13L0 13L0 16L5 16L5 15L3 15L3 14L2 14L2 15L1 15L1 13L2 13L2 12ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 18L15 18L15 19L14 19L14 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM28 13L28 14L29 14L29 13ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM0 17L0 21L1 21L1 17ZM10 17L10 18L11 18L11 17ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM6 19L6 20L7 20L7 19ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1);
INSERT INTO `tec_sales_juegos` (`id`, `created_at`, `updated_at`, `qr`, `juego_id`, `precio`, `tiempo`, `store_id`) VALUES
(14, '2024-05-07 21:48:51', '2024-05-07 21:48:51', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L7 9L7 10L6 10L6 11L4 11L4 10L2 10L2 9L5 9L5 8L0 8L0 21L1 21L1 18L2 18L2 19L3 19L3 20L4 20L4 21L8 21L8 23L9 23L9 24L8 24L8 29L12 29L12 27L13 27L13 26L11 26L11 25L10 25L10 23L9 23L9 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L9 13L9 11L8 11L8 10L7 10L7 11L6 11L6 12L7 12L7 13L5 13L5 14L4 14L4 15L2 15L2 13L1 13L1 17L2 17L2 18L5 18L5 19L4 19L4 20L5 20L5 19L6 19L6 20L8 20L8 21L9 21L9 19L10 19L10 20L11 20L11 19L10 19L10 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM23 10L23 11L24 11L24 10ZM3 11L3 12L4 12L4 11ZM19 11L19 12L20 12L20 11ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 19L15 19L15 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM10 13L10 14L9 14L9 15L7 15L7 14L5 14L5 15L4 15L4 16L2 16L2 17L5 17L5 16L6 16L6 17L7 17L7 18L6 18L6 19L7 19L7 18L8 18L8 19L9 19L9 18L10 18L10 17L11 17L11 15L10 15L10 14L11 14L11 13ZM28 13L28 14L29 14L29 13ZM6 15L6 16L7 16L7 17L8 17L8 16L7 16L7 15ZM9 16L9 17L10 17L10 16ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM10 26L10 27L9 27L9 28L10 28L10 27L11 27L11 26ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(15, '2024-05-07 21:49:17', '2024-05-07 21:49:17', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L7 9L7 10L5 10L5 11L4 11L4 9L5 9L5 8L0 8L0 9L1 9L1 11L2 11L2 12L3 12L3 13L4 13L4 12L6 12L6 13L5 13L5 14L3 14L3 16L2 16L2 15L1 15L1 16L0 16L0 21L1 21L1 18L2 18L2 17L4 17L4 18L3 18L3 19L4 19L4 20L3 20L3 21L8 21L8 23L9 23L9 24L8 24L8 29L9 29L9 28L10 28L10 29L12 29L12 27L13 27L13 26L11 26L11 28L10 28L10 27L9 27L9 24L10 24L10 25L11 25L11 24L10 24L10 22L11 22L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L8 13L8 14L7 14L7 13L6 13L6 14L7 14L7 15L6 15L6 16L7 16L7 17L6 17L6 18L4 18L4 19L5 19L5 20L8 20L8 19L9 19L9 22L10 22L10 21L11 21L11 20L10 20L10 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM2 9L2 10L3 10L3 9ZM7 10L7 11L6 11L6 12L8 12L8 11L9 11L9 10ZM23 10L23 11L24 11L24 10ZM3 11L3 12L4 12L4 11ZM19 11L19 12L20 12L20 11ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM1 13L1 14L2 14L2 13ZM10 13L10 14L9 14L9 15L7 15L7 16L8 16L8 17L7 17L7 18L6 18L6 19L7 19L7 18L9 18L9 15L10 15L10 17L11 17L11 13ZM28 13L28 14L29 14L29 13ZM4 16L4 17L5 17L5 16ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(16, '2024-05-07 21:50:03', '2024-05-07 21:50:03', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 10L1 10L1 9L3 9L3 10L2 10L2 11L0 11L0 12L1 12L1 13L0 13L0 14L1 14L1 15L0 15L0 21L1 21L1 17L2 17L2 16L1 16L1 15L2 15L2 14L3 14L3 13L4 13L4 14L5 14L5 13L4 13L4 12L3 12L3 10L6 10L6 11L5 11L5 12L6 12L6 13L7 13L7 14L6 14L6 15L7 15L7 16L6 16L6 17L5 17L5 19L3 19L3 18L2 18L2 19L3 19L3 20L2 20L2 21L4 21L4 20L6 20L6 21L7 21L7 20L8 20L8 23L9 23L9 20L10 20L10 23L11 23L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L11 13L11 14L10 14L10 16L9 16L9 17L10 17L10 18L14 18L14 17L15 17L15 18L16 18L16 17L17 17L17 18L18 18L18 19L16 19L16 20L15 20L15 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM6 9L6 10L7 10L7 9ZM8 9L8 13L9 13L9 9ZM23 10L23 11L24 11L24 10ZM6 11L6 12L7 12L7 11ZM19 11L19 12L20 12L20 11ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L14 17L14 16L15 16L15 17L16 17L16 16L17 16L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM28 13L28 14L29 14L29 13ZM7 14L7 15L9 15L9 14ZM4 15L4 16L3 16L3 17L4 17L4 16L5 16L5 15ZM7 16L7 17L6 17L6 18L7 18L7 19L6 19L6 20L7 20L7 19L8 19L8 20L9 20L9 19L8 19L8 18L7 18L7 17L8 17L8 16ZM10 16L10 17L11 17L11 16ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM10 19L10 20L11 20L11 19ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM8 24L8 29L9 29L9 28L10 28L10 29L12 29L12 27L13 27L13 26L11 26L11 24L10 24L10 25L9 25L9 24ZM25 24L25 25L26 25L26 24ZM9 26L9 27L10 27L10 26ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(17, '2024-05-07 21:50:35', '2024-05-07 21:50:35', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M8 0L8 1L10 1L10 0ZM14 0L14 2L11 2L11 4L10 4L10 3L9 3L9 2L8 2L8 5L9 5L9 6L8 6L8 7L9 7L9 8L8 8L8 9L7 9L7 8L6 8L6 9L4 9L4 8L0 8L0 9L4 9L4 10L3 10L3 11L0 11L0 14L1 14L1 12L3 12L3 13L2 13L2 15L1 15L1 16L2 16L2 17L1 17L1 18L0 18L0 19L1 19L1 18L2 18L2 17L3 17L3 18L4 18L4 19L2 19L2 20L1 20L1 21L5 21L5 20L6 20L6 21L8 21L8 22L9 22L9 21L8 21L8 19L7 19L7 18L4 18L4 17L5 17L5 15L4 15L4 14L3 14L3 13L7 13L7 12L6 12L6 11L8 11L8 13L10 13L10 14L12 14L12 16L9 16L9 15L8 15L8 14L6 14L6 15L7 15L7 16L6 16L6 17L7 17L7 16L9 16L9 17L8 17L8 18L9 18L9 20L10 20L10 21L12 21L12 22L10 22L10 23L9 23L9 25L8 25L8 29L9 29L9 26L10 26L10 24L11 24L11 23L14 23L14 20L13 20L13 19L17 19L17 20L15 20L15 21L16 21L16 22L18 22L18 24L14 24L14 26L13 26L13 24L12 24L12 25L11 25L11 28L10 28L10 29L11 29L11 28L12 28L12 29L13 29L13 28L12 28L12 26L13 26L13 27L14 27L14 29L16 29L16 28L17 28L17 27L18 27L18 26L20 26L20 29L21 29L21 27L22 27L22 25L23 25L23 28L24 28L24 29L25 29L25 28L26 28L26 25L28 25L28 27L27 27L27 29L28 29L28 27L29 27L29 23L28 23L28 22L29 22L29 21L27 21L27 18L28 18L28 15L29 15L29 13L27 13L27 12L26 12L26 11L28 11L28 12L29 12L29 11L28 11L28 10L29 10L29 8L28 8L28 10L26 10L26 11L24 11L24 10L25 10L25 9L27 9L27 8L24 8L24 9L22 9L22 8L20 8L20 7L21 7L21 5L20 5L20 3L21 3L21 1L20 1L20 0L16 0L16 2L15 2L15 0ZM17 1L17 2L16 2L16 3L15 3L15 4L13 4L13 3L12 3L12 5L10 5L10 6L9 6L9 7L10 7L10 8L9 8L9 9L8 9L8 11L9 11L9 12L10 12L10 13L11 13L11 11L13 11L13 9L14 9L14 11L15 11L15 12L14 12L14 13L13 13L13 12L12 12L12 14L14 14L14 15L13 15L13 16L12 16L12 17L11 17L11 18L12 18L12 17L13 17L13 16L14 16L14 15L17 15L17 16L15 16L15 17L16 17L16 18L18 18L18 19L19 19L19 20L20 20L20 19L21 19L21 18L20 18L20 17L18 17L18 16L19 16L19 15L18 15L18 14L19 14L19 13L20 13L20 14L22 14L22 15L21 15L21 16L22 16L22 19L23 19L23 16L24 16L24 15L25 15L25 17L24 17L24 20L26 20L26 19L25 19L25 18L26 18L26 17L27 17L27 15L25 15L25 14L27 14L27 13L25 13L25 12L22 12L22 10L20 10L20 8L19 8L19 7L20 7L20 6L19 6L19 3L20 3L20 1L19 1L19 3L18 3L18 1ZM17 3L17 4L15 4L15 5L16 5L16 7L17 7L17 9L16 9L16 11L18 11L18 12L17 12L17 13L15 13L15 14L18 14L18 12L19 12L19 10L17 10L17 9L19 9L19 8L18 8L18 7L19 7L19 6L18 6L18 5L17 5L17 4L18 4L18 3ZM12 5L12 7L11 7L11 6L10 6L10 7L11 7L11 8L12 8L12 7L13 7L13 5ZM14 6L14 8L15 8L15 6ZM17 6L17 7L18 7L18 6ZM6 9L6 10L4 10L4 11L6 11L6 10L7 10L7 9ZM9 9L9 10L10 10L10 9ZM20 12L20 13L21 13L21 12ZM22 13L22 14L23 14L23 15L22 15L22 16L23 16L23 15L24 15L24 14L23 14L23 13ZM2 15L2 16L3 16L3 17L4 17L4 16L3 16L3 15ZM4 19L4 20L5 20L5 19ZM6 19L6 20L7 20L7 19ZM11 19L11 20L12 20L12 19ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM26 22L26 23L25 23L25 25L26 25L26 24L27 24L27 22ZM19 23L19 24L18 24L18 25L20 25L20 26L21 26L21 25L20 25L20 23ZM14 26L14 27L15 27L15 28L16 28L16 27L17 27L17 26ZM24 26L24 28L25 28L25 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 40.00, 0, 1),
(18, '2024-05-07 21:51:11', '2024-05-07 21:51:11', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 12L1 12L1 10L4 10L4 9L5 9L5 10L6 10L6 11L3 11L3 12L2 12L2 13L0 13L0 16L1 16L1 15L2 15L2 19L4 19L4 20L3 20L3 21L4 21L4 20L5 20L5 19L7 19L7 20L6 20L6 21L7 21L7 20L8 20L8 23L10 23L10 24L8 24L8 29L9 29L9 26L10 26L10 28L11 28L11 29L12 29L12 27L13 27L13 26L10 26L10 24L11 24L11 23L10 23L10 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L9 13L9 11L8 11L8 13L6 13L6 14L5 14L5 12L3 12L3 13L2 13L2 15L3 15L3 14L5 14L5 16L3 16L3 17L4 17L4 19L5 19L5 16L7 16L7 17L6 17L6 18L7 18L7 19L8 19L8 18L9 18L9 21L10 21L10 20L11 20L11 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM6 9L6 10L7 10L7 9ZM23 10L23 11L24 11L24 10ZM6 11L6 12L7 12L7 11ZM19 11L19 12L20 12L20 11ZM13 12L13 13L12 13L12 14L13 14L13 13L14 13L14 14L15 14L15 15L14 15L14 16L13 16L13 15L12 15L12 17L13 17L13 18L15 18L15 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM8 13L8 15L7 15L7 14L6 14L6 15L7 15L7 16L9 16L9 17L10 17L10 18L11 18L11 17L10 17L10 16L11 16L11 13L10 13L10 14L9 14L9 13ZM28 13L28 14L29 14L29 13ZM14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 16ZM0 17L0 21L1 21L1 17ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM25 24L25 25L26 25L26 24ZM25 26L25 27L26 27L26 28L27 28L27 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 40.00, 0, 1),
(19, '2024-05-07 21:51:36', '2024-05-07 21:51:36', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M10 0L10 1L9 1L9 2L8 2L8 3L9 3L9 5L10 5L10 7L11 7L11 8L12 8L12 9L11 9L11 10L10 10L10 9L9 9L9 6L8 6L8 8L4 8L4 9L8 9L8 10L3 10L3 8L0 8L0 10L1 10L1 9L2 9L2 11L3 11L3 12L1 12L1 11L0 11L0 14L1 14L1 15L0 15L0 16L1 16L1 18L0 18L0 19L1 19L1 20L0 20L0 21L1 21L1 20L2 20L2 21L5 21L5 20L4 20L4 19L3 19L3 18L5 18L5 19L7 19L7 18L8 18L8 19L9 19L9 20L8 20L8 25L10 25L10 26L11 26L11 27L12 27L12 28L10 28L10 27L9 27L9 26L8 26L8 29L9 29L9 28L10 28L10 29L12 29L12 28L14 28L14 29L19 29L19 28L20 28L20 29L21 29L21 27L22 27L22 26L21 26L21 25L23 25L23 27L24 27L24 28L22 28L22 29L24 29L24 28L25 28L25 23L26 23L26 22L27 22L27 23L29 23L29 21L26 21L26 22L25 22L25 20L26 20L26 18L27 18L27 20L28 20L28 19L29 19L29 16L28 16L28 15L29 15L29 12L28 12L28 11L29 11L29 9L28 9L28 10L26 10L26 9L27 9L27 8L26 8L26 9L25 9L25 10L24 10L24 12L25 12L25 14L23 14L23 12L22 12L22 11L21 11L21 13L20 13L20 14L21 14L21 15L20 15L20 16L19 16L19 15L15 15L15 13L16 13L16 14L18 14L18 12L19 12L19 11L14 11L14 10L13 10L13 9L15 9L15 8L16 8L16 7L17 7L17 9L16 9L16 10L23 10L23 8L21 8L21 5L20 5L20 4L19 4L19 3L20 3L20 1L21 1L21 0L17 0L17 1L16 1L16 0L15 0L15 3L14 3L14 4L15 4L15 6L14 6L14 7L13 7L13 3L12 3L12 2L11 2L11 3L12 3L12 5L10 5L10 3L9 3L9 2L10 2L10 1L11 1L11 0ZM13 1L13 2L14 2L14 1ZM17 1L17 2L16 2L16 3L15 3L15 4L16 4L16 6L15 6L15 7L14 7L14 8L15 8L15 7L16 7L16 6L17 6L17 7L18 7L18 9L19 9L19 8L20 8L20 9L21 9L21 8L20 8L20 6L19 6L19 5L17 5L17 4L18 4L18 3L19 3L19 2L18 2L18 1ZM11 6L11 7L12 7L12 8L13 8L13 7L12 7L12 6ZM18 6L18 7L19 7L19 6ZM9 10L9 11L10 11L10 10ZM25 10L25 11L26 11L26 13L27 13L27 14L25 14L25 15L24 15L24 16L23 16L23 18L24 18L24 20L25 20L25 18L26 18L26 17L27 17L27 18L28 18L28 17L27 17L27 14L28 14L28 13L27 13L27 11L26 11L26 10ZM5 11L5 12L4 12L4 13L6 13L6 14L5 14L5 15L6 15L6 16L4 16L4 14L2 14L2 15L1 15L1 16L2 16L2 17L3 17L3 16L4 16L4 17L6 17L6 18L7 18L7 17L8 17L8 18L9 18L9 17L10 17L10 12L8 12L8 11ZM11 11L11 12L12 12L12 14L11 14L11 15L12 15L12 16L11 16L11 17L12 17L12 16L13 16L13 15L14 15L14 14L13 14L13 12L12 12L12 11ZM6 12L6 13L7 13L7 12ZM8 13L8 14L9 14L9 13ZM6 14L6 15L7 15L7 14ZM22 14L22 15L21 15L21 16L22 16L22 15L23 15L23 14ZM2 15L2 16L3 16L3 15ZM8 15L8 17L9 17L9 15ZM25 15L25 16L26 16L26 15ZM6 16L6 17L7 17L7 16ZM15 16L15 19L16 19L16 20L17 20L17 18L16 18L16 16ZM18 16L18 19L20 19L20 20L18 20L18 21L17 21L17 22L18 22L18 23L19 23L19 24L18 24L18 25L19 25L19 26L20 26L20 27L21 27L21 26L20 26L20 23L19 23L19 22L20 22L20 20L22 20L22 17L21 17L21 19L20 19L20 17L19 17L19 16ZM13 17L13 19L14 19L14 17ZM1 18L1 19L2 19L2 20L3 20L3 19L2 19L2 18ZM11 19L11 20L12 20L12 22L11 22L11 23L12 23L12 24L10 24L10 23L9 23L9 24L10 24L10 25L12 25L12 24L13 24L13 25L14 25L14 26L13 26L13 27L14 27L14 26L15 26L15 28L16 28L16 27L17 27L17 26L16 26L16 25L17 25L17 24L15 24L15 23L16 23L16 21L14 21L14 20L12 20L12 19ZM6 20L6 21L7 21L7 20ZM9 20L9 21L10 21L10 20ZM21 21L21 24L24 24L24 21ZM13 22L13 23L14 23L14 22ZM22 22L22 23L23 23L23 22ZM26 25L26 27L27 27L27 29L29 29L29 28L28 28L28 27L29 27L29 25ZM27 26L27 27L28 27L28 26ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 20.00, 0, 1),
(20, '2024-05-07 21:51:51', '2024-05-07 21:51:51', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"120\" height=\"120\" viewBox=\"0 0 120 120\"><rect x=\"0\" y=\"0\" width=\"120\" height=\"120\" fill=\"#ffffff\"/><g transform=\"scale(4.138)\"><g transform=\"translate(0,0)\"><path fill-rule=\"evenodd\" d=\"M9 0L9 1L8 1L8 2L9 2L9 3L8 3L8 4L10 4L10 7L11 7L11 4L12 4L12 5L13 5L13 6L12 6L12 9L13 9L13 10L11 10L11 11L10 11L10 9L11 9L11 8L6 8L6 9L5 9L5 8L0 8L0 9L1 9L1 10L2 10L2 11L3 11L3 12L4 12L4 14L3 14L3 15L4 15L4 16L3 16L3 17L4 17L4 18L2 18L2 17L1 17L1 16L0 16L0 21L1 21L1 18L2 18L2 21L5 21L5 20L4 20L4 18L5 18L5 19L8 19L8 20L6 20L6 21L8 21L8 23L9 23L9 24L8 24L8 29L12 29L12 27L13 27L13 26L11 26L11 22L10 22L10 18L11 18L11 21L12 21L12 22L13 22L13 23L12 23L12 25L13 25L13 24L14 24L14 25L16 25L16 26L15 26L15 27L14 27L14 28L15 28L15 27L16 27L16 28L17 28L17 29L19 29L19 28L17 28L17 27L20 27L20 28L21 28L21 29L22 29L22 28L21 28L21 25L25 25L25 26L22 26L22 27L23 27L23 29L24 29L24 27L25 27L25 28L26 28L26 29L27 29L27 28L28 28L28 26L29 26L29 24L26 24L26 23L27 23L27 22L29 22L29 20L28 20L28 19L27 19L27 16L28 16L28 15L27 15L27 12L28 12L28 11L27 11L27 12L25 12L25 13L21 13L21 12L22 12L22 11L23 11L23 12L24 12L24 11L25 11L25 9L26 9L26 8L25 8L25 9L24 9L24 8L23 8L23 9L22 9L22 8L21 8L21 4L20 4L20 3L21 3L21 2L19 2L19 4L18 4L18 3L17 3L17 2L18 2L18 1L20 1L20 0L16 0L16 1L15 1L15 0L14 0L14 1L15 1L15 2L14 2L14 3L13 3L13 4L12 4L12 2L13 2L13 1L11 1L11 2L10 2L10 0ZM15 2L15 5L14 5L14 4L13 4L13 5L14 5L14 6L13 6L13 8L14 8L14 10L16 10L16 9L15 9L15 7L16 7L16 8L18 8L18 9L17 9L17 12L14 12L14 11L12 11L12 13L11 13L11 12L10 12L10 13L11 13L11 14L10 14L10 16L9 16L9 14L7 14L7 13L6 13L6 12L8 12L8 13L9 13L9 11L6 11L6 10L7 10L7 9L6 9L6 10L5 10L5 11L6 11L6 12L5 12L5 13L6 13L6 14L7 14L7 15L6 15L6 16L5 16L5 18L8 18L8 19L9 19L9 17L10 17L10 16L11 16L11 18L13 18L13 19L12 19L12 21L14 21L14 22L16 22L16 23L17 23L17 24L18 24L18 25L17 25L17 26L19 26L19 25L20 25L20 24L19 24L19 22L18 22L18 23L17 23L17 22L16 22L16 21L17 21L17 20L18 20L18 21L20 21L20 20L22 20L22 19L23 19L23 20L24 20L24 19L25 19L25 21L26 21L26 20L27 20L27 19L25 19L25 18L24 18L24 19L23 19L23 18L22 18L22 17L26 17L26 16L27 16L27 15L26 15L26 13L25 13L25 16L24 16L24 15L23 15L23 16L22 16L22 14L21 14L21 16L20 16L20 17L21 17L21 18L18 18L18 17L19 17L19 15L20 15L20 14L18 14L18 13L20 13L20 12L21 12L21 11L20 11L20 9L19 9L19 8L18 8L18 6L17 6L17 5L16 5L16 4L17 4L17 3L16 3L16 2ZM10 3L10 4L11 4L11 3ZM8 5L8 7L9 7L9 5ZM15 5L15 6L14 6L14 7L15 7L15 6L16 6L16 7L17 7L17 6L16 6L16 5ZM19 5L19 7L20 7L20 5ZM27 8L27 9L28 9L28 10L29 10L29 9L28 9L28 8ZM2 9L2 10L3 10L3 11L4 11L4 10L3 10L3 9ZM8 9L8 10L9 10L9 9ZM23 10L23 11L24 11L24 10ZM19 11L19 12L20 12L20 11ZM0 12L0 13L1 13L1 15L2 15L2 13L1 13L1 12ZM13 12L13 13L12 13L12 14L13 14L13 15L12 15L12 17L14 17L14 18L15 18L15 20L16 20L16 19L18 19L18 18L17 18L17 17L18 17L18 16L17 16L17 13L18 13L18 12L17 12L17 13L16 13L16 14L15 14L15 13L14 13L14 12ZM13 13L13 14L14 14L14 15L13 15L13 16L14 16L14 17L15 17L15 18L16 18L16 17L17 17L17 16L16 16L16 17L15 17L15 14L14 14L14 13ZM28 13L28 14L29 14L29 13ZM7 15L7 16L6 16L6 17L7 17L7 16L8 16L8 15ZM28 17L28 18L29 18L29 17ZM21 18L21 19L22 19L22 18ZM21 21L21 24L24 24L24 21ZM22 22L22 23L23 23L23 22ZM14 23L14 24L15 24L15 23ZM9 24L9 25L10 25L10 24ZM25 24L25 25L26 25L26 24ZM25 26L25 27L26 27L26 28L27 28L27 26ZM10 27L10 28L11 28L11 27ZM0 0L0 7L7 7L7 0ZM1 1L1 6L6 6L6 1ZM2 2L2 5L5 5L5 2ZM22 0L22 7L29 7L29 0ZM23 1L23 6L28 6L28 1ZM24 2L24 5L27 5L27 2ZM0 22L0 29L7 29L7 22ZM1 23L1 28L6 28L6 23ZM2 24L2 27L5 27L5 24Z\" fill=\"#000000\"/></g></g></svg>\n', 1, 40.00, 0, 1);

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

--
-- Volcado de datos para la tabla `tec_sales_juegos_personas`
--

INSERT INTO `tec_sales_juegos_personas` (`id`, `nombre`, `telefono`, `instagram`, `direccion`, `created_at`, `updated_at`, `sale_juego_id`, `tipo_persona`) VALUES
(1, 'p', 'p', 'p', 'p', '2024-05-07 21:36:42', '2024-05-07 21:36:42', 1, 'Padre'),
(2, 'p', 'p', 'p', 'p', '2024-05-07 21:38:15', '2024-05-07 21:38:15', 2, 'Padre'),
(3, 'p', 'p', 'p', 'p', '2024-05-07 21:38:40', '2024-05-07 21:38:40', 3, 'Padre'),
(4, 'p', 'p', 'p', 'p', '2024-05-07 21:39:44', '2024-05-07 21:39:44', 4, 'Padre'),
(5, 'p', 'p', 'p', 'p', '2024-05-07 21:40:34', '2024-05-07 21:40:34', 5, 'Padre'),
(6, 'nn', NULL, NULL, NULL, '2024-05-07 21:40:34', '2024-05-07 21:40:34', 5, 'Hijo'),
(7, 'p', 'p', 'p', 'p', '2024-05-07 21:40:56', '2024-05-07 21:40:56', 6, 'Padre'),
(8, 'nn', NULL, NULL, NULL, '2024-05-07 21:40:56', '2024-05-07 21:40:56', 6, 'Hijo'),
(9, 'p', 'p', 'p', 'p', '2024-05-07 21:41:20', '2024-05-07 21:41:20', 7, 'Padre'),
(10, '', NULL, NULL, NULL, '2024-05-07 21:41:20', '2024-05-07 21:41:20', 7, 'Hijo'),
(11, 'p', 'p', 'p', 'p', '2024-05-07 21:42:38', '2024-05-07 21:42:38', 8, 'Padre'),
(12, 'nn', NULL, NULL, NULL, '2024-05-07 21:42:38', '2024-05-07 21:42:38', 8, 'Hijo'),
(13, 'p', 'p', 'p', 'p', '2024-05-07 21:43:01', '2024-05-07 21:43:01', 9, 'Padre'),
(14, 'nn', NULL, NULL, NULL, '2024-05-07 21:43:01', '2024-05-07 21:43:01', 9, 'Hijo'),
(15, 'p', 'p', 'p', 'p', '2024-05-07 21:45:29', '2024-05-07 21:45:29', 10, 'Padre'),
(16, 'nn', NULL, NULL, NULL, '2024-05-07 21:45:29', '2024-05-07 21:45:29', 10, 'Hijo'),
(17, 'p', 'p', 'p', 'p', '2024-05-07 21:46:33', '2024-05-07 21:46:33', 11, 'Padre'),
(18, 'nn', NULL, NULL, NULL, '2024-05-07 21:46:33', '2024-05-07 21:46:33', 11, 'Hijo'),
(19, 'p', 'p', 'p', 'p', '2024-05-07 21:47:04', '2024-05-07 21:47:04', 12, 'Padre'),
(20, 'nn', NULL, NULL, NULL, '2024-05-07 21:47:04', '2024-05-07 21:47:04', 12, 'Hijo'),
(21, 'p', 'p', 'p', 'p', '2024-05-07 21:48:19', '2024-05-07 21:48:19', 13, 'Padre'),
(22, 'nn', NULL, NULL, NULL, '2024-05-07 21:48:19', '2024-05-07 21:48:19', 13, 'Hijo'),
(23, 'p', 'p', 'p', 'p', '2024-05-07 21:48:51', '2024-05-07 21:48:51', 14, 'Padre'),
(24, 'nn', NULL, NULL, NULL, '2024-05-07 21:48:51', '2024-05-07 21:48:51', 14, 'Hijo'),
(25, 'p', 'p', 'p', 'p', '2024-05-07 21:49:17', '2024-05-07 21:49:17', 15, 'Padre'),
(26, 'nn', NULL, NULL, NULL, '2024-05-07 21:49:17', '2024-05-07 21:49:17', 15, 'Hijo'),
(27, 'p', 'p', 'p', 'p', '2024-05-07 21:50:03', '2024-05-07 21:50:03', 16, 'Padre'),
(28, 'nn', NULL, NULL, NULL, '2024-05-07 21:50:03', '2024-05-07 21:50:03', 16, 'Hijo'),
(29, 'p', 'p', 'p', 'p', '2024-05-07 21:50:35', '2024-05-07 21:50:35', 17, 'Padre'),
(30, 'nn', NULL, NULL, NULL, '2024-05-07 21:50:35', '2024-05-07 21:50:35', 17, 'Hijo'),
(31, 'zz', NULL, NULL, NULL, '2024-05-07 21:50:36', '2024-05-07 21:50:36', 17, 'Hijo'),
(32, 'zz', 'p', 'p', 'p', '2024-05-07 21:51:11', '2024-05-07 21:51:11', 18, 'Padre'),
(33, 'nn', NULL, NULL, NULL, '2024-05-07 21:51:11', '2024-05-07 21:51:11', 18, 'Hijo'),
(34, 'zz', NULL, NULL, NULL, '2024-05-07 21:51:11', '2024-05-07 21:51:11', 18, 'Hijo'),
(35, 'p', 'p', 'p', 'p', '2024-05-07 21:51:36', '2024-05-07 21:51:36', 19, 'Padre'),
(36, 'nn', NULL, NULL, NULL, '2024-05-07 21:51:36', '2024-05-07 21:51:36', 19, 'Hijo'),
(37, 'p', 'p', 'p', 'p', '2024-05-07 21:51:51', '2024-05-07 21:51:51', 20, 'Padre'),
(38, 'nn', NULL, NULL, NULL, '2024-05-07 21:51:51', '2024-05-07 21:51:51', 20, 'Hijo'),
(39, 'zz', NULL, NULL, NULL, '2024-05-07 21:51:51', '2024-05-07 21:51:51', 20, 'Hijo');

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
  `precio` float(22,2) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tec_salones`
--

INSERT INTO `tec_salones` (`id`, `nombre`, `store_id`, `created_at`, `updated_at`, `precio`, `capacidad`) VALUES
(2, 'prueba', 1, '2024-04-17 23:50:54', '2024-04-17 23:50:54', 20.00, NULL),
(3, 'salon 1 ', 1, '2024-04-18 03:30:27', '2024-04-18 03:30:27', 50.00, NULL),
(4, 'prueba c', 1, '2024-05-07 22:27:17', '2024-05-07 22:27:17', 20.00, 50);

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
('3f8n0cnf41holhui57gouo9luocb62va', '::1', 1714509588, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343530393538383b),
('tnvmrnrpav0drgsdqdnaegnncafkmqit', '::1', 1714695839, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343639353833393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('tbujb8ih0ti0havajk7s1k0128k9pdhh', '::1', 1713743883, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734333838333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('u75i49dmoffpdph5lvgg81b89ka1gk8r', '::1', 1713744019, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734333838333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('sldcrrcvgulgjtpv6eg1kl0nqnof4rc2', '::1', 1713743581, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734333538313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('8suklef70enuos7ejqpgliargr1dmfji', '::1', 1713742908, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734323930383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('3spp3le5oi3uueq2r37f8b328l2hjcma', '::1', 1713742125, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734323132353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('a89t3k7u37sl6iici97i50ms42e6m1bg', '::1', 1713738784, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733383738343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mhqm13sotv4uv85coo10t9e54vfo0ubc', '::1', 1713741822, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333734313832323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ggdca97lcb717h1b8hsepg1d0f30eicr', '::1', 1713738442, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733383434323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('5rrunnacpne4beo3clki4hcbroug20qa', '::1', 1713738054, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733383035343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('p6askcest7184bj0iv8kq86vre9ngb3h', '::1', 1713737729, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733373732393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ii9d8ouqcg231mv47rf46p9rfbdccark', '::1', 1713737427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733373432373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('a655so95st2n2i8shdrh2qbksqgsjru4', '::1', 1713736799, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733363739393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('da2ocah5h0najf433karn8j72df9ujvj', '::1', 1713737118, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733373131383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ekg276cumo1nsuafb7psa6oclef0beoc', '::1', 1713736416, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733363431363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('4jcktbs0p8nmep5sv5pfltlgcmoi0cbg', '::1', 1713736087, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733363038373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('1ju6j1gu8h43kipn6u5nrf5j82ogc30u', '::1', 1713735782, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733353738323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('87gip86fmd7f5r4qtjqgv9bb75tok1tg', '::1', 1713734549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733343534393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('jfe2e9d2op9fj43l38t0ctbt6osq09ue', '::1', 1713735235, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733353233353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('dio05ac9fkv947v5h2jfege1n8lveoj7', '::1', 1713733076, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733333037363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('49c6i93u0et7g430a5b00bmi65vt2r9t', '::1', 1713732748, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733323734383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ugqg4a5p1jk7j6q48gajdkkmv69hpb0f', '127.0.0.1', 1713732222, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333733323232323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133333930343330223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
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
('d33qd08jbqvgc9fmcvsad4ioaqbj5urc', '::1', 1713392824, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731333339323832343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133303332363237223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31353a2273616c6f6e65732064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
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
('t3nd0eio8ll8898pvcbu6k50fkg7210n', '::1', 1712975644, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323937353634343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132393531323638223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a227265636574612075706461746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
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
('hnk5sr9bairqk1tbpmmcn2n89jvcsfna', '::1', 1712904941, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323930343934313b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
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
('elik5jb8gbvdd1uejh4fbpq50ttfbr1p', '::1', 1712898854, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839383835343b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('q663q8ashb50iciep8vkvi7dpja3nohi', '::1', 1712899155, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839393135353b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('gta5e5rb9uq02omhs7vo8dllim5hic4q', '::1', 1712899498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731323839393439383b6572726f727c733a36393a22c2a141636365736f2064656e656761646f21204e6f207469656e65206465726563686f206120616363656465722061206c6120706167696e6120736f6c696369746164612e223b5f5f63695f766172737c613a323a7b733a353a226572726f72223b733a333a226f6c64223b733a373a226d657373616765223b733a333a226f6c64223b7d6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373132383636383131223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c693a313b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('r4hgi6hu13k8rkhcethhfo7s19hd327p', '::1', 1714696247, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343639363234373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ebua262dl9eam7fjshn8v0obf8bfo5v0', '::1', 1714697057, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343639373035373b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('34sgrh5t5cb81kk0eadn6hbh53gk0rnj', '::1', 1714701225, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343730313232353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('kl15gqggv0849loilvtaguimv6jc5umg', '::1', 1714703029, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343730333032393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('rh9c8qc5l8kfc8c9s66f501dp8lekbq1', '::1', 1714703366, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343730333336363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('g3oe4gsmr8vf3apimgm42jn3t0ki0q5h', '::1', 1714703894, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343730333839343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31323a22726563657461206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('cl567e09jtv844h90dfhrb5ul79n9ct8', '::1', 1714707009, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343730373030393b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('vhctspsmqgk2hg60pgaqh8bcujdovu28', '::1', 1714710026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343731303032363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('uuodh8h191qbh6qohc7d7avl3pe812or', '::1', 1714710355, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343731303335353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('4rs7gc01nbf5s8heh5v7qred6t4s579k', '::1', 1714710611, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731343731303335353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373133373331383038223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31343a2270656469646f2064656c65746564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('cobskuiprb3k254qin90kibjug5qr95v', '127.0.0.1', 1715116364, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131363336343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('8ld9cuhtji0o769cptf2uoeidlcnv6n3', '::1', 1715116776, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131363737363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('oeq6ibm53j1rt0kmhga1v8sad6qges2n', '::1', 1715117093, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131373039333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('mlceglibe0l19jgnk26qovcrk74jfpcg', '::1', 1715117402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131373430323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('336m1k8j5k00nr1886hhnupqufdbn9l3', '::1', 1715117790, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131373739303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('pr4ibqin0qq5b73jiq1lsciohbdrl442', '::1', 1715118151, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131383135313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('4crolg5q9u1q7jfrukk21scvp6le927j', '::1', 1715118493, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353131383439333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);
INSERT INTO `tec_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('5mn389hsh2e6fuufbkhlqf2undm1c4dh', '::1', 1715120658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353132303635383b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31313a226a7565676f206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('fqfpef2vq77sptvpta88r1qbmudg1jkd', '::1', 1715121305, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353132313330353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('1jgi0007ukoq8u169jo8tj4uu9cvh56o', '::1', 1715121309, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353132313330353b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373134363935353333223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a31303a226d657361206164646564223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ol4raibs0se89l5h97a7hvdnrk389m25', '::1', 1715138669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353133383636383b),
('jdqtk3ilobmcmns0rne3idbrnqsinqfu', '::1', 1715138669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353133383636383b),
('i9tvc9uidlu6vd7hpchaud2dor18491f', '127.0.0.1', 1715138669, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353133383636383b),
('iurgeg4pkqupetvl3tfrvbkfqevagbfv', '::1', 1715139341, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353133393334313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('ajunvk955l33d1tqo84njc0m908p4or0', '::1', 1715141643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134313634333b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('2tk6f4p1vjvqlffmsrfi4kr9cnl5ctca', '::1', 1715144476, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134343437363b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('b7ek62mim7i9hpl67ohqp0qk2s8ql4rp', '::1', 1715145141, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134353134313b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('etucu600ne5hqe00el3qs5s67li33sl8', '::1', 1715145580, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134353538303b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('bq794nbm1a45nf93a5h1fckq4gkj50cu', '::1', 1715145974, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134353937343b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('1sfbv9non9018h54j2c6brnjra4ik6d0', '::1', 1715146412, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134363431323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b),
('4jodsf97vn5kvtu0gu7mg36lqplumdof', '::1', 1715146475, 0x5f5f63695f6c6173745f726567656e65726174657c693a313731353134363431323b6964656e746974797c733a31333a2241646d696e6973747261646f72223b757365726e616d657c733a31333a2241646d696e6973747261646f72223b656d61696c7c733a31333a2268657940676d61696c2e636f6d223b757365725f69647c733a313a2231223b66697273745f6e616d657c733a353a2241646d696e223b6c6173745f6e616d657c733a353a2241646d696e223b637265617465645f6f6e7c733a32343a22546875203235204a756e20323031352031323a353920414d223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373135313136303933223b6c6173745f69707c733a333a223a3a31223b6176617461727c733a33363a2261376635306132313433316139653634313036653364656462646237623766612e6a7067223b67656e6465727c733a363a2266656d616c65223b67726f75705f69647c733a313a2231223b73746f72655f69647c733a313a2231223b6861735f73746f72655f69647c4e3b6d6573736167657c733a34313a223c703e48617320696e69636961646f20736573696f6e20636f7272656374616d656e74652e3c2f703e223b5f5f63695f766172737c613a313a7b733a373a226d657373616765223b733a333a226f6c64223b7d72656769737465725f69647c733a313a2236223b636173685f696e5f68616e647c733a363a22302e30303030223b72656769737465725f6f70656e5f74696d657c733a31393a22323032342d30332d32362032333a33373a3536223b);

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

--
-- Volcado de datos para la tabla `tec_tipos`
--

INSERT INTO `tec_tipos` (`id`, `nombre`, `precio`, `precio_adicional`, `tiempo`, `created_at`, `updated_at`, `store_id`) VALUES
(1, 'prueba', 20.00, 20.00, NULL, '2024-04-21 21:43:18', '2024-04-21 21:43:18', 1),
(2, 'prueba t', 10.00, 5.00, 2, '2024-05-07 21:20:27', '2024-05-07 21:20:27', 1);

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
(1, 0x3a3a31, 0x3132372e302e302e31, 'Administrador', 'b420b17c03f86c1e37f84ad31363f7afdf9eafa7', NULL, 'hey@gmail.com', NULL, NULL, NULL, '93e1ad0171c5e0e479794de392129458b7bc670d', 1435204774, 1715138675, 1, 'Admin', 'Admin', 'Tecdiary', '012345678', 'a7f50a21431a9e64106e3dedbdb7b7fa.jpg', 'female', 1, NULL),
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
(82, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-17 21:47:10'),
(83, 1, NULL, 0x3a3a31, 'Administrador', '2024-04-21 20:36:48'),
(84, 1, NULL, 0x3a3a31, 'Administrador', '2024-05-03 00:18:53'),
(85, 1, NULL, 0x3a3a31, 'Administrador', '2024-05-07 21:08:13'),
(86, 1, NULL, 0x3a3a31, 'Administrador', '2024-05-08 03:24:35');

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
(2, 2, 2, 20.00, 'cash', '2024-04-12 20:28:09', '2024-04-12 20:28:09'),
(4, 2, 3, 100.00, 'cash', '2024-04-21 22:15:36', '2024-04-21 22:15:36'),
(5, 2, 5, 200.00, 'CC', '2024-05-03 00:30:54', '2024-05-03 00:30:54'),
(6, 2, 6, 1000.00, 'CC', '2024-05-03 00:31:16', '2024-05-03 00:31:16'),
(7, 2, 7, 2.00, 'CC', '2024-05-03 00:45:12', '2024-05-03 00:45:12'),
(8, 2, 8, 20.00, 'cash', '2024-05-03 01:55:07', '2024-05-03 01:55:07');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tec_categories`
--
ALTER TABLE `tec_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tec_cliente_tiene_pedidos`
--
ALTER TABLE `tec_cliente_tiene_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tec_pedido_tiene_recetas`
--
ALTER TABLE `tec_pedido_tiene_recetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tec_receta_tiene_insumos`
--
ALTER TABLE `tec_receta_tiene_insumos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tec_sales_juegos_personas`
--
ALTER TABLE `tec_sales_juegos_personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tec_sale_items`
--
ALTER TABLE `tec_sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tec_salones`
--
ALTER TABLE `tec_salones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tec_users`
--
ALTER TABLE `tec_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tec_user_logins`
--
ALTER TABLE `tec_user_logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `tec_ventas_restaurante`
--
ALTER TABLE `tec_ventas_restaurante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
