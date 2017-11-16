CREATE DATABASE  IF NOT EXISTS `galery` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `galery`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: galery
-- ------------------------------------------------------
-- Server version	5.5.21

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryTitle` varchar(55) COLLATE utf8_bin NOT NULL,
  `AddressPicture` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_Category` AFTER INSERT ON `Category`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Category'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_Category` AFTER UPDATE ON `Category`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Category';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_Category` AFTER DELETE ON `Category`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Category';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `PictureId` int(11) NOT NULL,
  `Comment` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Comment_User` (`UserId`),
  KEY `FK_Comment_Picture` (`PictureId`),
  CONSTRAINT `FK_Comment_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comment_Picture` FOREIGN KEY (`PictureId`) REFERENCES `picture` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_Comment` AFTER INSERT ON `Comment`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Comment'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_Comment` AFTER UPDATE ON `Comment`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Comment';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_Comment` AFTER DELETE ON `Comment`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Comment';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `history_store`
--

DROP TABLE IF EXISTS `history_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_store` (
  `timemark` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `table_name` tinytext COLLATE utf8_bin NOT NULL,
  `pk_date_src` text COLLATE utf8_bin NOT NULL,
  `pk_date_dest` text COLLATE utf8_bin NOT NULL,
  `record_state` int(11) NOT NULL,
  PRIMARY KEY (`table_name`(85),`pk_date_dest`(85))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_store`
--

LOCK TABLES `history_store` WRITE;
/*!40000 ALTER TABLE `history_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `history_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picture`
--

DROP TABLE IF EXISTS `picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `picture` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `CategoryId` int(11) NOT NULL,
  `AddressPicture` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Picture_Category` (`CategoryId`),
  CONSTRAINT `FK_Picture_Category` FOREIGN KEY (`CategoryId`) REFERENCES `category` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picture`
--

LOCK TABLES `picture` WRITE;
/*!40000 ALTER TABLE `picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `picture` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_Picture` AFTER INSERT ON `Picture`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Picture'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_Picture` AFTER UPDATE ON `Picture`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Picture';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_Picture` AFTER DELETE ON `Picture`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Picture';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Question` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_Question` AFTER INSERT ON `Question`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Question'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_Question` AFTER UPDATE ON `Question`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Question';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_Question` AFTER DELETE ON `Question`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Question';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rate`
--

DROP TABLE IF EXISTS `rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `PictureId` int(11) NOT NULL,
  `rate` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Rate_User` (`UserId`),
  KEY `FK_Rate_Picture` (`PictureId`),
  CONSTRAINT `FK_Rate_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Rate_Picture` FOREIGN KEY (`PictureId`) REFERENCES `picture` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate`
--

LOCK TABLES `rate` WRITE;
/*!40000 ALTER TABLE `rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `rate` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_Rate` AFTER INSERT ON `Rate`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Rate'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_Rate` AFTER UPDATE ON `Rate`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Rate';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_Rate` AFTER DELETE ON `Rate`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'Rate';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `StateTitle` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_State` AFTER INSERT ON `State`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'State'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_State` AFTER UPDATE ON `State`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'State';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_State` AFTER DELETE ON `State`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'State';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) COLLATE utf8_bin NOT NULL,
  `Family` varchar(50) COLLATE utf8_bin NOT NULL,
  `UserName` varchar(50) COLLATE utf8_bin NOT NULL,
  `Password` varchar(50) COLLATE utf8_bin NOT NULL,
  `StatId` int(11) NOT NULL,
  `QustionId` int(11) NOT NULL,
  `Answer` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_User_Question` (`QustionId`),
  KEY `FK_User_State` (`StatId`),
  CONSTRAINT `FK_User_Question` FOREIGN KEY (`QustionId`) REFERENCES `question` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_User_State` FOREIGN KEY (`StatId`) REFERENCES `state` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_i_User` AFTER INSERT ON `User`						FOR EACH ROW BEGIN 						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'User'; 						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>'); 						SET @rec_state = 1;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`,`record_state` ) 						VALUES (@time_mark, @tbl_name, @pk_d, @pk_d, @rec_state); 						END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_u_User` AFTER UPDATE ON `User`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'User';						SET @pk_d_old = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @pk_d = CONCAT('<Id>',NEW.`Id`,'</Id>');						SET @rec_state = 2;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						IF @rs = 0 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d_old, @rec_state );						ELSE 						UPDATE `history_store` SET `timemark` = @time_mark, `pk_date_src` = @pk_d WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d_old;						END IF; END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `a_d_User` AFTER DELETE ON `User`						FOR EACH ROW BEGIN						SET @time_mark = DATE_ADD(NOW(), INTERVAL 0 SECOND); 						SET @tbl_name = 'User';						SET @pk_d = CONCAT('<Id>',OLD.`Id`,'</Id>');						SET @rec_state = 3;						SET @rs = 0;						SELECT `record_state` INTO @rs FROM `history_store` WHERE  `table_name` = @tbl_name AND `pk_date_src` = @pk_d;						DELETE FROM `history_store` WHERE `table_name` = @tbl_name AND `pk_date_src` = @pk_d; 						IF @rs <> 1 THEN 						INSERT INTO `history_store`( `timemark`, `table_name`, `pk_date_src`,`pk_date_dest`, `record_state` ) VALUES (@time_mark, @tbl_name, @pk_d,@pk_d, @rec_state ); 						END IF; END */;;
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

-- Dump completed on 2017-11-17  1:52:22
