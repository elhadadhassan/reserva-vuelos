-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_reserva_vuelos
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aerolinea`
--

DROP TABLE IF EXISTS `aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre_aerolinea` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea`
--

LOCK TABLES `aerolinea` WRITE;
/*!40000 ALTER TABLE `aerolinea` DISABLE KEYS */;
INSERT INTO `aerolinea` VALUES (1,'Aerolíneas Argentinas'),(2,'American Airlines'),(3,'Avianca'),(4,'Iberia'),(5,'Japan Airlines'),(6,'Latam'),(7,'Qatar Airways'),(8,'Royal Air Maroc'),(9,'Singapore Airlines'),(10,'Turkish Airlines');
/*!40000 ALTER TABLE `aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aerolinea_aud`
--

DROP TABLE IF EXISTS `aerolinea_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolinea_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `nombre_aerolinea` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKare3bxid6inj0map9pt3onu1g` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolinea_aud`
--

LOCK TABLES `aerolinea_aud` WRITE;
/*!40000 ALTER TABLE `aerolinea_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `aerolinea_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(255) DEFAULT NULL,
  `nombre_aeropuerto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES (1,'Madrid','Adolfo Suárez Barajas'),(2,'Agadir','Al Massira'),(3,'Mendoza','Governor Francisco Gabrielli'),(4,'Buenos Aires','Ministro Pistarini Ezeiza'),(5,'Casablanca','Mohammed V'),(6,'Agadir','Al Massira');
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto_aerolinea`
--

DROP TABLE IF EXISTS `aeropuerto_aerolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto_aerolinea` (
  `id_aerolinea` bigint NOT NULL,
  `id_aeropuerto` bigint NOT NULL,
  KEY `FK83256y1tow9x5shlpa77tfske` (`id_aeropuerto`),
  KEY `FKnxgxn1v5s4y9bwoevhfs4790o` (`id_aerolinea`),
  CONSTRAINT `FK83256y1tow9x5shlpa77tfske` FOREIGN KEY (`id_aeropuerto`) REFERENCES `aeropuerto` (`id`),
  CONSTRAINT `FKnxgxn1v5s4y9bwoevhfs4790o` FOREIGN KEY (`id_aerolinea`) REFERENCES `aerolinea` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto_aerolinea`
--

LOCK TABLES `aeropuerto_aerolinea` WRITE;
/*!40000 ALTER TABLE `aeropuerto_aerolinea` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeropuerto_aerolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto_aerolinea_aud`
--

DROP TABLE IF EXISTS `aeropuerto_aerolinea_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto_aerolinea_aud` (
  `rev` bigint NOT NULL,
  `id_aerolinea` bigint NOT NULL,
  `id_aeropuerto` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_aerolinea`,`rev`,`id_aeropuerto`),
  KEY `FKgj6prq50pvn6clqc2w4a63k4e` (`rev`),
  CONSTRAINT `FKgj6prq50pvn6clqc2w4a63k4e` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto_aerolinea_aud`
--

LOCK TABLES `aeropuerto_aerolinea_aud` WRITE;
/*!40000 ALTER TABLE `aeropuerto_aerolinea_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeropuerto_aerolinea_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto_aud`
--

DROP TABLE IF EXISTS `aeropuerto_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `nombre_aeropuerto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK1cuu0dlpbfgnsvenklp5xeijs` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto_aud`
--

LOCK TABLES `aeropuerto_aud` WRITE;
/*!40000 ALTER TABLE `aeropuerto_aud` DISABLE KEYS */;
INSERT INTO `aeropuerto_aud` VALUES (1,1,0,'Madrid','Adolfo Suárez Barajas'),(2,1,0,'Agadir','Al Massira'),(3,2,0,'Mendoza','Governor Francisco Gabrielli'),(4,2,0,'Buenos Aires','Ministro Pistarini Ezeiza'),(5,3,0,'Casablanca','Mohammed V'),(6,3,0,'Agadir','Al Massira');
/*!40000 ALTER TABLE `aeropuerto_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `clase_asiento` enum('BUSINESS','ECONOMY','TURISTA') DEFAULT NULL,
  `fila_asiento` int DEFAULT NULL,
  `letra_asiento` varchar(255) DEFAULT NULL,
  `numero_avion` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpgj7fku97fj7gx5ouna1t379e` (`numero_avion`),
  CONSTRAINT `FKpgj7fku97fj7gx5ouna1t379e` FOREIGN KEY (`numero_avion`) REFERENCES `avion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asiento_aud`
--

DROP TABLE IF EXISTS `asiento_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiento_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `clase_asiento` enum('BUSINESS','ECONOMY','TURISTA') DEFAULT NULL,
  `fila_asiento` int DEFAULT NULL,
  `letra_asiento` varchar(255) DEFAULT NULL,
  `numero_avion` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKa0a686w8oivya3ma4o2r7i0yi` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento_aud`
--

LOCK TABLES `asiento_aud` WRITE;
/*!40000 ALTER TABLE `asiento_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `asiento_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion`
--

DROP TABLE IF EXISTS `avion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `capacidad` int DEFAULT NULL,
  `numero_avion` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion`
--

LOCK TABLES `avion` WRITE;
/*!40000 ALTER TABLE `avion` DISABLE KEYS */;
INSERT INTO `avion` VALUES (1,150,1001),(2,180,1002),(3,200,1003);
/*!40000 ALTER TABLE `avion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avion_aud`
--

DROP TABLE IF EXISTS `avion_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avion_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  `numero_avion` int DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FK353n6aiwkv0o8pewxxfm47kp9` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avion_aud`
--

LOCK TABLES `avion_aud` WRITE;
/*!40000 ALTER TABLE `avion_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `avion_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_consulta` int DEFAULT NULL,
  `fk_usuario` bigint DEFAULT NULL,
  `fk_vuelo` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK82vaoaammts10nkj2noggbsu8` (`fk_vuelo`),
  KEY `FK7w7ae1xmwu5y14tgrsbyl4tsc` (`fk_usuario`),
  CONSTRAINT `FK7w7ae1xmwu5y14tgrsbyl4tsc` FOREIGN KEY (`fk_usuario`) REFERENCES `usuario` (`id`),
  CONSTRAINT `FKp00k74ymc1skolg0evay82bfa` FOREIGN KEY (`fk_vuelo`) REFERENCES `vuelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta_aud`
--

DROP TABLE IF EXISTS `consulta_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `numero_consulta` int DEFAULT NULL,
  `fk_usuario` bigint DEFAULT NULL,
  `fk_vuelo` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKfc7krckkit2qjogwkmpflopto` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta_aud`
--

LOCK TABLES `consulta_aud` WRITE;
/*!40000 ALTER TABLE `consulta_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto`
--

DROP TABLE IF EXISTS `piloto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `dni_persona` int DEFAULT NULL,
  `nombre_persona` varchar(255) DEFAULT NULL,
  `numero_piloto` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto`
--

LOCK TABLES `piloto` WRITE;
/*!40000 ALTER TABLE `piloto` DISABLE KEYS */;
INSERT INTO `piloto` VALUES (1,'Lina',11111111,'Caro',5001),(2,'san',22222222,'Has',5002),(3,'min',33333333,'Yas',5003);
/*!40000 ALTER TABLE `piloto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piloto_aud`
--

DROP TABLE IF EXISTS `piloto_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piloto_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `dni_persona` int DEFAULT NULL,
  `nombre_persona` varchar(255) DEFAULT NULL,
  `numero_piloto` int DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKq11eh7vexitn5f2gfc1aumk94` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piloto_aud`
--

LOCK TABLES `piloto_aud` WRITE;
/*!40000 ALTER TABLE `piloto_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `piloto_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision_info`
--

DROP TABLE IF EXISTS `revision_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revision_info` (
  `id` bigint NOT NULL,
  `revision_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision_info`
--

LOCK TABLES `revision_info` WRITE;
/*!40000 ALTER TABLE `revision_info` DISABLE KEYS */;
INSERT INTO `revision_info` VALUES (1,'2026-06-01 02:05:31.205000'),(2,'2026-06-01 02:06:56.217000'),(3,'2026-06-01 02:12:01.312000');
/*!40000 ALTER TABLE `revision_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_revision_id`
--

DROP TABLE IF EXISTS `seq_revision_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seq_revision_id` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_revision_id`
--

LOCK TABLES `seq_revision_id` WRITE;
/*!40000 ALTER TABLE `seq_revision_id` DISABLE KEYS */;
INSERT INTO `seq_revision_id` VALUES (101);
/*!40000 ALTER TABLE `seq_revision_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa`
--

DROP TABLE IF EXISTS `tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifa` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `clase_tarifa` enum('BUSINESS','ECONOMY','TURISTA') DEFAULT NULL,
  `numero_tarifa` int DEFAULT NULL,
  `precio_tarifa` int DEFAULT NULL,
  `fk_vuelo` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn9aimyow8u64rww76pvgybrfb` (`fk_vuelo`),
  CONSTRAINT `FKn9aimyow8u64rww76pvgybrfb` FOREIGN KEY (`fk_vuelo`) REFERENCES `vuelo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa`
--

LOCK TABLES `tarifa` WRITE;
/*!40000 ALTER TABLE `tarifa` DISABLE KEYS */;
INSERT INTO `tarifa` VALUES (1,'ECONOMY',1,100,1),(2,'ECONOMY',2,123,2),(3,'ECONOMY',3,100,3);
/*!40000 ALTER TABLE `tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarifa_aud`
--

DROP TABLE IF EXISTS `tarifa_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarifa_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `clase_tarifa` enum('BUSINESS','ECONOMY','TURISTA') DEFAULT NULL,
  `numero_tarifa` int DEFAULT NULL,
  `precio_tarifa` int DEFAULT NULL,
  `fk_vuelo` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKisixppclmmwkk9d7ssrfiq928` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarifa_aud`
--

LOCK TABLES `tarifa_aud` WRITE;
/*!40000 ALTER TABLE `tarifa_aud` DISABLE KEYS */;
INSERT INTO `tarifa_aud` VALUES (1,1,0,'ECONOMY',1,100,1),(2,2,0,'ECONOMY',2,123,2),(3,3,0,'ECONOMY',3,100,3);
/*!40000 ALTER TABLE `tarifa_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `dni_persona` int DEFAULT NULL,
  `nombre_persona` varchar(255) DEFAULT NULL,
  `contrasenia_usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_aud`
--

DROP TABLE IF EXISTS `usuario_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `apellido_persona` varchar(255) DEFAULT NULL,
  `dni_persona` int DEFAULT NULL,
  `nombre_persona` varchar(255) DEFAULT NULL,
  `contrasenia_usuario` varchar(255) DEFAULT NULL,
  `email_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKbj3yn6frag5mpexsxplkregwf` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_aud`
--

LOCK TABLES `usuario_aud` WRITE;
/*!40000 ALTER TABLE `usuario_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_vuelo` varchar(255) DEFAULT NULL,
  `numero_vuelo` int DEFAULT NULL,
  `fk_aerolinea` bigint DEFAULT NULL,
  `fk_avion` bigint DEFAULT NULL,
  `fk_piloto` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6iumakcwmqk0vqmantox227jt` (`fk_aerolinea`),
  KEY `FKanxh7w2ruxl2fp786xn3wqd8b` (`fk_avion`),
  KEY `FKfj95ueq6ff8jq56k9l0sqntkm` (`fk_piloto`),
  CONSTRAINT `FK6iumakcwmqk0vqmantox227jt` FOREIGN KEY (`fk_aerolinea`) REFERENCES `aerolinea` (`id`),
  CONSTRAINT `FKanxh7w2ruxl2fp786xn3wqd8b` FOREIGN KEY (`fk_avion`) REFERENCES `avion` (`id`),
  CONSTRAINT `FKfj95ueq6ff8jq56k9l0sqntkm` FOREIGN KEY (`fk_piloto`) REFERENCES `piloto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (1,'2026-12-31',1133,4,NULL,NULL),(2,'2026-06-30',5298,1,NULL,NULL),(3,'2027-01-31',8140,8,NULL,NULL);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_aeropuerto`
--

DROP TABLE IF EXISTS `vuelo_aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_aeropuerto` (
  `vuelo_id` bigint NOT NULL,
  `aeropuerto_id` bigint NOT NULL,
  KEY `FK7nxlv4hlqcytfbdaa3loa0iwt` (`aeropuerto_id`),
  KEY `FKo01yvo4c8nlwujrfchqjdq9ap` (`vuelo_id`),
  CONSTRAINT `FK7nxlv4hlqcytfbdaa3loa0iwt` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`id`),
  CONSTRAINT `FKo01yvo4c8nlwujrfchqjdq9ap` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_aeropuerto`
--

LOCK TABLES `vuelo_aeropuerto` WRITE;
/*!40000 ALTER TABLE `vuelo_aeropuerto` DISABLE KEYS */;
INSERT INTO `vuelo_aeropuerto` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6);
/*!40000 ALTER TABLE `vuelo_aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_aeropuerto_aud`
--

DROP TABLE IF EXISTS `vuelo_aeropuerto_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_aeropuerto_aud` (
  `rev` bigint NOT NULL,
  `vuelo_id` bigint NOT NULL,
  `aeropuerto_id` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  PRIMARY KEY (`rev`,`vuelo_id`,`aeropuerto_id`),
  CONSTRAINT `FKewtpk3dd6tb96rcan902dm9hh` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_aeropuerto_aud`
--

LOCK TABLES `vuelo_aeropuerto_aud` WRITE;
/*!40000 ALTER TABLE `vuelo_aeropuerto_aud` DISABLE KEYS */;
INSERT INTO `vuelo_aeropuerto_aud` VALUES (1,1,1,0),(1,1,2,0),(2,2,3,0),(2,2,4,0),(3,3,5,0),(3,3,6,0);
/*!40000 ALTER TABLE `vuelo_aeropuerto_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_aud`
--

DROP TABLE IF EXISTS `vuelo_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_aud` (
  `id` bigint NOT NULL,
  `rev` bigint NOT NULL,
  `revtype` tinyint DEFAULT NULL,
  `fecha_vuelo` varchar(255) DEFAULT NULL,
  `numero_vuelo` int DEFAULT NULL,
  `fk_aerolinea` bigint DEFAULT NULL,
  `fk_avion` bigint DEFAULT NULL,
  `fk_piloto` bigint DEFAULT NULL,
  PRIMARY KEY (`rev`,`id`),
  CONSTRAINT `FKiqp0uroln8bl80fi972moedv1` FOREIGN KEY (`rev`) REFERENCES `revision_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_aud`
--

LOCK TABLES `vuelo_aud` WRITE;
/*!40000 ALTER TABLE `vuelo_aud` DISABLE KEYS */;
INSERT INTO `vuelo_aud` VALUES (1,1,0,'2026-12-31',1133,4,NULL,NULL),(2,2,0,'2026-06-30',5298,1,NULL,NULL),(3,3,0,'2027-01-31',8140,8,NULL,NULL);
/*!40000 ALTER TABLE `vuelo_aud` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-01 12:25:48
