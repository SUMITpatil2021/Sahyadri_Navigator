-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: trekk
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `FACILITIES_ID` int NOT NULL AUTO_INCREMENT,
  `GUIDE_NAME` varchar(45) NOT NULL,
  `TREKKING_POLE` varchar(45) NOT NULL,
  `TRAINNING_PROGRAM` varchar(45) NOT NULL,
  `FIRST_AID` varchar(45) NOT NULL,
  `TRANSPORTATION` varchar(45) NOT NULL,
  `FOOD` varchar(45) NOT NULL,
  PRIMARY KEY (`FACILITIES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `FEEDBACK_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `TREKK_ID` int NOT NULL,
  `COMMENTS` varchar(45) NOT NULL,
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `N_TREKK_ID_idx` (`TREKK_ID`),
  CONSTRAINT `N_TREKK_ID` FOREIGN KEY (`TREKK_ID`) REFERENCES `trekk_details` (`TREKK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `LOGIN_ID` int NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ROLL_ID` int NOT NULL,
  PRIMARY KEY (`LOGIN_ID`),
  KEY `ROLL_ID_idx` (`ROLL_ID`),
  CONSTRAINT `ROLL_ID` FOREIGN KEY (`ROLL_ID`) REFERENCES `user_roll` (`ROLL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (6,'supriya','supriya@123',1),(7,'Sumit2021','Sumit@2021',1),(8,'Sumit2021','Sumit@2021',1);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PYMENT_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `TREKK_ID` int NOT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PYMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trekk_details`
--

DROP TABLE IF EXISTS `trekk_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trekk_details` (
  `TREKK_ID` int NOT NULL AUTO_INCREMENT,
  `TREKK_NAME` varchar(45) NOT NULL,
  `LOC_ID` int NOT NULL,
  `DATE` varchar(45) NOT NULL,
  `OFFER_DESCRIPTION` varchar(45) NOT NULL,
  `CHARGES` varchar(45) NOT NULL,
  `FACILITIES` int NOT NULL,
  `TREKK_IMG` mediumblob NOT NULL,
  PRIMARY KEY (`TREKK_ID`),
  KEY `LOC_ID_idx` (`LOC_ID`),
  CONSTRAINT `LOC_ID` FOREIGN KEY (`LOC_ID`) REFERENCES `trekk_location` (`LOC_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trekk_details`
--

LOCK TABLES `trekk_details` WRITE;
/*!40000 ALTER TABLE `trekk_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `trekk_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trekk_location`
--

DROP TABLE IF EXISTS `trekk_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trekk_location` (
  `LOC_ID` int NOT NULL AUTO_INCREMENT,
  `CITY` varchar(45) NOT NULL,
  `TREKKING_POINTS` varchar(45) NOT NULL,
  `LANDMARK` varchar(45) NOT NULL,
  `PINCODE` varchar(45) NOT NULL,
  PRIMARY KEY (`LOC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trekk_location`
--

LOCK TABLES `trekk_location` WRITE;
/*!40000 ALTER TABLE `trekk_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `trekk_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trekker_reg_event`
--

DROP TABLE IF EXISTS `trekker_reg_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trekker_reg_event` (
  `TREKK_REG_ID` int NOT NULL AUTO_INCREMENT,
  `USER_ID` int NOT NULL,
  `TREKK_ID` int NOT NULL,
  `PAYMENT_STATUS` varchar(45) NOT NULL,
  PRIMARY KEY (`TREKK_REG_ID`),
  KEY `EVENT_ID_idx` (`TREKK_ID`),
  KEY `F_USER_ID_idx` (`USER_ID`),
  CONSTRAINT `F_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user_registration` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TREKK_ID` FOREIGN KEY (`TREKK_ID`) REFERENCES `trekk_details` (`TREKK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trekker_reg_event`
--

LOCK TABLES `trekker_reg_event` WRITE;
/*!40000 ALTER TABLE `trekker_reg_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `trekker_reg_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trekking_club_trekk_reg`
--

DROP TABLE IF EXISTS `trekking_club_trekk_reg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trekking_club_trekk_reg` (
  `TREKK_REG_ID` int NOT NULL AUTO_INCREMENT,
  `TREKK_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  PRIMARY KEY (`TREKK_REG_ID`),
  KEY `T_TREKK_ID_idx` (`TREKK_ID`),
  KEY `T_USER_ID_idx` (`USER_ID`),
  CONSTRAINT `T_TREKK_ID` FOREIGN KEY (`TREKK_ID`) REFERENCES `trekk_details` (`TREKK_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `T_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user_registration` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trekking_club_trekk_reg`
--

LOCK TABLES `trekking_club_trekk_reg` WRITE;
/*!40000 ALTER TABLE `trekking_club_trekk_reg` DISABLE KEYS */;
/*!40000 ALTER TABLE `trekking_club_trekk_reg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upcoming_trekk`
--

DROP TABLE IF EXISTS `upcoming_trekk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upcoming_trekk` (
  `UT_ID` int NOT NULL AUTO_INCREMENT,
  `TREKK_ID` int NOT NULL,
  `LAST_DATE` date NOT NULL,
  PRIMARY KEY (`UT_ID`),
  KEY `F_TREKK_ID_idx` (`TREKK_ID`),
  CONSTRAINT `F_TREKK_ID` FOREIGN KEY (`TREKK_ID`) REFERENCES `trekk_details` (`TREKK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upcoming_trekk`
--

LOCK TABLES `upcoming_trekk` WRITE;
/*!40000 ALTER TABLE `upcoming_trekk` DISABLE KEYS */;
/*!40000 ALTER TABLE `upcoming_trekk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_registration`
--

DROP TABLE IF EXISTS `user_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_registration` (
  `USER_ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `EMAILID` varchar(45) NOT NULL,
  `CONTACT` varchar(45) NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  `PASSWORD` varchar(45) NOT NULL,
  `ROLL_ID` int DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `F_ROLLID` (`ROLL_ID`),
  CONSTRAINT `F_ROLLID` FOREIGN KEY (`ROLL_ID`) REFERENCES `user_roll` (`ROLL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_registration`
--

LOCK TABLES `user_registration` WRITE;
/*!40000 ALTER TABLE `user_registration` DISABLE KEYS */;
INSERT INTO `user_registration` VALUES (7,'sumit','sumit@gmail.com','7447882097','Sumit2021','Sumit@2021',1),(9,'sumit','sumit@gmail.com','7447882097','Sumit2021','Sumit@2021',1);
/*!40000 ALTER TABLE `user_registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_registration_AFTER_INSERT` AFTER INSERT ON `user_registration` FOR EACH ROW BEGIN
insert into login(username,password,roll_id) values(new.username,new.password,new.roll_id);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_registration_BEFORE_DELETE` BEFORE DELETE ON `user_registration` FOR EACH ROW BEGIN
    delete from trekk.login where trekk.login.LOGIN_ID=trekk.user_registration.USER_ID;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_roll`
--

DROP TABLE IF EXISTS `user_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roll` (
  `ROLL_ID` int NOT NULL AUTO_INCREMENT,
  `USER_TYPE` varchar(45) NOT NULL,
  PRIMARY KEY (`ROLL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roll`
--

LOCK TABLES `user_roll` WRITE;
/*!40000 ALTER TABLE `user_roll` DISABLE KEYS */;
INSERT INTO `user_roll` VALUES (1,'ADMIN'),(2,'TREKKER'),(3,'TREKKING_CLUB');
/*!40000 ALTER TABLE `user_roll` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-09 21:58:26
