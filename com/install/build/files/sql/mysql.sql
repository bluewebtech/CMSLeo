<cfoutput>
CREATE DATABASE  IF NOT EXISTS `#session.install.database.database#` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `#session.install.database.database#`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: #session.install.database.database#
-- ------------------------------------------------------
-- Server version	5.5.19

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
-- Table structure for table `#session.install.database.prefix#permissions`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_group` varchar(20) NOT NULL,
  `type_create` int(11) DEFAULT NULL,
  `type_read` int(11) DEFAULT NULL,
  `type_update` int(11) DEFAULT NULL,
  `type_delete` int(11) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#permissions`
--

LOCK TABLES `#session.install.database.prefix#permissions` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#permissions` DISABLE KEYS */;
INSERT INTO `#session.install.database.prefix#permissions` VALUES (1,'Admin',1,1,1,1,1,DATE_FORMAT(NOW(),"%Y-%m-%d"),NULL);
/*!40000 ALTER TABLE `#session.install.database.prefix#permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#users`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `recovery_key` longtext,
  `permissions` int(11) DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `login_total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#users`
--

LOCK TABLES `#session.install.database.prefix#users` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#users` DISABLE KEYS */;
INSERT INTO `#session.install.database.prefix#users` VALUES (1,'#session.install.user.firstname#','#session.install.user.lastname#','#session.install.user.email#','#session.install.user.username#','#session.install.user.password#',NULL,1,1,DATE_FORMAT(NOW(),"%Y-%m-%d"),NULL,0,0);
/*!40000 ALTER TABLE `#session.install.database.prefix#users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#log_visits`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#log_visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#log_visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` date DEFAULT NULL,
  `log_time` time DEFAULT NULL,
  `log_page` longtext,
  `log_ipaddress` varchar(50) DEFAULT NULL,
  `log_browser` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#log_visits`
--

LOCK TABLES `#session.install.database.prefix#log_visits` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#log_visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `#session.install.database.prefix#log_visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#content`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(45) DEFAULT NULL,
  `menu_type` int(11) DEFAULT NULL,
  `menu_item` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_url` varchar(45) DEFAULT NULL,
  `content` longtext,
  `meta_title` varchar(80) DEFAULT NULL,
  `meta_description` varchar(80) DEFAULT NULL,
  `meta_keywords` varchar(80) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#content`
--

LOCK TABLES `#session.install.database.prefix#content` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#content` DISABLE KEYS */;
INSERT INTO `#session.install.database.prefix#content` VALUES (1,'Home',1,1,1,NULL,'<h2>Welcome</h2>\n<p>Welcome, this is nothing more than default text. Please go into the site admin <a href="/leo/">here</a> to change this text and to add more stuff.</p>','Welcome','Welcome','welcome',DATE_FORMAT(NOW(),"%Y-%m-%d"),NULL,1);
/*!40000 ALTER TABLE `#session.install.database.prefix#content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#archives_content`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#archives_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#archives_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(45) DEFAULT NULL,
  `menu_type` int(11) DEFAULT NULL,
  `menu_item` int(11) DEFAULT NULL,
  `menu_order` int(11) DEFAULT NULL,
  `menu_url` varchar(45) DEFAULT NULL,
  `content` longtext,
  `meta_title` varchar(80) DEFAULT NULL,
  `meta_description` varchar(80) DEFAULT NULL,
  `meta_keywords` varchar(80) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `date_archived` date DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#archives_content`
--

/*!40000 ALTER TABLE `#session.install.database.prefix#archives_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `#session.install.database.prefix#archives_content` ENABLE KEYS */;

--
-- Table structure for table `#session.install.database.prefix#log_admin`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#log_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#log_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_date` date DEFAULT NULL,
  `log_time` time DEFAULT NULL,
  `log_user` varchar(20) DEFAULT NULL,
  `log_page` longtext,
  `log_ipaddress` varchar(50) DEFAULT NULL,
  `log_browser` longtext,
  `log_permissions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#log_admin`
--

LOCK TABLES `#session.install.database.prefix#log_admin` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#log_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `#session.install.database.prefix#log_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#theme`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme` varchar(45) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#theme`
--

LOCK TABLES `#session.install.database.prefix#theme` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#theme` DISABLE KEYS */;
INSERT INTO `#session.install.database.prefix#theme` VALUES (1,'default',DATE_FORMAT(NOW(),"%Y-%m-%d"),NULL,1);
/*!40000 ALTER TABLE `#session.install.database.prefix#theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `#session.install.database.prefix#files`
--

DROP TABLE IF EXISTS `#session.install.database.prefix#files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `#session.install.database.prefix#files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` longtext NOT NULL,
  `file_extension` varchar(5) NOT NULL,
  `file_size` varchar(20) DEFAULT NULL,
  `file_directory` varchar(30) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_updated` date DEFAULT NULL,
  `enable` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `#session.install.database.prefix#files`
--

LOCK TABLES `#session.install.database.prefix#files` WRITE;
/*!40000 ALTER TABLE `#session.install.database.prefix#files` DISABLE KEYS */;
/*!40000 ALTER TABLE `#session.install.database.prefix#files` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
</cfoutput>