-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2019 a las 04:47:57
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `verduras_y_frutas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administracion_de_gastos`
--

CREATE TABLE `administracion_de_gastos` (
  `Id_administracion_de_gastos` int(11) NOT NULL COMMENT 'llave primaria de la tabla administracion de gastos',
  `Id_gasto_adicional` int(11) NOT NULL COMMENT 'llave foranea de la tabla administracion de gasto',
  `Id_caja_registradora` int(11) NOT NULL COMMENT 'llave foranea de la tabla caja registrarora',
  `cantidad` int(10) NOT NULL COMMENT 'cantidad de gastos (comidas, gasolina por viaje, gastos de reparacion vehiculares del dia)',
  `descripcion_gastos` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'descripcion de cada coda gastos comprados por dia',
  `costos` int(10) NOT NULL COMMENT 'costos de lo gastos realizados por dia'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `Id_Almacen` int(11) NOT NULL COMMENT 'llave primaria de la tabla almacen',
  `nombre_almacen` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del almacen',
  `ubicacion` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'lugar de almacen'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja_registradora`
--

CREATE TABLE `caja_registradora` (
  `Id_caja_registradora` int(11) NOT NULL,
  `Id_Almacen` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `fecha_apertura` date NOT NULL COMMENT 'fecha de inicio de caja abierta',
  `monto_caja` int(10) NOT NULL COMMENT 'cantidad de dinero que cuenta cada caja'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Id_Compra` int(11) NOT NULL COMMENT 'llave primaria de la tabla compras',
  `hora_de_compra` time(6) NOT NULL COMMENT 'hora de compra de producto',
  `fecha_de_compra` date NOT NULL,
  `Id_Proveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_almacen`
--

CREATE TABLE `detalle_almacen` (
  `Id_detalle_almacen` int(11) NOT NULL COMMENT 'llave primaria de la tabla detalle de almacen',
  `Id_Almacen` int(11) NOT NULL COMMENT 'llave foranea de la tabla almacen',
  `Id_Producto` int(11) NOT NULL COMMENT 'llave foranea de la tabla productos'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

CREATE TABLE `detalle_compras` (
  `Id_detalle_compra` int(11) NOT NULL,
  `Id_Compra` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `costo_por_unidad` int(10) NOT NULL COMMENT 'costo por unidades de compra a proveerdores',
  `fecha_de_compra_de_producto` date NOT NULL,
  `hora_de_compra` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_de_venta`
--

CREATE TABLE `detalle_de_venta` (
  `Id_detalle_venta` int(11) NOT NULL,
  `Id_Venta` int(11) NOT NULL,
  `Id_Producto` int(11) NOT NULL,
  `producto_vendido` int(10) NOT NULL,
  `cantidad` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_adicionales`
--

CREATE TABLE `gastos_adicionales` (
  `Id_gasto_adicional` int(11) NOT NULL COMMENT 'llave primaria de la tabla gastos adicionales',
  `fecha_de_realizacion` date NOT NULL COMMENT 'fecha en la que fue realizada la compra de comidas, gasolinas, productos de limpieza, reparaciones vehiculares'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `Id_producto` int(11) NOT NULL,
  `nombre_producto` varchar(40) NOT NULL,
  `precio_de_adquisicion` int(11) NOT NULL,
  `precio_a_vender` int(11) NOT NULL,
  `kilos_adquiridos` int(11) NOT NULL,
  `habilitar_deshabilitar_producto` tinyint(1) NOT NULL,
  `Id_Detalle_Almacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Proveedor` int(11) NOT NULL COMMENT 'llave primaria de la tabla proveedor',
  `nombre_proveedor` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del proveedor',
  `ciudad` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'ciudad o lugar donde se compro los productos',
  `telefono` varchar(10) NOT NULL COMMENT 'telefono del proveedor',
  `RFC` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'RFC del proveedor',
  `correo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'correo electronico del proveedor'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `Id_Usuario` int(11) NOT NULL COMMENT 'identificador del usuario',
  `nombre` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'nombre del usuario',
  `apellido` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'apellido del usuario',
  `telefono` varchar(15) NOT NULL COMMENT 'telefono del usuario',
  `password` varchar(20) DEFAULT NULL COMMENT 'password unico del usuario',
  `rol` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL COMMENT 'tipo de puesto del usuario',
  `pago_semanal` int(10) NOT NULL COMMENT 'pago semanal del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`Id_Usuario`, `nombre`, `apellido`, `telefono`, `password`, `rol`, `pago_semanal`) VALUES
(1, 'Alan', 'Walker', 'sin numero', 'alan1', 'caja', 1200),
(2, 'Arturo', 'Rodriguez', '466-102-2021', 'art132', 'cajero', 12000),
(3, 'jose', 'Rodriguez', 'sin numero', 'jose132', 'cajero', 2000),
(4, 'pedrito', 'Gonzalez', 'sin numero', 'pedro', 'caje', 0),
(5, 'pedrito', 'Gonzalez', 'sin numero', 'pedro', 'cajero', 500),
(6, 'asd', 'asd', '23456789', 'asd', 'cajero', 1234567),
(7, 'asd2', 'asd', '23456', '', 'cargador', 2147483647),
(8, 'luigui', 'loquillo', 'diez digitos', 'loquillo', 'cargador', 1234567890);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `Id_Venta` int(11) NOT NULL,
  `total_de_la_venta` int(10) NOT NULL,
  `fecha_de_venta` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administracion_de_gastos`
--
ALTER TABLE `administracion_de_gastos`
  ADD PRIMARY KEY (`Id_administracion_de_gastos`),
  ADD KEY `Id_gastos_adicional` (`Id_gasto_adicional`),
  ADD KEY `Id_gastos_adicional_2` (`Id_gasto_adicional`),
  ADD KEY `Id_gastos_adicional_3` (`Id_gasto_adicional`),
  ADD KEY `Id_gastos_adicional_4` (`Id_gasto_adicional`),
  ADD KEY `Id_caja_registradora` (`Id_caja_registradora`);

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`Id_Almacen`);

--
-- Indices de la tabla `caja_registradora`
--
ALTER TABLE `caja_registradora`
  ADD PRIMARY KEY (`Id_caja_registradora`),
  ADD KEY `Id_Usuario` (`Id_Usuario`),
  ADD KEY `Id_Almacen` (`Id_Almacen`),
  ADD KEY `Id_Almacen_2` (`Id_Almacen`),
  ADD KEY `Id_Almacen_3` (`Id_Almacen`),
  ADD KEY `Id_Almacen_4` (`Id_Almacen`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Id_Compra`),
  ADD KEY `Id_Prodructo` (`Id_Proveedor`);

--
-- Indices de la tabla `detalle_almacen`
--
ALTER TABLE `detalle_almacen`
  ADD PRIMARY KEY (`Id_detalle_almacen`),
  ADD KEY `Id_Almacen` (`Id_Almacen`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`Id_detalle_compra`),
  ADD KEY `Id_Compra` (`Id_Compra`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `detalle_de_venta`
--
ALTER TABLE `detalle_de_venta`
  ADD PRIMARY KEY (`Id_detalle_venta`),
  ADD KEY `Id_Venta` (`Id_Venta`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `gastos_adicionales`
--
ALTER TABLE `gastos_adicionales`
  ADD PRIMARY KEY (`Id_gasto_adicional`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `Id_Detalle_Almacen` (`Id_Detalle_Almacen`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id_Usuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`Id_Venta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administracion_de_gastos`
--
ALTER TABLE `administracion_de_gastos`
  MODIFY `Id_administracion_de_gastos` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla administracion de gastos';

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Id_Almacen` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla almacen';

--
-- AUTO_INCREMENT de la tabla `caja_registradora`
--
ALTER TABLE `caja_registradora`
  MODIFY `Id_caja_registradora` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `Id_Compra` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla compras';

--
-- AUTO_INCREMENT de la tabla `detalle_almacen`
--
ALTER TABLE `detalle_almacen`
  MODIFY `Id_detalle_almacen` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla detalle de almacen';

--
-- AUTO_INCREMENT de la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  MODIFY `Id_detalle_compra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_de_venta`
--
ALTER TABLE `detalle_de_venta`
  MODIFY `Id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gastos_adicionales`
--
ALTER TABLE `gastos_adicionales`
  MODIFY `Id_gasto_adicional` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla gastos adicionales';

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `Id_producto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria de la tabla proveedor';

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del usuario', AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `Id_Venta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administracion_de_gastos`
--
ALTER TABLE `administracion_de_gastos`
  ADD CONSTRAINT `administracion_de_gastos_ibfk_1` FOREIGN KEY (`Id_caja_registradora`) REFERENCES `caja_registradora` (`Id_caja_registradora`),
  ADD CONSTRAINT `administracion_de_gastos_ibfk_2` FOREIGN KEY (`Id_gasto_adicional`) REFERENCES `gastos_adicionales` (`Id_gasto_adicional`);

--
-- Filtros para la tabla `caja_registradora`
--
ALTER TABLE `caja_registradora`
  ADD CONSTRAINT `caja_registradora_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`Id_Usuario`),
  ADD CONSTRAINT `caja_registradora_ibfk_2` FOREIGN KEY (`Id_Almacen`) REFERENCES `almacen` (`Id_Almacen`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Id_Proveedor`) REFERENCES `proveedor` (`Id_Proveedor`);

--
-- Filtros para la tabla `detalle_almacen`
--
ALTER TABLE `detalle_almacen`
  ADD CONSTRAINT `detalle_almacen_ibfk_1` FOREIGN KEY (`Id_Almacen`) REFERENCES `almacen` (`Id_Almacen`),
  ADD CONSTRAINT `detalle_almacen_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_producto`);

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_producto`),
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`Id_Compra`) REFERENCES `compras` (`Id_Compra`);

--
-- Filtros para la tabla `detalle_de_venta`
--
ALTER TABLE `detalle_de_venta`
  ADD CONSTRAINT `detalle_de_venta_ibfk_1` FOREIGN KEY (`Id_Producto`) REFERENCES `productos` (`Id_producto`),
  ADD CONSTRAINT `detalle_de_venta_ibfk_2` FOREIGN KEY (`Id_Venta`) REFERENCES `ventas` (`Id_Venta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
