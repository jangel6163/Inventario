CREATE DATABASE  IF NOT EXISTS `bd_inventariofree` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_inventariofree`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_inventariofree
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contador_entradas`
--

DROP TABLE IF EXISTS `contador_entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contador_entradas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contador_entradas`
--

LOCK TABLES `contador_entradas` WRITE;
/*!40000 ALTER TABLE `contador_entradas` DISABLE KEYS */;
/*!40000 ALTER TABLE `contador_entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrada` (
  `ent_id` int NOT NULL AUTO_INCREMENT,
  `ent_factura` varchar(30) DEFAULT NULL,
  `ent_pro_codigo` varchar(10) DEFAULT NULL,
  `ent_fecha` date NOT NULL,
  `ent_cantidad` int NOT NULL,
  PRIMARY KEY (`ent_id`),
  KEY `ent_pro_codigo` (`ent_pro_codigo`),
  CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`ent_pro_codigo`) REFERENCES `producto` (`pro_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (20,'001','NU006','2023-11-11',24),(22,'002','NU008','2023-11-04',76),(23,'003','NU011','2023-11-11',80),(24,'004','NU021','2023-11-11',87),(25,'005','NU021','2023-11-11',90),(26,'006','NU006','2023-11-11',90),(27,'007','NU022','2023-11-11',40),(28,'008','NU021','2023-11-11',100),(29,'009','NU015','2023-11-11',100),(30,'010','NU048','2023-11-12',12);
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `INVENTARIO_AI` AFTER INSERT ON `entrada` FOR EACH ROW UPDATE inventario SET inv_stock = inv_stock+NEW.ent_cantidad, inv_entradas = inv_entradas+NEW.ent_cantidad where inv_pro_codigo = NEW.ent_pro_codigo */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `inv_pro_codigo` varchar(10) NOT NULL,
  `inv_entradas` int DEFAULT '0',
  `inv_salidas` int DEFAULT '0',
  `inv_stock` int DEFAULT '0',
  PRIMARY KEY (`inv_pro_codigo`),
  CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`inv_pro_codigo`) REFERENCES `producto` (`pro_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES ('NU001',75,25,50),('NU002',100,50,50),('NU003',25,0,25),('NU004',67,0,67),('NU005',50,0,50),('NU006',114,40,74),('NU007',25,0,25),('NU008',150,0,150),('NU009',0,0,0),('NU010',168,0,168),('NU011',80,0,80),('NU012',128,0,128),('NU013',30,0,30),('NU014',0,0,0),('NU015',100,50,50),('NU016',0,0,0),('NU017',0,0,0),('NU018',96,5,91),('NU019',55,0,55),('NU020',20,0,20),('NU021',277,113,164),('NU022',40,0,40),('NU023',0,0,0),('NU024',0,0,0),('NU025',0,0,0),('NU026',0,0,0),('NU027',0,0,0),('NU028',0,0,0),('NU029',0,0,0),('NU030',0,0,0),('NU031',0,0,0),('NU032',0,0,0),('NU033',0,0,0),('NU034',0,0,0),('NU035',0,0,0),('NU036',0,0,0),('NU037',0,0,0),('NU038',0,0,0),('NU039',0,0,0),('NU040',0,0,0),('NU041',0,0,0),('NU042',0,0,0),('NU043',0,0,0),('NU044',0,0,0),('NU045',0,0,0),('NU046',0,0,0),('NU047',0,0,0),('NU048',12,0,12),('NU049',0,0,0),('NU050',0,0,0),('NU051',0,0,0),('NU052',0,0,0),('NU053',0,0,0),('NU054',0,0,0),('NU055',0,0,0),('NU056',0,0,0);
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `pro_codigo` varchar(10) NOT NULL,
  `pro_descripcion` varchar(150) NOT NULL,
  PRIMARY KEY (`pro_codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('NU001','Bolsas de suspensión '),('NU002','Aeradores'),('NU003','Líquido para quitar pintura'),('NU004','Pintura para chasis en aluminio'),('NU005','Balatas'),('NU006','Ejes '),('NU007','Tornillos de 5Ta'),('NU008','Tornillos capados de base tacón'),('NU009','Conectores de PVC'),('NU010','Aceite de motor'),('NU011','Llantas'),('NU012','Fibra de vidrio'),('NU013','Fusible de marcador'),('NU014','Espejo lateral retrovisor'),('NU015','Espejo Concavo'),('NU016','Tuerca 11R24.5'),('NU017','Tuerca de yugo'),('NU018','Yoyos de balatas'),('NU019','Manguera para agua'),('NU020','Manguera para soplador'),('NU021','Bridas'),('NU022','Resina para rellenar (para fibra de vidrio)'),('NU023','Empaque para DOMO'),('NU024','Empaque para flecha'),('NU025','Empaque para valvulas'),('NU026','Faro (luz) de baja/alta intensidad'),('NU027','Faro Revesero'),('NU028','Faro Neblinero'),('NU029','Acumuladores LTH'),('NU030','Hules de “manitas”'),('NU031','Birlos para llantas'),('NU032','Grasa de Mazas (para el soplador)'),('NU033','Matraca fina'),('NU034','Perno de pivote'),('NU035','Plafón ámbar'),('NU036','Conectores varios (por ejemplo, para plafones)'),('NU037','Filtros para Diesel'),('NU038','Rines para llantas'),('NU039','Alarmas de reversa'),('NU040','Bujes trifuncionales'),('NU041','Válvulas de “x” pulgadas'),('NU042','Mariposas cono'),('NU043','Tapa roscable'),('NU044','Masa para soldar'),('NU045','Silenciador de ruido'),('NU046','Bandas de abanico'),('NU047','Filtros (varios)'),('NU048','Tacones de motor'),('NU049','Materiales de limpieza (varios, trapos de cuero, Liquido limpiador, etc)'),('NU050','Sella-fugas'),('NU051','Muelles de gancho'),('NU052','Limpiaparabrisas'),('NU053','Plumas para limpiaparabrisas'),('NU054','Alternador de carro'),('NU055','Casquillos Biela y de árbol'),('NU056','Balancines');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salida`
--

DROP TABLE IF EXISTS `salida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salida` (
  `sal_id` int NOT NULL AUTO_INCREMENT,
  `sal_factura` varchar(30) DEFAULT NULL,
  `sal_pro_codigo` varchar(10) DEFAULT NULL,
  `sal_fecha` date NOT NULL,
  `sal_cantidad` int NOT NULL,
  PRIMARY KEY (`sal_id`),
  KEY `sal_pro_codigo` (`sal_pro_codigo`),
  CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`sal_pro_codigo`) REFERENCES `producto` (`pro_codigo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salida`
--

LOCK TABLES `salida` WRITE;
/*!40000 ALTER TABLE `salida` DISABLE KEYS */;
INSERT INTO `salida` VALUES (3,'001','NU015','2023-11-11',50),(4,'002','NU006','2023-11-11',40),(5,'003','NU021','2023-11-11',100),(6,'004','NU021','2023-11-12',13),(7,'005','NU018','2023-11-13',5);
/*!40000 ALTER TABLE `salida` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `INVENTARIO_S_AI` AFTER INSERT ON `salida` FOR EACH ROW UPDATE inventario SET inv_stock = inv_stock-NEW.sal_cantidad, inv_salidas = inv_salidas+NEW.sal_cantidad where inv_pro_codigo = NEW.sal_pro_codigo */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bd_inventariofree'
--

--
-- Dumping routines for database 'bd_inventariofree'
--
/*!50003 DROP PROCEDURE IF EXISTS `NUEVO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `NUEVO_PRODUCTO`(`CODIGO` VARCHAR(10))
INSERT INTO inventario (inv_pro_codigo) VALUES (CODIGO) ;;
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

-- Dump completed on 2023-11-13 14:28:47
