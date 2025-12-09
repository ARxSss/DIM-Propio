-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2025 at 04:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `destinyinv`
--

-- --------------------------------------------------------

--
-- Table structure for table `assets_items`
--

CREATE TABLE `assets_items` (
  `id_asset` bigint(20) UNSIGNED NOT NULL,
  `id_def_item` bigint(20) DEFAULT NULL,
  `tipo_asset` varchar(20) DEFAULT NULL,
  `ruta_archivo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorias_items`
--

CREATE TABLE `categorias_items` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorias_items`
--

INSERT INTO `categorias_items` (`id_categoria`, `nombre`) VALUES
(1, 'Arma'),
(2, 'Armadura'),
(3, 'Subclase');

-- --------------------------------------------------------

--
-- Table structure for table `clases`
--

CREATE TABLE `clases` (
  `id_clase` int(11) NOT NULL,
  `nombre_clase` varchar(50) NOT NULL,
  `ruta_icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clases`
--

INSERT INTO `clases` (`id_clase`, `nombre_clase`, `ruta_icono`) VALUES
(0, 'Titán', '/common/destiny2_content/icons/class_titan.jpg'),
(1, 'Cazador', '/common/destiny2_content/icons/class_hunter.jpg'),
(2, 'Hechicero', '/common/destiny2_content/icons/class_warlock.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `definiciones_estadisticas`
--

CREATE TABLE `definiciones_estadisticas` (
  `id_estadistica` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `ruta_icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `definiciones_estadisticas`
--

INSERT INTO `definiciones_estadisticas` (`id_estadistica`, `nombre`, `descripcion`, `ruta_icono`) VALUES
(1, 'Impacto', NULL, NULL),
(2, 'Alcance', NULL, NULL),
(3, 'Estabilidad', NULL, NULL),
(4, 'Manejo', NULL, NULL),
(5, 'Recarga', NULL, NULL),
(6, 'Movilidad', NULL, NULL),
(7, 'Resiliencia', NULL, NULL),
(8, 'Recuperación', NULL, NULL),
(9, 'Disciplina', NULL, NULL),
(10, 'Intelecto', NULL, NULL),
(11, 'Fuerza', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `definiciones_items`
--

CREATE TABLE `definiciones_items` (
  `id_def_item` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_rareza` int(11) DEFAULT NULL,
  `id_subtipo` int(11) DEFAULT NULL,
  `id_slot_equipamiento` int(11) DEFAULT NULL,
  `id_tipo_energia_default` int(11) DEFAULT NULL,
  `ruta_captura_pantalla` varchar(255) DEFAULT NULL,
  `texto_lore` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `definiciones_items`
--

INSERT INTO `definiciones_items` (`id_def_item`, `nombre`, `descripcion`, `id_rareza`, `id_subtipo`, `id_slot_equipamiento`, `id_tipo_energia_default`, `ruta_captura_pantalla`, `texto_lore`) VALUES
(1, 'As de Picas', 'Retirar la última mano.', 4, 1, 1, 6, '/common/destiny2_content/icons/ace_of_spades_large.jpg', 'Cayde.'),
(2, 'Gjallarhorn', 'Belleza.', 4, 3, 3, 1, '/common/destiny2_content/icons/gjallarhorn.jpg', 'Lobos.'),
(3, 'Witherhoard', 'El banco.', 4, 8, 1, 6, '/common/destiny2_content/icons/witherhoard.jpg', 'Drifter.'),
(4, 'Espino', 'Devorador.', 4, 1, 1, 6, '/common/destiny2_content/icons/thorn.jpg', 'Yor.'),
(5, 'Señor del Trueno', 'Tambores.', 4, 4, 3, 2, '/common/destiny2_content/icons/thunderlord.jpg', 'Rayo.'),
(11, 'La Reclusa', 'Meta.', 3, 2, 2, 3, '/common/destiny2_content/icons/recluse.jpg', NULL),
(12, 'Cima de la Montaña', 'GL.', 3, 8, 1, 6, '/common/destiny2_content/icons/mountaintop.jpg', NULL),
(13, 'Guillotina', 'Gira.', 3, 7, 3, 3, '/common/destiny2_content/icons/guillotine.jpg', NULL),
(14, 'Medianoche', 'Brilla.', 3, 1, 1, 6, '/common/destiny2_content/icons/midnight.jpg', NULL),
(15, 'Zoológico', 'Calus.', 3, 2, 2, 1, '/common/destiny2_content/icons/calus.jpg', NULL),
(16, 'Patrimonio', 'Cripta.', 3, 5, 1, 6, '/common/destiny2_content/icons/heritage.jpg', NULL),
(17, 'Taipan', 'Lineal.', 3, 10, 3, 3, '/common/destiny2_content/icons/taipan.jpg', NULL),
(18, 'Funnelweb', 'Veist.', 3, 2, 2, 3, '/common/destiny2_content/icons/funnelweb.jpg', NULL),
(19, 'Hezen', 'Cohete.', 3, 3, 3, 1, '/common/destiny2_content/icons/hezen.jpg', NULL),
(20, 'Eyasluna', 'Luna.', 3, 1, 1, 4, '/common/destiny2_content/icons/eyasluna.jpg', NULL),
(50, 'Yelmo San-14', 'Titan Exo.', 4, 20, 4, NULL, '/common/destiny2_content/icons/saint14.jpg', 'Ciega.'),
(52, 'Halcón Celestial', 'Cazador Exo.', 4, 20, 4, NULL, '/common/destiny2_content/icons/nighthawk.jpg', 'Disparo.'),
(54, 'Brazaletes Sol', 'Warlock Exo.', 4, 21, 5, NULL, '/common/destiny2_content/icons/sunbracers.jpg', 'Fuego.'),
(60, 'Yelmo Caballero', 'Titan.', 3, 20, 4, NULL, '/common/destiny2_content/icons/k_helm.jpg', NULL),
(61, 'Brazos Caballero', 'Titan.', 3, 21, 5, NULL, '/common/destiny2_content/icons/k_arms.jpg', NULL),
(62, 'Placa Caballero', 'Titan.', 3, 22, 6, NULL, '/common/destiny2_content/icons/k_chest.jpg', NULL),
(63, 'Grebas Caballero', 'Titan.', 3, 23, 7, NULL, '/common/destiny2_content/icons/k_legs.jpg', NULL),
(64, 'Marca Caballero', 'Titan.', 3, 24, 8, NULL, '/common/destiny2_content/icons/k_mark.jpg', NULL),
(65, 'Máscara Explorador', 'Cazador.', 3, 20, 4, NULL, '/common/destiny2_content/icons/e_helm.jpg', NULL),
(66, 'Mangas Explorador', 'Cazador.', 3, 21, 5, NULL, '/common/destiny2_content/icons/e_arms.jpg', NULL),
(67, 'Chaleco Explorador', 'Cazador.', 3, 22, 6, NULL, '/common/destiny2_content/icons/e_chest.jpg', NULL),
(68, 'Pantalones Explorador', 'Cazador.', 3, 23, 7, NULL, '/common/destiny2_content/icons/e_legs.jpg', NULL),
(69, 'Capa Explorador', 'Cazador.', 3, 24, 8, NULL, '/common/destiny2_content/icons/e_cloak.jpg', NULL),
(70, 'Capucha Erudito', 'Hechicero.', 3, 20, 4, NULL, '/common/destiny2_content/icons/s_hood.jpg', NULL),
(71, 'Guantes Erudito', 'Hechicero.', 3, 21, 5, NULL, '/common/destiny2_content/icons/s_gloves.jpg', NULL),
(72, 'Túnica Erudito', 'Hechicero.', 3, 22, 6, NULL, '/common/destiny2_content/icons/s_robe.jpg', NULL),
(73, 'Botas Erudito', 'Hechicero.', 3, 23, 7, NULL, '/common/destiny2_content/icons/s_boots.jpg', NULL),
(74, 'Bonda Erudito', 'Hechicero.', 3, 24, 8, NULL, '/common/destiny2_content/icons/s_bond.jpg', NULL),
(101, 'Pistolero', 'Solar.', 4, 100, 9, 1, '/common/destiny2_content/icons/subclass_solar.jpg', NULL),
(102, 'Jinete del Arco', 'Arco.', 4, 100, 9, 2, '/common/destiny2_content/icons/subclass_arc.jpg', NULL),
(103, 'Acechador', 'Vacío.', 4, 100, 9, 3, '/common/destiny2_content/icons/subclass_void.jpg', NULL),
(104, 'Renacido', 'Estasis.', 4, 101, 9, 4, '/common/destiny2_content/icons/subclass_stasis.jpg', NULL),
(105, 'Tejedor', 'Cuerdas.', 4, 101, 9, 5, '/common/destiny2_content/icons/subclass_strand.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `definiciones_perks`
--

CREATE TABLE `definiciones_perks` (
  `id_def_perk` bigint(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `ruta_icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `definiciones_perks`
--

INSERT INTO `definiciones_perks` (`id_def_perk`, `nombre`, `descripcion`, `ruta_icono`) VALUES
(1, 'Memento Mori', 'Balas extra.', '/common/destiny2_content/icons/perk_memento.jpg'),
(2, 'Manada', 'Cohetes.', '/common/destiny2_content/icons/perk_wolfpack.jpg'),
(3, 'Devorador', 'Veneno.', '/common/destiny2_content/icons/perk_thorn.jpg'),
(4, 'Incandescente', 'Solar.', '/common/destiny2_content/icons/perk_incandescent.jpg'),
(10, 'Fuera de la ley', 'Recarga.', '/common/destiny2_content/icons/perk_outlaw.jpg'),
(80, 'Excepcional', 'Efecto.', '/common/destiny2_content/icons/mod_exotic.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `equipamientos_guardados`
--

CREATE TABLE `equipamientos_guardados` (
  `id_equipamiento` bigint(20) UNSIGNED NOT NULL,
  `id_personaje` bigint(20) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tema_color` varchar(20) DEFAULT NULL,
  `indice_icono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estadisticas_instancia`
--

CREATE TABLE `estadisticas_instancia` (
  `id_instancia` bigint(20) NOT NULL,
  `id_estadistica` int(11) NOT NULL,
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estadisticas_instancia`
--

INSERT INTO `estadisticas_instancia` (`id_instancia`, `id_estadistica`, `valor`) VALUES
(1, 1, 80),
(1, 2, 60),
(2, 1, 80),
(2, 2, 60),
(3, 1, 80),
(3, 2, 60),
(4, 1, 80),
(4, 2, 60),
(5, 1, 80),
(5, 2, 60),
(6, 1, 80),
(6, 2, 60),
(7, 1, 80),
(7, 2, 60),
(8, 1, 80),
(8, 2, 60),
(9, 1, 80),
(9, 2, 60),
(10, 1, 80),
(10, 2, 60),
(11, 1, 80),
(11, 2, 60),
(12, 1, 80),
(12, 2, 60),
(13, 1, 80),
(13, 2, 60),
(14, 1, 80),
(14, 2, 60),
(15, 1, 80),
(15, 2, 60),
(16, 1, 80),
(16, 2, 60),
(17, 1, 80),
(17, 2, 60),
(18, 1, 80),
(18, 2, 60),
(19, 1, 80),
(19, 2, 60),
(20, 1, 80),
(20, 2, 60),
(21, 1, 80),
(21, 2, 60),
(22, 1, 80),
(22, 2, 60),
(23, 1, 80),
(23, 2, 60),
(24, 1, 80),
(24, 2, 60),
(25, 1, 80),
(25, 2, 60),
(26, 1, 80),
(26, 2, 60),
(27, 1, 80),
(27, 2, 60),
(28, 1, 80),
(28, 2, 60),
(29, 1, 80),
(29, 2, 60),
(30, 1, 80),
(30, 2, 60),
(31, 1, 80),
(31, 2, 60),
(32, 1, 80),
(32, 2, 60);

-- --------------------------------------------------------

--
-- Table structure for table `instancias_items`
--

CREATE TABLE `instancias_items` (
  `id_instancia` bigint(20) NOT NULL,
  `id_def_item` bigint(20) DEFAULT NULL,
  `id_personaje_dueno` bigint(20) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  `nivel_poder_actual` int(11) DEFAULT NULL,
  `esta_bloqueado` tinyint(1) DEFAULT 0,
  `esta_obra_maestra` tinyint(1) DEFAULT 0,
  `nivel_obra_maestra` int(11) DEFAULT 0,
  `cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instancias_items`
--

INSERT INTO `instancias_items` (`id_instancia`, `id_def_item`, `id_personaje_dueno`, `id_ubicacion`, `nivel_poder_actual`, `esta_bloqueado`, `esta_obra_maestra`, `nivel_obra_maestra`, `cantidad`) VALUES
(1, 1, 1001, 1, 1810, 0, 0, 0, 1),
(2, 11, 1001, 1, 1805, 0, 0, 0, 1),
(3, 13, 1001, 1, 1810, 0, 0, 0, 1),
(4, 101, 1001, 1, 1810, 0, 0, 0, 1),
(5, 65, 1001, 1, 1800, 0, 0, 0, 1),
(6, 66, 1001, 1, 1800, 0, 0, 0, 1),
(7, 67, 1001, 1, 1800, 0, 0, 0, 1),
(8, 68, 1001, 1, 1800, 0, 0, 0, 1),
(9, 69, 1001, 1, 1800, 0, 0, 0, 1),
(10, 104, 1001, 2, 1810, 0, 0, 0, 1),
(11, 52, 1001, 2, 1810, 0, 0, 0, 1),
(12, 16, 1001, 2, 1800, 0, 0, 0, 1),
(13, 20, 1001, 2, 1800, 0, 0, 0, 1),
(14, 2, 1002, 1, 1815, 0, 0, 0, 1),
(15, 14, 1002, 1, 1815, 0, 0, 0, 1),
(16, 15, 1002, 1, 1815, 0, 0, 0, 1),
(17, 50, 1002, 1, 1815, 0, 0, 0, 1),
(18, 61, 1002, 1, 1815, 0, 0, 0, 1),
(19, 62, 1002, 1, 1815, 0, 0, 0, 1),
(20, 63, 1002, 1, 1815, 0, 0, 0, 1),
(21, 64, 1002, 1, 1815, 0, 0, 0, 1),
(22, 3, 1002, 2, 1800, 0, 0, 0, 1),
(23, 17, 1002, 2, 1800, 0, 0, 0, 1),
(24, 4, 1003, 1, 1790, 0, 0, 0, 1),
(25, 18, 1003, 1, 1790, 0, 0, 0, 1),
(26, 5, 1003, 1, 1790, 0, 0, 0, 1),
(27, 54, 1003, 1, 1790, 0, 0, 0, 1),
(28, 70, 1003, 1, 1790, 0, 0, 0, 1),
(29, 72, 1003, 1, 1790, 0, 0, 0, 1),
(30, 73, 1003, 1, 1790, 0, 0, 0, 1),
(31, 74, 1003, 1, 1790, 0, 0, 0, 1),
(32, 105, 1003, 2, 1790, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `perks_instancia`
--

CREATE TABLE `perks_instancia` (
  `id_instancia` bigint(20) NOT NULL,
  `id_def_perk` bigint(20) NOT NULL,
  `indice_socket` int(11) NOT NULL,
  `esta_activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perks_instancia`
--

INSERT INTO `perks_instancia` (`id_instancia`, `id_def_perk`, `indice_socket`, `esta_activo`) VALUES
(1, 10, 1, 1),
(2, 10, 1, 1),
(3, 10, 1, 1),
(4, 10, 1, 1),
(5, 10, 1, 1),
(6, 10, 1, 1),
(7, 10, 1, 1),
(8, 10, 1, 1),
(9, 10, 1, 1),
(10, 10, 1, 1),
(11, 10, 1, 1),
(12, 10, 1, 1),
(13, 10, 1, 1),
(14, 10, 1, 1),
(15, 10, 1, 1),
(16, 10, 1, 1),
(17, 10, 1, 1),
(18, 10, 1, 1),
(19, 10, 1, 1),
(20, 10, 1, 1),
(21, 10, 1, 1),
(22, 10, 1, 1),
(23, 10, 1, 1),
(24, 10, 1, 1),
(25, 10, 1, 1),
(26, 10, 1, 1),
(27, 10, 1, 1),
(28, 10, 1, 1),
(29, 10, 1, 1),
(30, 10, 1, 1),
(31, 10, 1, 1),
(32, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personajes`
--

CREATE TABLE `personajes` (
  `id_personaje` bigint(20) NOT NULL,
  `id_usuario` bigint(20) UNSIGNED DEFAULT NULL,
  `id_clase` int(11) DEFAULT NULL,
  `nivel_luz` int(11) DEFAULT NULL,
  `ruta_emblema` varchar(255) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `ultimo_juego` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personajes`
--

INSERT INTO `personajes` (`id_personaje`, `id_usuario`, `id_clase`, `nivel_luz`, `ruta_emblema`, `fecha_creacion`, `ultimo_juego`) VALUES
(1001, 1, 1, 1810, '/common/destiny2_content/icons/emblem_hunter.jpg', '2025-12-09 11:05:11', NULL),
(1002, 1, 0, 1815, '/common/destiny2_content/icons/emblem_titan.jpg', '2025-12-09 11:05:11', NULL),
(1003, 1, 2, 1790, '/common/destiny2_content/icons/emblem_warlock.jpg', '2025-12-09 11:05:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rarezas`
--

CREATE TABLE `rarezas` (
  `id_rareza` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `color_hex` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rarezas`
--

INSERT INTO `rarezas` (`id_rareza`, `nombre`, `color_hex`) VALUES
(1, 'Común', '#C3BCB4'),
(2, 'Raro', '#5076A3'),
(3, 'Legendario', '#522F65'),
(4, 'Excepcional', '#F5DC56');

-- --------------------------------------------------------

--
-- Table structure for table `slots_equipamiento`
--

CREATE TABLE `slots_equipamiento` (
  `id_slot` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `hash_referencia` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slots_equipamiento`
--

INSERT INTO `slots_equipamiento` (`id_slot`, `nombre`, `hash_referencia`) VALUES
(1, 'Cinética', 0),
(2, 'Energética', 0),
(3, 'Destructiva', 0),
(4, 'Casco', 0),
(5, 'Guanteletes', 0),
(6, 'Pecho', 0),
(7, 'Piernas', 0),
(8, 'Clase', 0),
(9, 'Subclase', 0);

-- --------------------------------------------------------

--
-- Table structure for table `subtipos_items`
--

CREATE TABLE `subtipos_items` (
  `id_subtipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_categoria_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subtipos_items`
--

INSERT INTO `subtipos_items` (`id_subtipo`, `nombre`, `id_categoria_padre`) VALUES
(1, 'Cañón de Mano', 1),
(2, 'Subfusil', 1),
(3, 'Lanzacohetes', 1),
(4, 'Automático', 1),
(5, 'Escopeta', 1),
(6, 'Francotirador', 1),
(7, 'Espada', 1),
(8, 'Lanzagranadas', 1),
(9, 'Arco', 1),
(10, 'Fusión Lineal', 1),
(20, 'Casco', 2),
(21, 'Guanteletes', 2),
(22, 'Pecho', 2),
(23, 'Piernas', 2),
(24, 'Objeto de Clase', 2),
(100, 'Subclase Luz', 3),
(101, 'Subclase Oscuridad', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tipos_energia`
--

CREATE TABLE `tipos_energia` (
  `id_tipo_energia` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ruta_icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tipos_energia`
--

INSERT INTO `tipos_energia` (`id_tipo_energia`, `nombre`, `ruta_icono`) VALUES
(1, 'Solar', ''),
(2, 'Arco', ''),
(3, 'Vacío', ''),
(4, 'Estasis', ''),
(5, 'Atadura', ''),
(6, 'Cinético', '');

-- --------------------------------------------------------

--
-- Table structure for table `ubicaciones_inventario`
--

CREATE TABLE `ubicaciones_inventario` (
  `id_ubicacion` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ubicaciones_inventario`
--

INSERT INTO `ubicaciones_inventario` (`id_ubicacion`, `nombre`) VALUES
(1, 'Equipado'),
(2, 'Inventario'),
(3, 'Depósito');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` bigint(20) UNSIGNED NOT NULL,
  `nombre_bungie` varchar(100) NOT NULL,
  `plataforma_id` int(11) DEFAULT NULL,
  `ultimo_acceso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_bungie`, `plataforma_id`, `ultimo_acceso`) VALUES
(1, 'Guardian_Dev', 3, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assets_items`
--
ALTER TABLE `assets_items`
  ADD PRIMARY KEY (`id_asset`),
  ADD KEY `id_def_item` (`id_def_item`);

--
-- Indexes for table `categorias_items`
--
ALTER TABLE `categorias_items`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id_clase`);

--
-- Indexes for table `definiciones_estadisticas`
--
ALTER TABLE `definiciones_estadisticas`
  ADD PRIMARY KEY (`id_estadistica`);

--
-- Indexes for table `definiciones_items`
--
ALTER TABLE `definiciones_items`
  ADD PRIMARY KEY (`id_def_item`),
  ADD KEY `id_rareza` (`id_rareza`),
  ADD KEY `id_subtipo` (`id_subtipo`),
  ADD KEY `id_slot_equipamiento` (`id_slot_equipamiento`),
  ADD KEY `id_tipo_energia_default` (`id_tipo_energia_default`);

--
-- Indexes for table `definiciones_perks`
--
ALTER TABLE `definiciones_perks`
  ADD PRIMARY KEY (`id_def_perk`);

--
-- Indexes for table `equipamientos_guardados`
--
ALTER TABLE `equipamientos_guardados`
  ADD PRIMARY KEY (`id_equipamiento`),
  ADD KEY `id_personaje` (`id_personaje`);

--
-- Indexes for table `estadisticas_instancia`
--
ALTER TABLE `estadisticas_instancia`
  ADD PRIMARY KEY (`id_instancia`,`id_estadistica`),
  ADD KEY `id_estadistica` (`id_estadistica`);

--
-- Indexes for table `instancias_items`
--
ALTER TABLE `instancias_items`
  ADD PRIMARY KEY (`id_instancia`),
  ADD KEY `id_def_item` (`id_def_item`),
  ADD KEY `id_personaje_dueno` (`id_personaje_dueno`),
  ADD KEY `id_ubicacion` (`id_ubicacion`);

--
-- Indexes for table `perks_instancia`
--
ALTER TABLE `perks_instancia`
  ADD PRIMARY KEY (`id_instancia`,`id_def_perk`,`indice_socket`),
  ADD KEY `id_def_perk` (`id_def_perk`);

--
-- Indexes for table `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id_personaje`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_clase` (`id_clase`);

--
-- Indexes for table `rarezas`
--
ALTER TABLE `rarezas`
  ADD PRIMARY KEY (`id_rareza`);

--
-- Indexes for table `slots_equipamiento`
--
ALTER TABLE `slots_equipamiento`
  ADD PRIMARY KEY (`id_slot`);

--
-- Indexes for table `subtipos_items`
--
ALTER TABLE `subtipos_items`
  ADD PRIMARY KEY (`id_subtipo`),
  ADD KEY `id_categoria_padre` (`id_categoria_padre`);

--
-- Indexes for table `tipos_energia`
--
ALTER TABLE `tipos_energia`
  ADD PRIMARY KEY (`id_tipo_energia`);

--
-- Indexes for table `ubicaciones_inventario`
--
ALTER TABLE `ubicaciones_inventario`
  ADD PRIMARY KEY (`id_ubicacion`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assets_items`
--
ALTER TABLE `assets_items`
  MODIFY `id_asset` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `definiciones_items`
--
ALTER TABLE `definiciones_items`
  MODIFY `id_def_item` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT for table `definiciones_perks`
--
ALTER TABLE `definiciones_perks`
  MODIFY `id_def_perk` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `equipamientos_guardados`
--
ALTER TABLE `equipamientos_guardados`
  MODIFY `id_equipamiento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instancias_items`
--
ALTER TABLE `instancias_items`
  MODIFY `id_instancia` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assets_items`
--
ALTER TABLE `assets_items`
  ADD CONSTRAINT `assets_items_ibfk_1` FOREIGN KEY (`id_def_item`) REFERENCES `definiciones_items` (`id_def_item`);

--
-- Constraints for table `definiciones_items`
--
ALTER TABLE `definiciones_items`
  ADD CONSTRAINT `definiciones_items_ibfk_1` FOREIGN KEY (`id_rareza`) REFERENCES `rarezas` (`id_rareza`),
  ADD CONSTRAINT `definiciones_items_ibfk_2` FOREIGN KEY (`id_subtipo`) REFERENCES `subtipos_items` (`id_subtipo`),
  ADD CONSTRAINT `definiciones_items_ibfk_3` FOREIGN KEY (`id_slot_equipamiento`) REFERENCES `slots_equipamiento` (`id_slot`),
  ADD CONSTRAINT `definiciones_items_ibfk_4` FOREIGN KEY (`id_tipo_energia_default`) REFERENCES `tipos_energia` (`id_tipo_energia`);

--
-- Constraints for table `equipamientos_guardados`
--
ALTER TABLE `equipamientos_guardados`
  ADD CONSTRAINT `equipamientos_guardados_ibfk_1` FOREIGN KEY (`id_personaje`) REFERENCES `personajes` (`id_personaje`);

--
-- Constraints for table `estadisticas_instancia`
--
ALTER TABLE `estadisticas_instancia`
  ADD CONSTRAINT `estadisticas_instancia_ibfk_1` FOREIGN KEY (`id_instancia`) REFERENCES `instancias_items` (`id_instancia`),
  ADD CONSTRAINT `estadisticas_instancia_ibfk_2` FOREIGN KEY (`id_estadistica`) REFERENCES `definiciones_estadisticas` (`id_estadistica`);

--
-- Constraints for table `instancias_items`
--
ALTER TABLE `instancias_items`
  ADD CONSTRAINT `instancias_items_ibfk_1` FOREIGN KEY (`id_def_item`) REFERENCES `definiciones_items` (`id_def_item`),
  ADD CONSTRAINT `instancias_items_ibfk_2` FOREIGN KEY (`id_personaje_dueno`) REFERENCES `personajes` (`id_personaje`),
  ADD CONSTRAINT `instancias_items_ibfk_3` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones_inventario` (`id_ubicacion`);

--
-- Constraints for table `perks_instancia`
--
ALTER TABLE `perks_instancia`
  ADD CONSTRAINT `perks_instancia_ibfk_1` FOREIGN KEY (`id_instancia`) REFERENCES `instancias_items` (`id_instancia`),
  ADD CONSTRAINT `perks_instancia_ibfk_2` FOREIGN KEY (`id_def_perk`) REFERENCES `definiciones_perks` (`id_def_perk`);

--
-- Constraints for table `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `personajes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `personajes_ibfk_2` FOREIGN KEY (`id_clase`) REFERENCES `clases` (`id_clase`);

--
-- Constraints for table `subtipos_items`
--
ALTER TABLE `subtipos_items`
  ADD CONSTRAINT `subtipos_items_ibfk_1` FOREIGN KEY (`id_categoria_padre`) REFERENCES `categorias_items` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
