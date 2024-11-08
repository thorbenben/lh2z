-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: h2zdb
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `co2_data`
--

DROP TABLE IF EXISTS `co2_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co2_data` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `country` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `year` int NOT NULL,
                            `emission` decimal(15,4) NOT NULL,
                            `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
                            `submitted_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                            PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co2_data`
--

LOCK TABLES `co2_data` WRITE;
/*!40000 ALTER TABLE `co2_data` DISABLE KEYS */;
INSERT INTO `co2_data` VALUES (11,'Afghanistan',2000,0.2500,'approved','wissenschaftler1'),(59,'Afghanistan',2000,0.2464,'approved','wissenschaftler1'),(60,'Afghanistan',2001,0.1865,'approved','wissenschaftler1'),(61,'Afghanistan',2002,0.2811,'approved','wissenschaftler1'),(62,'Afghanistan',2003,0.2143,'approved','wissenschaftler1'),(63,'Afghanistan',2004,0.1692,'approved','wissenschaftler1'),(64,'Afghanistan',2005,0.2456,'approved','wissenschaftler1'),(65,'Afghanistan',2006,0.2622,'approved','wissenschaftler1'),(66,'Afghanistan',2007,0.6449,'approved','wissenschaftler1'),(67,'Afghanistan',2008,1.1581,'approved','wissenschaftler1'),(68,'Afghanistan',2009,1.6090,'approved','wissenschaftler1'),(69,'Afghanistan',2010,1.9248,'approved','wissenschaftler1'),(70,'Afghanistan',2011,3.6383,'approved','wissenschaftler1'),(71,'Afghanistan',2012,2.8791,'approved','wissenschaftler1'),(72,'Afghanistan',2013,2.8687,'approved','wissenschaftler1'),(73,'Afghanistan',2014,3.0570,'approved','wissenschaftler1'),(74,'Afghanistan',2015,2.3943,'approved','wissenschaftler1'),(75,'Afghanistan',2016,2.4082,'approved','wissenschaftler1'),(76,'Afghanistan',2017,2.9265,'approved','wissenschaftler1'),(77,'Afghanistan',2018,2.4124,'approved','wissenschaftler1'),(78,'Afghanistan',2019,2.3692,'approved','wissenschaftler1'),(79,'Afghanistan',2020,1.6451,'approved','wissenschaftler1'),(80,'Afghanistan',2021,1.6959,'approved','wissenschaftler1'),(81,'Afghanistan',2022,1.6891,'approved','wissenschaftler1'),(82,'Germany',2000,102.7398,'approved','wissenschaftler1'),(83,'Germany',2001,96.4403,'approved','wissenschaftler1'),(84,'Germany',2002,95.8432,'approved','wissenschaftler1'),(85,'Germany',2003,98.5714,'approved','wissenschaftler1'),(86,'Germany',2004,97.0651,'approved','wissenschaftler1'),(87,'Germany',2005,94.7715,'approved','wissenschaftler1'),(88,'Germany',2006,96.6597,'approved','wissenschaftler1'),(89,'Germany',2007,96.0489,'approved','wissenschaftler1'),(90,'Germany',2008,99.8683,'approved','wissenschaftler1'),(91,'Germany',2009,86.8686,'approved','wissenschaftler1'),(92,'Germany',2010,98.3512,'approved','wissenschaftler1'),(93,'Germany',2011,97.1816,'approved','wissenschaftler1'),(94,'Germany',2012,94.2500,'approved','wissenschaftler1'),(95,'Germany',2013,93.8048,'approved','wissenschaftler1'),(96,'Germany',2014,91.2462,'approved','wissenschaftler1'),(97,'Germany',2015,95.1189,'approved','wissenschaftler1'),(98,'Germany',2016,93.2194,'approved','wissenschaftler1'),(99,'Germany',2017,95.1388,'approved','wissenschaftler1'),(100,'Germany',2018,98.3399,'approved','wissenschaftler1'),(101,'Germany',2019,93.4304,'approved','wissenschaftler1'),(102,'Germany',2020,90.9346,'approved','wissenschaftler1'),(103,'Germany',2021,99.3206,'approved','wissenschaftler1'),(104,'Germany',2022,93.6107,'approved','wissenschaftler1'),(105,'France',2000,55.4485,'approved','wissenschaftler1'),(106,'France',2001,59.3442,'approved','wissenschaftler1'),(107,'France',2002,57.1552,'approved','wissenschaftler1'),(108,'France',2003,56.6253,'approved','wissenschaftler1'),(109,'France',2004,53.0819,'approved','wissenschaftler1'),(110,'France',2005,55.1296,'approved','wissenschaftler1'),(111,'France',2006,54.8352,'approved','wissenschaftler1'),(112,'France',2007,54.0272,'approved','wissenschaftler1'),(113,'France',2008,52.5361,'approved','wissenschaftler1'),(114,'France',2009,41.2483,'approved','wissenschaftler1'),(115,'France',2010,45.1047,'approved','wissenschaftler1'),(116,'France',2011,50.6263,'approved','wissenschaftler1'),(117,'France',2012,48.1157,'approved','wissenschaftler1'),(118,'France',2013,49.2023,'approved','wissenschaftler1'),(119,'France',2014,46.5848,'approved','wissenschaftler1'),(120,'France',2015,45.0074,'approved','wissenschaftler1'),(121,'France',2016,46.8934,'approved','wissenschaftler1'),(122,'France',2017,41.9273,'approved','wissenschaftler1'),(123,'France',2018,41.0864,'approved','wissenschaftler1'),(124,'France',2019,39.2288,'approved','wissenschaftler1'),(125,'France',2020,36.7519,'approved','wissenschaftler1'),(126,'France',2021,39.5617,'approved','wissenschaftler1'),(127,'France',2022,36.4312,'approved','wissenschaftler1'),(128,'India',2000,192.2747,'approved','wissenschaftler1'),(129,'India',2001,193.9797,'approved','wissenschaftler1'),(130,'India',2002,207.6702,'approved','wissenschaftler1'),(131,'India',2003,198.4246,'approved','wissenschaftler1'),(132,'India',2004,208.2556,'approved','wissenschaftler1'),(133,'India',2005,232.6190,'approved','wissenschaftler1'),(134,'India',2006,260.3072,'approved','wissenschaftler1'),(135,'India',2007,295.2585,'approved','wissenschaftler1'),(136,'India',2008,308.1789,'approved','wissenschaftler1'),(137,'India',2009,355.5846,'approved','wissenschaftler1'),(138,'India',2010,398.0158,'approved','wissenschaftler1'),(139,'India',2011,443.4060,'approved','wissenschaftler1'),(140,'India',2012,431.9004,'approved','wissenschaftler1'),(141,'India',2013,469.3858,'approved','wissenschaftler1'),(142,'India',2014,500.5302,'approved','wissenschaftler1'),(143,'India',2015,503.0969,'approved','wissenschaftler1'),(144,'India',2016,524.0355,'approved','wissenschaftler1'),(145,'India',2017,555.4623,'approved','wissenschaftler1'),(146,'India',2018,565.2894,'approved','wissenschaftler1'),(147,'India',2019,549.3496,'approved','wissenschaftler1'),(148,'India',2020,501.3189,'approved','wissenschaftler1'),(149,'India',2021,557.7164,'approved','wissenschaftler1'),(150,'India',2022,583.4082,'approved','wissenschaftler1'),(151,'United States',2000,567.1249,'approved','wissenschaftler1'),(152,'United States',2001,540.0108,'approved','wissenschaftler1'),(153,'United States',2002,490.8160,'approved','wissenschaftler1'),(154,'United States',2003,485.4160,'approved','wissenschaftler1'),(155,'United States',2004,511.6738,'approved','wissenschaftler1'),(156,'United States',2005,477.3253,'approved','wissenschaftler1'),(157,'United States',2006,495.8157,'approved','wissenschaftler1'),(158,'United States',2007,486.0106,'approved','wissenschaftler1'),(159,'United States',2008,474.7671,'approved','wissenschaftler1'),(160,'United States',2009,407.5382,'approved','wissenschaftler1'),(161,'United States',2010,466.3256,'approved','wissenschaftler1'),(162,'United States',2011,435.6929,'approved','wissenschaftler1'),(163,'United States',2012,438.5726,'approved','wissenschaftler1'),(164,'United States',2013,434.8862,'approved','wissenschaftler1'),(165,'United States',2014,437.2563,'approved','wissenschaftler1'),(166,'United States',2015,433.8849,'approved','wissenschaftler1'),(167,'United States',2016,439.0239,'approved','wissenschaftler1'),(168,'United States',2017,429.4054,'approved','wissenschaftler1'),(169,'United States',2018,454.0616,'approved','wissenschaftler1'),(170,'United States',2019,439.0522,'approved','wissenschaftler1'),(171,'United States',2020,437.7491,'approved','wissenschaftler1'),(172,'United States',2021,452.8352,'approved','wissenschaftler1'),(173,'United States',2022,466.8880,'approved','wissenschaftler1'),(174,'Testland',2000,12.1234,'approved','wissenschaftler1'),(175,'Testland',2001,88.1234,'approved','wissenschaftler1');
/*!40000 ALTER TABLE `co2_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         `role` enum('admin','scientist') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','1234','admin'),(2,'wissenschaftler1','1234','scientist'),(3,'wissenschaftler2','1234','scientist'),(4,'wissenschaftler3','1234','scientist');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-08 21:33:53