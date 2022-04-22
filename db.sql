-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.4-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para quimicexpress
CREATE DATABASE IF NOT EXISTS `quimicexpress` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quimicexpress`;

-- Volcando estructura para tabla quimicexpress.almacen
CREATE TABLE IF NOT EXISTS `almacen` (
  `Id_Almacen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(200) DEFAULT NULL,
  `IdMarca` int(10) unsigned NOT NULL DEFAULT 1,
  `IdCategoria` int(10) unsigned NOT NULL DEFAULT 1,
  `CantidadLitro` int(20) unsigned NOT NULL DEFAULT 0,
  `CantidadKilos` int(20) unsigned NOT NULL DEFAULT 0,
  `PrecioCosto` decimal(10,2) DEFAULT 0.00,
  `PrecioReventa` decimal(10,2) DEFAULT 0.00,
  `PrecioLitro` decimal(10,2) DEFAULT 0.00,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Almacen`) USING BTREE,
  UNIQUE KEY `Id_AlmacenUnique` (`Id_Almacen`),
  KEY `Id_AlmacenKey` (`Id_Almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.almacen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.apertura
CREATE TABLE IF NOT EXISTS `apertura` (
  `Id_Apertura` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CodigoUsuario` int(10) unsigned NOT NULL,
  `NombreUsuario` varchar(200) DEFAULT NULL,
  `Guarani` decimal(10,2) DEFAULT 0.00,
  `Dolar` decimal(10,2) DEFAULT 0.00,
  `Realb` decimal(10,2) DEFAULT 0.00,
  `Peso` decimal(10,2) DEFAULT 0.00,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Apertura`),
  UNIQUE KEY `Id_AperturaUnique` (`Id_Apertura`),
  KEY `Id_AperturaKey` (`Id_Apertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.apertura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `apertura` DISABLE KEYS */;
/*!40000 ALTER TABLE `apertura` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `Id_Categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(200) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Categoria`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.categoria: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.cierrecaja
CREATE TABLE IF NOT EXISTS `cierrecaja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `montoGs` decimal(10,2) DEFAULT 0.00,
  `montoUs` decimal(10,2) DEFAULT 0.00,
  `montoRs` decimal(10,2) DEFAULT 0.00,
  `montoPs` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.cierrecaja: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cierrecaja` DISABLE KEYS */;
/*!40000 ALTER TABLE `cierrecaja` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id_Cliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) DEFAULT NULL,
  `Dirección` varchar(200) DEFAULT NULL,
  `Contacto` varchar(200) DEFAULT NULL,
  `Ruc` varchar(200) DEFAULT NULL,
  `CorreoElectronico` varchar(200) DEFAULT NULL,
  `FechaDeNacimiento` date DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.cobros
CREATE TABLE IF NOT EXISTS `cobros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcredito` int(11) DEFAULT NULL,
  `idventa` int(11) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT 0.00,
  `descuento` decimal(10,2) DEFAULT 0.00,
  `totalneto` decimal(10,2) DEFAULT 0.00,
  `fecha` date DEFAULT NULL,
  `Cgs` decimal(10,2) DEFAULT 0.00,
  `Crs` decimal(10,2) DEFAULT 0.00,
  `Cus` decimal(10,2) DEFAULT 0.00,
  `Cps` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.cobros: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cobros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cobros` ENABLE KEYS */;

-- Volcando estructura para vista quimicexpress.consultaalmacen
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultaalmacen` (
	`Codigo` INT(10) UNSIGNED NOT NULL,
	`Descripción` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Marca` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Categoria` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Litros` INT(20) UNSIGNED NOT NULL,
	`Kilos` INT(20) UNSIGNED NOT NULL,
	`PrecioCosto` DECIMAL(10,2) NULL,
	`PrecioReventa` DECIMAL(10,2) NULL,
	`PrecioPorLitro` DECIMAL(10,2) NULL,
	`Fecha` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultacierrecaja
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultacierrecaja` (
	`id` INT(11) NOT NULL,
	`fecha` DATE NULL,
	`MontoGuaranies` DECIMAL(10,2) NULL,
	`MontoDolares` DECIMAL(10,2) NULL,
	`MontoReales` DECIMAL(10,2) NULL,
	`MontoPesos` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultacliente
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultacliente` (
	`Id` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultacobros
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultacobros` (
	`Guaranies` DECIMAL(32,2) NULL,
	`Reales` DECIMAL(32,2) NULL,
	`Dolar` DECIMAL(32,2) NULL,
	`Pesos` DECIMAL(32,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultadescuento
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultadescuento` (
	`id` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(32,0) NULL,
	`totalneto` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`estado` INT(10) UNSIGNED NULL,
	`GS` DECIMAL(10,2) NULL,
	`RS` DECIMAL(10,2) NULL,
	`US` DECIMAL(10,2) NULL,
	`PS` DECIMAL(10,2) NULL,
	`comprobante` VARCHAR(45) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultadescuentos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultadescuentos` (
	`id` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(32,0) NULL,
	`totalneto` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`estado` INT(10) UNSIGNED NULL,
	`GS` DECIMAL(10,2) NULL,
	`RS` DECIMAL(10,2) NULL,
	`US` DECIMAL(10,2) NULL,
	`PS` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultadeudores
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultadeudores` (
	`ID` INT(10) UNSIGNED NOT NULL,
	`Comprobante` INT(10) UNSIGNED NOT NULL,
	`IDVenta` INT(10) UNSIGNED NULL,
	`Idcliente` INT(10) UNSIGNED NOT NULL,
	`Nombres` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Fecha` DATETIME NOT NULL,
	`SubTotal` DECIMAL(10,2) NOT NULL,
	`Iva` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`Descuento` DECIMAL(10,2) NOT NULL,
	`TotalNeto` DECIMAL(10,0) NOT NULL,
	`TotalDeuda` DECIMAL(10,0) NOT NULL,
	`mensualidad` DECIMAL(10,0) NOT NULL,
	`CantidadCuota` INT(10) UNSIGNED NOT NULL,
	`Estado` INT(10) UNSIGNED NOT NULL,
	`CuotasPagadas` INT(10) NULL,
	`GS` DECIMAL(10,2) NULL,
	`RS` DECIMAL(10,2) NULL,
	`US` DECIMAL(10,2) NULL,
	`PS` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultadeudoresinforme
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultadeudoresinforme` (
	`comprobante` INT(10) UNSIGNED NOT NULL,
	`id` INT(10) UNSIGNED NOT NULL,
	`idcliente` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NOT NULL,
	`subtotal` DECIMAL(10,2) NOT NULL,
	`iva` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`totalneto` DECIMAL(10,0) NOT NULL,
	`totaldeuda` DECIMAL(10,0) NOT NULL,
	`mensualidad` DECIMAL(10,0) NOT NULL,
	`cantidadcuota` INT(10) UNSIGNED NOT NULL,
	`CuotasPagadas` INT(10) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultagastos
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultagastos` (
	`Guarani` DECIMAL(32,2) NULL,
	`Dolar` DECIMAL(32,2) NULL,
	`Reales` DECIMAL(32,2) NULL,
	`Peso` DECIMAL(32,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultagastosinforme
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultagastosinforme` (
	`id_Gasto` INT(11) NOT NULL,
	`fecha` DATE NULL,
	`descripción` VARCHAR(50) NULL COLLATE 'utf8_general_ci',
	`guarani` DECIMAL(10,2) NULL,
	`dolar` DECIMAL(10,2) NULL,
	`realb` DECIMAL(10,2) NULL,
	`peso` DECIMAL(10,2) NULL,
	`estado` INT(11) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultahistorial
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultahistorial` (
	`comprobante` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`idproducto` INT(10) UNSIGNED NULL,
	`descripcion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`precio` DECIMAL(10,0) NULL,
	`descuento` DECIMAL(10,0) NULL,
	`cantidad` DECIMAL(10,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultainventario
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultainventario` (
	`Codigo` INT(10) UNSIGNED NOT NULL,
	`CodigoBarra` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Descripción` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Marca` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Categoria` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Proveedor` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`PrecioCosto` DECIMAL(10,2) NULL,
	`PrecioMinimo` DECIMAL(10,2) NULL,
	`PrecioNormal` DECIMAL(10,2) NULL,
	`Stock` INT(20) UNSIGNED NOT NULL,
	`Fecha` DATE NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultanotacobrada
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultanotacobrada` (
	`comprobante` INT(10) UNSIGNED NOT NULL,
	`nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NOT NULL,
	`subtotal` DECIMAL(10,2) NOT NULL,
	`iva` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,2) NOT NULL,
	`direccion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`telefono` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`cantidadcuota` INT(10) UNSIGNED NOT NULL,
	`CuotasPagadas` INT(10) NULL,
	`totaldeuda` DECIMAL(10,0) NOT NULL,
	`Cgs` DECIMAL(10,2) NULL,
	`Crs` DECIMAL(10,2) NULL,
	`Cus` DECIMAL(10,2) NULL,
	`Cps` DECIMAL(10,2) NULL,
	`mensualidad` DECIMAL(10,0) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultaproveedor
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultaproveedor` (
	`Id_Proveedor` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultausuario
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultausuario` (
	`Id_Usuario` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultaventas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `consultaventas` (
	`id` INT(10) UNSIGNED NOT NULL,
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`RUC` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`SubTotal` DECIMAL(10,0) NULL,
	`Descuento` DECIMAL(10,0) NULL,
	`TotalNeto` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Estado` INT(10) UNSIGNED NULL,
	`GS` DECIMAL(10,2) NULL,
	`RS` DECIMAL(10,2) NULL,
	`US` DECIMAL(10,2) NULL,
	`PS` DECIMAL(10,2) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla quimicexpress.cotizacion
CREATE TABLE IF NOT EXISTS `cotizacion` (
  `Id_Cotización` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Guarani` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Dolar` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Realb` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Peso` decimal(10,2) NOT NULL DEFAULT 0.00,
  `Usuario` varchar(200) NOT NULL,
  `Estado` int(10) unsigned NOT NULL,
  `Fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`Id_Cotización`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.cotizacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.creditos
CREATE TABLE IF NOT EXISTS `creditos` (
  `id` int(10) unsigned NOT NULL,
  `idventa` int(10) unsigned NOT NULL,
  `idvendedor` int(10) unsigned NOT NULL,
  `idcliente` int(10) unsigned NOT NULL,
  `saldo` decimal(10,0) DEFAULT NULL,
  `cantidadCuotas` int(10) unsigned NOT NULL,
  `interes` varchar(45) DEFAULT NULL,
  `fechaVencimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.creditos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `creditos` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditos` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.deudores
CREATE TABLE IF NOT EXISTS `deudores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comprobante` int(10) unsigned NOT NULL,
  `idcliente` int(10) unsigned NOT NULL,
  `fecha` datetime NOT NULL,
  `idVenta` int(10) unsigned NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `iva` varchar(200) NOT NULL DEFAULT '',
  `descuento` decimal(10,2) NOT NULL,
  `totalneto` decimal(10,0) NOT NULL DEFAULT 0,
  `totaldeuda` decimal(10,0) NOT NULL DEFAULT 0,
  `mensualidad` decimal(10,0) NOT NULL DEFAULT 0,
  `cantidadcuota` int(10) unsigned NOT NULL,
  `idusuario` int(10) unsigned NOT NULL,
  `estado` int(10) unsigned NOT NULL,
  `CuotasPagadas` int(10) DEFAULT 0,
  `ruc` varchar(200) DEFAULT NULL,
  `Cgs` decimal(10,2) DEFAULT 0.00,
  `Crs` decimal(10,2) DEFAULT 0.00,
  `Cus` decimal(10,2) DEFAULT 0.00,
  `Cps` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.deudores: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `deudores` DISABLE KEYS */;
/*!40000 ALTER TABLE `deudores` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.gastos
CREATE TABLE IF NOT EXISTS `gastos` (
  `id_Gasto` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `descripción` varchar(50) DEFAULT NULL,
  `guarani` decimal(10,2) DEFAULT 0.00,
  `dolar` decimal(10,2) DEFAULT 0.00,
  `realb` decimal(10,2) DEFAULT 0.00,
  `peso` decimal(10,2) DEFAULT 0.00,
  `estado` int(11) DEFAULT 0,
  PRIMARY KEY (`id_Gasto`) USING BTREE,
  UNIQUE KEY `id` (`id_Gasto`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.gastos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;

-- Volcando estructura para vista quimicexpress.historial
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `historial` (
	`comprobante` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`Nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`Ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`idproducto` INT(10) UNSIGNED NULL,
	`descripcion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`precio` DECIMAL(10,0) NULL,
	`descuento` DECIMAL(10,0) NULL,
	`cantidad` DECIMAL(10,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla quimicexpress.inventario
CREATE TABLE IF NOT EXISTS `inventario` (
  `Id_Inventario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idCodigoBarra` varchar(200) DEFAULT NULL,
  `Descripción` varchar(200) DEFAULT NULL,
  `idMarca` int(10) unsigned NOT NULL DEFAULT 1,
  `idcategoria` int(10) unsigned NOT NULL DEFAULT 1,
  `idproveedor` int(10) unsigned NOT NULL DEFAULT 1,
  `PrecioCosto` decimal(10,2) DEFAULT 0.00,
  `PrecioMinimo` decimal(10,2) DEFAULT 0.00,
  `PrecioNormal` decimal(10,2) DEFAULT 0.00,
  `Stock` int(20) unsigned NOT NULL DEFAULT 0,
  `Foto` mediumblob DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Inventario`) USING BTREE,
  UNIQUE KEY `idUnique` (`Id_Inventario`) USING BTREE,
  UNIQUE KEY `idCodigoBarra` (`idCodigoBarra`),
  KEY `idKey` (`Id_Inventario`) USING BTREE,
  KEY `descripcion` (`Descripción`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.inventario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.marca
CREATE TABLE IF NOT EXISTS `marca` (
  `id_marca` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descripción` varchar(200) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.marca: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarAlmacen
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarAlmacen`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Almacen,
			Descripción
		FROM
			almacen
		ORDER BY
			Id_Almacen;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Almacen,
			Descripción,
			IdMarca,
			IdCategoria,
			CantidadLitro,
			CantidadKilos,
			PrecioCosto,
			PrecioReventa,
			PrecioLitro,
			Fecha
		FROM 
			almacen
		WHERE 
			Id_Almacen=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarCategoria
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarCategoria`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Categoria,
			Descripción
		FROM
			categoria
		ORDER BY
			Id_Categoria;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Categoria,
			Descripción,
			Fecha
		FROM 
			categoria
		WHERE 
			Id_Categoria=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarCliente
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarCliente`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Cliente,
			Nombre
		FROM
			cliente
		ORDER BY
			Id_Cliente;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Cliente,
			Nombre,
			Dirección,
			Contacto,
			Ruc,
			CorreoElectronico,
			FechaDeNacimiento,
			Fecha
		FROM 
			cliente
		WHERE 
			Id_Cliente=ParId;
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarGasto
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarGasto`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Gasto,
			Descripción,
			guarani,
			dolar,
			realb,
			peso
		FROM
			gastos
		ORDER BY
			Id_Gasto;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Gasto,
			Descripción,
			guarani,
			dolar,
			realb,
			peso,
			Estado,
			Fecha
		FROM 
			gastos
		WHERE 
			Id_Gasto=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarInventario
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarInventario`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Inventario,
			idCodigoBarra,
			Descripción
		FROM
			inventario
		ORDER BY
			Id_Inventario;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Inventario,
			idCodigoBarra,
			Descripción,
			idMarca,
			idcategoria,
			idproveedor,
			PrecioCosto,
			PrecioMinimo,
			PrecioNormal,
			Stock,
			Foto,
			Fecha
		FROM 
			inventario
		WHERE 
			Id_Inventario=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarMarca
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarMarca`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Marca,
			Descripción
		FROM
			marca
		ORDER BY
			Id_Marca;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Marca,
			Descripción,
			Fecha
		FROM 
			marca
		WHERE 
			Id_Marca=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarProveedor
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarProveedor`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN
	IF ParOpcion=1 THEN
		SELECT 
			Id_Proveedor,
			Nombre
		FROM
			proveedor
		ORDER BY
			Id_Proveedor;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Proveedor,
			Nombre,
			Dirección,
			Contacto,
			Ruc,
			Fecha
		FROM 
			proveedor
		WHERE 
			Id_Proveedor=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_ConsultarUsuario
DELIMITER //
CREATE PROCEDURE `Pa_ConsultarUsuario`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		SELECT 
			Id_Usuario,
			Nombre
		FROM
			usuario
		ORDER BY
			Id_Usuario;
	ELSEIF ParOpcion=2 THEN
		SELECT 
			Id_Usuario,
			Nombre,
			NombreUsuario,
			PasswordUsuario,
			Cargo,
			CorreoElectronico,
			Contacto,
			Estado,
			Nivel,
			Fecha
		FROM 
			usuario
		WHERE 
			Id_Usuario=ParId;
	END IF;
	
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarAlmacen
DELIMITER //
CREATE PROCEDURE `Pa_EditarAlmacen`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParIdMarca` INT,
	IN `ParIdCategoria` INT,
	IN `ParCantidadLitro` INT,
	IN `ParCantidadKilo` INT,
	IN `ParPrecioCosto` DECIMAL(10,2),
	IN `ParPrecioReventa` DECIMAL(10,2),
	IN `ParPrecioLitro` DECIMAL(10,2),
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			almacen
		SET
			Descripción=ParDescripción,
			IdMarca=ParIdMarca,
			IdCategoria=ParIdCategoria,
			CantidadLitro=ParCantidadLitro,
			CantidadKilos=ParCantidadKilo,
			PrecioCosto=ParPrecioCosto,
			PrecioReventa=ParPrecioReventa,
			PrecioLitro=ParPrecioLitro,
			Fecha=ParFecha
		WHERE
			Id_Almacen=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarCategoria
DELIMITER //
CREATE PROCEDURE `Pa_EditarCategoria`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			categoria
		SET
			Descripción=ParDescripción,
			Fecha=ParFecha
		WHERE
			Id_Categoria=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarCliente
DELIMITER //
CREATE PROCEDURE `Pa_EditarCliente`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParDirección` VARCHAR(200),
	IN `ParContacto` VARCHAR(200),
	IN `ParRuc` VARCHAR(200),
	IN `ParCorreoElectronico` VARCHAR(200),
	IN `ParFechaDeNacimiento` DATE,
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			cliente
		SET
			Nombre=ParNombre,
			Dirección=ParDirección,
			Contacto=ParContacto,
			Ruc=ParRuc,
			CorreoElectronico=ParCorreoElectronico,
			FechaDeNacimiento=ParFechaDeNacimiento,
			Fecha=ParFecha
		WHERE
			Id_Cliente=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarGasto
DELIMITER //
CREATE PROCEDURE `Pa_EditarGasto`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParGuarani` DECIMAL(10,2),
	IN `ParDolar` DECIMAL(10,2),
	IN `ParReal` DECIMAL(10,2),
	IN `ParPeso` DECIMAL(10,2),
	IN `ParEstado` INT,
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			gastos
		SET
			Descripción=ParDescripción,
			guarani=parGuarani,
			dolar=ParDolar,
			realb=ParReal,
			peso=ParPeso,
			Estado=ParEstado,
			Fecha=ParFecha
		WHERE
			Id_Gasto=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarInventario
DELIMITER //
CREATE PROCEDURE `Pa_EditarInventario`(
	IN `ParOpcion` INT,
	IN `ParidCodigoBarra` VARCHAR(200),
	IN `ParDescripción` VARCHAR(200),
	IN `ParidMarca` INT,
	IN `Paridcategoria` INT,
	IN `Paridproveedor` INT,
	IN `ParPrecioCosto` DECIMAL(10,2),
	IN `ParPrecioMinimo` DECIMAL(10,2),
	IN `ParPrecioNormal` DECIMAL(10,2),
	IN `ParStock` INT,
	IN `ParFoto` MEDIUMBLOB,
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			inventario
		SET
			idCodigoBarra=ParidCodigoBarra,
			Descripción=ParDescripción,
			idMarca=ParidMarca,
			idcategoria=Paridcategoria,
			idproveedor=Paridproveedor,
			PrecioCosto=ParPrecioCosto,
			PrecioMinimo=ParPrecioMinimo,
			PrecioNormal=ParPrecioNormal,
			Stock=ParStock,
			Foto=ParFoto,
			Fecha=ParFecha
		WHERE
			Id_Inventario=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarMarca
DELIMITER //
CREATE PROCEDURE `Pa_EditarMarca`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			marca
		SET
			Descripción=ParDescripción,
			Fecha=ParFecha
		WHERE
			Id_Marca=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarProveedor
DELIMITER //
CREATE PROCEDURE `Pa_EditarProveedor`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParDirección` VARCHAR(200),
	IN `ParContacto` VARCHAR(50),
	IN `ParRuc` VARCHAR(200),
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			proveedor
		SET
			Nombre=ParNombre,
			Dirección=ParDirección,
			Contacto=ParContacto,
			Ruc=ParRuc,
			Fecha=ParFecha
		WHERE
			Id_Proveedor=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EditarUsuario
DELIMITER //
CREATE PROCEDURE `Pa_EditarUsuario`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParNombreUsuario` VARCHAR(200),
	IN `ParPasswordUsuario` VARCHAR(200),
	IN `ParCargo` VARCHAR(200),
	IN `ParCorreoElectronico` VARCHAR(200),
	IN `ParContacto` VARCHAR(200),
	IN `ParEstado` INT,
	IN `ParNivel` INT,
	IN `ParFecha` DATE,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		UPDATE
			usuario
		SET
			Nombre=ParNombre,
			NombreUsuario=ParNombreUsuario,
			PasswordUsuario=ParPasswordUsuario,
			Cargo=ParCargo,
			CorreoElectronico=ParCorreoElectronico,
			Contacto=ParContacto,
			Estado=ParEstado,
			Nivel=ParNivel,
			Fecha=ParFecha
		WHERE
			Id_Usuario=ParId;
	END IF;

END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarAlmacen
DELIMITER //
CREATE PROCEDURE `Pa_EliminarAlmacen`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			almacen
		WHERE 
			Id_Almacen=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarCategoria
DELIMITER //
CREATE PROCEDURE `Pa_EliminarCategoria`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			categoria
		WHERE 
			Id_Categoria=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarCliente
DELIMITER //
CREATE PROCEDURE `Pa_EliminarCliente`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			cliente
		WHERE 
			Id_Cliente=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarGasto
DELIMITER //
CREATE PROCEDURE `Pa_EliminarGasto`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			gastos
		WHERE 
			Id_Gasto=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarInventario
DELIMITER //
CREATE PROCEDURE `Pa_EliminarInventario`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			inventario
		WHERE 
			Id_Inventario=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarMarca
DELIMITER //
CREATE PROCEDURE `Pa_EliminarMarca`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			marca
		WHERE 
			Id_Marca=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarProveedor
DELIMITER //
CREATE PROCEDURE `Pa_EliminarProveedor`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			proveedor
		WHERE 
			Id_Proveedor=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_EliminarUsuario
DELIMITER //
CREATE PROCEDURE `Pa_EliminarUsuario`(
	IN `ParOpcion` INT,
	IN `ParId` INT
)
BEGIN

	IF ParOpcion=1 THEN
		DELETE FROM
			usuario
		WHERE 
			Id_Usuario=ParId;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarAlmacen
DELIMITER //
CREATE PROCEDURE `Pa_InsertarAlmacen`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParIdMarca` INT,
	IN `ParIdCategoria` INT,
	IN `ParCantidadLitro` INT,
	IN `ParCantidadKilo` INT,
	IN `ParPrecioCosto` DECIMAL(10,2),
	IN `ParPrecioReventa` DECIMAL(10,2),
	IN `ParPrecioLitro` DECIMAL(10,2),
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			almacen
		(
			Descripción,
			IdMarca,
			IdCategoria,
			CantidadLitro,
			CantidadKilos,
			PrecioCosto,
			PrecioReventa,
			PrecioLitro,
			Fecha
		)
		VALUES
		(
			ParDescripción,
			ParIdMarca,
			ParIdCategoria,
			ParCantidadLitro,
			ParCantidadKilo,
			ParPrecioCosto,
			ParPrecioReventa,
			ParPrecioLitro,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarCategoria
DELIMITER //
CREATE PROCEDURE `Pa_InsertarCategoria`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			categoria
		(
			Descripción,
			Fecha
		)
		VALUES
		(
			ParDescripción,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarCliente
DELIMITER //
CREATE PROCEDURE `Pa_InsertarCliente`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParDirección` VARCHAR(200),
	IN `ParContacto` VARCHAR(200),
	IN `ParRuc` VARCHAR(200),
	IN `ParCorreoElectronico` VARCHAR(200),
	IN `ParFechaDeNacimiento` DATE,
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			cliente
		(
			Nombre,
			Dirección,
			Contacto,
			Ruc,
			CorreoElectronico,
			FechaDeNacimiento,
			Fecha
		)
		VALUES
		(
			ParNombre,
			ParDirección,
			ParContacto,
			ParRuc,
			ParCorreoElectronico,
			ParFechaDeNacimiento,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarGasto
DELIMITER //
CREATE PROCEDURE `Pa_InsertarGasto`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParGuarani` INT,
	IN `ParDolar` INT,
	IN `ParReal` INT,
	IN `ParPeso` INT,
	IN `ParEstado` INT,
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			gastos
		(
			Descripción,
			guarani,
			dolar,
			realb,
			peso,
			Estado,
			Fecha
		)
		VALUES
		(
			ParDescripción,
			ParGuarani,
			ParDolar,
			ParReal,
			ParPeso,
			ParEstado,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarInventario
DELIMITER //
CREATE PROCEDURE `Pa_InsertarInventario`(
	IN `ParOpcion` INT,
	IN `ParidCodigoBarra` VARCHAR(200),
	IN `ParDescripción` VARCHAR(200),
	IN `ParidMarca` INT,
	IN `Paridcategoria` INT,
	IN `Paridproveedor` INT,
	IN `ParPrecioMinimo` DECIMAL(10,2),
	IN `ParPrecioNormal` DECIMAL(10,2),
	IN `ParStock` INT,
	IN `ParFoto` MEDIUMBLOB,
	IN `ParFecha` DATE,
	IN `ParPrecioCosto` DECIMAL(10,2)
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			inventario
		(
			idCodigoBarra,
			Descripción,
			idMarca,
			idcategoria,
			idproveedor,
			PrecioCosto,
			PrecioMinimo,
			PrecioNormal,
			Stock,
			Foto,
			Fecha
		)
		VALUES
		(
			ParidCodigoBarra,
			ParDescripción,
			ParidMarca,
			Paridcategoria,
			Paridproveedor,
			ParPrecioCosto,
			ParPrecioMinimo,
			ParPrecioNormal,
			ParStock,
			ParFoto,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarMarca
DELIMITER //
CREATE PROCEDURE `Pa_InsertarMarca`(
	IN `ParOpcion` INT,
	IN `ParDescripción` VARCHAR(200),
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			marca
		(
			Descripción,
			Fecha
		)
		VALUES
		(
			ParDescripción,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarProveedor
DELIMITER //
CREATE PROCEDURE `Pa_InsertarProveedor`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParDirección` VARCHAR(200),
	IN `ParContacto` VARCHAR(200),
	IN `ParRuc` VARCHAR(200),
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			proveedor
		(
			Nombre,
			Dirección,
			Contacto,
			Ruc,
			Fecha
		)
		VALUES
		(
			ParNombre,
			ParDirección,
			ParContacto,
			ParRuc,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento quimicexpress.Pa_InsertarUsuario
DELIMITER //
CREATE PROCEDURE `Pa_InsertarUsuario`(
	IN `ParOpcion` INT,
	IN `ParNombre` VARCHAR(200),
	IN `ParNombreUsuario` VARCHAR(200),
	IN `ParPasswordUsuario` VARCHAR(200),
	IN `ParCargo` VARCHAR(200),
	IN `ParCorreoElectronico` VARCHAR(200),
	IN `ParContacto` VARCHAR(200),
	IN `ParEstado` INT,
	IN `ParNivel` INT,
	IN `ParFecha` DATE
)
BEGIN
	IF ParOpcion=1 THEN
		INSERT INTO
			usuario
		(
			Nombre,
			NombreUsuario,
			PasswordUsuario,
			Cargo,
			CorreoElectronico,
			Contacto,
			Estado,
			Nivel,
			Fecha
		)
		VALUES
		(
			ParNombre,
			ParNombreUsuario,
			ParPasswordUsuario,
			ParCargo,
			ParCorreoElectronico,
			ParContacto,
			ParEstado,
			ParNivel,
			ParFecha
		);
		
		SELECT LAST_INSERT_ID();
	END IF;
END//
DELIMITER ;

-- Volcando estructura para tabla quimicexpress.proveedor
CREATE TABLE IF NOT EXISTS `proveedor` (
  `Id_Proveedor` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) DEFAULT NULL,
  `Dirección` varchar(200) DEFAULT NULL,
  `Contacto` varchar(200) DEFAULT NULL,
  `Ruc` varchar(200) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Proveedor`) USING BTREE,
  UNIQUE KEY `Id_ProveedorUnique` (`Id_Proveedor`),
  KEY `Id_ProveedorKey` (`Id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.proveedor: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;

-- Volcando estructura para vista quimicexpress.stockbajo
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `stockbajo` (
	`Id_Inventario` INT(10) UNSIGNED NOT NULL,
	`Descripción` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`PrecioCosto` DECIMAL(10,2) NULL,
	`Stock` INT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.sumaventas
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `sumaventas` (
	`Guaranies` DOUBLE(23,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para tabla quimicexpress.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `Id_Usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(200) DEFAULT NULL,
  `NombreUsuario` varchar(200) DEFAULT NULL,
  `PasswordUsuario` varchar(200) DEFAULT NULL,
  `Cargo` varchar(200) DEFAULT NULL,
  `CorreoElectronico` varchar(200) DEFAULT NULL,
  `Contacto` varchar(200) DEFAULT NULL,
  `Estado` int(10) unsigned NOT NULL DEFAULT 0,
  `Nivel` int(10) unsigned NOT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`Id_Usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.usuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`Id_Usuario`, `Nombre`, `NombreUsuario`, `PasswordUsuario`, `Cargo`, `CorreoElectronico`, `Contacto`, `Estado`, `Nivel`, `Fecha`) VALUES
	(1, 'admin', 'admin', '123', 'ceo', 'asdfas', '111111', 1, 0, '2021-09-16');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.venta
CREATE TABLE IF NOT EXISTS `venta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comprobante` varchar(45) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `iva` varchar(200) DEFAULT NULL,
  `descuento` decimal(10,0) DEFAULT NULL,
  `totalneto` varchar(200) DEFAULT NULL,
  `idusuario` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `Cgs` decimal(10,2) DEFAULT 0.00,
  `Crs` decimal(10,2) DEFAULT 0.00,
  `Cus` decimal(10,2) DEFAULT 0.00,
  `Cps` decimal(10,2) DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.venta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.ventapresupuesto
CREATE TABLE IF NOT EXISTS `ventapresupuesto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comprobante` varchar(45) DEFAULT NULL,
  `idcliente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `subtotal` decimal(10,0) DEFAULT NULL,
  `iva` varchar(200) DEFAULT NULL,
  `descuento` decimal(10,0) DEFAULT NULL,
  `totalneto` varchar(200) DEFAULT NULL,
  `idusuario` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `Cgs` decimal(10,0) DEFAULT 0,
  `Crs` decimal(10,0) DEFAULT 0,
  `Cus` decimal(10,0) DEFAULT 0,
  `Cps` decimal(10,0) DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.ventapresupuesto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `ventapresupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventapresupuesto` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.venta_items
CREATE TABLE IF NOT EXISTS `venta_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idventa` int(10) unsigned DEFAULT NULL,
  `idproducto` int(10) unsigned DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT 0,
  `cantidad` decimal(10,0) DEFAULT 0,
  `iva` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `id_cliente` int(11) DEFAULT 0,
  `ruc` varchar(50) DEFAULT NULL,
  `Cgs` decimal(10,0) DEFAULT 0,
  `Crs` decimal(10,0) DEFAULT 0,
  `Cus` decimal(10,0) DEFAULT 0,
  `Cps` decimal(10,0) DEFAULT 0,
  `subtotal` decimal(10,0) DEFAULT 0,
  `totalneto` decimal(10,0) DEFAULT 0,
  `descuento` decimal(10,0) DEFAULT 0,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.venta_items: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_items` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.venta_items_credito
CREATE TABLE IF NOT EXISTS `venta_items_credito` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idventa` int(10) unsigned DEFAULT NULL,
  `idproducto` int(10) unsigned DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT 0,
  `cantidad` decimal(10,0) DEFAULT 0,
  `iva` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `id_cliente` int(11) DEFAULT 0,
  `ruc` varchar(50) DEFAULT NULL,
  `Cgs` decimal(10,0) DEFAULT 0,
  `Crs` decimal(10,0) DEFAULT 0,
  `Cus` decimal(10,0) DEFAULT 0,
  `Cps` decimal(10,0) DEFAULT 0,
  `subtotal` decimal(10,0) DEFAULT 0,
  `totalneto` decimal(10,0) DEFAULT 0,
  `descuento` decimal(10,0) DEFAULT 0,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.venta_items_credito: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_items_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_items_credito` ENABLE KEYS */;

-- Volcando estructura para tabla quimicexpress.venta_items_presupuesto
CREATE TABLE IF NOT EXISTS `venta_items_presupuesto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idventa` int(10) unsigned DEFAULT NULL,
  `idproducto` int(10) unsigned DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT 0,
  `cantidad` decimal(10,0) DEFAULT 0,
  `iva` int(10) unsigned DEFAULT NULL,
  `estado` int(10) unsigned DEFAULT NULL,
  `id_cliente` int(11) DEFAULT 0,
  `ruc` varchar(50) DEFAULT NULL,
  `Cgs` decimal(10,0) DEFAULT 0,
  `Crs` decimal(10,0) DEFAULT 0,
  `Cus` decimal(10,0) DEFAULT 0,
  `Cps` decimal(10,0) DEFAULT 0,
  `subtotal` decimal(10,0) DEFAULT 0,
  `totalneto` decimal(10,0) DEFAULT 0,
  `descuento` decimal(10,0) DEFAULT 0,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla quimicexpress.venta_items_presupuesto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `venta_items_presupuesto` DISABLE KEYS */;
/*!40000 ALTER TABLE `venta_items_presupuesto` ENABLE KEYS */;

-- Volcando estructura para vista quimicexpress.v_venta
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_venta` (
	`id` INT(10) UNSIGNED NOT NULL,
	`comprobante` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,0) NULL,
	`direccion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`telefono` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.v_ventaitems
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_ventaitems` (
	`id` INT(10) UNSIGNED NOT NULL,
	`idventa` INT(10) UNSIGNED NOT NULL,
	`idproducto` INT(10) UNSIGNED NOT NULL,
	`precio` DECIMAL(10,0) NULL,
	`cantidad` DECIMAL(10,0) NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` INT(10) UNSIGNED NULL,
	`estado` INT(10) UNSIGNED NULL,
	`descripcion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.v_ventaitemscredito
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_ventaitemscredito` (
	`id` INT(10) UNSIGNED NOT NULL,
	`idventa` INT(10) UNSIGNED NOT NULL,
	`idproducto` INT(10) UNSIGNED NOT NULL,
	`precio` DECIMAL(10,0) NULL,
	`cantidad` DECIMAL(10,0) NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` INT(10) UNSIGNED NULL,
	`estado` INT(10) UNSIGNED NOT NULL,
	`descripcion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.v_ventaitemspresupuesto
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_ventaitemspresupuesto` (
	`id` INT(10) UNSIGNED NOT NULL,
	`idventa` INT(10) UNSIGNED NOT NULL,
	`idproducto` INT(10) UNSIGNED NOT NULL,
	`precio` DECIMAL(10,0) NULL,
	`cantidad` DECIMAL(10,0) NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` INT(10) UNSIGNED NULL,
	`estado` INT(10) UNSIGNED NULL,
	`descripcion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,0) NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.v_venta_credito
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_venta_credito` (
	`id` INT(10) UNSIGNED NOT NULL,
	`comprobante` INT(10) UNSIGNED NOT NULL,
	`nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NOT NULL,
	`subtotal` DECIMAL(10,2) NOT NULL,
	`iva` VARCHAR(200) NOT NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,2) NOT NULL,
	`direccion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`telefono` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`cantidadcuota` INT(10) UNSIGNED NOT NULL,
	`totaldeuda` DECIMAL(10,0) NOT NULL,
	`mensualidad` DECIMAL(10,0) NOT NULL
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.v_venta_presupuesto
-- Creando tabla temporal para superar errores de dependencia de VIEW
CREATE TABLE `v_venta_presupuesto` (
	`id` INT(10) UNSIGNED NOT NULL,
	`comprobante` VARCHAR(45) NULL COLLATE 'utf8_general_ci',
	`nombre` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`fecha` DATETIME NULL,
	`subtotal` DECIMAL(10,0) NULL,
	`iva` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`descuento` DECIMAL(10,0) NULL,
	`direccion` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`telefono` VARCHAR(200) NULL COLLATE 'utf8_general_ci',
	`ruc` VARCHAR(200) NULL COLLATE 'utf8_general_ci'
) ENGINE=MyISAM;

-- Volcando estructura para vista quimicexpress.consultaalmacen
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultaalmacen`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultaalmacen` AS select `a`.`Id_Almacen` AS `Codigo`,`a`.`Descripción` AS `Descripción`,`m`.`Descripción` AS `Marca`,`c`.`Descripción` AS `Categoria`,`a`.`CantidadLitro` AS `Litros`,`a`.`CantidadKilos` AS `Kilos`,`a`.`PrecioCosto` AS `PrecioCosto`,`a`.`PrecioReventa` AS `PrecioReventa`,`a`.`PrecioLitro` AS `PrecioPorLitro`,`a`.`Fecha` AS `Fecha` from ((`almacen` `a` join `marca` `m`) join `categoria` `c`) where ((`a`.`idMarca` = `m`.`id_marca`) and (`a`.`idCategoria` = `c`.`id_categoria`)) ;

-- Volcando estructura para vista quimicexpress.consultacierrecaja
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultacierrecaja`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultacierrecaja` AS SELECT id, fecha, montoGs AS MontoGuaranies, montoUs AS MontoDolares, montoRs AS MontoReales, montoPs AS MontoPesos
FROM cierrecaja ;

-- Volcando estructura para vista quimicexpress.consultacliente
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultacliente`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultacliente` AS select `c`.`id_cliente` AS `Id`,`c`.`Nombre` AS `Nombre` from `cliente` `c` ;

-- Volcando estructura para vista quimicexpress.consultacobros
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultacobros`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultacobros` AS SELECT SUM(Cgs) AS Guaranies, SUM(Crs) AS Reales, SUM(Cus) AS Dolar, SUM(Cps) AS Pesos
FROM cobros
WHERE fecha= (SELECT max(fecha) FROM cobros) ;

-- Volcando estructura para vista quimicexpress.consultadescuento
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultadescuento`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultadescuento` AS SELECT v.id,c.Nombre,c.Ruc,v.fecha,v.subtotal,v.iva,SUM(vi.descuento) as descuento,v.totalneto,v.estado, v.Cgs AS GS, v.Crs AS RS, v.Cus AS US, v.Cps AS PS, v.comprobante
FROM venta_items as vi, venta AS v, cliente AS c
WHERE v.id=vi.idventa  AND v.ruc = c.Ruc AND v.estado =1
group by vi.idventa ;

-- Volcando estructura para vista quimicexpress.consultadescuentos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultadescuentos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultadescuentos` AS SELECT v.id,c.Nombre,c.Ruc,v.fecha,v.subtotal,v.iva,SUM(vi.descuento) as descuento,v.totalneto,v.estado, v.Cgs AS GS, v.Crs AS RS, v.Cus AS US, v.Cps AS PS
FROM venta_items as vi, venta AS v, cliente AS c
where v.id=vi.idventa AND v.estado =1
group by vi.idventa ;

-- Volcando estructura para vista quimicexpress.consultadeudores
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultadeudores`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultadeudores` AS SELECT d.id as ID, d.comprobante as Comprobante, vic.idVenta as IDVenta, c.id_cliente as Idcliente, c.Nombre as Nombres, c.Ruc AS Ruc, d.fecha as Fecha, d.subtotal as SubTotal, d.iva as Iva, d.descuento as Descuento, d.totalneto as TotalNeto, d.totaldeuda as TotalDeuda, d.mensualidad as mensualidad,d.cantidadcuota as CantidadCuota, d.estado as Estado, d.CuotasPagadas as CuotasPagadas,
d.Cgs AS GS, d.Crs AS RS, d.Cus AS US, d.Cps AS PS
 from venta_items_credito AS vic, cliente as c, deudores AS d
where c.id_cliente = d.idcliente and d.idVenta = vic.idVenta  AND d.estado =2 AND d.ruc = c.Ruc
group by vic.idVenta ;

-- Volcando estructura para vista quimicexpress.consultadeudoresinforme
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultadeudoresinforme`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultadeudoresinforme` AS SELECT d.comprobante, v.id, c.nombre AS idcliente, d.ruc, d.fecha, d.subtotal, d.iva, d.totalneto, d.totaldeuda, d.mensualidad,d.cantidadcuota, d.CuotasPagadas
 from venta as v, cliente as c, deudores AS d
where c.id_cliente = d.idcliente and d.idVenta = v.id AND d.ruc = c.Ruc ;

-- Volcando estructura para vista quimicexpress.consultagastos
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultagastos`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultagastos` AS SELECT SUM(guarani) AS Guarani, SUM(dolar) AS Dolar, SUM(realb) AS Reales, SUM(peso) AS Peso
from gastos 
WHERE fecha= (select MAX(fecha) FROM gastos) ;

-- Volcando estructura para vista quimicexpress.consultagastosinforme
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultagastosinforme`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultagastosinforme` AS SELECT id_Gasto, fecha, `descripción`, guarani, dolar, realb, peso, estado
FROM gastos ORDER BY id_Gasto desc ;

-- Volcando estructura para vista quimicexpress.consultahistorial
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultahistorial`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultahistorial` AS select v.comprobante, c.Nombre,c.Ruc, v.fecha, vi.idproducto, vi.descripcion, vi.precio, vi.descuento,vi.cantidad
from venta_items as vi, venta as v, cliente as c
where vi.idventa= v.id and v.idcliente=c.Id_Cliente ORDER BY v.id ;

-- Volcando estructura para vista quimicexpress.consultainventario
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultainventario`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultainventario` AS select `i`.`Id_Inventario` AS `Codigo`,`i`.`idCodigoBarra` AS `CodigoBarra`,`i`.`Descripción` AS `Descripción`,`m`.`Descripción` AS `Marca`,`c`.`Descripción` AS `Categoria`,`p`.`Nombre` AS `Proveedor`,`i`.`PrecioCosto` AS `PrecioCosto`,`i`.`PrecioMinimo` AS `PrecioMinimo`,`i`.`PrecioNormal` AS `PrecioNormal`,`i`.`Stock` AS `Stock`,`i`.`Fecha` AS `Fecha` from (((`inventario` `i` join `marca` `m`) join `categoria` `c`) join `proveedor` `p`) where ((`i`.`idMarca` = `m`.`id_marca`) and (`i`.`idcategoria` = `c`.`id_categoria`) and (`i`.`idproveedor` = `p`.`id_proveedor`)) ;

-- Volcando estructura para vista quimicexpress.consultanotacobrada
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultanotacobrada`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultanotacobrada` AS select d.comprobante, c.nombre, d.fecha, d.subtotal, d.iva, d.descuento, c.`Dirección` AS direccion, c.Contacto AS telefono, c.ruc, d.cantidadcuota, d.CuotasPagadas, d.totaldeuda, co.Cgs, co.Crs, co.Cus, co.Cps, d.mensualidad
from deudores as d, cliente AS c, cobros AS co
where d.idcliente=c.id_cliente AND d.id=co.id ;

-- Volcando estructura para vista quimicexpress.consultaproveedor
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultaproveedor`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultaproveedor` AS select `p`.`Id_Proveedor` AS `Id_Proveedor`,`p`.`Nombre` AS `Nombre` from `proveedor` `p` ;

-- Volcando estructura para vista quimicexpress.consultausuario
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultausuario`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultausuario` AS select `u`.`id_usuario` AS `Id_Usuario`,`u`.`Nombre` AS `Nombre` from `usuario` `u` ;

-- Volcando estructura para vista quimicexpress.consultaventas
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `consultaventas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `consultaventas` AS select `v`.`id` AS `id`,`c`.`Nombre` ,`c`.`Ruc` AS `RUC`,`v`.`fecha` AS `fecha`,`v`.`subtotal` AS `SubTotal`,`v`.`descuento`AS `Descuento`,`v`.`totalneto` AS `TotalNeto`,`v`.`estado` AS `Estado`,`v`.`Cgs` AS `GS`,`v`.`Crs` AS `RS`,`v`.`Cus` AS `US`,`v`.`Cps` AS `PS` from (`venta` `v` join `cliente` `c`) where `c`.`id_cliente` = `v`.`idcliente` and `v`.`estado`=1 ;

-- Volcando estructura para vista quimicexpress.historial
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `historial`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `historial` AS select v.comprobante, c.Nombre,c.Ruc, v.fecha, vi.idproducto, vi.descripcion, vi.precio, vi.descuento,vi.cantidad
from venta_items as vi, venta as v, cliente as c
where vi.idventa= v.id and v.idcliente=c.Id_Cliente ;

-- Volcando estructura para vista quimicexpress.stockbajo
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `stockbajo`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `stockbajo` AS SELECT Id_Inventario, Descripción,PrecioCosto,Stock
FROM inventario
WHERE stock < 11 OR stock = 10 ;

-- Volcando estructura para vista quimicexpress.sumaventas
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `sumaventas`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `sumaventas` AS SELECT SUM(totalneto) AS Guaranies 
FROM venta ;

-- Volcando estructura para vista quimicexpress.v_venta
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_venta`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_venta` AS select v.id, v.comprobante, c.nombre, v.fecha, v.subtotal, v.iva, v.descuento, c.`Dirección` AS direccion, c.Contacto AS telefono, c.ruc
from venta as v, cliente AS c
where v.idcliente=c.id_cliente ;

-- Volcando estructura para vista quimicexpress.v_ventaitems
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_ventaitems`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_ventaitems` AS SELECT vi.id, v.id AS idventa, i.Id_Inventario AS idproducto, vi.precio, vi.cantidad, vi.subtotal, vi.iva, v.estado, i.`Descripción` AS descripcion, vi.descuento
FROM venta AS v, venta_items AS vi, inventario AS i
WHERE  v.id=vi.idventa AND vi.idproducto=i.Id_Inventario ;

-- Volcando estructura para vista quimicexpress.v_ventaitemscredito
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_ventaitemscredito`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_ventaitemscredito` AS SELECT vic.id, d.id AS idventa, i.Id_Inventario AS idproducto, vic.precio, vic.cantidad, vic.subtotal, vic.iva, d.estado, i.`Descripción` AS descripcion, vic.descuento
FROM deudores AS d, venta_items_credito AS vic, inventario AS i
WHERE  d.id=vic.idventa AND vic.idproducto=i.Id_Inventario ;

-- Volcando estructura para vista quimicexpress.v_ventaitemspresupuesto
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_ventaitemspresupuesto`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_ventaitemspresupuesto` AS SELECT vi.id, v.id AS idventa, i.Id_Inventario AS idproducto, vi.precio, vi.cantidad, vi.subtotal, vi.iva, v.estado, i.`Descripción` AS descripcion, vi.descuento
FROM ventapresupuesto AS v, venta_items_presupuesto AS vi, inventario AS i
WHERE  v.id=vi.idventa AND vi.idproducto=i.Id_Inventario ;

-- Volcando estructura para vista quimicexpress.v_venta_credito
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_venta_credito`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_venta_credito` AS SELECT d.id, d.comprobante, c.nombre, d.fecha, d.subtotal, d.iva, d.descuento, c.`Dirección` AS direccion, c.Contacto AS telefono, c.ruc, d.cantidadcuota, d.totaldeuda, d.mensualidad
from deudores as d, cliente AS c
WHERE d.idcliente=c.id_cliente ;

-- Volcando estructura para vista quimicexpress.v_venta_presupuesto
-- Eliminando tabla temporal y crear estructura final de VIEW
DROP TABLE IF EXISTS `v_venta_presupuesto`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `v_venta_presupuesto` AS select v.id, v.comprobante, c.nombre, v.fecha, v.subtotal, v.iva, v.descuento, c.`Dirección` AS direccion, c.Contacto AS telefono, c.ruc
from ventapresupuesto as v, cliente AS c
where v.idcliente=c.id_cliente ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
