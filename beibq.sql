-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: beibq
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `bb_book_book`
--

DROP TABLE IF EXISTS `bb_book_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_book_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `access` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `brief` text NOT NULL,
  `select_catalog` int(11) NOT NULL,
  `publish_timestamp` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  `cover` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_bb_book_book_status` (`status`),
  KEY `ix_bb_book_book_publish_timestamp` (`publish_timestamp`),
  KEY `ix_bb_book_book_name` (`name`),
  KEY `ix_bb_book_book_timestamp` (`timestamp`),
  KEY `ix_bb_book_book_updatetime` (`updatetime`),
  KEY `ix_bb_book_book_access` (`access`),
  CONSTRAINT `bb_book_book_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `bb_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_book_book`
--

LOCK TABLES `bb_book_book` WRITE;
/*!40000 ALTER TABLE `bb_book_book` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_book_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_book_catalog`
--

DROP TABLE IF EXISTS `bb_book_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_book_catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `markdown` longtext NOT NULL,
  `html` longtext NOT NULL,
  `publish_markdown` longtext NOT NULL,
  `publish_html` longtext NOT NULL,
  `status` int(11) DEFAULT NULL,
  `abstract` varchar(255) DEFAULT NULL,
  `publish_order` int(11) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `is_dir` tinyint(1) NOT NULL,
  `publish_timestamp` datetime NOT NULL,
  `first_publish` datetime NOT NULL,
  `updatetime` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  `book_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `ix_bb_book_catalog_status` (`status`),
  KEY `ix_bb_book_catalog_timestamp` (`timestamp`),
  KEY `ix_bb_book_catalog_publish_timestamp` (`publish_timestamp`),
  KEY `ix_bb_book_catalog_publish_order` (`publish_order`),
  KEY `ix_bb_book_catalog_pos` (`pos`),
  KEY `ix_bb_book_catalog_first_publish` (`first_publish`),
  KEY `ix_bb_book_catalog_parent_id` (`parent_id`),
  KEY `ix_bb_book_catalog_title` (`title`),
  KEY `ix_bb_book_catalog_updatetime` (`updatetime`),
  KEY `ix_bb_book_catalog_is_dir` (`is_dir`),
  CONSTRAINT `bb_book_catalog_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `bb_book_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_book_catalog`
--

LOCK TABLES `bb_book_catalog` WRITE;
/*!40000 ALTER TABLE `bb_book_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_book_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_book_image`
--

DROP TABLE IF EXISTS `bb_book_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_book_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `book_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `bb_book_image_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `bb_book_book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_book_image`
--

LOCK TABLES `bb_book_image` WRITE;
/*!40000 ALTER TABLE `bb_book_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `bb_book_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_ceshi`
--

DROP TABLE IF EXISTS `bb_ceshi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_ceshi` (
  `id` int(11) NOT NULL,
  `imgname` varchar(255) DEFAULT NULL,
  `imgpath` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `learningrate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_ceshi`
--

LOCK TABLES `bb_ceshi` WRITE;
/*!40000 ALTER TABLE `bb_ceshi` DISABLE KEYS */;
INSERT INTO `bb_ceshi` VALUES (1,'1544886786.png','/Users/fengchang/PycharmProjects/beibq-master/app/static/resource/image/image/1544886786.png',NULL,0.05);
/*!40000 ALTER TABLE `bb_ceshi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_site_meta`
--

DROP TABLE IF EXISTS `bb_site_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_site_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_bb_site_meta_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_site_meta`
--

LOCK TABLES `bb_site_meta` WRITE;
/*!40000 ALTER TABLE `bb_site_meta` DISABLE KEYS */;
INSERT INTO `bb_site_meta` VALUES (1,'name','AI实验平台'),(2,'description','欢迎来到AI实验平台'),(3,'about','您可以在该平台提交代码，进行人脸识别实验，修改参数。');
/*!40000 ALTER TABLE `bb_site_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_tiaocan`
--

DROP TABLE IF EXISTS `bb_tiaocan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_tiaocan` (
  `id` int(11) NOT NULL,
  `learningrate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_tiaocan`
--

LOCK TABLES `bb_tiaocan` WRITE;
/*!40000 ALTER TABLE `bb_tiaocan` DISABLE KEYS */;
INSERT INTO `bb_tiaocan` VALUES (1,0.01);
/*!40000 ALTER TABLE `bb_tiaocan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bb_user`
--

DROP TABLE IF EXISTS `bb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `updatetime` datetime NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_bb_user_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bb_user`
--

LOCK TABLES `bb_user` WRITE;
/*!40000 ALTER TABLE `bb_user` DISABLE KEYS */;
INSERT INTO `bb_user` VALUES (1,'fengchang','fengchang','pbkdf2:sha256:50000$Nr8g5jsX$01b39960438a6db3eeaad83a33b4c394a125eb89974e411add39bd1d3056baaa','16fa0df8fe8211e8acff8c8590740509.png','2018-12-12 22:55:22','2018-12-12 22:55:22');
/*!40000 ALTER TABLE `bb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-15 23:56:59
