-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cinemat
-- ------------------------------------------------------
-- Server version	8.0.15
CREATE DATABASE CinemaT;
use CinemaT;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actores`
--

DROP TABLE IF EXISTS `actores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `actores` (
  `ACT_idactor` int(11) NOT NULL AUTO_INCREMENT,
  `ACT_nombre` varchar(30) NOT NULL,
  `ACT_ap` varchar(30) NOT NULL,
  `ACT_am` varchar(30) NOT NULL,
  `ACT_imagenactor` varchar(50) NOT NULL,
  PRIMARY KEY (`ACT_idactor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actores`
--

LOCK TABLES `actores` WRITE;
/*!40000 ALTER TABLE `actores` DISABLE KEYS */;
/*!40000 ALTER TABLE `actores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `almacen` (
  `Id_producto` int(11) DEFAULT NULL,
  `Id_proveedor` int(11) DEFAULT NULL,
  `precio_de_compra` float DEFAULT NULL,
  KEY `Id_producto` (`Id_producto`),
  KEY `Id_proveedor` (`Id_proveedor`),
  CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`PRO_id`),
  CONSTRAINT `almacen_ibfk_2` FOREIGN KEY (`Id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen`
--

LOCK TABLES `almacen` WRITE;
/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `combos`
--

DROP TABLE IF EXISTS `combos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `combos` (
  `COMBO_id` int(11) NOT NULL AUTO_INCREMENT,
  `COMBO_nombre` varchar(30) NOT NULL,
  `COMBO_precio` float NOT NULL,
  `COMBO_status` int(11) DEFAULT NULL,
  `img` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`COMBO_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `combos`
--

LOCK TABLES `combos` WRITE;
/*!40000 ALTER TABLE `combos` DISABLE KEYS */;
INSERT INTO `combos` VALUES (1,'Combo Amigos',120,1,'c_amigos'),(2,'Combo Pareja',150,1,'c_pareja'),(3,'Combo Familiar',200,1,'c_familiar'),(4,'Combo Grande',100,1,'c_grande');
/*!40000 ALTER TABLE `combos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `empleados` (
  `EMP_idempleado` int(11) NOT NULL AUTO_INCREMENT,
  `EMP_nombre` varchar(40) NOT NULL,
  `EMP_ap` varchar(40) NOT NULL,
  `EMP_am` varchar(40) NOT NULL,
  `EMP_bithday` date NOT NULL,
  `EMP_area` varchar(40) NOT NULL,
  `EMP_salario` float NOT NULL,
  `EMP_status` int(11) DEFAULT NULL,
  `EMP_contrasena` varchar(20) NOT NULL,
  `EMP_rootistrador` varchar(40) NOT NULL,
  PRIMARY KEY (`EMP_idempleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formatos`
--

DROP TABLE IF EXISTS `formatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `formatos` (
  `FOR_idformato` int(11) NOT NULL AUTO_INCREMENT,
  `FOR_nombre` varchar(20) NOT NULL,
  `FOR_precio` float NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`FOR_idformato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formatos`
--

LOCK TABLES `formatos` WRITE;
/*!40000 ALTER TABLE `formatos` DISABLE KEYS */;
INSERT INTO `formatos` VALUES (1,'3D',60,1),(2,'Tradicional',45,1),(3,'4D',130,1),(4,'Platino ',120,1),(5,'Cinema Xtreme',70,1),(6,'Cinema Xtreme 3D',90,1);
/*!40000 ALTER TABLE `formatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `funciones` (
  `FUN_idfuncion` int(11) NOT NULL AUTO_INCREMENT,
  `FUN_idpelicula` int(11) NOT NULL,
  `FUN_idsucursal` int(11) NOT NULL,
  `FUN_hora` time NOT NULL,
  `FUN_dia` date NOT NULL,
  `FUN_idformato` int(11) DEFAULT NULL,
  `FUN_ididioma` int(11) DEFAULT NULL,
  PRIMARY KEY (`FUN_idfuncion`),
  KEY `FUN_idsucursal` (`FUN_idsucursal`),
  KEY `FUN_idpelicula` (`FUN_idpelicula`),
  CONSTRAINT `Funciones_ibfk_1` FOREIGN KEY (`FUN_idsucursal`) REFERENCES `sucursal` (`SUC_idsucursal`),
  CONSTRAINT `Funciones_ibfk_2` FOREIGN KEY (`FUN_idpelicula`) REFERENCES `peliculas` (`PEL_idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES (1,1,1,'10:00:00','2020-12-20',2,2),(2,2,3,'11:00:00','2020-12-20',2,2),(3,3,2,'16:00:00','2020-12-20',2,1),(4,3,2,'18:00:00','2020-12-20',1,2),(5,4,3,'14:00:00','2020-12-20',3,2),(6,4,1,'15:00:00','2020-12-20',1,2),(7,5,3,'20:00:00','2020-12-20',1,1),(8,5,2,'13:00:00','2020-12-20',2,1),(9,6,1,'17:00:00','2020-12-20',5,2),(10,6,2,'14:00:00','2020-12-20',1,2),(11,7,1,'21:00:00','2020-12-20',1,2),(12,9,2,'17:00:00','2020-12-20',2,1),(13,8,3,'13:00:00','2020-12-20',1,1),(14,7,3,'21:30:00','2020-12-20',1,2),(15,1,3,'20:45:00','2020-12-20',4,2),(16,1,1,'10:00:00','2020-12-20',2,2),(17,2,3,'11:00:00','2020-12-20',2,2),(18,3,2,'20:00:00','2020-12-20',2,2),(19,2,2,'17:00:00','2020-12-20',2,2),(20,2,3,'20:00:00','2020-12-20',2,2),(21,3,3,'10:00:00','2020-12-20',2,2),(22,4,2,'14:00:00','2020-12-20',2,3),(23,3,3,'23:00:00','2020-12-20',2,2),(24,1,1,'12:00:00','2020-12-20',1,1),(25,1,3,'09:00:00','2020-12-20',1,1),(26,1,1,'10:00:00','2020-12-20',1,1),(27,1,1,'10:00:00','2020-12-20',1,1);
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idiomas`
--

DROP TABLE IF EXISTS `idiomas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `idiomas` (
  `IDI_id` int(11) NOT NULL AUTO_INCREMENT,
  `IDI_nombre` varchar(40) DEFAULT NULL,
  `IDI_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`IDI_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idiomas`
--

LOCK TABLES `idiomas` WRITE;
/*!40000 ALTER TABLE `idiomas` DISABLE KEYS */;
INSERT INTO `idiomas` VALUES (1,'EspaÃÂÃÂ±ol',1),(2,'Ingles',1),(3,'Chino',1),(4,'Frances',1);
/*!40000 ALTER TABLE `idiomas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `niveles_tarjeta`
--

DROP TABLE IF EXISTS `niveles_tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `niveles_tarjeta` (
  `NTA_idnivel` int(11) NOT NULL AUTO_INCREMENT,
  `NTA_nombre` varchar(20) NOT NULL,
  `NTA_puntos` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`NTA_idnivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `niveles_tarjeta`
--

LOCK TABLES `niveles_tarjeta` WRITE;
/*!40000 ALTER TABLE `niveles_tarjeta` DISABLE KEYS */;
INSERT INTO `niveles_tarjeta` VALUES (1,'Básica',0.05),(2,'Oro',0.08),(3,'Premium',0.10);
/*!40000 ALTER TABLE `niveles_tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opciones_productos`
--

DROP TABLE IF EXISTS `opciones_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `opciones_productos` (
  `id_opc` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_opc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opciones_productos`
--

LOCK TABLES `opciones_productos` WRITE;
/*!40000 ALTER TABLE `opciones_productos` DISABLE KEYS */;
INSERT INTO `opciones_productos` VALUES (1,'Productos'),(2,'Combos');
/*!40000 ALTER TABLE `opciones_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `peliculas` (
  `PEL_idpelicula` int(11) NOT NULL AUTO_INCREMENT,
  `PEL_nombre` varchar(40) NOT NULL,
  `PEL_clasificacion` varchar(3) NOT NULL,
  `PEL_duracion` time NOT NULL,
  `PEL_fechaestreno` date DEFAULT NULL,
  `PEL_imagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PEL_idpelicula`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peliculas`
--

LOCK TABLES `peliculas` WRITE;
/*!40000 ALTER TABLE `peliculas` DISABLE KEYS */;
INSERT INTO `peliculas` VALUES (1,'Jhon Wick 4','C','01:20:00','2020-07-15','John4.png'),(2,'Matrix 4','B15','02:20:00','2020-06-01','Matrix4.png'),(3,'Die Hard','B','02:12:00','1988-07-12','Die_hard.png'),(4,'Back to the Future','A','01:56:00','1985-07-03','BackTo.png'),(5,'La ultima y nos vamos','B15','01:51:00','2015-05-29','La_ultima.png'),(6,'Your Name','A','01:52:00','2016-08-26','YourName.jpeg'),(7,'Buscando a Nemo','AA','01:40:00','2003-07-04','Nemo.png'),(8,'Monster Inc','AA','01:36:00','2001-12-14','MonsterInc.png'),(9,'Parasite','B15','02:12:00','2019-09-18','Parasite.png');
/*!40000 ALTER TABLE `peliculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `producto` (
  `PRO_id` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_nombre` varchar(30) NOT NULL,
  `PRO_precio` float NOT NULL,
  `PRO_almacen` int(11) DEFAULT NULL,
  `PRO_status` int(11) DEFAULT NULL,
  `id_tam` int(11) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PRO_id`),
  KEY `id_tam` (`id_tam`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_tam`) REFERENCES `size` (`Idsize`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_producto` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Palomitas chicas',40,10000,1,1,2,'p_chicas'),(2,'Palomitas medianas',45,10000,1,2,2,'p_medianas'),(3,'Palomitas grandes',50,10000,1,3,2,'p_grandes'),(4,'Refresco grande',50,10000,1,6,1,'r_grande'),(5,'Refresco mediano',45,10000,1,5,1,'r_mediano'),(6,'Refresco chico',40,10000,1,4,1,'r_chico'),(7,'Kit Kat',30,300,1,7,3,'kitkat');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `promociones` (
  `PRO_idpromocion` int(11) NOT NULL AUTO_INCREMENT,
  `PRO_nombre` varchar(40) NOT NULL,
  `PRO_descuento` float NOT NULL,
  `PRO_status` int(11) DEFAULT NULL,
  `PRO_dia` int(11) DEFAULT NULL,
  PRIMARY KEY (`PRO_idpromocion`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Miercoles',0.3,1,0),(2,'Cumple',0.5,1,0),(3,'Viernes Feliz',0.1,1,5),(4,'Martes Feliz',0.25,1,2);
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `punto_reorden`
--

DROP TABLE IF EXISTS `punto_reorden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `punto_reorden` (
  `Id_producto` int(11) DEFAULT NULL,
  `cantidad_limite` int(11) DEFAULT NULL,
  `cantidad_ordenar` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  KEY `Id_producto` (`Id_producto`),
  CONSTRAINT `punto_reorden_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`PRO_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `punto_reorden`
--

LOCK TABLES `punto_reorden` WRITE;
/*!40000 ALTER TABLE `punto_reorden` DISABLE KEYS */;
/*!40000 ALTER TABLE `punto_reorden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_act_pel`
--

DROP TABLE IF EXISTS `rel_act_pel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_act_pel` (
  `RAP_idactor` int(11) NOT NULL,
  `RAP_idpelicula` int(11) NOT NULL,
  KEY `FK_ACT_pel` (`RAP_idactor`),
  KEY `RAP_idpelicula` (`RAP_idpelicula`),
  CONSTRAINT `FK_ACT_pel` FOREIGN KEY (`RAP_idactor`) REFERENCES `actores` (`ACT_idactor`),
  CONSTRAINT `Rel_act_pel_ibfk_1` FOREIGN KEY (`RAP_idpelicula`) REFERENCES `peliculas` (`PEL_idpelicula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_act_pel`
--

LOCK TABLES `rel_act_pel` WRITE;
/*!40000 ALTER TABLE `rel_act_pel` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_act_pel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_dulceria_empleados`
--

DROP TABLE IF EXISTS `rel_dulceria_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_dulceria_empleados` (
  `RDEM_idempleado` int(11) NOT NULL,
  `RDEM_idventa` int(11) NOT NULL,
  KEY `RDEM_idempleado` (`RDEM_idempleado`),
  KEY `RDEM_idventa` (`RDEM_idventa`),
  CONSTRAINT `Rel_dulceria_empleados_ibfk_1` FOREIGN KEY (`RDEM_idempleado`) REFERENCES `empleados` (`EMP_idempleado`),
  CONSTRAINT `Rel_dulceria_empleados_ibfk_2` FOREIGN KEY (`RDEM_idventa`) REFERENCES `ventas_dulceria` (`VDU_idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_dulceria_empleados`
--

LOCK TABLES `rel_dulceria_empleados` WRITE;
/*!40000 ALTER TABLE `rel_dulceria_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_dulceria_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_fun_asientos`
--

DROP TABLE IF EXISTS `rel_fun_asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_fun_asientos` (
  `RFA_idasiento` int(11) NOT NULL,
  `RFA_idfuncion` int(11) NOT NULL,
  `RFA_disponible` int(11) NOT NULL,
  KEY `RFA_idasiento` (`RFA_idasiento`),
  KEY `RFA_idfuncion` (`RFA_idfuncion`),
  CONSTRAINT `Rel_fun_asientos_ibfk_1` FOREIGN KEY (`RFA_idasiento`) REFERENCES `sala_asientos` (`SAS_idasiento`),
  CONSTRAINT `Rel_fun_asientos_ibfk_2` FOREIGN KEY (`RFA_idfuncion`) REFERENCES `funciones` (`FUN_idfuncion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_fun_asientos`
--

LOCK TABLES `rel_fun_asientos` WRITE;
/*!40000 ALTER TABLE `rel_fun_asientos` DISABLE KEYS */;
INSERT INTO `rel_fun_asientos` VALUES (1,1,1),(2,1,1),(3,1,0),(4,1,0),(5,1,0),(6,1,1),(7,1,0),(8,1,0),(9,1,1),(10,1,1),(11,1,0),(12,1,0),(51,18,0),(52,18,0),(53,18,0),(54,18,0),(55,18,0),(56,18,0),(57,18,0),(58,18,0),(59,18,0),(60,18,0),(61,18,0),(62,18,0),(63,18,0),(64,18,0),(65,18,0),(66,18,0),(67,18,0),(68,18,0),(69,18,0),(70,18,0),(71,18,0),(72,18,0),(73,18,0),(74,18,0),(75,18,0),(76,18,0),(77,18,0),(78,18,0),(79,18,0),(80,18,0),(81,18,0),(82,18,0),(83,18,0),(84,18,0),(85,18,0),(86,18,0),(87,18,0),(88,18,0),(89,18,0),(90,18,0),(91,18,0),(92,18,0),(93,18,0),(94,18,0),(95,18,0),(96,18,0),(97,18,0),(98,18,0),(99,18,0),(100,18,0),(251,19,0),(252,19,0),(253,19,0),(254,19,0),(255,19,0),(256,19,0),(257,19,0),(258,19,0),(259,19,0),(260,19,0),(261,19,0),(262,19,0),(263,19,0),(264,19,0),(265,19,0),(266,19,0),(267,19,0),(268,19,0),(269,19,0),(270,19,0),(271,19,0),(272,19,0),(273,19,0),(274,19,0),(275,19,0),(276,19,0),(277,19,0),(278,19,0),(279,19,0),(280,19,0),(281,19,0),(282,19,0),(283,19,0),(284,19,0),(285,19,0),(286,19,0),(287,19,0),(288,19,0),(289,19,0),(290,19,0),(291,19,0),(292,19,0),(293,19,0),(294,19,0),(295,19,0),(296,19,0),(297,19,0),(298,19,0),(299,19,0),(300,19,0),(51,20,1),(52,20,1),(53,20,1),(54,20,1),(55,20,1),(56,20,1),(57,20,1),(58,20,1),(59,20,1),(60,20,1),(61,20,1),(62,20,1),(63,20,1),(64,20,1),(65,20,1),(66,20,1),(67,20,1),(68,20,1),(69,20,1),(70,20,1),(71,20,1),(72,20,1),(73,20,1),(74,20,1),(75,20,1),(76,20,1),(77,20,1),(78,20,1),(79,20,1),(80,20,1),(81,20,1),(82,20,1),(83,20,1),(84,20,1),(85,20,1),(86,20,1),(87,20,1),(88,20,1),(89,20,1),(90,20,1),(91,20,1),(92,20,1),(93,20,1),(94,20,1),(95,20,1),(96,20,1),(97,20,1),(98,20,1),(99,20,1),(100,20,1),(1,21,0),(2,21,0),(3,21,0),(4,21,0),(5,21,0),(6,21,0),(7,21,0),(8,21,0),(9,21,0),(10,21,0),(11,21,0),(12,21,0),(13,21,0),(14,21,0),(15,21,0),(16,21,0),(17,21,0),(18,21,0),(19,21,0),(20,21,0),(21,21,0),(22,21,0),(23,21,0),(24,21,0),(25,21,0),(26,21,0),(27,21,0),(28,21,0),(29,21,0),(30,21,0),(31,21,0),(32,21,0),(33,21,0),(34,21,0),(35,21,0),(36,21,0),(37,21,0),(38,21,0),(39,21,0),(40,21,0),(41,21,0),(42,21,0),(43,21,0),(44,21,0),(45,21,0),(46,21,0),(47,21,0),(48,21,0),(49,21,0),(50,21,0),(51,22,0),(52,22,0),(53,22,0),(54,22,0),(55,22,0),(56,22,0),(57,22,0),(58,22,0),(59,22,0),(60,22,0),(61,22,0),(62,22,0),(63,22,0),(64,22,0),(65,22,0),(66,22,0),(67,22,0),(68,22,0),(69,22,0),(70,22,0),(71,22,0),(72,22,0),(73,22,0),(74,22,0),(75,22,0),(76,22,0),(77,22,0),(78,22,0),(79,22,0),(80,22,0),(81,22,0),(82,22,0),(83,22,0),(84,22,0),(85,22,0),(86,22,0),(87,22,0),(88,22,0),(89,22,0),(90,22,0),(91,22,0),(92,22,0),(93,22,0),(94,22,0),(95,22,0),(96,22,0),(97,22,0),(98,22,0),(99,22,0),(100,22,0),(251,23,0),(252,23,0),(253,23,0),(254,23,0),(255,23,0),(256,23,0),(257,23,0),(258,23,0),(259,23,0),(260,23,0),(261,23,0),(262,23,0),(263,23,0),(264,23,0),(265,23,0),(266,23,0),(267,23,0),(268,23,0),(269,23,0),(270,23,0),(271,23,0),(272,23,0),(273,23,0),(274,23,0),(275,23,0),(276,23,0),(277,23,0),(278,23,0),(279,23,0),(280,23,0),(281,23,0),(282,23,0),(283,23,0),(284,23,0),(285,23,0),(286,23,0),(287,23,0),(288,23,0),(289,23,0),(290,23,0),(291,23,0),(292,23,0),(293,23,0),(294,23,0),(295,23,0),(296,23,0),(297,23,0),(298,23,0),(299,23,0),(300,23,0),(1,24,0),(2,24,0),(3,24,0),(4,24,0),(5,24,0),(6,24,0),(7,24,0),(8,24,0),(9,24,0),(10,24,0),(11,24,0),(12,24,0),(13,24,0),(14,24,0),(15,24,0),(16,24,0),(17,24,0),(18,24,0),(19,24,0),(20,24,0),(21,24,0),(22,24,0),(23,24,0),(24,24,0),(25,24,0),(26,24,0),(27,24,0),(28,24,0),(29,24,0),(30,24,0),(31,24,0),(32,24,0),(33,24,0),(34,24,0),(35,24,0),(36,24,0),(37,24,0),(38,24,0),(39,24,0),(40,24,0),(41,24,0),(42,24,0),(43,24,0),(44,24,0),(45,24,0),(46,24,0),(47,24,0),(48,24,0),(49,24,0),(50,24,0),(1,25,0),(2,25,0),(3,25,0),(4,25,0),(5,25,0),(6,25,0),(7,25,0),(8,25,0),(9,25,0),(10,25,0),(11,25,0),(12,25,0),(13,25,0),(14,25,0),(15,25,0),(16,25,0),(17,25,0),(18,25,0),(19,25,0),(20,25,0),(21,25,0),(22,25,0),(23,25,0),(24,25,0),(25,25,0),(26,25,0),(27,25,0),(28,25,0),(29,25,0),(30,25,0),(31,25,0),(32,25,0),(33,25,0),(34,25,0),(35,25,0),(36,25,0),(37,25,0),(38,25,0),(39,25,0),(40,25,1),(41,25,1),(42,25,0),(43,25,0),(44,25,1),(45,25,1),(46,25,0),(47,25,1),(48,25,1),(49,25,0),(50,25,0),(1,26,0),(2,26,0),(3,26,0),(4,26,0),(5,26,0),(6,26,0),(7,26,0),(8,26,0),(9,26,0),(10,26,0),(11,26,0),(12,26,0),(13,26,0),(14,26,0),(15,26,0),(16,26,0),(17,26,0),(18,26,0),(19,26,0),(20,26,0),(21,26,0),(22,26,0),(23,26,0),(24,26,0),(25,26,0),(26,26,0),(27,26,0),(28,26,0),(29,26,0),(30,26,0),(31,26,0),(32,26,0),(33,26,0),(34,26,0),(35,26,0),(36,26,0),(37,26,0),(38,26,0),(39,26,1),(40,26,1),(41,26,1),(42,26,1),(43,26,1),(44,26,1),(45,26,1),(46,26,1),(47,26,1),(48,26,1),(49,26,1),(50,26,1),(1,27,0),(2,27,0),(3,27,0),(4,27,0),(5,27,0),(6,27,1),(7,27,1),(8,27,1),(9,27,1),(10,27,1),(11,27,1),(12,27,1),(13,27,1),(14,27,1),(15,27,1),(16,27,1),(17,27,1),(18,27,1),(19,27,1),(20,27,1),(21,27,1),(22,27,1),(23,27,1),(24,27,1),(25,27,1),(26,27,1),(27,27,1),(28,27,1),(29,27,1),(30,27,1),(31,27,1),(32,27,1),(33,27,1),(34,27,1),(35,27,1),(36,27,1),(37,27,1),(38,27,1),(39,27,1),(40,27,1),(41,27,1),(42,27,1),(43,27,1),(44,27,1),(45,27,1),(46,27,1),(47,27,1),(48,27,1),(49,27,1),(50,27,1);
/*!40000 ALTER TABLE `rel_fun_asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_product_combo`
--

DROP TABLE IF EXISTS `rel_product_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_product_combo` (
  `RPCO_idcombo` int(11) DEFAULT NULL,
  `RPCO_idproducto` int(11) DEFAULT NULL,
  KEY `RPCO_idcombo` (`RPCO_idcombo`),
  KEY `RPCO_idproducto` (`RPCO_idproducto`),
  CONSTRAINT `Rel_product_combo_ibfk_1` FOREIGN KEY (`RPCO_idcombo`) REFERENCES `combos` (`COMBO_id`),
  CONSTRAINT `Rel_product_combo_ibfk_2` FOREIGN KEY (`RPCO_idproducto`) REFERENCES `producto` (`PRO_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_product_combo`
--

LOCK TABLES `rel_product_combo` WRITE;
/*!40000 ALTER TABLE `rel_product_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_product_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_promo_formato`
--

DROP TABLE IF EXISTS `rel_promo_formato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_promo_formato` (
  `RPF_idpromo` int(11) DEFAULT NULL,
  `RPF_idformato` int(11) DEFAULT NULL,
  KEY `RPF_idpromo` (`RPF_idpromo`),
  KEY `RPF_idformato` (`RPF_idformato`),
  CONSTRAINT `Rel_promo_formato_ibfk_1` FOREIGN KEY (`RPF_idpromo`) REFERENCES `promociones` (`PRO_idpromocion`),
  CONSTRAINT `Rel_promo_formato_ibfk_2` FOREIGN KEY (`RPF_idformato`) REFERENCES `formatos` (`FOR_idformato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_promo_formato`
--

LOCK TABLES `rel_promo_formato` WRITE;
/*!40000 ALTER TABLE `rel_promo_formato` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_promo_formato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_ticket`
--

DROP TABLE IF EXISTS `rel_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_ticket` (
  `RTIC_idempleado` int(11) NOT NULL,
  `RTIC_idventa` int(11) NOT NULL,
  KEY `RTIC_idempleado` (`RTIC_idempleado`),
  KEY `RTIC_idventa` (`RTIC_idventa`),
  CONSTRAINT `Rel_ticket_ibfk_1` FOREIGN KEY (`RTIC_idempleado`) REFERENCES `empleados` (`EMP_idempleado`),
  CONSTRAINT `Rel_ticket_ibfk_2` FOREIGN KEY (`RTIC_idventa`) REFERENCES `ventas_ticket` (`VET_idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_ticket`
--

LOCK TABLES `rel_ticket` WRITE;
/*!40000 ALTER TABLE `rel_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_venta_combo`
--

DROP TABLE IF EXISTS `rel_venta_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_venta_combo` (
  `RVCO_idcombo` int(11) DEFAULT NULL,
  `RVCO_idventa` int(11) DEFAULT NULL,
  KEY `RVCO_idcombo` (`RVCO_idcombo`),
  KEY `RVCO_idventa` (`RVCO_idventa`),
  CONSTRAINT `Rel_venta_combo_ibfk_1` FOREIGN KEY (`RVCO_idcombo`) REFERENCES `combos` (`COMBO_id`),
  CONSTRAINT `Rel_venta_combo_ibfk_2` FOREIGN KEY (`RVCO_idventa`) REFERENCES `ventas_dulceria` (`VDU_idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_venta_combo`
--

LOCK TABLES `rel_venta_combo` WRITE;
/*!40000 ALTER TABLE `rel_venta_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_venta_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_venta_producto`
--

DROP TABLE IF EXISTS `rel_venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_venta_producto` (
  `RVPR_idproducto` int(11) DEFAULT NULL,
  `RVPR_idventa` int(11) DEFAULT NULL,
  KEY `RVPR_idproducto` (`RVPR_idproducto`),
  KEY `RVPR_idventa` (`RVPR_idventa`),
  CONSTRAINT `Rel_venta_producto_ibfk_1` FOREIGN KEY (`RVPR_idproducto`) REFERENCES `producto` (`PRO_id`),
  CONSTRAINT `Rel_venta_producto_ibfk_2` FOREIGN KEY (`RVPR_idventa`) REFERENCES `ventas_dulceria` (`VDU_idventa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_venta_producto`
--

LOCK TABLES `rel_venta_producto` WRITE;
/*!40000 ALTER TABLE `rel_venta_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `rel_venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rel_ventas_asientos`
--

DROP TABLE IF EXISTS `rel_ventas_asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rel_ventas_asientos` (
  `VAS_idventa` int(11) NOT NULL,
  `VAS_idasiento` int(11) NOT NULL,
  KEY `VAS_idventa` (`VAS_idventa`),
  KEY `VAS_idasiento` (`VAS_idasiento`),
  CONSTRAINT `Rel_ventas_asientos_ibfk_1` FOREIGN KEY (`VAS_idventa`) REFERENCES `ventas_ticket` (`VET_idventa`),
  CONSTRAINT `Rel_ventas_asientos_ibfk_2` FOREIGN KEY (`VAS_idasiento`) REFERENCES `rel_fun_asientos` (`RFA_idasiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rel_ventas_asientos`
--

LOCK TABLES `rel_ventas_asientos` WRITE;
/*!40000 ALTER TABLE `rel_ventas_asientos` DISABLE KEYS */;
INSERT INTO `rel_ventas_asientos` VALUES (2,48),(2,47),(3,44),(3,45),(4,44),(4,45),(5,44),(5,45),(6,44),(6,45),(7,44),(7,45),(8,41),(8,40),(9,48),(9,47),(10,48),(10,47),(11,42),(11,43),(12,42),(12,41),(13,46),(13,45),(14,34),(14,35),(15,33),(15,32),(16,30),(16,31),(17,20),(17,19),(18,18),(18,17),(19,24),(19,23),(20,36),(21,49),(21,50),(22,39),(22,40),(23,16),(23,15),(24,13),(24,14),(25,25),(26,12),(27,12),(28,10),(29,9),(30,8),(31,7),(32,6),(33,6),(34,5),(35,4),(36,5),(37,50),(38,48),(39,49),(40,49),(41,47),(41,46),(42,45),(43,44),(44,43),(45,41),(46,40),(47,39);
/*!40000 ALTER TABLE `rel_ventas_asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala_asientos`
--

DROP TABLE IF EXISTS `sala_asientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sala_asientos` (
  `SAS_idasiento` int(11) NOT NULL AUTO_INCREMENT,
  `SAS_asiento` varchar(4) NOT NULL,
  `SAS_sala` int(11) NOT NULL,
  PRIMARY KEY (`SAS_idasiento`),
  KEY `SAS_sala` (`SAS_sala`),
  CONSTRAINT `Sala_asientos_ibfk_1` FOREIGN KEY (`SAS_sala`) REFERENCES `salas` (`SAL_idsala`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala_asientos`
--

LOCK TABLES `sala_asientos` WRITE;
/*!40000 ALTER TABLE `sala_asientos` DISABLE KEYS */;
INSERT INTO `sala_asientos` VALUES (1,'A1',1),(2,'A2',1),(3,'A3',1),(4,'A4',1),(5,'A5',1),(6,'A6',1),(7,'A7',1),(8,'A8',1),(9,'A9',1),(10,'A10',1),(11,'A11',1),(12,'A12',1),(13,'B1',1),(14,'B2',1),(15,'B3',1),(16,'B4',1),(17,'B5',1),(18,'B6',1),(19,'B7',1),(20,'B8',1),(21,'B9',1),(22,'B10',1),(23,'B11',1),(24,'B12',1),(25,'C1',1),(26,'C2',1),(27,'C3',1),(28,'C4',1),(29,'C5',1),(30,'C6',1),(31,'C7',1),(32,'C8',1),(33,'C9',1),(34,'C10',1),(35,'C11',1),(36,'C12',1),(37,'D1',1),(38,'D2',1),(39,'D3',1),(40,'D4',1),(41,'D5',1),(42,'D6',1),(43,'D7',1),(44,'D8',1),(45,'D9',1),(46,'D10',1),(47,'D11',1),(48,'D12',1),(49,'D13',1),(50,'D14',1),(51,'A1',2),(52,'A2',2),(53,'A3',2),(54,'A4',2),(55,'A5',2),(56,'A6',2),(57,'A7',2),(58,'A8',2),(59,'A9',2),(60,'A10',2),(61,'A11',2),(62,'A12',2),(63,'B1',2),(64,'B2',2),(65,'B3',2),(66,'B4',2),(67,'B5',2),(68,'B6',2),(69,'B7',2),(70,'B8',2),(71,'B9',2),(72,'B10',2),(73,'B11',2),(74,'B12',2),(75,'C1',2),(76,'C2',2),(77,'C3',2),(78,'C4',2),(79,'C5',2),(80,'C6',2),(81,'C7',2),(82,'C8',2),(83,'C9',2),(84,'C10',2),(85,'C11',2),(86,'C12',2),(87,'D1',2),(88,'D2',2),(89,'D3',2),(90,'D4',2),(91,'D5',2),(92,'D6',2),(93,'D7',2),(94,'D8',2),(95,'D9',2),(96,'D10',2),(97,'D11',2),(98,'D12',2),(99,'D13',2),(100,'D14',2),(101,'A1',3),(102,'A2',3),(103,'A3',3),(104,'A4',3),(105,'A5',3),(106,'A6',3),(107,'A7',3),(108,'A8',3),(109,'A9',3),(110,'A10',3),(111,'A11',3),(112,'A12',3),(113,'B1',3),(114,'B2',3),(115,'B3',3),(116,'B4',3),(117,'B5',3),(118,'B6',3),(119,'B7',3),(120,'B8',3),(121,'B9',3),(122,'B10',3),(123,'B11',3),(124,'B12',3),(125,'C1',3),(126,'C2',3),(127,'C3',3),(128,'C4',3),(129,'C5',3),(130,'C6',3),(131,'C7',3),(132,'C8',3),(133,'C9',3),(134,'C10',3),(135,'C11',3),(136,'C12',3),(137,'D1',3),(138,'D2',3),(139,'D3',3),(140,'D4',3),(141,'D5',3),(142,'D6',3),(143,'D7',3),(144,'D8',3),(145,'D9',3),(146,'D10',3),(147,'D11',3),(148,'D12',3),(149,'D13',3),(150,'D14',3),(151,'A1',4),(152,'A2',4),(153,'A3',4),(154,'A4',4),(155,'A5',4),(156,'A6',4),(157,'A7',4),(158,'A8',4),(159,'A9',4),(160,'A10',4),(161,'A11',4),(162,'A12',4),(163,'B1',4),(164,'B2',4),(165,'B3',4),(166,'B4',4),(167,'B5',4),(168,'B6',4),(169,'B7',4),(170,'B8',4),(171,'B9',4),(172,'B10',4),(173,'B11',4),(174,'B12',4),(175,'C1',4),(176,'C2',4),(177,'C3',4),(178,'C4',4),(179,'C5',4),(180,'C6',4),(181,'C7',4),(182,'C8',4),(183,'C9',4),(184,'C10',4),(185,'C11',4),(186,'C12',4),(187,'D1',4),(188,'D2',4),(189,'D3',4),(190,'D4',4),(191,'D5',4),(192,'D6',4),(193,'D7',4),(194,'D8',4),(195,'D9',4),(196,'D10',4),(197,'D11',4),(198,'D12',4),(199,'D13',4),(200,'D14',4),(201,'A1',5),(202,'A2',5),(203,'A3',5),(204,'A4',5),(205,'A5',5),(206,'A6',5),(207,'A7',5),(208,'A8',5),(209,'A9',5),(210,'A10',5),(211,'A11',5),(212,'A12',5),(213,'B1',5),(214,'B2',5),(215,'B3',5),(216,'B4',5),(217,'B5',5),(218,'B6',5),(219,'B7',5),(220,'B8',5),(221,'B9',5),(222,'B10',5),(223,'B11',5),(224,'B12',5),(225,'C1',5),(226,'C2',5),(227,'C3',5),(228,'C4',5),(229,'C5',5),(230,'C6',5),(231,'C7',5),(232,'C8',5),(233,'C9',5),(234,'C10',5),(235,'C11',5),(236,'C12',5),(237,'D1',5),(238,'D2',5),(239,'D3',5),(240,'D4',5),(241,'D5',5),(242,'D6',5),(243,'D7',5),(244,'D8',5),(245,'D9',5),(246,'D10',5),(247,'D11',5),(248,'D12',5),(249,'D13',5),(250,'D14',5),(251,'A1',6),(252,'A2',6),(253,'A3',6),(254,'A4',6),(255,'A5',6),(256,'A6',6),(257,'A7',6),(258,'A8',6),(259,'A9',6),(260,'A10',6),(261,'A11',6),(262,'A12',6),(263,'B1',6),(264,'B2',6),(265,'B3',6),(266,'B4',6),(267,'B5',6),(268,'B6',6),(269,'B7',6),(270,'B8',6),(271,'B9',6),(272,'B10',6),(273,'B11',6),(274,'B12',6),(275,'C1',6),(276,'C2',6),(277,'C3',6),(278,'C4',6),(279,'C5',6),(280,'C6',6),(281,'C7',6),(282,'C8',6),(283,'C9',6),(284,'C10',6),(285,'C11',6),(286,'C12',6),(287,'D1',6),(288,'D2',6),(289,'D3',6),(290,'D4',6),(291,'D5',6),(292,'D6',6),(293,'D7',6),(294,'D8',6),(295,'D9',6),(296,'D10',6),(297,'D11',6),(298,'D12',6),(299,'D13',6),(300,'D14',6),(301,'A1',7),(302,'A2',7),(303,'A3',7),(304,'A4',7),(305,'A5',7),(306,'A6',7),(307,'A7',7),(308,'A8',7),(309,'A9',7),(310,'A10',7),(311,'A11',7),(312,'A12',7),(313,'B1',7),(314,'B2',7),(315,'B3',7),(316,'B4',7),(317,'B5',7),(318,'B6',7),(319,'B7',7),(320,'B8',7),(321,'B9',7),(322,'B10',7),(323,'B11',7),(324,'B12',7),(325,'C1',7),(326,'C2',7),(327,'C3',7),(328,'C4',7),(329,'C5',7),(330,'C6',7),(331,'C7',7),(332,'C8',7),(333,'C9',7),(334,'C10',7),(335,'C11',7),(336,'C12',7),(337,'D1',7),(338,'D2',7),(339,'D3',7),(340,'D4',7),(341,'D5',7),(342,'D6',7),(343,'D7',7),(344,'D8',7),(345,'D9',7),(346,'D10',7),(347,'D11',7),(348,'D12',7),(349,'D13',7),(350,'D14',7);
/*!40000 ALTER TABLE `sala_asientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `salas` (
  `SAL_idsala` int(11) NOT NULL AUTO_INCREMENT,
  `SAL_numerosala` int(11) NOT NULL,
  `SAL_idsucursal` int(11) NOT NULL,
  `SAL_cupo` int(11) NOT NULL,
  PRIMARY KEY (`SAL_idsala`),
  KEY `SAL_idsucursal` (`SAL_idsucursal`),
  CONSTRAINT `Salas_ibfk_1` FOREIGN KEY (`SAL_idsucursal`) REFERENCES `sucursal` (`SUC_idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,1,1,50),(2,2,1,50),(3,3,1,50),(4,4,1,50),(5,5,1,50),(6,1,2,50),(7,6,2,50),(8,2,2,50),(9,3,2,50),(10,4,2,50),(11,5,2,50),(12,1,3,50),(13,2,3,50),(14,3,3,50),(15,4,3,50),(16,5,3,50);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `size`
--

DROP TABLE IF EXISTS `size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `size` (
  `Idsize` int(11) NOT NULL AUTO_INCREMENT,
  `size_name` varchar(30) DEFAULT NULL,
  `cantidad` float DEFAULT NULL,
  `unidad_medida` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Idsize`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `size`
--

LOCK TABLES `size` WRITE;
/*!40000 ALTER TABLE `size` DISABLE KEYS */;
INSERT INTO `size` VALUES (1,'Chico',200,'gr'),(2,'Mediano',400,'gr'),(3,'Grande',600,'gr'),(4,'Chico',500,'ml'),(5,'Mediano',800,'ml'),(6,'Grande',1000,'ml'),(7,'Chico',41,'gr');
/*!40000 ALTER TABLE `size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sucursal` (
  `SUC_idsucursal` int(11) NOT NULL AUTO_INCREMENT,
  `SUC_nombre` varchar(30) NOT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`SUC_idsucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (1,'Cinema Azcapotzalco',1),(2,'Cinema Lomas Estrella',1),(3,'Cinema Iztapalapa',1);
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tipo_producto` (
  `id_tipo` int(11) NOT NULL,
  `nombre_tipo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Bebidas'),(2,'Comida'),(3,'Dulces');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuarios` (
  `USU_idtarjeta` decimal(16,0) NOT NULL,
  `USU_nombre` varchar(40) NOT NULL,
  `USU_ap` varchar(40) NOT NULL,
  `USU_am` varchar(40) NOT NULL,
  `USU_idnivel` int(11) NOT NULL,
  `USU_cumple` date DEFAULT NULL,
  `USU_correo` varchar(50) NOT NULL,
  `USU_contrasena` varbinary(16) DEFAULT NULL,
  `USU_status` int(11) DEFAULT NULL,
  `USU_puntos` int(11) NOT NULL,
  PRIMARY KEY (`USU_idtarjeta`),
  UNIQUE KEY `USU_correo` (`USU_correo`),
  KEY `USU_idnivel` (`USU_idnivel`),
  CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`USU_idnivel`) REFERENCES `niveles_tarjeta` (`NTA_idnivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (753135376193581,'Fernando','skywalker','Mcfly',1,'2020-12-18','fersky@hotmail.com',_binary '\ß\0\Ö%§ÆÇÑEÿ4',1,0),(1578288561973418,'Fernando','Delgadillo','JuÃÂÃÂ¡rez',1,'1997-08-13','fer@hotmail.com',_binary 'Ã\0Ã%Â§ÂÃÂÂ',1,0);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_dulceria`
--

DROP TABLE IF EXISTS `ventas_dulceria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas_dulceria` (
  `VDU_idventa` int(11) NOT NULL AUTO_INCREMENT,
  `VDU_idtarjeta` decimal(16,0) NOT NULL,
  `VDU_fecha` date NOT NULL,
  `VDU_total` float NOT NULL,
  `status_entrega` int(11) DEFAULT NULL,
  PRIMARY KEY (`VDU_idventa`),
  KEY `VDU_idtarjeta` (`VDU_idtarjeta`),
  CONSTRAINT `Ventas_dulceria_ibfk_1` FOREIGN KEY (`VDU_idtarjeta`) REFERENCES `usuarios` (`USU_idtarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_dulceria`
--

LOCK TABLES `ventas_dulceria` WRITE;
/*!40000 ALTER TABLE `ventas_dulceria` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas_dulceria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas_ticket`
--

DROP TABLE IF EXISTS `ventas_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ventas_ticket` (
  `VET_idventa` int(11) NOT NULL AUTO_INCREMENT,
  `VET_idfuncion` int(11) NOT NULL,
  `VET_idtarjeta` decimal(16,0) NOT NULL,
  `VET_fecha` date NOT NULL,
  `VET_total` float NOT NULL,
  PRIMARY KEY (`VET_idventa`),
  KEY `VET_idfuncion` (`VET_idfuncion`),
  KEY `VET_idtarjeta` (`VET_idtarjeta`),
  CONSTRAINT `Ventas_ticket_ibfk_1` FOREIGN KEY (`VET_idfuncion`) REFERENCES `funciones` (`FUN_idfuncion`),
  CONSTRAINT `Ventas_ticket_ibfk_2` FOREIGN KEY (`VET_idtarjeta`) REFERENCES `usuarios` (`USU_idtarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas_ticket`
--

LOCK TABLES `ventas_ticket` WRITE;
/*!40000 ALTER TABLE `ventas_ticket` DISABLE KEYS */;
INSERT INTO `ventas_ticket` VALUES (1,25,1578288561973418,'2020-08-07',0),(2,25,1578288561973418,'2020-08-07',108),(3,25,1578288561973418,'2020-08-07',108),(4,25,1578288561973418,'2020-08-07',108),(5,25,1578288561973418,'2020-08-07',108),(6,25,1578288561973418,'2020-08-07',108),(7,25,1578288561973418,'2020-08-07',108),(8,25,1578288561973418,'2020-08-07',108),(9,27,1578288561973418,'2020-08-12',120),(10,27,1578288561973418,'2020-08-12',120),(11,27,1578288561973418,'2020-08-12',120),(12,27,1578288561973418,'2020-08-12',120),(13,27,1578288561973418,'2020-08-17',120),(14,27,1578288561973418,'2020-08-17',120),(15,27,1578288561973418,'2020-08-17',120),(16,27,1578288561973418,'2020-08-17',120),(17,27,1578288561973418,'2020-08-17',120),(18,27,1578288561973418,'2020-08-17',120),(19,27,1578288561973418,'2020-08-18',90),(20,27,1578288561973418,'2020-08-18',45),(21,27,1578288561973418,'2020-08-18',90),(22,27,1578288561973418,'2020-08-18',90),(23,27,1578288561973418,'2020-08-18',90),(24,27,1578288561973418,'2020-08-21',108),(25,27,1578288561973418,'2020-08-21',54),(26,27,1578288561973418,'2020-08-21',54),(27,27,1578288561973418,'2020-08-21',54),(28,27,1578288561973418,'2020-08-21',54),(29,27,1578288561973418,'2020-08-21',54),(30,27,1578288561973418,'2020-08-21',54),(31,27,1578288561973418,'2020-08-21',54),(32,27,1578288561973418,'2020-08-21',54),(33,27,1578288561973418,'2020-08-22',60),(34,27,1578288561973418,'2020-08-22',60),(35,27,1578288561973418,'2020-08-22',60),(36,27,1578288561973418,'2020-08-22',60),(37,26,1578288561973418,'2020-08-22',60),(38,26,1578288561973418,'2020-08-22',60),(39,26,1578288561973418,'2020-08-22',60),(40,26,1578288561973418,'2020-08-22',60),(41,26,1578288561973418,'2020-08-22',120),(42,26,1578288561973418,'2020-08-22',60),(43,26,1578288561973418,'2020-08-22',60),(44,26,1578288561973418,'2020-08-22',60),(45,26,1578288561973418,'2020-08-22',60),(46,26,1578288561973418,'2020-08-22',60),(47,26,1578288561973418,'2020-08-22',60);
/*!40000 ALTER TABLE `ventas_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cinemat'
--

--
-- Dumping routines for database 'cinemat'
--
/*!50003 DROP PROCEDURE IF EXISTS `insertar_funcion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `insertar_funcion`(in idpelicula int , in idsucursal int , in hora time , in dia date ,  in formato int , in idioma int, IN sala int)
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE idAsiento INT;
    DECLARE dispSala int ;
    declare dispDia date;
    DECLARE dispHora time;
    DECLARE bandera int;
    declare dispSucursal int;
	DECLARE cur1 CURSOR FOR select SAS_idasiento from sala_asientos where SAS_sala = sala;
    DECLARE cur2 CURSOR FOR  select SAL_idsala,FUN_hora,FUN_dia,FUN_idsucursal from salas d inner join  sala_asientos a on d.SAL_idsala =a.SAS_sala
	inner join rel_fun_asientos  b on a.SAS_idasiento =b.RFA_idasiento
	inner join funciones c on b.RFA_idfuncion=c.FUN_idfuncion group by  SAL_idsala,FUN_hora,FUN_dia,FUN_idsucursal;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    SET bandera = 0;/*AUN NO SE VALIDA QUE SE REPITA LA FUNCIÃÂN*/

	OPEN cur2;/*NOS SIRVE PARA SABER SI SE EMPALMA CON ALGÃÂNA FUNCIÃÂN*/
    BEGIN
	  DECLARE exit_flag INT DEFAULT 0;
      DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET exit_flag = 1;
		read_loop:LOOP
			FETCH cur2 INTO dispSala, dispHora, dispDia,dispSucursal;
            IF exit_flag THEN LEAVE read_loop;
            END IF;
			IF (dispSala = sala and dispHora=hora and dispDia=dia and dispSucursal=idsucursal) then 
				SET bandera=1;/*CON UNA FUNCIÃÂN QUE SE EMPALME ES MAS QUE SUFICIENTE*/
				LEAVE read_loop;/*ya con una funciÃÂ³n que haya empalmado entonces se cierra el ciclo*/
			END IF;
		END LOOP;
    END;
    CLOSE cur2;
    
    OPEN cur1;
    BEGIN
    DECLARE exit_flag INT DEFAULT 0;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET exit_flag = 1;
    IF bandera != 1 THEN /*SI ES DIFERENTE A 1 ENTONCES NO SE EMPALMA Y PODEMOS CREAR LA FUNCIÃÂN*/
		set @maximo=(select max(FUN_idfuncion) from funciones)+1;
		/*Necesitamos el idfuncion que el proc lo guarde en una variable con la funciÃÂÃÂ³n de agregado MAX*/
        /*SE INSERTA LA FUNCIÃÂN*/
		INSERT INTO funciones (FUN_idfuncion , FUN_idpelicula ,  FUN_idsucursal, FUN_hora, FUN_dia, FUN_idformato, FUN_ididioma )
		VALUES ( @maximo, idpelicula, idsucursal , hora , dia , formato , idioma);
        
        
		/*AQUI SE INSERTAN LOS ASIENTOS*/
		insertAsientoLoop: LOOP
			FETCH cur1 INTO idAsiento;
			IF exit_flag THEN LEAVE insertAsientoLoop;
            END IF;
			insert into rel_fun_asientos values(idAsiento,@maximo,0);
		END LOOP;            
	ELSE 
		select 'Sala ocupada';
    END IF;
    END;
    CLOSE cur1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_ALTA_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_ALTA_USUARIO`(
								IN tarjeta decimal(16),
                                IN nombre varchar(40),
                                IN ap varchar(40),
                                IN am varchar(40),
                                IN cumple date,
                                IN correo varchar(50),
                                IN contrasena varchar(16)
                                )
begin
	SET @estado = (select USU_status from usuarios where USU_correo = correo);
	if (@estado is null)then /*el estado es nulo osea no existe el correo por lo tanto podemos ingresar';*/
		SELECT 3 as alta;
        INSERT INTO usuarios(USU_idtarjeta,USU_nombre,USU_ap,USU_am,USU_idnivel,USU_cumple,USU_correo,USU_contrasena,USU_status,USU_puntos)
		values(tarjeta,nombre,ap,am,1,cumple,correo, AES_ENCRYPT(contrasena,'/Rw0/]_R}Xj,Cs(['),1,0);
	else
		if  @estado = 0
			then /* 'existe el correo pero tiene status 0';*/
            SELECT 1 as alta;
		else /* 'el correo existe y esta activo';*/
			SELECT 2 as alta;
		end if;
END IF;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_COMBOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_COMBOS`()
BEGIN
	select * from combos where COMBO_status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_DISPO_ASIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_DISPO_ASIENTO`(IN idasiento int, IN idfuncion int)
BEGIN 
		set @disponibilidad=(select RFA_disponible from rel_fun_asientos where RFA_idasiento=idasiento and RFA_idfuncion=idfuncion);
        
        if @disponibilidad = 1 then 
			select 1 as disponible;
            
			else if @disponibilidad = 0 then 
				select 0 as disponible;
			end if;
        END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_FORMATOS_ACTIVOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_FORMATOS_ACTIVOS`()
BEGIN
	SELECT FOR_idformato as id, FOR_nombre as name FROM formatos where status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_FORMATO_PRECIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_FORMATO_PRECIO`(IN id_funcion int )
begin 
		select FOR_nombre as Formato, FOR_precio as Precio  from formatos fo
        inner join funciones fu on fu.FUN_idformato = fo.FOR_idformato  where fu.FUN_idfuncion=id_funcion;
 end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_IDIOMAS_ACTIVOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_IDIOMAS_ACTIVOS`()
BEGIN
	select IDI_id as ID, IDI_nombre as Nombre, IDI_status as Estatus  
    from idiomas WHERE IDI_status = 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_INFO_BOLETO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_INFO_BOLETO`(IN id_funcion INT, IN id_asiento INT)
BEGIN
	select SAL_numerosala as NombreSala,PEL_nombre as pelicula, SAS_asiento as nombreasiento, FUN_hora as hora,FUN_dia as dia
	from funciones f 
	inner join rel_fun_asientos rf
	ON f.FUN_idfuncion = rf.RFA_idfuncion
	inner join sala_asientos sa
	ON rf.RFA_idasiento = sa.SAS_idasiento
	inner join salas s
	ON sa.SAS_sala = s.SAL_idsala
	inner join peliculas p
	ON f.FUN_idpelicula = p.PEL_idpelicula
	where f.FUN_idfuncion = id_funcion and rf.RFA_idasiento = id_asiento;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_LIBERAR_LUGAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_LIBERAR_LUGAR`(IN id_funcion int, IN id_asiento int)
BEGIN
	update rel_fun_asientos
	set RFA_disponible = 0
	where RFA_idfuncion = id_funcion and RFA_idasiento = id_asiento;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_LOGIN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_LOGIN`(IN correo varchar(50), IN pass varchar(20))
begin
SELECT * FROM usuarios where USU_correo = correo and  USU_contrasena = AES_ENCRYPT(pass,'/Rw0/]_R}Xj,Cs([') and USU_status = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_OBTENER_ASIENTOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_OBTENER_ASIENTOS`(IN funcion int )
BEGIN
select SAS_idasiento,SAS_asiento, RFA_disponible  
from rel_fun_asientos 
inner join sala_asientos  on SAS_idasiento = RFA_idasiento 
where funcion= RFA_idfuncion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_OPCIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_OPCIONES`()
BEGIN
	select * from opciones_productos order by nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_PELICULAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_PELICULAS`()
BEGIN
SELECT PEL_idpelicula as ID, PEL_nombre as Nombre FROM peliculas;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_PELICULAS_ESTRENO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE PROCEDURE `P_PELICULAS_ESTRENO`()
begin
	select * from peliculas order by PEL_fechaestreno DESC Limit 4 ;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_PRODUCTOS_TIPO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_PRODUCTOS_TIPO`(tipo int)
BEGIN
	select PRO_id, PRO_nombre, PRO_precio,size_name,img from producto p
	inner join size s
	on p.id_tam = idsize
	where id_tipo = tipo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_PROMO_DIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_PROMO_DIA`( in dia int)
begin 
    
	select PRO_nombre as Nombre ,PRO_descuento as Descuento from promociones
    where PRO_dia = dia  and PRO_status = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_RESERVAR_LUGAR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_RESERVAR_LUGAR`(IN id_funcion int, IN id_asiento int)
BEGIN
	update rel_fun_asientos
	set RFA_disponible = 1
	where RFA_idfuncion = id_funcion and RFA_idasiento = id_asiento;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_SALA_DISPONIBILIDAD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_SALA_DISPONIBILIDAD`(IN funcion int )
begin
set @ocupado= (select SUM(RFA_disponible) as asientosOcupados from  rel_fun_asientos where RFA_idfuncion = funcion)
;
set @disponibles =50- @ocupado;

if @disponibles =0 then
select '1' as Status;

else if  @disponibles >0 then 
select '0' as Status;
end if ;
end if; 

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_SUCURSALES_ACTIVAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_SUCURSALES_ACTIVAS`()
BEGIN
	select SUC_idsucursal as id, SUC_nombre as name from sucursal where status = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_TIPOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_TIPOS`()
BEGIN
	SELECT * FROM tipo_producto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_VENTA_ASIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_VENTA_ASIENTO`( IN idVenta int, IN idAsiento int, IN idFuncion int)
begin
     insert into rel_ventas_asientos values(idVenta, idAsiento);
     
     update rel_fun_Asientos set RFA_disponible = 1
     where RFA_idAsiento = idAsiento and RFA_idfuncion =idFuncion;
     
     select 1 as Status;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `P_VENTA_TICKET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `P_VENTA_TICKET`(in idFuncion int, in idTarjeta decimal(16,0), in total float)
begin

set @maximo=(select max(VET_idventa) from ventas_ticket)+1;
set @fechaActual=(select curdate());

insert into ventas_ticket values(@maximo,idfuncion,idTarjeta,@fechaActual,total);
select @maximo as idVenta;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-26 22:05:52
