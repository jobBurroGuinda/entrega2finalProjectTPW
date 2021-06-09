-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2021 a las 10:07:18
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbelectivas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `programa` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`id`, `nombre`, `programa`) VALUES
(1, 'Panchito Mendez', 'Ing. en Aeronautica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `constancia`
--

CREATE TABLE `constancia` (
  `id` int(11) NOT NULL,
  `actividad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `horas` int(11) DEFAULT NULL,
  `archivo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `valida` tinyint(4) DEFAULT NULL,
  `observaciones_encargado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creditos` float DEFAULT NULL,
  `alumno_id` int(11) NOT NULL,
  `denominacion_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `constancia`
--

INSERT INTO `constancia` (`id`, `actividad`, `fecha_inicio`, `fecha_fin`, `horas`, `archivo`, `observaciones`, `valida`, `observaciones_encargado`, `creditos`, `alumno_id`, `denominacion_id`) VALUES
(5, 'Japonés', '2021-05-12', '2021-05-26', 50, 'archivo.doc', 'Niguno', 1, 'Niguno', 50, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `denominacion`
--

CREATE TABLE `denominacion` (
  `id` int(11) NOT NULL,
  `eje_tematico` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `modalidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `factor` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ejemplos` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `denominacion`
--

INSERT INTO `denominacion` (`id`, `eje_tematico`, `modalidad`, `descripcion`, `factor`, `ejemplos`) VALUES
(1, 'Programacion', 'Escolarizada', 'Programacion de dispositivos moviles', 'L', 'kmlmakxsa'),
(2, 'minos', 'la mia', 'la que le puse', 'esta', 'mirame<br><b>bien</b>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `electiva`
--

CREATE TABLE `electiva` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `creditos` float DEFAULT NULL,
  `creditos_acumulados` float DEFAULT NULL,
  `alumno_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `electiva`
--

INSERT INTO `electiva` (`id`, `nombre`, `creditos`, `creditos_acumulados`, `alumno_id`) VALUES
(1, 'Android', 200, 100, 1),
(3, 'Ajedrés', 300, 268, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `constancia`
--
ALTER TABLE `constancia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_constancia_alumno_idx` (`alumno_id`),
  ADD KEY `fk_constancia_denominacion1_idx` (`denominacion_id`);

--
-- Indices de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `electiva`
--
ALTER TABLE `electiva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_electiva_alumno1_idx` (`alumno_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumno`
--
ALTER TABLE `alumno`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `constancia`
--
ALTER TABLE `constancia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `denominacion`
--
ALTER TABLE `denominacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `electiva`
--
ALTER TABLE `electiva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `constancia`
--
ALTER TABLE `constancia`
  ADD CONSTRAINT `fk_constancia_alumno` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_constancia_denominacion1` FOREIGN KEY (`denominacion_id`) REFERENCES `denominacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `electiva`
--
ALTER TABLE `electiva`
  ADD CONSTRAINT `fk_electiva_alumno1` FOREIGN KEY (`alumno_id`) REFERENCES `alumno` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
