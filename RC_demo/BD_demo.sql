-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_demo
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `cliente_id` int NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `estado_civil` varchar(20) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'María','González','1985-03-15','F','Casada','Av. Principal 123','Ciudad de México','México'),(2,'Carlos','Rodríguez','1990-07-22','M','Soltero','Calle Real 456','Guadalajara','México'),(3,'Ana','Martínez','1988-11-30','F','Divorciada','Paseo de los Robles 789','Monterrey','México'),(4,'Javier','López','1982-05-10','M','Casado','Boulevard Sur 234','Puebla','México');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditos`
--

DROP TABLE IF EXISTS `creditos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditos` (
  `credito_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `tipo_credito` varchar(50) DEFAULT NULL,
  `monto_solicitado` decimal(10,2) DEFAULT NULL,
  `plazo_meses` int DEFAULT NULL,
  `tasa_interes` decimal(5,2) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `estado_credito` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`credito_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `creditos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditos`
--

LOCK TABLES `creditos` WRITE;
/*!40000 ALTER TABLE `creditos` DISABLE KEYS */;
INSERT INTO `creditos` VALUES (1,1,'Crédito Personal',200000.00,48,12.50,'2024-01-15','Aprobado'),(2,2,'Crédito Automotriz',350000.00,60,11.80,'2024-02-20','En Revisión'),(3,3,'Crédito Hipotecario',1500000.00,240,9.50,'2024-03-10','Aprobado'),(4,4,'Línea de Crédito',100000.00,36,14.20,'2024-04-05','Rechazado');
/*!40000 ALTER TABLE `creditos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluacionriesgo`
--

DROP TABLE IF EXISTS `evaluacionriesgo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacionriesgo` (
  `evaluacion_id` int NOT NULL,
  `credito_id` int DEFAULT NULL,
  `nivel_riesgo` varchar(20) DEFAULT NULL,
  `probabilidad_default` decimal(5,2) DEFAULT NULL,
  `comentarios` text,
  `fecha_evaluacion` date DEFAULT NULL,
  PRIMARY KEY (`evaluacion_id`),
  KEY `credito_id` (`credito_id`),
  CONSTRAINT `evaluacionriesgo_ibfk_1` FOREIGN KEY (`credito_id`) REFERENCES `creditos` (`credito_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacionriesgo`
--

LOCK TABLES `evaluacionriesgo` WRITE;
/*!40000 ALTER TABLE `evaluacionriesgo` DISABLE KEYS */;
INSERT INTO `evaluacionriesgo` VALUES (1,1,'Bajo',0.05,'Cliente con buen historial crediticio y ingresos estables','2024-01-20'),(2,2,'Medio',0.15,'Historial crediticio limitado, requiere seguimiento','2024-02-25'),(3,3,'Bajo',0.03,'Cliente con excelente puntaje crediticio y garantía sólida','2024-03-15'),(4,4,'Alto',0.35,'Puntaje crediticio bajo y sin garantías','2024-04-10');
/*!40000 ALTER TABLE `evaluacionriesgo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantias`
--

DROP TABLE IF EXISTS `garantias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantias` (
  `garantia_id` int NOT NULL,
  `credito_id` int DEFAULT NULL,
  `tipo_garantia` varchar(50) DEFAULT NULL,
  `valor_garantia` decimal(10,2) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`garantia_id`),
  KEY `credito_id` (`credito_id`),
  CONSTRAINT `garantias_ibfk_1` FOREIGN KEY (`credito_id`) REFERENCES `creditos` (`credito_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantias`
--

LOCK TABLES `garantias` WRITE;
/*!40000 ALTER TABLE `garantias` DISABLE KEYS */;
INSERT INTO `garantias` VALUES (1,1,'Fondos de Inversión',250000.00,'Portafolio de inversiones como garantía'),(2,2,'Vehículo',400000.00,'Automóvil modelo 2022 como garantía'),(3,3,'Propiedad Inmobiliaria',2000000.00,'Casa habitación en zona residencial'),(4,4,'Sin Garantía',0.00,'Crédito sin garantía adicional');
/*!40000 ALTER TABLE `garantias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historialcrediticio`
--

DROP TABLE IF EXISTS `historialcrediticio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historialcrediticio` (
  `historial_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `puntaje_crediticio` int DEFAULT NULL,
  `numero_creditos_activos` int DEFAULT NULL,
  `numero_creditos_cerrados` int DEFAULT NULL,
  `deuda_total` decimal(10,2) DEFAULT NULL,
  `morosidad_maxima` int DEFAULT NULL,
  PRIMARY KEY (`historial_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `historialcrediticio_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historialcrediticio`
--

LOCK TABLES `historialcrediticio` WRITE;
/*!40000 ALTER TABLE `historialcrediticio` DISABLE KEYS */;
INSERT INTO `historialcrediticio` VALUES (1,1,750,2,1,150000.00,0),(2,2,680,1,0,75000.00,1),(3,3,820,3,2,300000.00,0),(4,4,590,1,1,50000.00,2);
/*!40000 ALTER TABLE `historialcrediticio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `ingreso_id` int NOT NULL,
  `cliente_id` int DEFAULT NULL,
  `tipo_empleo` varchar(50) DEFAULT NULL,
  `ocupacion` varchar(100) DEFAULT NULL,
  `ingreso_mensual` decimal(10,2) DEFAULT NULL,
  `antiguedad_empleo` int DEFAULT NULL,
  PRIMARY KEY (`ingreso_id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (1,1,'Empleado','Ingeniera de Sistemas',65000.00,6),(2,2,'Independiente','Consultor de Marketing',55000.00,4),(3,3,'Empleado','Abogada',75000.00,8),(4,4,'Empleado','Gerente de Ventas',85000.00,10);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bd_demo'
--

--
-- Dumping routines for database 'bd_demo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-27 15:58:38
