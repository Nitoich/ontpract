-- MySQL dump 10.13  Distrib 5.7.25, for Win32 (AMD64)
--
-- Host: 192.168.1.68    Database: kargaev
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_fond`
--

DROP TABLE IF EXISTS `book_fond`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_fond` (
  `Invent_nom_book` int(11) DEFAULT NULL,
  `Lib_Nom_book` int(11) NOT NULL,
  `otm_o_vidache` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Lib_Nom_book`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_fond`
--

LOCK TABLES `book_fond` WRITE;
/*!40000 ALTER TABLE `book_fond` DISABLE KEYS */;
INSERT INTO `book_fond` VALUES (0,0,'sf'),(1,1,'Vidan'),(2,2,'ne Vidan'),(3,3,'net'),(4,4,'UwU'),(5,5,'Vidan'),(6,6,'Net'),(7,7,'aga'),(8,8,'Davno uje'),(9,9,'Ya Nikita:)');
/*!40000 ALTER TABLE `book_fond` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalog` (
  `Lib_Nom_book` int(11) NOT NULL DEFAULT '0',
  `avtor` varchar(30) DEFAULT NULL,
  `nameBook` varchar(20) DEFAULT NULL,
  `izd` varchar(20) DEFAULT NULL,
  `date_release` date DEFAULT NULL,
  `count_str` int(11) DEFAULT NULL,
  `tema` varchar(30) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Lib_Nom_book`),
  CONSTRAINT `catalog_ibfk_1` FOREIGN KEY (`Lib_Nom_book`) REFERENCES `book_fond` (`Lib_Nom_book`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (0,'Kesha E.K.','Lexa Ha KypopTe',NULL,'2019-03-17',8465,NULL,1500.99),(1,'3axapbl4','Zavodi korovu',NULL,'2021-01-02',9,NULL,9.99),(2,'Pelmeshkov','Hochu korovu',NULL,'2021-01-03',989823,NULL,0.99),(3,'Ukulelev','Kuplu garaj',NULL,'2018-05-03',1,NULL,45000.00),(4,'Turk','Privet Lopata',NULL,'2016-03-16',234,NULL,100.00),(5,'IvkaChev','Kupec idet gulat',NULL,'2017-05-06',152,NULL,99.00),(6,'Navalnyi','Jajda svobodi',NULL,'2021-02-20',212,NULL,124.00),(7,'Burchik','Torpeda iz kumisa',NULL,'2002-02-20',2141,NULL,178.00),(8,'Shamil','Stoi eto ya shamil',NULL,'2018-12-21',34,NULL,50.00),(9,'Altair','ibn-LaAhad',NULL,'0843-12-21',58,NULL,90.00);
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitateli`
--

DROP TABLE IF EXISTS `chitateli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitateli` (
  `Nom_bileta` int(11) NOT NULL,
  `fam` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `otchestvo` varchar(20) DEFAULT NULL,
  `homephone` varchar(12) DEFAULT NULL,
  `jobphone` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`Nom_bileta`),
  KEY `famx` (`fam`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitateli`
--

LOCK TABLES `chitateli` WRITE;
/*!40000 ALTER TABLE `chitateli` DISABLE KEYS */;
INSERT INTO `chitateli` VALUES (0,'Kargaev','Nikita',NULL,'79011132487',NULL),(1,'Gemoglobinov','Xabib',NULL,'73329583789',NULL),(2,'ToBapuIII','ulyanov',NULL,'71917331991',NULL);
/*!40000 ALTER TABLE `chitateli` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vidacha`
--

DROP TABLE IF EXISTS `vidacha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vidacha` (
  `Nom_bileta` int(11) DEFAULT NULL,
  `Lib_Nom_book` int(11) DEFAULT NULL,
  `data_vidachi` date DEFAULT NULL,
  `Nom_vidachi` int(11) NOT NULL,
  PRIMARY KEY (`Nom_vidachi`),
  KEY `Lib_Nom_book` (`Lib_Nom_book`),
  KEY `Nom_bileta` (`Nom_bileta`),
  CONSTRAINT `vidacha_ibfk_1` FOREIGN KEY (`Nom_bileta`) REFERENCES `chitateli` (`Nom_bileta`),
  CONSTRAINT `vidacha_ibfk_2` FOREIGN KEY (`Nom_bileta`) REFERENCES `book_fond` (`Lib_Nom_book`),
  CONSTRAINT `vidacha_ibfk_3` FOREIGN KEY (`Lib_Nom_book`) REFERENCES `book_fond` (`Lib_Nom_book`),
  CONSTRAINT `vidacha_ibfk_4` FOREIGN KEY (`Nom_bileta`) REFERENCES `chitateli` (`Nom_bileta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vidacha`
--

LOCK TABLES `vidacha` WRITE;
/*!40000 ALTER TABLE `vidacha` DISABLE KEYS */;
/*!40000 ALTER TABLE `vidacha` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-26 15:40:49
