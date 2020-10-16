-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Hotel
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Habitaciones`
--

DROP TABLE IF EXISTS `Habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Habitaciones` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_de_Habitacion` varchar(30) DEFAULT NULL,
  `Cantidad_de_mascotas` int(11) DEFAULT NULL,
  `Precio_por_dia_USD$` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Habitaciones`
--

LOCK TABLES `Habitaciones` WRITE;
/*!40000 ALTER TABLE `Habitaciones` DISABLE KEYS */;
INSERT INTO `Habitaciones` VALUES (1,'Suite',1,34),(2,'Suite',2,51),(3,'Suite',3,68),(4,'Junior Suite',1,31),(5,'Junior Suite',2,46),(6,'Junior Suite',3,62),(7,'Mini Suite',1,31),(8,'Mini Suite',2,47),(9,'Mini Suite',3,62),(10,'Estandar',1,28),(11,'Estandar',2,40),(12,'Estandar',3,56);
/*!40000 ALTER TABLE `Habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mascotas`
--

DROP TABLE IF EXISTS `Mascotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mascotas` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(30) DEFAULT NULL,
  `Duenio` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mascotas`
--

LOCK TABLES `Mascotas` WRITE;
/*!40000 ALTER TABLE `Mascotas` DISABLE KEYS */;
INSERT INTO `Mascotas` VALUES (1,'Pepe','Duenio 1'),(2,'Beto','Duenio 2'),(3,'Beto','Duenio 3');
/*!40000 ALTER TABLE `Mascotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservas`
--

DROP TABLE IF EXISTS `Reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tipo_de_Habitacion` varchar(30) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Cantidad_de_mascotas` int(11) DEFAULT NULL,
  `Dia_de_la_reserva` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservas`
--

LOCK TABLES `Reservas` WRITE;
/*!40000 ALTER TABLE `Reservas` DISABLE KEYS */;
INSERT INTO `Reservas` VALUES (1,'Estandar','Alvaro',3,'2020-10-08'),(2,'Junior Suite','Beto',1,'2020-10-15'),(3,'Mini Suite','Pepe',2,'2020-12-19'),(4,'Mini Suite','Pepe',2,'2020-12-19'),(5,'Suite','Danilo',2,'2020-11-12'),(6,'Junior Suite','Paola',3,'2020-12-15'),(7,'Estandar','Carlito',3,'2020-11-18'),(8,'Suite','Laura',2,'2020-10-25'),(9,'Mini Suite','Jorge',3,'2020-10-18'),(10,'Mini Suite','Pablo',2,'2020-01-13'),(11,'Junior Suite','Robert',2,'2020-10-13'),(12,'Mini Suite','Pablito',4,'2020-10-15'),(13,'Estandar','KIKO',2,'2020-10-16'),(14,'Junior Suite','Juan',2,'2020-10-13'),(15,'Suite','Oscar',3,'2020-10-13'),(16,'Suite','Gerardo',2,'2020-10-08'),(17,'Suite','Fabricio',3,'2020-10-13'),(18,'Suite','Felipe',2,'2020-10-13'),(19,'Suite','Paola',3,'2020-10-14'),(20,'Junior Suite','Facundo',2,'2020-10-14');
/*!40000 ALTER TABLE `Reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Traslados`
--

DROP TABLE IF EXISTS `Traslados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Traslados` (
  `Días` varchar(20) DEFAULT NULL,
  `1er_Turno_inicio` time NOT NULL,
  `1er_Turno_fin` time NOT NULL,
  `2do_Turno_inicio` time NOT NULL,
  `2do_Turno_fin` time NOT NULL,
  `3er_Turno_inicio` time NOT NULL,
  `3er_Turno_fin` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Traslados`
--

LOCK TABLES `Traslados` WRITE;
/*!40000 ALTER TABLE `Traslados` DISABLE KEYS */;
INSERT INTO `Traslados` VALUES ('Lunes','11:20:00','13:00:00','14:00:00','16:30:00','17:00:00','19:00:00'),('Martes','11:00:00','13:00:00','14:00:00','16:30:00','17:00:00','19:00:00'),('Miércoles','11:00:00','13:00:00','14:00:00','16:30:00','17:00:00','19:00:00'),('Jueves','11:00:00','13:00:00','14:00:00','16:30:00','17:00:00','19:00:00'),('Viernes','11:00:00','13:00:00','14:00:00','16:30:00','17:00:00','19:00:00');
/*!40000 ALTER TABLE `Traslados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Traslados_clientes`
--

DROP TABLE IF EXISTS `Traslados_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Traslados_clientes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Cantidad_de_mascotas` int(11) DEFAULT NULL,
  `Horarios_traslados` time DEFAULT NULL,
  `Tiempo_del_recorrido` time DEFAULT NULL,
  `Destino` varchar(30) DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Traslados_clientes`
--

LOCK TABLES `Traslados_clientes` WRITE;
/*!40000 ALTER TABLE `Traslados_clientes` DISABLE KEYS */;
INSERT INTO `Traslados_clientes` VALUES (2,2,'15:20:00','00:50:00','Barros Blancos','2020-10-13'),(3,2,'15:15:00','00:55:00','Lavalleja','2020-12-23'),(5,3,'13:50:00','00:20:00','8 de Octubre','2020-10-13'),(6,3,'18:30:00','00:20:00','Propios','2020-10-13'),(7,2,'14:00:00','00:30:00','La Paz 2008','2020-10-14'),(8,2,'09:00:00','01:20:00','Pando','2020-10-16'),(9,3,'17:00:00','02:00:00','San Jose','2020-10-16');
/*!40000 ALTER TABLE `Traslados_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `User` char(80) NOT NULL,
  `Password` char(41) DEFAULT NULL,
  PRIMARY KEY (`User`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES ('gerente','gerente2020'),('oficinista','oficinista2020'),('recepcionista','recepcionista2020');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-16  4:39:07
