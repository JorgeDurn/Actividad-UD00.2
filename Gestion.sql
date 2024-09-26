-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.6.1-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para nominas
CREATE DATABASE IF NOT EXISTS `nominas` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_spanish2_ci */;
USE `nominas`;

-- Volcando estructura para tabla nominas.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria` int(11) NOT NULL,
  `sueldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- Volcando datos para la tabla nominas.categorias: ~10 rows (aproximadamente)
INSERT INTO `categorias` (`categoria`, `sueldo`) VALUES
	(1, 50000),
	(2, 70000),
	(3, 90000),
	(4, 110000),
	(5, 130000),
	(6, 150000),
	(7, 170000),
	(8, 190000),
	(9, 210000),
	(10, 230000);

-- Volcando estructura para tabla nominas.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `dni` varchar(9) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `categoria` int(11) DEFAULT NULL,
  `anyosTrabajados` int(11) DEFAULT NULL,
  `sueldo` int(11) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `categorias` (`categoria`),
  CONSTRAINT `categorias` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- Volcando datos para la tabla nominas.empleados: ~2 rows (aproximadamente)
INSERT INTO `empleados` (`dni`, `nombre`, `sexo`, `categoria`, `anyosTrabajados`, `sueldo`) VALUES
	('32000031R', 'Ada Lovelace', 'F', 1, 1, 55000),
	('32000032G', 'James Cosling', 'M', 9, 7, 245000);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
