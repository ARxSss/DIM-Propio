-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2025 at 01:37 AM
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
(0, 'Titán', NULL),
(1, 'Cazador', NULL),
(2, 'Hechicero', NULL);

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
(5, 'Velocidad de Recarga', NULL, NULL),
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
(1, 'As de Picas', 'Retirar la última mano es un saludo muy largo.', 4, NULL, 1, 6, '/common/destiny2_content/icons/ace_of_spades_large.jpg', 'El arma de Cayde-6. \"Vuelvo a casa, Ace\".'),
(2, 'Gjallarhorn', 'Si hay belleza en la destrucción...', 4, NULL, 3, 1, '/common/destiny2_content/icons/gjallarhorn.jpg', 'Forjado a partir de la armadura de los guardianes caídos.'),
(3, 'Espino', 'Para desgarrar la luz y la carne.', 4, NULL, 1, 6, '/common/destiny2_content/icons/thorn.jpg', 'Un arma de dolor. Dredgen Yor la usó para segar la luz.'),
(4, 'La Última Palabra', 'Tuya, hasta que la llama se apague.', 4, NULL, 1, 6, '/common/destiny2_content/icons/the_last_word.jpg', 'Shin Malphur escribió su leyenda con fuego rápido.'),
(5, 'Witherhoard', 'Como un hombre que mira al abismo.', 4, NULL, 1, 6, '/common/destiny2_content/icons/witherhoard.jpg', 'El Banco se alimenta. Esta arma dispara una plaga tomada.'),
(6, 'Lanza de Gravitón', '¿Y si disparamos agujeros negros?', 4, NULL, 2, 3, '/common/destiny2_content/icons/graviton_lance.jpg', 'Dispara singularidades en miniatura.'),
(7, 'Señor del Trueno', 'Vuelven a sonar los tambores.', 4, NULL, 3, 2, '/common/destiny2_content/icons/thunderlord.jpg', 'Invoca la tormenta con cada gatillazo.'),
(8, 'Halcón de Luna', 'Escucha el graznido.', 4, NULL, 1, 6, '/common/destiny2_content/icons/hawkmoon.jpg', 'Forjada por la Luz misma, un regalo del Viajero.'),
(9, 'Ojos del Mañana', 'Quieren verte arder.', 4, NULL, 3, 1, '/common/destiny2_content/icons/eyes_tomorrow.jpg', 'Tecnología de la Cripta de la Piedra Profunda.'),
(10, 'Adivinación de Ticuu', 'El tiempo es una flecha.', 4, NULL, 2, 1, '/common/destiny2_content/icons/ticuus.jpg', 'Un arco Psiónico que dobla la causalidad.'),
(11, 'La Reclusa', 'Mis picaduras son peores.', 3, NULL, 2, 3, '/common/destiny2_content/icons/recluse.jpg', NULL),
(12, 'Cima de la Montaña', 'El ascenso es duro.', 3, NULL, 1, 6, '/common/destiny2_content/icons/mountaintop.jpg', NULL),
(13, 'Guillotina Interactiva', 'Gira para ganar.', 3, NULL, 3, 3, '/common/destiny2_content/icons/falling_guillotine.jpg', NULL),
(14, 'Cabeza de Martillo', 'Golpea como un yunque.', 3, NULL, 3, 3, '/common/destiny2_content/icons/hammerhead.jpg', NULL),
(15, 'Destino de los Justos', 'Mantén la línea.', 3, NULL, 1, 6, '/common/destiny2_content/icons/auto_kinetic.jpg', NULL),
(16, 'Legado de Medianoche', 'Brilla en la oscuridad.', 3, NULL, 1, 6, '/common/destiny2_content/icons/midnight_coup.jpg', NULL),
(17, 'Zoológico', 'Herramienta Calus Mini.', 3, NULL, 2, 1, '/common/destiny2_content/icons/calus_mini.jpg', NULL),
(18, 'Funnelweb', 'Veneno de Veist.', 3, NULL, 2, 3, '/common/destiny2_content/icons/funnelweb.jpg', NULL),
(19, 'Taipan-4FR', 'Precisión lineal.', 3, NULL, 3, 3, '/common/destiny2_content/icons/taipan.jpg', NULL),
(20, 'Venganza de Hezen', 'Perdido en el tiempo.', 3, NULL, 3, 1, '/common/destiny2_content/icons/hezen_vengeance.jpg', NULL),
(21, 'Patrimonio', 'Escopeta de la Cripta.', 3, NULL, 1, 6, '/common/destiny2_content/icons/heritage.jpg', NULL),
(22, 'Sombra Dispersa', 'Subfusil de Atadura.', 3, NULL, 1, 5, '/common/destiny2_content/icons/strand_smg.jpg', NULL),
(23, 'Hielo Negro', 'Pulso de Estasis.', 3, NULL, 1, 4, '/common/destiny2_content/icons/stasis_pulse.jpg', NULL),
(24, 'Nación de Bestias', 'Trueno de mano.', 3, NULL, 2, 2, '/common/destiny2_content/icons/nation_beasts.jpg', NULL),
(25, 'Luna Aulladora', 'Recuerdo del Crisol.', 3, NULL, 2, 1, '/common/destiny2_content/icons/luna_howl.jpg', NULL),
(26, 'Matador 64', 'Clásico de escopeta.', 3, NULL, 2, 2, '/common/destiny2_content/icons/matador.jpg', NULL),
(27, 'Cataclísmico', 'Lineal Solar.', 3, NULL, 3, 1, '/common/destiny2_content/icons/cataclysmic.jpg', NULL),
(28, 'Perdón del Polvo', 'Lanzagranadas Cinético.', 3, NULL, 1, 6, '/common/destiny2_content/icons/pardon_dust.jpg', NULL),
(29, 'Eyasluna', 'Halcón joven.', 3, NULL, 1, 4, '/common/destiny2_content/icons/eyasluna.jpg', NULL),
(30, 'Mil Pasos', 'Francotirador de vacío.', 3, NULL, 2, 3, '/common/destiny2_content/icons/1000_yard.jpg', NULL),
(31, 'Verdad Contada', 'Cañón de mano de vacío.', 3, NULL, 2, 3, '/common/destiny2_content/icons/trust.jpg', NULL),
(32, 'Filo del Otro Lado', 'Espada rápida.', 3, NULL, 3, 3, '/common/destiny2_content/icons/eager_edge_sword.jpg', NULL),
(33, 'Código de Duelo', 'Lanzacohetes de campo.', 3, NULL, 3, 1, '/common/destiny2_content/icons/duello.jpg', NULL),
(34, 'Tigerspite', 'Fusil automático.', 3, NULL, 1, 6, '/common/destiny2_content/icons/tigerspite.jpg', NULL),
(35, 'Waking Vigil', 'Cañón de mano de Arco.', 3, NULL, 2, 2, '/common/destiny2_content/icons/waking_vigil.jpg', NULL),
(36, 'Retold Tale', 'Escopeta de vacío.', 3, NULL, 2, 3, '/common/destiny2_content/icons/retold.jpg', NULL),
(37, 'Sleepless', 'Lanzacohetes de Arco.', 3, NULL, 3, 2, '/common/destiny2_content/icons/sleepless.jpg', NULL),
(38, 'Abide the Return', 'Espada Solar.', 3, NULL, 3, 1, '/common/destiny2_content/icons/abide.jpg', NULL),
(39, 'Horror Least', 'Pulso de disparo rápido.', 3, NULL, 2, 2, '/common/destiny2_content/icons/horror_least.jpg', NULL),
(40, 'Mindbender', 'Escopeta agresiva.', 3, NULL, 2, 1, '/common/destiny2_content/icons/mindbender.jpg', NULL),
(41, 'Khvostov 7G-02', 'El inicio.', 1, NULL, 1, 6, '/common/destiny2_content/icons/khvostov_white.jpg', NULL),
(42, 'Ballyhoo Mk.27', 'Fiable.', 2, NULL, 1, 6, '/common/destiny2_content/icons/ballyhoo.jpg', NULL),
(43, 'Stubborn Oak', 'Escopeta básica.', 1, NULL, 1, 6, '/common/destiny2_content/icons/oak.jpg', NULL),
(44, 'Thistle and Yew', 'Explorador común.', 2, NULL, 1, 6, '/common/destiny2_content/icons/thistle.jpg', NULL),
(45, 'Butler-RS/2', 'Lanzacohetes raro.', 2, NULL, 3, 2, '/common/destiny2_content/icons/butler.jpg', NULL),
(46, 'Requiem-43', 'Escopeta de campo.', 2, NULL, 2, 3, '/common/destiny2_content/icons/requiem.jpg', NULL),
(47, 'Sonata-48', 'Fusil de explorador.', 2, NULL, 2, 1, '/common/destiny2_content/icons/sonata.jpg', NULL),
(48, 'Fugue-55', 'Francotirador.', 2, NULL, 2, 3, '/common/destiny2_content/icons/fugue.jpg', NULL),
(49, 'Allegro-34', 'Cañón de mano.', 2, NULL, 2, 1, '/common/destiny2_content/icons/allegro.jpg', NULL),
(50, 'Minuet-42', 'Cañón de mano.', 2, NULL, 2, 1, '/common/destiny2_content/icons/minuet.jpg', NULL),
(60, 'Yelmo de San-14', 'Nunca vaciló.', 4, NULL, 4, NULL, '/common/destiny2_content/icons/saint14_helm.jpg', 'EFECTO: Ciega enemigos en la Cúpula.'),
(61, 'Halcón Celestial', 'Un solo disparo.', 4, NULL, 4, NULL, '/common/destiny2_content/icons/nighthawk.jpg', 'EFECTO: Pistola Dorada dispara 1 bala.'),
(62, 'Brazaletes Solares', 'El sol en tus manos.', 4, NULL, 5, NULL, '/common/destiny2_content/icons/sunbracers.jpg', 'EFECTO: Granadas solares ilimitadas.'),
(63, 'Pisotones (St0mp-EE5)', 'No toques el suelo.', 4, NULL, 7, NULL, '/common/destiny2_content/icons/stompees.jpg', 'EFECTO: Mejora salto y sprint.'),
(64, 'Corazón de la Luz', 'Poder interior.', 4, NULL, 6, NULL, '/common/destiny2_content/icons/inmost_light.jpg', 'EFECTO: Usar habilidades potencia otras.'),
(70, 'Yelmo Caballero', 'Casco pesado.', 3, NULL, 4, NULL, '/common/destiny2_content/icons/knight_helm.jpg', NULL),
(71, 'Brazos Caballero', 'Guanteletes blindados.', 3, NULL, 5, NULL, '/common/destiny2_content/icons/knight_arms.jpg', NULL),
(72, 'Placa Caballero', 'Pecho de placas.', 3, NULL, 6, NULL, '/common/destiny2_content/icons/knight_chest.jpg', NULL),
(73, 'Grebas Caballero', 'Botas reforzadas.', 3, NULL, 7, NULL, '/common/destiny2_content/icons/knight_legs.jpg', NULL),
(74, 'Marca Caballero', 'Distintivo de orden.', 3, NULL, 8, NULL, '/common/destiny2_content/icons/knight_mark.jpg', NULL),
(75, 'Máscara Explorador', 'Visor táctico.', 3, NULL, 4, NULL, '/common/destiny2_content/icons/explorer_mask.jpg', NULL),
(76, 'Mangas Explorador', 'Agilidad mejorada.', 3, NULL, 5, NULL, '/common/destiny2_content/icons/explorer_arms.jpg', NULL),
(77, 'Chaleco Explorador', 'Kevlar ligero.', 3, NULL, 6, NULL, '/common/destiny2_content/icons/explorer_chest.jpg', NULL),
(78, 'Pantalones Explorador', 'Bolsillos tácticos.', 3, NULL, 7, NULL, '/common/destiny2_content/icons/explorer_legs.jpg', NULL),
(79, 'Capa Explorador', 'Camuflaje activo.', 3, NULL, 8, NULL, '/common/destiny2_content/icons/explorer_cloak.jpg', NULL),
(80, 'Capucha Erudito', 'Mente abierta.', 3, NULL, 4, NULL, '/common/destiny2_content/icons/scholar_hood.jpg', NULL),
(81, 'Guantes Erudito', 'Canalizadores.', 3, NULL, 5, NULL, '/common/destiny2_content/icons/scholar_gloves.jpg', NULL),
(82, 'Túnica Erudito', 'Tejido arcano.', 3, NULL, 6, NULL, '/common/destiny2_content/icons/scholar_robes.jpg', NULL),
(83, 'Botas Erudito', 'Paso firme.', 3, NULL, 7, NULL, '/common/destiny2_content/icons/scholar_boots.jpg', NULL),
(84, 'Bonda Erudito', 'Símbolo de sabiduría.', 3, NULL, 8, NULL, '/common/destiny2_content/icons/scholar_bond.jpg', NULL);

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
(10, 'Fuera de la ley', 'Recargas rápidas tras baja de precisión.', '/common/destiny2_content/icons/perk_outlaw.jpg'),
(11, 'Cargador Mortal', 'Recargar tras matar aumenta el daño.', '/common/destiny2_content/icons/perk_kill_clip.jpg'),
(12, 'Luciérnaga', 'Bajas de precisión causan explosiones solares.', '/common/destiny2_content/icons/perk_firefly.jpg'),
(13, 'Telémetro', 'Aumenta el alcance al apuntar.', '/common/destiny2_content/icons/perk_rangefinder.jpg'),
(14, 'Incandescente', 'Propaga calcinación a los enemigos cercanos.', '/common/destiny2_content/icons/perk_incandescent.jpg'),
(15, 'Reconstrucción', 'Se recarga sola lentamente hasta el doble.', '/common/destiny2_content/icons/perk_reconstruction.jpg'),
(16, 'Vorpal', 'Daño aumentado contra jefes y vehículos.', '/common/destiny2_content/icons/perk_vorpal.jpg'),
(17, 'Cebo y Cambio', 'Dañar con todas las armas aumenta el daño.', '/common/destiny2_content/icons/perk_bait_and_switch.jpg'),
(50, 'Memento Mori', 'Recargar tras baja otorga balas de daño extra.', '/common/destiny2_content/icons/perk_memento_mori.jpg'),
(51, 'Proyectiles de la Manada', 'Cohetes que se dividen en rastreadores.', '/common/destiny2_content/icons/perk_wolfpack_rounds.jpg'),
(52, 'Devorador de Almas', 'Daño de veneno continuo y atraviesa objetivos.', '/common/destiny2_content/icons/perk_thorn.jpg'),
(53, 'Fuego de Cadera', 'Disparar sin apuntar es más preciso y rápido.', '/common/destiny2_content/icons/perk_last_word.jpg'),
(54, 'Tormento Primordial', 'Dispara plaga de poseídos que daña con el tiempo.', '/common/destiny2_content/icons/perk_witherhoard.jpg'),
(55, 'Cosmología', 'Las bajas crean explosiones de vacío y proyectiles.', '/common/destiny2_content/icons/perk_graviton.jpg'),
(56, 'Conducto de Arco', 'Las bajas encadenan rayos a enemigos cercanos.', '/common/destiny2_content/icons/perk_thunderlord.jpg'),
(57, 'Regulador', 'Dispara balas pesadas. Bajas de precisión curan.', '/common/destiny2_content/icons/perk_hawkmoon.jpg'),
(58, 'Ojos del Mañana', 'Fija múltiples objetivos y dispara andanada de cohetes.', '/common/destiny2_content/icons/perk_eyes_tomorrow.jpg'),
(59, 'La Maldición', 'Disparar desde la cadera marca objetivos.', '/common/destiny2_content/icons/perk_ticuu.jpg'),
(80, 'Protocolo Starless', 'Las bajas con fusión otorgan energía de granada.', '/common/destiny2_content/icons/mod_warlock.jpg'),
(81, 'Ojo Celestial', 'La Pistola Dorada dispara un solo tiro.', '/common/destiny2_content/icons/mod_nighthawk.jpg'),
(82, 'Puños de Havoc', 'Aumenta el alcance de las embestidas.', '/common/destiny2_content/icons/mod_synthoceps.jpg'),
(83, 'Pisadas Hidráulicas', 'Aumenta velocidad de sprint y salto.', '/common/destiny2_content/icons/mod_stompees.jpg'),
(84, 'Resaca', 'Las bajas con arco crean una explosión.', '/common/destiny2_content/icons/mod_chromatic.jpg');

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
(1, 1, 84),
(1, 2, 78),
(1, 3, 46),
(1, 4, 46),
(1, 5, 48),
(2, 1, 100),
(2, 2, 70),
(2, 3, 65),
(2, 4, 50),
(2, 5, 40),
(3, 1, 80),
(3, 2, 45),
(3, 3, 60),
(3, 4, 69),
(3, 5, 50),
(4, 1, 78),
(4, 2, 20),
(4, 3, 40),
(4, 4, 100),
(4, 5, 80),
(5, 1, 90),
(5, 2, 60),
(5, 3, 20),
(5, 4, 80),
(5, 5, 10),
(6, 1, 60),
(6, 2, 80),
(6, 3, 70),
(6, 4, 50),
(6, 5, 60),
(7, 1, 50),
(7, 2, 70),
(7, 3, 60),
(7, 4, 50),
(7, 5, 60),
(8, 1, 80),
(8, 2, 70),
(8, 3, 60),
(8, 4, 70),
(8, 5, 50),
(9, 1, 90),
(9, 2, 80),
(9, 3, 50),
(9, 4, 40),
(9, 5, 30),
(10, 1, 60),
(10, 2, 70),
(10, 3, 80),
(10, 4, 60),
(10, 5, 50),
(11, 1, 20),
(11, 2, 40),
(11, 3, 50),
(11, 4, 80),
(11, 5, 40),
(12, 1, 80),
(12, 2, 50),
(12, 3, 50),
(12, 4, 50),
(12, 5, 50),
(13, 1, 100),
(13, 2, 0),
(13, 3, 50),
(13, 4, 50),
(13, 5, 0),
(14, 1, 40),
(14, 2, 70),
(14, 3, 60),
(14, 4, 40),
(14, 5, 30),
(15, 1, 30),
(15, 2, 60),
(15, 3, 60),
(15, 4, 60),
(15, 5, 60),
(16, 1, 84),
(16, 2, 60),
(16, 3, 60),
(16, 4, 50),
(16, 5, 50),
(17, 1, 20),
(17, 2, 45),
(17, 3, 55),
(17, 4, 85),
(17, 5, 45),
(18, 1, 20),
(18, 2, 42),
(18, 3, 52),
(18, 4, 82),
(18, 5, 42),
(19, 1, 45),
(19, 2, 80),
(19, 3, 50),
(19, 4, 35),
(19, 5, 35),
(20, 1, 90),
(20, 2, 60),
(20, 3, 40),
(20, 4, 30),
(20, 5, 20),
(21, 1, 80),
(21, 2, 30),
(21, 3, 30),
(21, 4, 40),
(21, 5, 30),
(22, 1, 20),
(22, 2, 40),
(22, 3, 50),
(22, 4, 80),
(22, 5, 40),
(23, 1, 30),
(23, 2, 60),
(23, 3, 70),
(23, 4, 50),
(23, 5, 40),
(24, 1, 84),
(24, 2, 55),
(24, 3, 55),
(24, 4, 55),
(24, 5, 55),
(25, 1, 90),
(25, 2, 50),
(25, 3, 50),
(25, 4, 45),
(25, 5, 45),
(26, 1, 85),
(26, 2, 35),
(26, 3, 25),
(26, 4, 35),
(26, 5, 25),
(27, 1, 45),
(27, 2, 80),
(27, 3, 50),
(27, 4, 35),
(27, 5, 35),
(28, 1, 80),
(28, 2, 40),
(28, 3, 40),
(28, 4, 60),
(28, 5, 50),
(29, 1, 84),
(29, 2, 65),
(29, 3, 65),
(29, 4, 60),
(29, 5, 60),
(30, 1, 70),
(30, 2, 80),
(30, 3, 40),
(30, 4, 40),
(30, 5, 40),
(31, 1, 90),
(31, 2, 40),
(31, 3, 40),
(31, 4, 40),
(31, 5, 40),
(32, 1, 90),
(32, 2, 0),
(32, 3, 60),
(32, 4, 60),
(32, 5, 0),
(33, 1, 95),
(33, 2, 60),
(33, 3, 40),
(33, 4, 30),
(33, 5, 20),
(34, 1, 30),
(34, 2, 60),
(34, 3, 60),
(34, 4, 60),
(34, 5, 60),
(35, 1, 80),
(35, 2, 50),
(35, 3, 50),
(35, 4, 60),
(35, 5, 60),
(36, 1, 75),
(36, 2, 40),
(36, 3, 35),
(36, 4, 45),
(36, 5, 35),
(37, 1, 95),
(37, 2, 60),
(37, 3, 40),
(37, 4, 30),
(37, 5, 20),
(38, 1, 90),
(38, 2, 0),
(38, 3, 60),
(38, 4, 60),
(38, 5, 0),
(39, 1, 25),
(39, 2, 65),
(39, 3, 65),
(39, 4, 65),
(39, 5, 65),
(40, 1, 90),
(40, 2, 25),
(40, 3, 20),
(40, 4, 30),
(40, 5, 20),
(41, 1, 20),
(41, 2, 40),
(41, 3, 50),
(41, 4, 50),
(41, 5, 50),
(42, 1, 50),
(42, 2, 50),
(42, 3, 50),
(42, 4, 50),
(42, 5, 50),
(43, 1, 70),
(43, 2, 20),
(43, 3, 30),
(43, 4, 40),
(43, 5, 30),
(44, 1, 40),
(44, 2, 70),
(44, 3, 40),
(44, 4, 40),
(44, 5, 40),
(45, 1, 90),
(45, 2, 60),
(45, 3, 40),
(45, 4, 30),
(45, 5, 20),
(46, 1, 70),
(46, 2, 20),
(46, 3, 30),
(46, 4, 40),
(46, 5, 30),
(47, 1, 40),
(47, 2, 70),
(47, 3, 40),
(47, 4, 40),
(47, 5, 40),
(48, 1, 70),
(48, 2, 80),
(48, 3, 40),
(48, 4, 40),
(48, 5, 40),
(49, 1, 70),
(49, 2, 40),
(49, 3, 40),
(49, 4, 40),
(49, 5, 40),
(50, 1, 70),
(50, 2, 40),
(50, 3, 40),
(50, 4, 40),
(50, 5, 40),
(60, 6, 20),
(60, 7, 100),
(60, 10, 80),
(61, 6, 100),
(61, 8, 30),
(61, 10, 90),
(62, 8, 80),
(62, 9, 100),
(62, 11, 40),
(63, 6, 100),
(63, 7, 50),
(63, 8, 50),
(64, 7, 80),
(64, 9, 80),
(64, 11, 80),
(65, 7, 60),
(65, 8, 50),
(66, 7, 60),
(66, 8, 50),
(67, 7, 60),
(67, 8, 50),
(68, 7, 60),
(68, 8, 50),
(69, 7, 60),
(69, 8, 50),
(70, 6, 60),
(70, 9, 50),
(71, 6, 60),
(71, 9, 50),
(72, 6, 60),
(72, 9, 50),
(73, 6, 60),
(73, 9, 50),
(74, 6, 60),
(74, 9, 50),
(75, 8, 60),
(75, 10, 50),
(76, 8, 60),
(76, 10, 50),
(77, 8, 60),
(77, 10, 50),
(78, 8, 60),
(78, 10, 50),
(79, 8, 60),
(79, 10, 50);

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
(1, 1, 12345, 1, 1810, 0, 1, 0, 1),
(2, 2, 12345, 2, 1805, 0, 1, 0, 1),
(3, 3, 12345, 2, 1800, 0, 0, 0, 1),
(4, 4, 12345, 2, 1805, 0, 1, 0, 1),
(5, 5, 12345, 2, 1808, 0, 1, 0, 1),
(6, 6, 12345, 2, 1790, 0, 0, 0, 1),
(7, 7, 12345, 2, 1800, 0, 1, 0, 1),
(8, 8, 12345, 2, 1800, 0, 1, 0, 1),
(9, 9, 12345, 2, 1805, 0, 1, 0, 1),
(10, 10, 12345, 2, 1800, 0, 0, 0, 1),
(11, 11, 12345, 1, 1810, 0, 1, 0, 1),
(12, 12, 12345, 2, 1800, 0, 1, 0, 1),
(13, 13, 12345, 1, 1810, 0, 1, 0, 1),
(14, 14, 12345, 2, 1810, 0, 1, 0, 1),
(15, 15, 12345, 2, 1750, 0, 0, 0, 1),
(16, 16, 12345, 2, 1800, 0, 1, 0, 1),
(17, 17, 12345, 2, 1810, 0, 1, 0, 1),
(18, 18, 12345, 2, 1800, 0, 1, 0, 1),
(19, 19, 12345, 2, 1805, 0, 1, 0, 1),
(20, 20, 12345, 2, 1800, 0, 1, 0, 1),
(21, 21, 12345, 2, 1800, 0, 1, 0, 1),
(22, 22, 12345, 2, 1780, 0, 0, 0, 1),
(23, 23, 12345, 2, 1795, 0, 0, 0, 1),
(24, 24, 12345, 2, 1700, 0, 0, 0, 1),
(25, 25, 12345, 2, 1600, 0, 0, 0, 1),
(26, 26, 12345, 2, 1800, 0, 0, 0, 1),
(27, 27, 12345, 2, 1808, 0, 1, 0, 1),
(28, 28, 12345, 2, 1800, 0, 0, 0, 1),
(29, 29, 12345, 2, 1800, 0, 1, 0, 1),
(30, 30, 12345, 2, 1800, 0, 0, 0, 1),
(31, 31, 12345, 2, 1750, 0, 0, 0, 1),
(32, 32, 12345, 2, 1810, 0, 0, 0, 1),
(33, 33, 12345, 2, 1800, 0, 0, 0, 1),
(34, 34, 12345, 2, 1800, 0, 0, 0, 1),
(35, 35, 12345, 2, 1800, 0, 0, 0, 1),
(36, 36, 12345, 2, 1800, 0, 0, 0, 1),
(37, 37, 12345, 2, 1800, 0, 0, 0, 1),
(38, 38, 12345, 2, 1800, 0, 0, 0, 1),
(39, 39, 12345, 2, 1800, 0, 0, 0, 1),
(40, 40, 12345, 2, 1800, 0, 0, 0, 1),
(41, 41, 12345, 2, 1600, 0, 0, 0, 1),
(42, 42, 12345, 2, 1600, 0, 0, 0, 1),
(43, 43, 12345, 2, 1600, 0, 0, 0, 1),
(44, 44, 12345, 2, 1600, 0, 0, 0, 1),
(45, 45, 12345, 2, 1600, 0, 0, 0, 1),
(46, 46, 12345, 2, 1600, 0, 0, 0, 1),
(47, 47, 12345, 2, 1600, 0, 0, 0, 1),
(48, 48, 12345, 2, 1600, 0, 0, 0, 1),
(49, 49, 12345, 2, 1600, 0, 0, 0, 1),
(50, 50, 12345, 2, 1600, 0, 0, 0, 1),
(60, 60, 12345, 1, 1810, 0, 1, 0, 1),
(61, 70, 12345, 1, 1810, 0, 1, 0, 1),
(62, 71, 12345, 1, 1810, 0, 1, 0, 1),
(63, 72, 12345, 1, 1810, 0, 1, 0, 1),
(64, 73, 12345, 1, 1810, 0, 1, 0, 1),
(65, 74, 12345, 1, 1810, 0, 1, 0, 1),
(66, 61, 12345, 2, 1800, 0, 1, 0, 1),
(67, 62, 12345, 2, 1800, 0, 1, 0, 1),
(68, 63, 12345, 2, 1800, 0, 1, 0, 1),
(69, 64, 12345, 2, 1800, 0, 1, 0, 1),
(70, 75, 12345, 2, 1800, 0, 0, 0, 1),
(71, 76, 12345, 2, 1800, 0, 0, 0, 1),
(72, 77, 12345, 2, 1800, 0, 0, 0, 1),
(73, 78, 12345, 2, 1800, 0, 0, 0, 1),
(74, 79, 12345, 2, 1800, 0, 0, 0, 1),
(75, 80, 12345, 2, 1800, 0, 0, 0, 1),
(76, 81, 12345, 2, 1800, 0, 0, 0, 1),
(77, 82, 12345, 2, 1800, 0, 0, 0, 1),
(78, 83, 12345, 2, 1800, 0, 0, 0, 1),
(79, 84, 12345, 2, 1800, 0, 0, 0, 1);

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
(1, 12, 2, 1),
(1, 50, 1, 1),
(2, 51, 1, 1),
(3, 52, 1, 1),
(4, 53, 1, 1),
(5, 54, 1, 1),
(6, 55, 1, 1),
(7, 56, 1, 1),
(8, 57, 1, 1),
(9, 58, 1, 1),
(10, 59, 1, 1),
(11, 11, 2, 1),
(11, 17, 1, 1),
(12, 15, 1, 1),
(12, 16, 2, 1),
(13, 17, 1, 1),
(14, 11, 1, 1),
(15, 10, 1, 1),
(16, 10, 1, 1),
(16, 12, 2, 1),
(17, 14, 1, 1),
(18, 13, 1, 1),
(19, 17, 1, 1),
(20, 15, 1, 1),
(21, 15, 1, 1),
(22, 14, 1, 1),
(23, 10, 1, 1),
(24, 12, 1, 1),
(25, 12, 1, 1),
(26, 16, 1, 1),
(27, 17, 1, 1),
(28, 10, 1, 1),
(29, 10, 1, 1),
(30, 13, 1, 1),
(31, 12, 1, 1),
(32, 17, 1, 1),
(33, 13, 1, 1),
(34, 11, 1, 1),
(35, 12, 1, 1),
(36, 16, 1, 1),
(37, 16, 1, 1),
(38, 14, 1, 1),
(39, 11, 1, 1),
(40, 16, 1, 1),
(41, 10, 1, 1),
(42, 10, 1, 1),
(43, 10, 1, 1),
(44, 10, 1, 1),
(45, 10, 1, 1),
(46, 10, 1, 1),
(47, 10, 1, 1),
(48, 10, 1, 1),
(49, 10, 1, 1),
(50, 10, 1, 1),
(60, 80, 1, 1),
(61, 81, 1, 1),
(62, 80, 1, 1),
(63, 83, 1, 1),
(64, 80, 1, 1);

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
(12345, 1, 1, 1810, NULL, '2025-12-08 20:27:33', NULL);

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
(1, 'Cinética', NULL),
(2, 'Energética', NULL),
(3, 'Destructiva', NULL),
(4, 'Casco', NULL),
(5, 'Guanteletes', NULL),
(6, 'Pecho', NULL),
(7, 'Piernas', NULL),
(8, 'Objeto de Clase', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subtipos_items`
--

CREATE TABLE `subtipos_items` (
  `id_subtipo` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `id_categoria_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Solar', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Solar.png'),
(2, 'Arco', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Arc.png'),
(3, 'Vacío', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Void.png'),
(4, 'Estasis', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Stasis.png'),
(5, 'Atadura', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Strand.png'),
(6, 'Cinético', '/common/destiny2_content/icons/DestinyDamageTypeDefinition_Kinetic.png');

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
(3, 'Deposito');

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
-- AUTO_INCREMENT for table `equipamientos_guardados`
--
ALTER TABLE `equipamientos_guardados`
  MODIFY `id_equipamiento` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `personajes_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
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
