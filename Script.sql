DROP TABLE IF EXISTS `T_PERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_PERSONAL` (
  `IdTrabajador` int NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido1` varchar(50) NOT NULL,
  `Apellido2` varchar(50) DEFAULT NULL,
  `CodCategoria` int DEFAULT NULL,
  PRIMARY KEY (`IdTrabajador`),
  KEY `FK_PERSONAL_CATPERSONAL` (`CodCategoria`),
  CONSTRAINT `FK_PERSONAL_CATPERSONAL` FOREIGN KEY (`CodCategoria`) REFERENCES `T_CATPERSONAL` (`CodCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `T_PUESTO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_PUESTO` (
  `IdTrabajador` int NOT NULL,
  `IdVuelo` int NOT NULL,
  PRIMARY KEY (`IdTrabajador`,`IdVuelo`),
  KEY `FK_PUESTO_VUELO` (`IdVuelo`),
  CONSTRAINT `FK_PUESTO_PERSONAL` FOREIGN KEY (`IdTrabajador`) REFERENCES `T_PERSONAL` (`IdTrabajador`),
  CONSTRAINT `FK_PUESTO_VUELO` FOREIGN KEY (`IdVuelo`) REFERENCES `T_VUELO` (`IdVuelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `T_TELEFONOPASAJERO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_TELEFONOPASAJERO` (
  `DniPropietario` varchar(9) NOT NULL,
  `TelefonoPasajero` int NOT NULL,
  PRIMARY KEY (`DniPropietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `T_TELEFONOPERSONAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_TELEFONOPERSONAL` (
  `IdTrabajador` int NOT NULL,
  `Telefono` int NOT NULL,
  PRIMARY KEY (`IdTrabajador`,`Telefono`),
  CONSTRAINT `FK_TELEFONOPERSONAL_PERSONAL` FOREIGN KEY (`IdTrabajador`) REFERENCES `T_PERSONAL` (`IdTrabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `T_VUELO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `T_VUELO` (
  `IdVuelo` int NOT NULL,
  `Origen` varchar(50) NOT NULL,
  `Destino` varchar(50) NOT NULL,
  `Fecha` date NOT NULL,
  `Matricula` varchar(50) NOT NULL,
  PRIMARY KEY (`IdVuelo`),
  KEY `FK_VUELO_AVION` (`Matricula`),
  CONSTRAINT `FK_VUELO_AVION` FOREIGN KEY (`Matricula`) REFERENCES `T_AEROPLANO` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;