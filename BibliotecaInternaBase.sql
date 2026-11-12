-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	9.3.0

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
-- Table structure for table `academia`
--

DROP TABLE IF EXISTS `academia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academia` (
  `id_academia` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_academia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `academia_experiencia`
--

DROP TABLE IF EXISTS `academia_experiencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academia_experiencia` (
  `id_experiencia_educativa` int NOT NULL,
  `id_academia` int NOT NULL,
  PRIMARY KEY (`id_experiencia_educativa`,`id_academia`),
  KEY `FKp2lyq1j4bne3wdqyvgvij1goy` (`id_academia`),
  CONSTRAINT `FKk3do9cmjmwyb2e8fsetyrt22u` FOREIGN KEY (`id_experiencia_educativa`) REFERENCES `experiencia_educativa` (`id_experiencia_educativa`),
  CONSTRAINT `FKp2lyq1j4bne3wdqyvgvij1goy` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `academia_programa`
--

DROP TABLE IF EXISTS `academia_programa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academia_programa` (
  `id_academia` int NOT NULL,
  `id_programa_educativo` int NOT NULL,
  PRIMARY KEY (`id_academia`,`id_programa_educativo`),
  KEY `FKfuxpqt62ncrawjalp2o7q985t` (`id_programa_educativo`),
  CONSTRAINT `FKfuxpqt62ncrawjalp2o7q985t` FOREIGN KEY (`id_programa_educativo`) REFERENCES `programa_educativo` (`id_programa_educativo`),
  CONSTRAINT `FKgyr9olu8wfefs15k98lqoivfv` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alumno_practica`
--

DROP TABLE IF EXISTS `alumno_practica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno_practica` (
  `id_alumno` int NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `apellidos` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `horas_requeridas` int DEFAULT NULL,
  `matricula` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `tipo` enum('PRACTICAS_PROFESIONALES','SERVICIO_SOCIAL') NOT NULL,
  `id_programa_educativo` int DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `UKdqdnaop1rwgtx04jd0bwsmhir` (`matricula`),
  KEY `FK5etcadqjnbrvuw8asm6kmwopj` (`id_programa_educativo`),
  CONSTRAINT `FK5etcadqjnbrvuw8asm6kmwopj` FOREIGN KEY (`id_programa_educativo`) REFERENCES `programa_educativo` (`id_programa_educativo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `baja`
--

DROP TABLE IF EXISTS `baja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baja` (
  `id_baja` int NOT NULL AUTO_INCREMENT,
  `fecha_baja` date NOT NULL,
  `motivo` varchar(500) NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `id_recurso_documental` int NOT NULL,
  `id_usuario` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_baja`),
  KEY `FKm2mkedu3gf9y2pmbqdp0wvuty` (`id_recurso_documental`),
  KEY `FKgud4sh4sa5p58w7df47u7kjrm` (`id_usuario`),
  CONSTRAINT `FKgud4sh4sa5p58w7df47u7kjrm` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKm2mkedu3gf9y2pmbqdp0wvuty` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizacion` (
  `id_cotizacion` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(255) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `observaciones` varchar(3000) DEFAULT NULL,
  `correo_solicitante` varchar(255) DEFAULT NULL,
  `dependencia` varchar(255) DEFAULT NULL,
  `justificacion` varchar(3000) DEFAULT NULL,
  `proveedor_sugerido` varchar(255) DEFAULT NULL,
  `solicitante` varchar(255) DEFAULT NULL,
  `telefono_solicitante` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_cotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `descarte`
--

DROP TABLE IF EXISTS `descarte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descarte` (
  `id_descarte` int NOT NULL AUTO_INCREMENT,
  `fecha_descarte` date NOT NULL,
  `motivo` varchar(500) NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `id_recurso_documental` int NOT NULL,
  `id_usuario` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  `estado` varchar(20) NOT NULL DEFAULT 'PENDIENTE',
  `fecha_resolucion` date DEFAULT NULL,
  `observaciones_resolucion` varchar(1000) DEFAULT NULL,
  `id_usuario_resolucion` int DEFAULT NULL,
  `id_baja` int DEFAULT NULL,
  PRIMARY KEY (`id_descarte`),
  KEY `FK36bg6o0c24h2jknl44un9h9il` (`id_recurso_documental`),
  KEY `FKdbxvvpygpcc5bbpka3t175yf9` (`id_usuario`),
  KEY `fk_descarte_usuario_resolucion` (`id_usuario_resolucion`),
  KEY `fk_descarte_baja` (`id_baja`),
  CONSTRAINT `FK36bg6o0c24h2jknl44un9h9il` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`),
  CONSTRAINT `fk_descarte_baja` FOREIGN KEY (`id_baja`) REFERENCES `baja` (`id_baja`),
  CONSTRAINT `fk_descarte_usuario_resolucion` FOREIGN KEY (`id_usuario_resolucion`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FKdbxvvpygpcc5bbpka3t175yf9` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `detalle_cotizacion`
--

DROP TABLE IF EXISTS `detalle_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_cotizacion` (
  `id_detalle_cotizacion` int NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `filu` varchar(255) DEFAULT NULL,
  `precio_unitario_estimado` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `id_cotizacion` int NOT NULL,
  `id_recurso_documental` int DEFAULT NULL,
  `id_academia` int DEFAULT NULL,
  `id_programa_educativo` int DEFAULT NULL,
  `anio_externo` int DEFAULT NULL,
  `autor_externo` varchar(255) DEFAULT NULL,
  `edicion_externa` varchar(255) DEFAULT NULL,
  `editorial_externa` varchar(255) DEFAULT NULL,
  `isbn_externo` varchar(255) DEFAULT NULL,
  `titulo_externo` varchar(500) DEFAULT NULL,
  `id_editorial` int DEFAULT NULL,
  `url_cotizacion` varchar(2048) DEFAULT NULL,
  `estado_adquisicion` varchar(30) NOT NULL DEFAULT 'PENDIENTE',
  PRIMARY KEY (`id_detalle_cotizacion`),
  KEY `FKio1qm2xv8nxi0jt06n25nxyr8` (`id_cotizacion`),
  KEY `FK1i5gr3ix9dsw75qv73w5iveoo` (`id_recurso_documental`),
  KEY `FKcnyr9d4n1tpab59egstbr6l5g` (`id_academia`),
  KEY `FK2caoxf7ylo1fsftlivn82iogl` (`id_programa_educativo`),
  KEY `fk_detalle_cotizacion_editorial` (`id_editorial`),
  CONSTRAINT `FK1i5gr3ix9dsw75qv73w5iveoo` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`),
  CONSTRAINT `FK2caoxf7ylo1fsftlivn82iogl` FOREIGN KEY (`id_programa_educativo`) REFERENCES `programa_educativo` (`id_programa_educativo`),
  CONSTRAINT `fk_detalle_cotizacion_editorial` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FKcnyr9d4n1tpab59egstbr6l5g` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`),
  CONSTRAINT `FKio1qm2xv8nxi0jt06n25nxyr8` FOREIGN KEY (`id_cotizacion`) REFERENCES `cotizacion` (`id_cotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `donacion`
--

DROP TABLE IF EXISTS `donacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donacion` (
  `id_donacion` int NOT NULL AUTO_INCREMENT,
  `fecha_donacion` date DEFAULT NULL,
  `nombre_donante` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `precio_estimado` decimal(10,2) DEFAULT NULL,
  `id_recurso_documental` int NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_donacion`),
  KEY `FKfqe29qkwynwktppub16e3183y` (`id_recurso_documental`),
  CONSTRAINT `FKfqe29qkwynwktppub16e3183y` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `editorial`
--

DROP TABLE IF EXISTS `editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editorial` (
  `id_editorial` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `pagina_web` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experiencia_educativa`
--

DROP TABLE IF EXISTS `experiencia_educativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencia_educativa` (
  `id_experiencia_educativa` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` bit(1) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_experiencia_educativa`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `experiencia_recurso`
--

DROP TABLE IF EXISTS `experiencia_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `experiencia_recurso` (
  `id_recurso_documental` int NOT NULL,
  `id_experiencia_educativa` int NOT NULL,
  PRIMARY KEY (`id_recurso_documental`,`id_experiencia_educativa`),
  KEY `FK9brxs428a8g9rkelmqlt71nxn` (`id_experiencia_educativa`),
  CONSTRAINT `FK8iublcuqttl2f9hf5563t5x2t` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`),
  CONSTRAINT `FK9brxs428a8g9rkelmqlt71nxn` FOREIGN KEY (`id_experiencia_educativa`) REFERENCES `experiencia_educativa` (`id_experiencia_educativa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_cotizacion`
--

DROP TABLE IF EXISTS `historial_cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_cotizacion` (
  `id_historial` bigint NOT NULL AUTO_INCREMENT,
  `id_cotizacion` int NOT NULL,
  `fecha_hora` datetime(6) NOT NULL,
  `accion` varchar(30) NOT NULL,
  `estado_anterior` varchar(30) DEFAULT NULL,
  `estado_nuevo` varchar(30) DEFAULT NULL,
  `usuario` varchar(150) DEFAULT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `datos_anteriores` longtext,
  `datos_nuevos` longtext,
  PRIMARY KEY (`id_historial`),
  KEY `idx_historial_cotizacion` (`id_cotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `programa_educativo`
--

DROP TABLE IF EXISTS `programa_educativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programa_educativo` (
  `id_programa_educativo` int NOT NULL AUTO_INCREMENT,
  `anio` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `nombre_corto` varchar(255) DEFAULT NULL,
  `modalidad` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_programa_educativo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `recurso_documental`
--

DROP TABLE IF EXISTS `recurso_documental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recurso_documental` (
  `id_recurso_documental` int NOT NULL AUTO_INCREMENT,
  `anio` varchar(255) DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `edicion` varchar(255) DEFAULT NULL,
  `en_catalogo_biblio_fca` bit(1) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `movimiento` varchar(255) DEFAULT NULL,
  `observaciones` varchar(255) DEFAULT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_editorial` int DEFAULT NULL,
  `formato` varchar(20) DEFAULT NULL,
  `url_recurso` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id_recurso_documental`),
  KEY `FKnao4bqfpie7isbetft7ecfat0` (`id_editorial`),
  CONSTRAINT `FKnao4bqfpie7isbetft7ecfat0` FOREIGN KEY (`id_editorial`) REFERENCES `editorial` (`id_editorial`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registro_horas`
--

DROP TABLE IF EXISTS `registro_horas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_horas` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL,
  `horas_realizadas` decimal(6,2) NOT NULL,
  `observaciones` varchar(1000) DEFAULT NULL,
  `id_alumno` int NOT NULL,
  `id_usuario` int NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `FKflkms598oi4euabnssc31oiy0` (`id_alumno`),
  KEY `FKlu7mgvkv34kybyjvcmb2cmd52` (`id_usuario`),
  CONSTRAINT `FKflkms598oi4euabnssc31oiy0` FOREIGN KEY (`id_alumno`) REFERENCES `alumno_practica` (`id_alumno`),
  CONSTRAINT `FKlu7mgvkv34kybyjvcmb2cmd52` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `activo` bit(1) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('PERSONAL_BIBLIOTECA','RESPONSABLE_BIBLIOTECA') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `UK2mlfr087gb1ce55f2j87o74t` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vinculacion_academica_recurso`
--

DROP TABLE IF EXISTS `vinculacion_academica_recurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vinculacion_academica_recurso` (
  `id_vinculacion` int NOT NULL AUTO_INCREMENT,
  `id_academia` int NOT NULL,
  `id_experiencia_educativa` int NOT NULL,
  `id_programa_educativo` int NOT NULL,
  `id_recurso_documental` int NOT NULL,
  PRIMARY KEY (`id_vinculacion`),
  UNIQUE KEY `uk_vinculacion_academica` (`id_recurso_documental`,`id_experiencia_educativa`,`id_academia`,`id_programa_educativo`),
  KEY `FK9h1p48dk8qwpyux4u9xfj8hwd` (`id_academia`),
  KEY `FKrkvcq537mlrprsq5b9wfi04p` (`id_experiencia_educativa`),
  KEY `FKh2gcbobbka3hq61p4rmwyr4jq` (`id_programa_educativo`),
  CONSTRAINT `FK9h1p48dk8qwpyux4u9xfj8hwd` FOREIGN KEY (`id_academia`) REFERENCES `academia` (`id_academia`),
  CONSTRAINT `FKh2gcbobbka3hq61p4rmwyr4jq` FOREIGN KEY (`id_programa_educativo`) REFERENCES `programa_educativo` (`id_programa_educativo`),
  CONSTRAINT `FKnpb3mrp4ybg5m8nr9blq6jmlk` FOREIGN KEY (`id_recurso_documental`) REFERENCES `recurso_documental` (`id_recurso_documental`),
  CONSTRAINT `FKrkvcq537mlrprsq5b9wfi04p` FOREIGN KEY (`id_experiencia_educativa`) REFERENCES `experiencia_educativa` (`id_experiencia_educativa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-12 16:47:34
