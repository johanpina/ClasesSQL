-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-07-2023 a las 21:37:03
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `servipaquete`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro_de_distribucion`
--

CREATE TABLE `centro_de_distribucion` (
  `codigo` int(11) NOT NULL,
  `direccion` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `centro_de_distribucion`
--

INSERT INTO `centro_de_distribucion` (`codigo`, `direccion`) VALUES
(345, 'calle50'),
(432, 'calle20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `identificacion` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`identificacion`, `nombre`) VALUES
(876543, 'santi'),
(876543456, 'hernesto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `identificacion` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `salario` varchar(20) DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `centro_de_distribucion_codigo` int(11) DEFAULT NULL,
  `rol_empleado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega`
--

CREATE TABLE `entrega` (
  `paqueteNumeroSeguimiento` int(11) NOT NULL,
  `identificacion_empleado` int(11) NOT NULL,
  `FechaHoraEntrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `numeroSeguimiento` int(11) NOT NULL,
  `ciudadOrigen` varchar(30) DEFAULT NULL,
  `ciudadDestino` varchar(30) DEFAULT NULL,
  `centro_de_distribucion_codigo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `realiza`
--

CREATE TABLE `realiza` (
  `identificacion_cliente` int(11) NOT NULL,
  `solicitud_seguimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recibe`
--

CREATE TABLE `recibe` (
  `paqueteNumeroSeguimiento` int(11) NOT NULL,
  `identificacion_empleado` int(11) NOT NULL,
  `fechaHoraRecepcion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `empleado` varchar(59) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento_a`
--

CREATE TABLE `seguimiento_a` (
  `paqueteNumeroSeguimiento` int(11) NOT NULL,
  `centro_de_distribucion_codigo` int(11) NOT NULL,
  `fechaAsignada` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `numeroSeguimiento` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `peso` varchar(30) DEFAULT NULL,
  `costo` varchar(30) DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `clienteIdentificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabaja_en`
--

CREATE TABLE `trabaja_en` (
  `identificacion_empleado` int(11) NOT NULL,
  `centro_de_distribucion_codigo` int(11) NOT NULL,
  `FechaInicio` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centro_de_distribucion`
--
ALTER TABLE `centro_de_distribucion`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `centro_de_distribucion_codigo` (`centro_de_distribucion_codigo`),
  ADD KEY `rol_empleado` (`rol_empleado`);

--
-- Indices de la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`paqueteNumeroSeguimiento`,`identificacion_empleado`),
  ADD KEY `identificacion_empleado` (`identificacion_empleado`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`numeroSeguimiento`),
  ADD KEY `centro_de_distribucion_codigo` (`centro_de_distribucion_codigo`);

--
-- Indices de la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`identificacion_cliente`,`solicitud_seguimiento`),
  ADD KEY `solicitud_seguimiento` (`solicitud_seguimiento`);

--
-- Indices de la tabla `recibe`
--
ALTER TABLE `recibe`
  ADD PRIMARY KEY (`paqueteNumeroSeguimiento`,`identificacion_empleado`),
  ADD KEY `identificacion_empleado` (`identificacion_empleado`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`empleado`);

--
-- Indices de la tabla `seguimiento_a`
--
ALTER TABLE `seguimiento_a`
  ADD PRIMARY KEY (`paqueteNumeroSeguimiento`,`centro_de_distribucion_codigo`),
  ADD KEY `centro_de_distribucion_codigo` (`centro_de_distribucion_codigo`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`numeroSeguimiento`),
  ADD KEY `clienteIdentificacion` (`clienteIdentificacion`);

--
-- Indices de la tabla `trabaja_en`
--
ALTER TABLE `trabaja_en`
  ADD PRIMARY KEY (`identificacion_empleado`,`centro_de_distribucion_codigo`),
  ADD KEY `centro_de_distribucion_codigo` (`centro_de_distribucion_codigo`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_ibfk_1` FOREIGN KEY (`centro_de_distribucion_codigo`) REFERENCES `centro_de_distribucion` (`codigo`),
  ADD CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`rol_empleado`) REFERENCES `rol` (`empleado`);

--
-- Filtros para la tabla `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `entrega_ibfk_1` FOREIGN KEY (`paqueteNumeroSeguimiento`) REFERENCES `paquete` (`numeroSeguimiento`),
  ADD CONSTRAINT `entrega_ibfk_2` FOREIGN KEY (`identificacion_empleado`) REFERENCES `empleados` (`identificacion`);

--
-- Filtros para la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD CONSTRAINT `paquete_ibfk_1` FOREIGN KEY (`centro_de_distribucion_codigo`) REFERENCES `centro_de_distribucion` (`codigo`);

--
-- Filtros para la tabla `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `realiza_ibfk_1` FOREIGN KEY (`identificacion_cliente`) REFERENCES `cliente` (`identificacion`),
  ADD CONSTRAINT `realiza_ibfk_2` FOREIGN KEY (`solicitud_seguimiento`) REFERENCES `solicitud` (`numeroSeguimiento`);

--
-- Filtros para la tabla `recibe`
--
ALTER TABLE `recibe`
  ADD CONSTRAINT `recibe_ibfk_1` FOREIGN KEY (`paqueteNumeroSeguimiento`) REFERENCES `paquete` (`numeroSeguimiento`),
  ADD CONSTRAINT `recibe_ibfk_2` FOREIGN KEY (`identificacion_empleado`) REFERENCES `empleados` (`identificacion`);

--
-- Filtros para la tabla `seguimiento_a`
--
ALTER TABLE `seguimiento_a`
  ADD CONSTRAINT `seguimiento_a_ibfk_1` FOREIGN KEY (`paqueteNumeroSeguimiento`) REFERENCES `paquete` (`numeroSeguimiento`),
  ADD CONSTRAINT `seguimiento_a_ibfk_2` FOREIGN KEY (`centro_de_distribucion_codigo`) REFERENCES `centro_de_distribucion` (`codigo`);

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`clienteIdentificacion`) REFERENCES `cliente` (`identificacion`);

--
-- Filtros para la tabla `trabaja_en`
--
ALTER TABLE `trabaja_en`
  ADD CONSTRAINT `trabaja_en_ibfk_1` FOREIGN KEY (`identificacion_empleado`) REFERENCES `empleados` (`identificacion`),
  ADD CONSTRAINT `trabaja_en_ibfk_2` FOREIGN KEY (`centro_de_distribucion_codigo`) REFERENCES `centro_de_distribucion` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
