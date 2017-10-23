-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: duan2_webapplication_tintucgame
-- ------------------------------------------------------
-- Server version	5.6.20

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
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `sub_content` varchar(4000) NOT NULL,
  `main_content` text NOT NULL,
  `author` varchar(255) NOT NULL,
  `images_thumbnail` text,
  `images_list` text,
  `video` text,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `views` bigint(20) NOT NULL DEFAULT '0',
  `created_date` varchar(45) NOT NULL,
  `created_user_id` int(11) unsigned NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user_id` int(11) DEFAULT NULL,
  `activate_date` datetime DEFAULT NULL,
  `activate_user_id` int(11) DEFAULT NULL,
  `show_date` datetime DEFAULT NULL,
  `allow_comment` enum('allow','block') DEFAULT 'allow',
  `is_hot` tinyint(4) DEFAULT NULL,
  `link_source` text,
  PRIMARY KEY (`article_id`),
  UNIQUE KEY `article_id_UNIQUE` (`article_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `UKlc76j4bqg2jrk06np18eve5yj` (`slug`),
  UNIQUE KEY `UK571gx7oqo5xpmgocegaidlcu9` (`title`),
  KEY `fk_users_category_article_idx` (`created_user_id`),
  CONSTRAINT `FK1vrjy59b2icq8pr85h1skqmwx` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_users_category_article` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_article_category`
--

DROP TABLE IF EXISTS `article_article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_article_category` (
  `article_id` int(11) unsigned NOT NULL,
  `article_category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`article_id`,`article_category_id`),
  KEY `fk_article_category_article_article_category_idx` (`article_category_id`),
  CONSTRAINT `FKgdr8k0bc0h1p6ue4ehl3ks10q` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`article_category_id`),
  CONSTRAINT `FKohje1lc7qi16vjpfsi5ck15wk` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `fk_article_article_article_category` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_category_article_article_category` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`article_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_article_category`
--

LOCK TABLES `article_article_category` WRITE;
/*!40000 ALTER TABLE `article_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category`
--

DROP TABLE IF EXISTS `article_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category` (
  `article_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_article_category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_category_id`),
  UNIQUE KEY `article_category_id_UNIQUE` (`article_category_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `UKhwokd4h9xg8tl23yb004m6tey` (`name`),
  UNIQUE KEY `UK2oiom3i1odw7puepqgrj8x2ud` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category`
--

LOCK TABLES `article_category` WRITE;
/*!40000 ALTER TABLE `article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_category_forum`
--

DROP TABLE IF EXISTS `article_category_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_category_forum` (
  `article_category_forum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_article_category_forum_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_category_forum_id`),
  UNIQUE KEY `article_category_forum_id_UNIQUE` (`article_category_forum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_category_forum`
--

LOCK TABLES `article_category_forum` WRITE;
/*!40000 ALTER TABLE `article_category_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_category_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_forum`
--

DROP TABLE IF EXISTS `article_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_forum` (
  `article_forum_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `main_content` text NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `views` bigint(20) NOT NULL DEFAULT '0',
  `created_date` varchar(45) NOT NULL,
  `created_user_id` int(11) unsigned NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `modified_user_id` int(11) DEFAULT NULL,
  `activate_date` datetime DEFAULT NULL,
  `activate_user_id` int(11) DEFAULT NULL,
  `show_date` datetime DEFAULT NULL,
  `allow_comment` enum('allow','block') DEFAULT 'allow',
  `is_hot` tinyint(4) DEFAULT NULL,
  `link_source` text,
  PRIMARY KEY (`article_forum_id`),
  UNIQUE KEY `title_UNIQUE` (`title`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `article_forum_id_UNIQUE` (`article_forum_id`),
  UNIQUE KEY `UKe6otd7vhq68onbjwaypx1ibbk` (`slug`),
  UNIQUE KEY `UKn0rdjg5egkwyvfhf8p7knrfyu` (`title`),
  KEY `fk_users_category_forum_article_forum_idx` (`created_user_id`),
  CONSTRAINT `FK1ij24wot1221coq3b9vdvjiss` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_users_category_forum_article_forum` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_forum`
--

LOCK TABLES `article_forum` WRITE;
/*!40000 ALTER TABLE `article_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_forum_article_category_forum`
--

DROP TABLE IF EXISTS `article_forum_article_category_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_forum_article_category_forum` (
  `article_forum_id` int(11) unsigned NOT NULL,
  `article_category_forum_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`article_forum_id`,`article_category_forum_id`),
  KEY `fk_article_category_forum_article_forum_article_category_fo_idx` (`article_category_forum_id`),
  CONSTRAINT `FKenxu9gh13h4msbk9umg63bl31` FOREIGN KEY (`article_category_forum_id`) REFERENCES `article_category_forum` (`article_category_forum_id`),
  CONSTRAINT `FKm8t2cfb42q7y1449x4blmd0x1` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`),
  CONSTRAINT `fk_article_category_forum_article_forum_article_category_forum` FOREIGN KEY (`article_category_forum_id`) REFERENCES `article_category_forum` (`article_category_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_forum_article_forum_article_category_forum` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_forum_article_category_forum`
--

LOCK TABLES `article_forum_article_category_forum` WRITE;
/*!40000 ALTER TABLE `article_forum_article_category_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_forum_article_category_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_like`
--

DROP TABLE IF EXISTS `article_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_like` (
  `article_like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_like_id`),
  UNIQUE KEY `article_like_id_UNIQUE` (`article_like_id`),
  KEY `fk_article_article_like_idx` (`article_id`),
  KEY `fk_users_article_like_idx` (`user_id`),
  CONSTRAINT `FK4q8taf63le59xlia82u2morw1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKabthli6g1qjriusniw93pbesw` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `fk_article_article_like` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_article_like` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_like`
--

LOCK TABLES `article_like` WRITE;
/*!40000 ALTER TABLE `article_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_like_forum`
--

DROP TABLE IF EXISTS `article_like_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_like_forum` (
  `article_like_forum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `article_forum_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_like_forum_id`),
  UNIQUE KEY `article_like_forum_id_UNIQUE` (`article_like_forum_id`),
  KEY `fk_article_forum_article_like_forum_idx` (`article_forum_id`),
  KEY `fk_users_article_like_forum_idx` (`user_id`),
  CONSTRAINT `FK5it3m6oend38vb5occb2nkpq9` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK63yrepufi014fa1vfycx4sio6` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`),
  CONSTRAINT `fk_article_forum_article_like_forum` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_article_like_forum` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_like_forum`
--

LOCK TABLES `article_like_forum` WRITE;
/*!40000 ALTER TABLE `article_like_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_like_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_tag`
--

DROP TABLE IF EXISTS `article_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_tag` (
  `article_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`article_id`,`tag_id`),
  KEY `fk_tags_article_tag_idx` (`tag_id`),
  CONSTRAINT `FK3nvn435qf5rn1e9ph51e3r55h` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tags_id`),
  CONSTRAINT `FKenqeees0y8hkm7x1p1ittuuye` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `fk_article_article_tag` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_article_tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tags_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_tag`
--

LOCK TABLES `article_tag` WRITE;
/*!40000 ALTER TABLE `article_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `article_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_comment_id` int(11) unsigned DEFAULT NULL,
  `content` text NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'active',
  `article_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  UNIQUE KEY `comment_id_UNIQUE` (`comment_id`),
  KEY `fk_article_comment_idx` (`article_id`),
  KEY `fk_users_comment_idx` (`user_id`),
  CONSTRAINT `FK5yx0uphgjc6ik6hb82kkw501y` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  CONSTRAINT `FKqm52p1v3o13hy268he0wcngr5` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_article_comment` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_comment` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_forum`
--

DROP TABLE IF EXISTS `comment_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_forum` (
  `comment_forum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_comment_forum_id` int(11) unsigned DEFAULT NULL,
  `content` text NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'active',
  `article_forum_id` int(11) unsigned NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_forum_id`),
  UNIQUE KEY `comment_forum_id_UNIQUE` (`comment_forum_id`),
  KEY `fk_article_forum_comment_forum_idx` (`article_forum_id`),
  KEY `fk_users_forum_comment_forum_idx` (`user_id`),
  CONSTRAINT `FKki0ndia5v4dtauptncgor9gmv` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`),
  CONSTRAINT `FKm1m85hw5onak5ta3r3hlcmy58` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_article_forum_comment_forum` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_forum_comment_forum` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_forum`
--

LOCK TABLES `comment_forum` WRITE;
/*!40000 ALTER TABLE `comment_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_like`
--

DROP TABLE IF EXISTS `comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_like` (
  `comment_like_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `comment_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_like_id`),
  UNIQUE KEY `comment_like_id_UNIQUE` (`comment_like_id`),
  KEY `fk_comment_comment_like_idx` (`comment_id`),
  KEY `fk_users_comment_like_idx` (`user_id`),
  CONSTRAINT `FKl5wrmp8eoy5uegdo3473jqqi` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKqlv8phl1ibeh0efv4dbn3720p` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`),
  CONSTRAINT `fk_comment_comment_like` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`comment_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_comment_like` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_like`
--

LOCK TABLES `comment_like` WRITE;
/*!40000 ALTER TABLE `comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_like_forum`
--

DROP TABLE IF EXISTS `comment_like_forum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_like_forum` (
  `comment_like_forum_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `comment_forum_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_like_forum_id`),
  UNIQUE KEY `comment_like_forum_id_UNIQUE` (`comment_like_forum_id`),
  KEY `fk_comment_forum_comment_like_forum_idx` (`comment_forum_id`),
  KEY `fk_users_forum_comment_like_forum_idx` (`user_id`),
  CONSTRAINT `FK4c9pb6egti96420hwi922c6qi` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKamilv0ymvqg3m51xu5ghn5ct0` FOREIGN KEY (`comment_forum_id`) REFERENCES `comment_forum` (`comment_forum_id`),
  CONSTRAINT `fk_comment_forum_comment_like_forum` FOREIGN KEY (`comment_forum_id`) REFERENCES `comment_forum` (`comment_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_forum_comment_like_forum` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_like_forum`
--

LOCK TABLES `comment_like_forum` WRITE;
/*!40000 ALTER TABLE `comment_like_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_like_forum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_category`
--

DROP TABLE IF EXISTS `game_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_category` (
  `game_category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sub_game_category_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_category_id`),
  UNIQUE KEY `game_category_id_UNIQUE` (`game_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_category`
--

LOCK TABLES `game_category` WRITE;
/*!40000 ALTER TABLE `game_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game_reviews`
--

DROP TABLE IF EXISTS `game_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_reviews` (
  `game_review_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `game_id` int(11) unsigned NOT NULL,
  `review` double NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'active',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_review_id`),
  UNIQUE KEY `game_review_id_UNIQUE` (`game_review_id`),
  KEY `fk_gane_game_reviews_idx` (`game_id`),
  KEY `fk_users_game_reviews_idx` (`user_id`),
  CONSTRAINT `FK8wbl1jhvpws8ek1y4tfi0pv31` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `FKndh5d3njmsvuo57vq3yu8sy9k` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `fk_gane_game_reviews` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_game_reviews` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game_reviews`
--

LOCK TABLES `game_reviews` WRITE;
/*!40000 ALTER TABLE `game_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `game_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `developers` varchar(1000) DEFAULT NULL,
  `publishers` varchar(1000) NOT NULL,
  `writers` varchar(1000) DEFAULT NULL,
  `composers` varchar(1000) DEFAULT NULL,
  `engine` varchar(1000) DEFAULT NULL,
  `platforms` varchar(1000) DEFAULT NULL,
  `release` varchar(1000) NOT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `UKdp39yy9j9cn10v9vhyr2j1uaa` (`name`),
  UNIQUE KEY `UKnoa70sjs12k50cvamllci7lve` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `games_games_category`
--

DROP TABLE IF EXISTS `games_games_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games_games_category` (
  `game_id` int(11) unsigned NOT NULL,
  `game_category_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`game_id`,`game_category_id`),
  KEY `fk_games_category_games_games_category_idx` (`game_category_id`),
  CONSTRAINT `FK5r0yuhlgt18005ioct182xkpi` FOREIGN KEY (`game_category_id`) REFERENCES `game_category` (`game_category_id`),
  CONSTRAINT `FKj61ymmcuulpkejpm8qq9fw7ts` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`),
  CONSTRAINT `fk_games_category_games_games_category` FOREIGN KEY (`game_category_id`) REFERENCES `game_category` (`game_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_games_games_games_category` FOREIGN KEY (`game_id`) REFERENCES `games` (`game_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games_games_category`
--

LOCK TABLES `games_games_category` WRITE;
/*!40000 ALTER TABLE `games_games_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `games_games_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_id_UNIQUE` (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_id_UNIQUE` (`page_id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `UKi2togwxhf7vhxn5pstqyu8jc8` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Liên Hệ','lien-he','noi dung page lien he','active',NULL),(3,'Liên Hê 1','lien-he-1','noi dugn lien he 1','inactive','123123');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `idquyen_UNIQUE` (`role_id`),
  UNIQUE KEY `tenquyen_UNIQUE` (`name`),
  UNIQUE KEY `UKofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (5,'ROLE_ADMIN','active',NULL),(6,'ROLE_MEMBER','active',NULL);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tags_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tags_id`),
  UNIQUE KEY `tags_id_UNIQUE` (`tags_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  UNIQUE KEY `UKt48xdq560gs3gap9g7jg36kgc` (`name`),
  UNIQUE KEY `UKsn0d91hxu700qcw0n4pebp5vc` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `pasword` varchar(70) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `status` enum('deleted','draft','inactive','active') NOT NULL DEFAULT 'inactive',
  `created_date` datetime NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `is_online` tinyint(4) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `logged_in_date` datetime NOT NULL,
  `avatar` text,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UKk8d0f2n7n88w1a16yhua64onx` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,'admin','$2a$10$MBL6FteloVnYjVMxeeYUbul9MARInxTrAWkfHJlGXyD9HQZ.oo2fK','admin@gmail.com',NULL,NULL,'active','2017-10-17 14:13:51',NULL,1,NULL,'2017-10-17 14:13:51',NULL,NULL),(4,'nguoidung','$2a$10$kd1g0Vd7B8V2IPH.liImKOazmy/JVTat5HH4SJ01ubf5uOXsITS6O','nguoidung@gmail.com',NULL,NULL,'inactive','2017-10-17 14:13:51',NULL,1,NULL,'2017-10-17 14:13:51',NULL,NULL),(5,'nguoidung0','$2a$10$BkFYwsEymhHZTYBzT9Ef7ezZYZHZ9Pm9zx8kFMUdMEW9eiAKLbk5K','nguoidung0@gmail.com',NULL,NULL,'active','2017-10-20 22:07:10',NULL,1,NULL,'2017-10-20 22:07:10',NULL,NULL),(6,'nguoidung1','$2a$10$SXC1kyS1Qj8BtPWhTnjdne9duC7rjOIHUNNK2Me2DHtCq2rL8gORm','nguoidung1@gmail.com',NULL,NULL,'active','2017-10-20 22:07:10',NULL,1,NULL,'2017-10-20 22:07:10',NULL,NULL),(7,'nguoidung2','$2a$10$UOgUm9T13TDciHcxGLKD6utUI2U11nWPr9WxnMEZGMfrEQQzJQ3Dy','nguoidung2@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(8,'nguoidung3','$2a$10$vvjrztmP2dwtMkWiiSYSP.fXNJneQq9sKEBUXj/j.pppz6amzRXKq','nguoidung3@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(9,'nguoidung4','$2a$10$7pWVUCZuytN2pYhbDJRcPeKhBvmArpqzIZR3CtcBPHq3AtaagnlUS','nguoidung4@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(10,'nguoidung5','$2a$10$rvdAjZQw82E12AJJ168BYOKek4Zl2m/9.zBhA3VuH2VfMl6ZnIIfC','nguoidung5@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(11,'nguoidung6','$2a$10$VJjEz.eNWplcPgGQ9pm9DeX9RrWcN4iNMKL5QHEi/nnj5ntqhvyoK','nguoidung6@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(12,'nguoidung7','$2a$10$VeCRf8oOaU9dknU8YP6u3eK7ZEKqlO2oe65wh/iYZXAl8j8Nbec4C','nguoidung7@gmail.com',NULL,NULL,'active','2017-10-20 22:07:11',NULL,1,NULL,'2017-10-20 22:07:11',NULL,NULL),(13,'nguoidung8','$2a$10$ta9VnkNM2cNWMPMSmbguae9hqnvIwQJhwl7yLGAal8relwqjLzmi6','nguoidung8@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(14,'nguoidung9','$2a$10$Ksup.Wh/YOYrcL91K98FXe9FIw7vUE.Jr8yUDAoAa3HdsXKKpBfXa','nguoidung9@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(15,'nguoidung10','$2a$10$A2W2fCqpuI809Myapv2AK.RBzwKbLYTS7LSNzc0GYSPPMNRfUV.FO','nguoidung10@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(16,'nguoidung11','$2a$10$u/wMUMocfDdvls0pnUmofOGgO/AfrOcN49dX1juP6NEsuMxFgpwcu','nguoidung11@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(17,'nguoidung12','$2a$10$wyL358.DcUGlKb7ISTASOO/Pk5vDNSaCfVk1qhDE5kQZbwoxdXPm6','nguoidung12@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(18,'nguoidung13','$2a$10$n6vEJOlSsxHg0eHLgG9rCO0..AGmCuZ.iNCu3D7glNq7M971ksPHu','nguoidung13@gmail.com',NULL,NULL,'active','2017-10-20 22:07:12',NULL,1,NULL,'2017-10-20 22:07:12',NULL,NULL),(19,'nguoidung14','$2a$10$Ouw30Go7arLD51ik/E.kt.2tUqg57wk8yk/RQcBAwoiRTg1uI43pu','nguoidung14@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(20,'nguoidung15','$2a$10$QfGuAylD1D26tIT0keZkIe1W2UQOl6hbJ5wcr.YHgYW8LYYs4Pvc2','nguoidung15@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(21,'nguoidung16','$2a$10$A6/VRREM31vDSiBXKVujmeZ5UoR8gKcZw0BeOn1N87/PtZOmongA2','nguoidung16@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(22,'nguoidung17','$2a$10$TRM/z0ant6PmY.GYeNau.Ok8nmhKaCYOfUaMo8k3I8ki2p15jYO8i','nguoidung17@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(23,'nguoidung18','$2a$10$gygrwUJE7yS9RtZPj6AzaOeVnR55LTqi9rYxIzXGWiBdVhWHFNk.y','nguoidung18@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(24,'nguoidung19','$2a$10$unYaL.tAOFNHRrJVzO5lku3Q3xEBmudCqQoGt3j0tN5nqMGmBzzUG','nguoidung19@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(25,'nguoidung20','$2a$10$C2ehfiFe5as52Y.OzimJKeZyAyTXrxUdIi7Qvfr.kYii4eIOmn73.','nguoidung20@gmail.com',NULL,NULL,'active','2017-10-20 22:07:13',NULL,1,NULL,'2017-10-20 22:07:13',NULL,NULL),(26,'nguoidung21','$2a$10$MM8/PEM3PRZ/lLWtm1ae3uCq0euWGf468A7dJLLiXnLm8Az/2lgIO','nguoidung21@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(27,'nguoidung22','$2a$10$pbqPiaPoPfEkbqGHn8HSAeCV4b4LtLkxJyReW3rKzXvq2e1t/wWBC','nguoidung22@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(28,'nguoidung23','$2a$10$kj7LGbYMmxaTwOdYCY4LfOsWkgxXoissp39OgvdR.0BXjBH3/bdAa','nguoidung23@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(29,'nguoidung24','$2a$10$FdlQ7d/01aHmyzEExNBsLOnwbTptcgnE24SPQEhXVYJsmm6EvVXSe','nguoidung24@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(30,'nguoidung25','$2a$10$Y8FfTcGrSOd8lEZCEI6lr.U11UfEDGOzr/h.iABP9Dys.ozu30iui','nguoidung25@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(31,'nguoidung26','$2a$10$Lgt9/IDZZfnSEGBF6X9BCOZ/mPWria4ryTazWAf8M8rJiNlXxYG3e','nguoidung26@gmail.com',NULL,NULL,'active','2017-10-20 22:07:14',NULL,1,NULL,'2017-10-20 22:07:14',NULL,NULL),(32,'nguoidung27','$2a$10$g4nLkYrHwY3UX0WNiwbAs.VuxGKybokOyycXdv1EOP1XdobOOYXG2','nguoidung27@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(33,'nguoidung28','$2a$10$ZWWJjor6ymhm3a.fTzYtYOwobZMuJSBh0Q4Dgsjm3IvMiivVNHmlG','nguoidung28@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(34,'nguoidung29','$2a$10$D3xFFlcDLLG45/U7rgM7tuFDgmZ3hwJqlF6hqfvwYLAjhbGCFrO1i','nguoidung29@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(35,'nguoidung30','$2a$10$ZMQq6YfdJvL7ib2HhDqG7..0dvPIsm.u8w56jxPTB30.wZhyEtpoW','nguoidung30@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(36,'nguoidung31','$2a$10$qRM4mfJL4/PR0DjEwdpjNuHiQYF/FklhYIp33y7DenzUVxlaQkst2','nguoidung31@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(37,'nguoidung32','$2a$10$nrI.N6jxsEES8CMtcnPAS.20dSZmwYJgLFoE34aMxCJOSw9fjTcci','nguoidung32@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(38,'nguoidung33','$2a$10$tWx3ESrsRpAnwo1trMNJbeQlxuZ/LCw/gBFGuJv2eg4W4OyNhkqEC','nguoidung33@gmail.com',NULL,NULL,'active','2017-10-20 22:07:15',NULL,1,NULL,'2017-10-20 22:07:15',NULL,NULL),(39,'nguoidung34','$2a$10$Exc/IVYBJXmPdyJFdMPX5eQJ9DKTZtlvw8HgrCrZ0cugmOW.CegPe','nguoidung34@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(40,'nguoidung35','$2a$10$E1A0T3hBrKb08QZ3wL/nAukUj3zlVv6O3AgWWw/rghB41OZ3GJeNC','nguoidung35@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(41,'nguoidung36','$2a$10$3/t4WAgWVNrPnehIZ6JZ2ufgERVnzpGMAb7PqEB/4FrHloj5Mj0IS','nguoidung36@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(42,'nguoidung37','$2a$10$evii6PzhNvx2kpMx2e7gcOLXTmYjlugkMQPoV1oF8MYHRpPUrkLv6','nguoidung37@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(43,'nguoidung38','$2a$10$UZpYh4Wqb4X87MBbi6T4..C9Jyid3pttfJlsBYpiyNHl8qaO0mONO','nguoidung38@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(44,'nguoidung39','$2a$10$10e0A.KMIdP85l/R2WDdG.i1JH7usjuqCXQeQ69nJCBG44Ghz1obu','nguoidung39@gmail.com',NULL,NULL,'active','2017-10-20 22:07:16',NULL,1,NULL,'2017-10-20 22:07:16',NULL,NULL),(45,'nguoidung40','$2a$10$JZIdeFcKk.WcXJtdmnwPJOdE88Qi308RlZqH9q9Rt0TNX9NRgPyEG','nguoidung40@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(46,'nguoidung41','$2a$10$9R8OIod7LbV8PoBFQCOgxO1beCzxVi/xcRYcT51BcUnUb663EF52W','nguoidung41@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(47,'nguoidung42','$2a$10$Fsc8VyRKN8VVqJqh/nk1kexHW60cEde8d/LAy1.0uaKb/yG.3Udse','nguoidung42@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(48,'nguoidung43','$2a$10$oDkJRZKL4La22FPJxkJHyeTPC70zadqZZMMggtjP4qTY5xK.p4sla','nguoidung43@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(49,'nguoidung44','$2a$10$vlTo.68ajPX/pbMfxYnSG.p68lDUlYG1uFTXEsiYCcfzL9atMJzr2','nguoidung44@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(50,'nguoidung45','$2a$10$4s9Lw3DWfIZBzJ302aWQAeUWLh/J7i1TcMjgL6DseqOafk/jYTTqW','nguoidung45@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(51,'nguoidung46','$2a$10$GYhEJx4cULU0z6.TofOrr.a1oI2h529vmyETn1OJpNl0cCgd3TFZm','nguoidung46@gmail.com',NULL,NULL,'active','2017-10-20 22:07:17',NULL,1,NULL,'2017-10-20 22:07:17',NULL,NULL),(52,'nguoidung47','$2a$10$HilfWhdWJ4gpcio4BNvvpe72tVDtfkepRlbPfkRI9Ug09WdrN9r6C','nguoidung47@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(53,'nguoidung48','$2a$10$8R02.4eukEo1WM5ov7s9POG97ICcLD/mMaoJaB7u7t6vfqy7phGja','nguoidung48@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(54,'nguoidung49','$2a$10$yvzHUoDgekQxZREX1XA8gO4/PCTkxbkk/Bc5kihoPOCwYkwjHj1G6','nguoidung49@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(55,'nguoidung50','$2a$10$O6buTarXg5XcXPFZbq89g.u9bWpxhVeYpPdTQJlOaIyE.TgxNoq6.','nguoidung50@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(56,'nguoidung51','$2a$10$AIgu3Pg4kD//bmNHZsZDWuctliu0MzOqFHi908WpZkolqbU44Bpie','nguoidung51@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(57,'nguoidung52','$2a$10$HOKTbpJe2kdcEdj4jKrkuecz1wRtOWDxmb0/iD15l0bjeb1OJiAhC','nguoidung52@gmail.com',NULL,NULL,'active','2017-10-20 22:07:18',NULL,1,NULL,'2017-10-20 22:07:18',NULL,NULL),(58,'nguoidung53','$2a$10$1PQXQXbCXrS2iYHQlEY3VOEHKRU6yKihnSZq4ogp8gqu8wixmZJqK','nguoidung53@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(59,'nguoidung54','$2a$10$Xw9L6TZsE0g48mfia2sPw.dT/DrnV3V.wUDSAIpbB4VbrnLgeC//.','nguoidung54@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(60,'nguoidung55','$2a$10$O3wFaaazXUZw1xP760l7ROJUtJE/YZmE2Ta29oC1quHy9uxcmOpPG','nguoidung55@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(61,'nguoidung56','$2a$10$I0.NKbAn6TTxW7cpB8u6h.95k.QMoadSuDpR.klKGHweIFFy.Ubaa','nguoidung56@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(62,'nguoidung57','$2a$10$MligQUSS/BiPszN.6NEul.0UXuJYSoHfLpE1PF/F5NQxG8ISU4xnq','nguoidung57@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(63,'nguoidung58','$2a$10$FWfauTNCgKRurDx1meyNZOPxjH0iJrg/lFAgd8NoX3GcIuJXga/zu','nguoidung58@gmail.com',NULL,NULL,'active','2017-10-20 22:07:19',NULL,1,NULL,'2017-10-20 22:07:19',NULL,NULL),(64,'nguoidung59','$2a$10$XTZLpXVLFPa/AjBH..kZxuhXpJr0lH0qWtvuoHgb1aXZ1c/l3fvz.','nguoidung59@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(65,'nguoidung60','$2a$10$C8Ppupl43YvOQ8g6ilBoreHlFKO.y57xQ2rp3ygJYSbos5WSXUfyi','nguoidung60@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(66,'nguoidung61','$2a$10$FrsNroN3D9uA6pFQXPeQEuvc96KkwqzPe6mvnAZuLNR4Y0/xWJsTu','nguoidung61@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(67,'nguoidung62','$2a$10$u.jcUTzZaKTU1CwPZ5oo4uY.Pz.YlTAuRCxPEicHr0LGxrK6bZixS','nguoidung62@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(68,'nguoidung63','$2a$10$Xm21kEVYZPVo7OALyrp5DOgPOPDF54zIby.SrITaL.8v1uExsF52.','nguoidung63@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(69,'nguoidung64','$2a$10$sow2HRpCiYb0HTgYzT00eeyLqcvjqpPdjl9FhYO8L5g1ElrEejURK','nguoidung64@gmail.com',NULL,NULL,'active','2017-10-20 22:07:20',NULL,1,NULL,'2017-10-20 22:07:20',NULL,NULL),(70,'nguoidung65','$2a$10$.IdjlrFyDqh18ZXV96ScPutlfrQ89NsmHAZUDXg7GMp6g/QBRks1G','nguoidung65@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(71,'nguoidung66','$2a$10$EJ8PwW8KFmlGBPLv.WlKf.h9OwjwEEzvgIGJqSh7LvASpiFJC8ZGK','nguoidung66@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(72,'nguoidung67','$2a$10$ylYd1khzLTqOz3SUg3S4xu13nITbbWRDbiSimzYHx4LHR50UIXaAa','nguoidung67@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(73,'nguoidung68','$2a$10$XjEVLPSbzC/hB1i0UmUCd.WlZo9.eK9w7rwFotg5xdT7qpHRAC3IO','nguoidung68@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(74,'nguoidung69','$2a$10$2RWm3ELYCLUoqFSBnd5QoO1k5viev9TUf4sjpW7.PXC6yk2nWggEu','nguoidung69@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(75,'nguoidung70','$2a$10$CxtVlCL2pk6PmTA8upsX4es2NnOWL91Zb4a8HkpXDTBJR7dFLH.Ga','nguoidung70@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(76,'nguoidung71','$2a$10$KELG8iG8/CtcurLzxN5a7uX16mjiLwbH8mV3/Sj8mjnaS0Rg6n9Tq','nguoidung71@gmail.com',NULL,NULL,'active','2017-10-20 22:07:21',NULL,1,NULL,'2017-10-20 22:07:21',NULL,NULL),(77,'nguoidung72','$2a$10$neqYkPvHni5e0bJeh1Ggoeg8hSdu5EQTll9F5keZEFME6UJXhJENK','nguoidung72@gmail.com',NULL,NULL,'active','2017-10-20 22:07:22',NULL,1,NULL,'2017-10-20 22:07:22',NULL,NULL),(78,'nguoidung73','$2a$10$3dPwVuNZynnLsqWJAQbDre/xNkqp0ToRuHFLURMpngkhHYNcSkjw2','nguoidung73@gmail.com',NULL,NULL,'active','2017-10-20 22:07:22',NULL,1,NULL,'2017-10-20 22:07:22',NULL,NULL),(79,'nguoidung74','$2a$10$j/NhR5JpYK3UJ3Nn0KNaDuPNN31x4U3p31mPFlfOwCHMdzgS7ow2m','nguoidung74@gmail.com',NULL,NULL,'active','2017-10-20 22:07:22',NULL,1,NULL,'2017-10-20 22:07:22',NULL,NULL),(80,'nguoidung75','$2a$10$5tKIWFlT4oFUZDWkBoff/eNH8FyLLKZtRzUJAypPPc9Ah9YWmvs0q','nguoidung75@gmail.com',NULL,NULL,'active','2017-10-20 22:07:22',NULL,1,NULL,'2017-10-20 22:07:22',NULL,NULL),(81,'nguoidung76','$2a$10$oWcnZQZ3WElYe1DjVDikqeIoeOoCgQAs.x.YIBXFG.fMB13D22R1.','nguoidung76@gmail.com',NULL,NULL,'active','2017-10-20 22:07:22',NULL,1,NULL,'2017-10-20 22:07:22',NULL,NULL),(82,'nguoidung77','$2a$10$o1SfRGTHpVLoCjsdVD2Ufu1j0vCrUpNjFM/50PykMGmI1Z1YxjLiu','nguoidung77@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(83,'nguoidung78','$2a$10$p3PpAawcMwiEnmFI7az.UeLmQ51XXp1gubj.il9u6uZ.95tg3EWTm','nguoidung78@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(84,'nguoidung79','$2a$10$ezT2kBkjB9U6swxcCTFlregx04usGpPApLvFEaxvxJuLdK8CpbG7y','nguoidung79@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(85,'nguoidung80','$2a$10$4i0DDLsQlPC8BpZLefqiA.IinyCBhRtRZTnveTd1cFbQWm5dirhq6','nguoidung80@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(86,'nguoidung81','$2a$10$qrtqAPXkBgwKSSKn3L70.O2DskHy5Fv8XJvisdkqJoDXZU6DAMXli','nguoidung81@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(87,'nguoidung82','$2a$10$2.F6EaV5oIaSy1egCx/mvOBnIhbjBd/emZvdg6SXhmLI44IbfIolu','nguoidung82@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(88,'nguoidung83','$2a$10$2vWuN/J3QG3qHMRTrKtxtuJvyQfHpEqHMVDfr/J/Hafa0AWtdEXPu','nguoidung83@gmail.com',NULL,NULL,'active','2017-10-20 22:07:23',NULL,1,NULL,'2017-10-20 22:07:23',NULL,NULL),(89,'nguoidung84','$2a$10$2eoS8VgiGo6AyXvX1Vot4uB/ut9olqObNr3Yo8kluCOFpYHiYNV.e','nguoidung84@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(90,'nguoidung85','$2a$10$l6v.cMCCpLtSjrGruCw4LezS1GOEECXJIXNA9zzHGNd.eCMEFeete','nguoidung85@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(91,'nguoidung86','$2a$10$mHq0Bx0bFR76MFqEq/gd9./d6nZ9Kn8kp5ocISjidyn4AhZUe0oNW','nguoidung86@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(92,'nguoidung87','$2a$10$9q6jD5dL9ZEF9G3dpmRyrOW8B.ZFMg1gTcjpv7hIYo8SVIqQLvQuW','nguoidung87@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(93,'nguoidung88','$2a$10$GKa4dKUXd/e.gFtigp9oruBtlZrV3W5rCCFRPPmYiUcI5r97jElkW','nguoidung88@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(94,'nguoidung89','$2a$10$hfl07sS3PjhoEvAqzULqa.mZogAJ47GsXbW1qJBKKmS/QDgbaiiLm','nguoidung89@gmail.com',NULL,NULL,'active','2017-10-20 22:07:24',NULL,1,NULL,'2017-10-20 22:07:24',NULL,NULL),(95,'nguoidung90','$2a$10$wla.3zLIBEXzO6qvgQwrNux9qKQf/VGT043DJJZ6Osf7DAG3i9HGa','nguoidung90@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(96,'nguoidung91','$2a$10$cjEn7FyDNQKaToRoRGlHiuz.ZE1AxYllILC4gX31grcOH4w7Qedoq','nguoidung91@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(97,'nguoidung92','$2a$10$8AjP6ISkp4UijG9.gPD0CO/HzCeerhhhCKuWoOtDnZsNkHA0Yvavy','nguoidung92@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(98,'nguoidung93','$2a$10$3Dq55LmJYu1q2yVxfmgl9eW2nxc39422PnN36lEeHEuB6WgFK4h.i','nguoidung93@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(99,'nguoidung94','$2a$10$Ov4//ssYViQup5HmVUkUw.VndVOxjJpiaFifpsQ0Y2EVjosbeZGIK','nguoidung94@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(100,'nguoidung95','$2a$10$WvfbMnHc7J9ORqeAaPgrBOKSqFJRqpJuAmyBr46VKSfPAkaaFu.B6','nguoidung95@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(101,'nguoidung96','$2a$10$30do5l4APFqmpRLAUi95yOJL.EqPV9GUAAHbOkzFxKUPnLVC3WR8e','nguoidung96@gmail.com',NULL,NULL,'active','2017-10-20 22:07:25',NULL,1,NULL,'2017-10-20 22:07:25',NULL,NULL),(102,'nguoidung97','$2a$10$9gEbxwp9TOrtbnsu.5YlB.WFMaQePn3ExZZczwdhSPFrmT1eXk1pK','nguoidung97@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(103,'nguoidung98','$2a$10$/Pb0dl8wpSqnSbGmxQZ.NO3swBXYU66KV9VmmoT1nTp/zwRX2I0ZC','nguoidung98@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(104,'nguoidung99','$2a$10$JPiQYZlliFl3MnlF4w7u5.SwZvu5WX6iMoL5uhw9C35MRVuOoQYba','nguoidung99@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(105,'nguoidung100','$2a$10$K7HGuuiv57AvU3hXgn0/HeOSVnQ1w3q2WIUOpe4s72gsksMZBbhUu','nguoidung100@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(106,'nguoidung101','$2a$10$hGIMtNBiqqdONRSwhOFWFO8RmGJJwOnRcJPvk/OZLjIMHHDbYPV12','nguoidung101@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(107,'nguoidung102','$2a$10$vJv5uo4mL0JmfrblV/.IwevqmMsgr.p0a4LlybDSNGDZktUDddBby','nguoidung102@gmail.com',NULL,NULL,'active','2017-10-20 22:07:26',NULL,1,NULL,'2017-10-20 22:07:26',NULL,NULL),(108,'nguoidung103','$2a$10$7N34IxDA2tu6zyccV3OY/uhCQ9qIG6E/ZUvkrvoQnDYed0GIZUUAC','nguoidung103@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(109,'nguoidung104','$2a$10$nZlbKXOtcHAPHWkcMmklHu1YOH6HtAphVqAaGSZ02UgnuJ74NRR4q','nguoidung104@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(110,'nguoidung105','$2a$10$D8SMtJdgVZVUMbMI4Ev...nsXbXGIw0Bw6T69Q223FJLIwJcwtTUW','nguoidung105@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(111,'nguoidung106','$2a$10$WiBYesiubzZGrVRNrPubI.imIFceUjujxhXacl6iRA3xZLNvqoMIy','nguoidung106@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(112,'nguoidung107','$2a$10$P/p/K4d3CcNIAREqrFD/7.IDUr2XDm5l0iLfHyHh0AZ5ke/mu/wTm','nguoidung107@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(113,'nguoidung108','$2a$10$zWngscWQl2hLsKwTiYPiFOgrfVvLIXfo2mZSPuTs254wn.6zXm82a','nguoidung108@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(114,'nguoidung109','$2a$10$6niRf9NcqKxajmSah7iuN.kag/U125UIEGYCAq98ZinRzVMpTEzbG','nguoidung109@gmail.com',NULL,NULL,'active','2017-10-20 22:07:27',NULL,1,NULL,'2017-10-20 22:07:27',NULL,NULL),(115,'nguoidung110','$2a$10$MCdVKLG2ffQ/9ZS.L9bWROqs3cutGMsxZBQqck3ocg60FB9KTLdjm','nguoidung110@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(116,'nguoidung111','$2a$10$hCC9gW81Ckceh6GONinZQO0l63kByGIxSo3ubn2AZpZ2Lwvi59S2K','nguoidung111@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(117,'nguoidung112','$2a$10$0dXBS6mnZp2vupWDz0X4zOUP15PbxhecRlvNbOkMBqZbS5yJ/iHWO','nguoidung112@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(118,'nguoidung113','$2a$10$TapPxB0cysbePlTro54pX.02v.1uqA9w0dixol8o274CmS8t6Wdxq','nguoidung113@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(119,'nguoidung114','$2a$10$aX./qiY7S9kcTo3.5bETLOn2iTDUgjIW8ByOJy357bFey2nidIdyK','nguoidung114@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(120,'nguoidung115','$2a$10$ZXTen3KQBL1mY6x4Ss5ONOD9xgFktD/Jqc1wUaCzHz4HEopo/sTIu','nguoidung115@gmail.com',NULL,NULL,'active','2017-10-20 22:07:28',NULL,1,NULL,'2017-10-20 22:07:28',NULL,NULL),(121,'nguoidung116','$2a$10$RIEB32OnuRdXUKRmGtU0DOe5T20D0hxvgPAi9guDtTrQjrJOvYDzC','nguoidung116@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(122,'nguoidung117','$2a$10$RXcYUMgI5xp127ItArUdROJ7vhJn75vD94RTK9I5L9RmBavZAUrDi','nguoidung117@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(123,'nguoidung118','$2a$10$qnc1Lra11VKOI/Jh4KHxc.temt1wj20WMnfB2K188BLZRDyCjXnve','nguoidung118@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(124,'nguoidung119','$2a$10$KV8KPEca5ERMsd45c/Fcfe00f3ZTYmdt4AXjrhYqhPtxiGThM9r3q','nguoidung119@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(125,'nguoidung120','$2a$10$a.biiP51d2ifH8huVFAxKOt9lolLz2zulE5WomvlWRGKs4uwlda46','nguoidung120@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(126,'nguoidung121','$2a$10$hEUl2oFf4I6/Cjg9qf15ouYRMtvBnZX6m6UPOuWF8EpMw9mTbn8Na','nguoidung121@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(127,'nguoidung122','$2a$10$Er55yns9w0SdnwQrGtxUQ.2pnPWBwQnsHAPj7WIg2Nk33qwB27.WO','nguoidung122@gmail.com',NULL,NULL,'active','2017-10-20 22:07:29',NULL,1,NULL,'2017-10-20 22:07:29',NULL,NULL),(128,'nguoidung123','$2a$10$UZlcT3u2K3IupeOzZ277U.1H5eqYgut38q1e.VUM3xbaljw0sD5fG','nguoidung123@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(129,'nguoidung124','$2a$10$AZ6peI9x8D2qBkEfThD4.u0LsdS8/s12oDqMUzpeXtq.JVqfFRylC','nguoidung124@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(130,'nguoidung125','$2a$10$TZDfSaqhgBS4l.yJPRkhJeww0xrb34NBdlN99iTX8FTXhhTQgrDhm','nguoidung125@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(131,'nguoidung126','$2a$10$kL2MVE1LD7YtYp6sSJ3wHuk6zl0y5kHv/6ZOuBu7v0MhMLZtc5DVy','nguoidung126@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(132,'nguoidung127','$2a$10$AAyO5UGNwjYjxFEgmXpT5eEnV56MkZylSgS7ryDzkCAWuvXHn6e0O','nguoidung127@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(133,'nguoidung128','$2a$10$54a8h4LB.F46TJuZYlAmseU7So3F6ENgUeobruGntmDnhSAl5RxMW','nguoidung128@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(134,'nguoidung129','$2a$10$TMT6qXyAo/Bo/VMjv706POUBzfTAYVmTfHanpwuH4H7jcdDNXEZm2','nguoidung129@gmail.com',NULL,NULL,'active','2017-10-20 22:07:30',NULL,1,NULL,'2017-10-20 22:07:30',NULL,NULL),(135,'nguoidung130','$2a$10$2jum4w.7qwOPHpNPh7nGGOStb11ojU/XSFPP0pAUMv/Z7PXKudBqe','nguoidung130@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(136,'nguoidung131','$2a$10$EI84YtDA0pPhB4qsCGrTKeaHRLnaDVQkFGMQ46lu7aYSTxGW50lrG','nguoidung131@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(137,'nguoidung132','$2a$10$jWqaJU2VT/SmPetRW2QRbutE6cB9qoS/KeVyNt1CtR6eHIbCHPtFO','nguoidung132@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(138,'nguoidung133','$2a$10$WZwBt4nlRe1wgR5Jq3Z3DeMZy9HeQQmKKBmW94TsnTTNSBxd8vUk2','nguoidung133@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(139,'nguoidung134','$2a$10$ffCKxQSLXaGOzO.0MD1UtOiaDsFuxETfzaSAcP/wSuneDQ1MV2qC6','nguoidung134@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(140,'nguoidung135','$2a$10$89NHmhu3tt1EwsI/CEs/jO7lMaLXh5oMQRIOBc/UxyppI/PbdjthS','nguoidung135@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(141,'nguoidung136','$2a$10$9ChjNr1ORttwSrf2GN1Td.qFUuGaZyR3SXdTrCtaKlE56yarYF7AW','nguoidung136@gmail.com',NULL,NULL,'active','2017-10-20 22:07:31',NULL,1,NULL,'2017-10-20 22:07:31',NULL,NULL),(142,'nguoidung137','$2a$10$9JctdLudXY716tfLqbGYAumrWCVkX6rMLE26TDb8lvGPjRTYEnSCy','nguoidung137@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(143,'nguoidung138','$2a$10$AHbiKyNzxjy4LinPhAAAteqt8IftplropeHPehriQfMyErd.WCwpG','nguoidung138@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(144,'nguoidung139','$2a$10$5EkK01vLQeCnBe1H5JD0z.SQLKyVG9LUhLG79kk82X1hk4WgdpUzm','nguoidung139@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(145,'nguoidung140','$2a$10$gM8nQwJy0VkeJSqAYajt9uuUBE4iov5Dn/anYVUEhs.PFs95jp5m.','nguoidung140@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(146,'nguoidung141','$2a$10$YC6Z0yBY0o6YxIY9GoAIqOgqiHkpV95.wsFTtrB/4jawidwhLkYE6','nguoidung141@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(147,'nguoidung142','$2a$10$2Xd1U//1qeJiHvCzlWsdCeJRo6fyJw.mujq6ifvQIk1/xPlCFb2JG','nguoidung142@gmail.com',NULL,NULL,'active','2017-10-20 22:07:32',NULL,1,NULL,'2017-10-20 22:07:32',NULL,NULL),(148,'nguoidung143','$2a$10$SnvVobpz2n8KGp.zO0J/fO1vRecL2jRyAlh.Lay07XRuJUvBe06vm','nguoidung143@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(149,'nguoidung144','$2a$10$Qt0oH8NSyG/DmicKJZXPF.L7pj.5w2dfOX9YDqe3i90m1bFhIN35e','nguoidung144@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(150,'nguoidung145','$2a$10$Uw/PjhdbGsoK7DoB1018keYvnBeNd.gY48Z.LhIyarQI5W03oeR1S','nguoidung145@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(151,'nguoidung146','$2a$10$zKDxxYMkAHFNKh5q5tumSeiBE8ggxaoGmqSWAnTfCbYSl85QSvYeK','nguoidung146@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(152,'nguoidung147','$2a$10$.QmBpUfrBJp4ctOgjm/3N.Xcl4Nq7L3nxYzqVEQ2TDLUwjb1Svawm','nguoidung147@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(153,'nguoidung148','$2a$10$be7mcwlC1b25iHMNC/Ccw.h45LChdRD4mz2O3BJnQO37z2PId6C62','nguoidung148@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(154,'nguoidung149','$2a$10$5.Usd5DpJELwUItOOmtDmOkiGuwzf96ajvfoLqY7eg9sl.dWBO6Lm','nguoidung149@gmail.com',NULL,NULL,'active','2017-10-20 22:07:33',NULL,1,NULL,'2017-10-20 22:07:33',NULL,NULL),(155,'nguoidung150','$2a$10$gUM3UmLT0fULtXRilp/NjOGH27fpAExaFeg1khWdZAqH7LpQR/IkO','nguoidung150@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(156,'nguoidung151','$2a$10$wuVYKHr07/44zGyp0oQ1kOF6dForkTPD6MrpMmbUrFz2Mo2MI8co2','nguoidung151@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(157,'nguoidung152','$2a$10$p1RhKW7ys.S3rV5MnO/7q.GYR8QacCjTtTjX1cWeqHBwXEkGVySyG','nguoidung152@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(158,'nguoidung153','$2a$10$RY/hEsOAqFwLji9bAAyl/eZ736DsPKYWJXauKoPDlcBXj1jl6aZ7y','nguoidung153@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(159,'nguoidung154','$2a$10$63mKV8QHMGLS1UZgxRN.OOID84ty7XxPc.LQRsREmuZh7O9Zt1WT.','nguoidung154@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(160,'nguoidung155','$2a$10$YvFLxAReqZYWGQ.pceRn3u4cvUMzZ93QxMNaIsoHkAlZclzzB.d4O','nguoidung155@gmail.com',NULL,NULL,'active','2017-10-20 22:07:34',NULL,1,NULL,'2017-10-20 22:07:34',NULL,NULL),(161,'nguoidung156','$2a$10$cOn6k/mPMkJ8CApFtSyPvuCW6gVQHlZ1UxaCp/WN51iswTg2Isczy','nguoidung156@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(162,'nguoidung157','$2a$10$3PBllN3wjWd12FMDmcakmOReR1S.IjdrPPPirK.HbxZ/uxR3d2MjC','nguoidung157@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(163,'nguoidung158','$2a$10$iv.xaCF78zfDJSAqvhEB9OhHfhwn56k.Dqqk3CR2yaa49cYigAg.W','nguoidung158@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(164,'nguoidung159','$2a$10$VD3Q1XERzg3K1NfLNNy7uedB9A4JJNBvrcG7QZyfF7vVYXAdNb8ru','nguoidung159@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(165,'nguoidung160','$2a$10$WF0AAIA4dtjteqZgqZ3kX.q2T3hl6i4kgDT568QCZVxAv3DyXsKLK','nguoidung160@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(166,'nguoidung161','$2a$10$jqQARSCj0yoCcA4kkHAPMu4A78TMVitCeAjQmFgJ5Z7147D2uu5AG','nguoidung161@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(167,'nguoidung162','$2a$10$VKZs5EGL9sOMJfob/adyOuyuAFwT.aXt6X0MTrrl9gCWjTXNpmj4.','nguoidung162@gmail.com',NULL,NULL,'active','2017-10-20 22:07:35',NULL,1,NULL,'2017-10-20 22:07:35',NULL,NULL),(168,'nguoidung163','$2a$10$t4pURe3Tk0RBBBCSOeA4zukxmmHsM2DnVKMV6PGImCnB1OotXMEgK','nguoidung163@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(169,'nguoidung164','$2a$10$aidZcJ2qwKGJxOWF8UxmNOlxpXjzY72yjn6.5IseJrzXS3wROqRWS','nguoidung164@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(170,'nguoidung165','$2a$10$STtyUP0dwdlPowGJvVq/geEoIyslOGa.ctfv9YS4We8ULb5XzNi5y','nguoidung165@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(171,'nguoidung166','$2a$10$Wzg1QB.Uv9ZsZYYk8UxsOeVjEf0j8Hi7XrTR6Fd8rPvSLkg4im19C','nguoidung166@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(172,'nguoidung167','$2a$10$pyAgScC.o0LbNXYEZyAfr.IBlmAnghyMV.26u23UMv.BqSFR01fE6','nguoidung167@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(173,'nguoidung168','$2a$10$S.Pxe5SyZFtOA0I1kICr7OnvcDjMdec4v6kI1g5pRE3wUEKqZdmuK','nguoidung168@gmail.com',NULL,NULL,'active','2017-10-20 22:07:36',NULL,1,NULL,'2017-10-20 22:07:36',NULL,NULL),(174,'nguoidung169','$2a$10$rrC9uxmtrH2Z2y3NIqYG6.lP5lFVr8pDFNrUGhfCz6wyefCqvkkuO','nguoidung169@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(175,'nguoidung170','$2a$10$tFCUEFP6p25yp0RxBLXST.iA6H2MxtRgdiqztu0uB0FChXLbCKp1m','nguoidung170@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(176,'nguoidung171','$2a$10$w8WUhy.FXeZR/kKq9iEvr.Ztu4uJIr8/IW5HIeld6zqzjndq0lIpO','nguoidung171@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(177,'nguoidung172','$2a$10$uYGDu8GNq4zcJDqHT9IZBuq6m0oxz5gSHMuPAcDXFZQyaVfvuMlDe','nguoidung172@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(178,'nguoidung173','$2a$10$7bERmX2lRHsEDraZy4b/cuFNskDTede.RiJJdFQ/PMGVSxxvmPG.G','nguoidung173@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(179,'nguoidung174','$2a$10$KmG.ioU7kMXqC0PKXMqoBenAXOe7w7xrXKQMusCjrgbdGB9KENn5.','nguoidung174@gmail.com',NULL,NULL,'active','2017-10-20 22:07:37',NULL,1,NULL,'2017-10-20 22:07:37',NULL,NULL),(180,'nguoidung175','$2a$10$w3c7hVVdHx9PoZDlzYo9uOp89RJBlJN7fM8NZU2JGz.mlP42QGQem','nguoidung175@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(181,'nguoidung176','$2a$10$pDzs9zFJMPk3fZsdN/G0seWSZ/dPsCigPKgaiwt68rqw3urhiQPFC','nguoidung176@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(182,'nguoidung177','$2a$10$ulPXQDTU3yWQuHU3LA0NPeKAwGIrXlgyGRGxDAmVC2tP1qC9wLiWO','nguoidung177@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(183,'nguoidung178','$2a$10$vKGcPY.BtSOiZ5jBKHYBrOjcZBEe9nbY1JEMR8GbQNgFSibqQz/pW','nguoidung178@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(184,'nguoidung179','$2a$10$iJX5ndX4mhxmntcDauOf4OweiT7KMhXzzxGrCh/H9ep9a9h4ZX.n6','nguoidung179@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(185,'nguoidung180','$2a$10$dD.tl.27xdJcmX635ovUAuXugMhGqA2AsxcQzJi9pFo9yPBbSx92G','nguoidung180@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(186,'nguoidung181','$2a$10$1Kyh9DoImiBNbowLoVqKIuvjHtKQsKkfXrjxRaVwEnwbPaTbVGxHG','nguoidung181@gmail.com',NULL,NULL,'active','2017-10-20 22:07:38',NULL,1,NULL,'2017-10-20 22:07:38',NULL,NULL),(187,'nguoidung182','$2a$10$K.1DYi0AFBU3/.UndhrEAud/0jEuZk5vg3gkmitJaOJA0z15HsZRy','nguoidung182@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(188,'nguoidung183','$2a$10$L4cxjeDzAxfqlL3OH.Z7we.XSeEwqjE/ENJWrRKbG2/j8vRiLrN9i','nguoidung183@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(189,'nguoidung184','$2a$10$ATMrYV5WQsEoXpxOxD4xv.lpd0CgW0xy/48efXY3sJ2zrkaODAFHq','nguoidung184@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(190,'nguoidung185','$2a$10$UNiTeDlIphCFt1nLHCD0eeXRcIT2vM1X0MqNtdOr2teFcKR/GTJli','nguoidung185@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(191,'nguoidung186','$2a$10$227.0LeCCQeVL1fdxfqauuPu3TQP9ltGqbOLRYC5WULfRAUMQyIs.','nguoidung186@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(192,'nguoidung187','$2a$10$dM.UzUH/BxAz1AXnn.87eeijrhPDGP1ndU/B3Y/71.oxVtOfWCcpG','nguoidung187@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(193,'nguoidung188','$2a$10$AHf0Wkgu3Le7WF5q4UevPuuHe8wU6mcdBAsWQ7HVrOcre1Kf7lyxa','nguoidung188@gmail.com',NULL,NULL,'active','2017-10-20 22:07:39',NULL,1,NULL,'2017-10-20 22:07:39',NULL,NULL),(194,'nguoidung189','$2a$10$W6MIjj6Rln7yXPF6pdZ3q.VkSDy5evpc3VO8/ZOAx443MFbRI36sm','nguoidung189@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(195,'nguoidung190','$2a$10$FURKgG5T75TN8TN9hqe4qeWXIDsf2TlE/R2G2ZJzpZ5edF7kh9OXS','nguoidung190@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(196,'nguoidung191','$2a$10$4M6x1xsj391ssSLPC2cDAO6Hp6LF0N/zjKE6BEYaHxTgWMYn4DkFa','nguoidung191@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(197,'nguoidung192','$2a$10$O8kjYGUtS/T9iY5RkjeS9ONpgF.MGEKotSRha2wm6HXXTy4UoGj9q','nguoidung192@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(198,'nguoidung193','$2a$10$c6aWkDRyQUPpOJuOp8ay0uii1PeJHQqqgpM2PB124nm6btTU68fZu','nguoidung193@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(199,'nguoidung194','$2a$10$4Nac0jXBA8JQQY7tsVBKoePccPZ0M6w30LiWk71KaNGrqR5sF9Ima','nguoidung194@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(200,'nguoidung195','$2a$10$HiGC467epgF/P44Ey/bfBuofoVvR0U53lbBSNo9DOx9auZ3yMfo6m','nguoidung195@gmail.com',NULL,NULL,'active','2017-10-20 22:07:40',NULL,1,NULL,'2017-10-20 22:07:40',NULL,NULL),(201,'nguoidung196','$2a$10$vJI/ivhCaDJzSSUe2I5QjurHpH44xtplbezoMo/fyP.aytbyEUsLi','nguoidung196@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(202,'nguoidung197','$2a$10$VzRvysHHkfdyxp3X6RDRHODWeTJqesQ1HNzHJpzMjfPru/Uzkeh1a','nguoidung197@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(203,'nguoidung198','$2a$10$pMCUQl5Nz.t8o65IGpOqaOkComk1bFbb9fvvr9JwnnoDuzi9iPTiy','nguoidung198@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(204,'nguoidung199','$2a$10$fxhOaC.bKSsSmPMqzxdzruvTPK5FX6EP9ae1KhD0/Ks3fpG7WFr5e','nguoidung199@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(205,'nguoidung200','$2a$10$x03egGD0eUu.ML8kjBUcC.EP26qiwpxxeLX6Yjw7rQzNaFPXMag2S','nguoidung200@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(206,'nguoidung201','$2a$10$AVi.kUhNh7XzBr/1vCJNbeTrDtrzU8pJJLlDLVbEYtPvp7fI0VblC','nguoidung201@gmail.com',NULL,NULL,'active','2017-10-20 22:07:41',NULL,1,NULL,'2017-10-20 22:07:41',NULL,NULL),(207,'nguoidung202','$2a$10$UXkBy/cWts5lBiQY6dhJMOmCul5YEGlQgJ6SyevFnUaQrLOUzZL6i','nguoidung202@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(208,'nguoidung203','$2a$10$9smS5lUC83NMeYUIhEj8Ee3vkbY9/0wdr1c9bCcxbsfcMrI8njGGe','nguoidung203@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(209,'nguoidung204','$2a$10$4iKbZZs6IPu/ZlG0WqGqbunQrSZRrfSEQ2zhmF2mBcTu7ET0PdB4y','nguoidung204@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(210,'nguoidung205','$2a$10$IUCciGf9ucA4gK/cE7etLe.bBT2XYhAR2d2FTv7E0zg7nN3GjcKXm','nguoidung205@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(211,'nguoidung206','$2a$10$wLRAZrnOV0T.k72SzE8aneg03fJ2//rYf8CjTK0lRzFaVQCG97Wti','nguoidung206@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(212,'nguoidung207','$2a$10$CmLtB7vs5XK9FxJIr7HoB.U1YmDuhLVLNoqe/xgQwlLFtUHNY3dS2','nguoidung207@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(213,'nguoidung208','$2a$10$lxcfGx02Uv3C1Jkv/i8C6.Yrr7TUkOUvUDk4NzbSOPBs.x5Kf0oaC','nguoidung208@gmail.com',NULL,NULL,'active','2017-10-20 22:07:42',NULL,1,NULL,'2017-10-20 22:07:42',NULL,NULL),(214,'nguoidung209','$2a$10$K.Gh7WsKAn5Cqaklrvq6oufYsbRyvgDO8KkqSz2GVFIMkxorRyviC','nguoidung209@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(215,'nguoidung210','$2a$10$hcWP24UeWRnl48EGwy3Tu.Ho0tpuBtF4juvFZOawonPsMsGX2Jn8u','nguoidung210@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(216,'nguoidung211','$2a$10$i9UOCX3d//Mwyka0pbAgTu3FCBdo0H84B1VFgU7ThJzsnSVdAOib.','nguoidung211@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(217,'nguoidung212','$2a$10$W/YDJaIiWhbaodm4V1H33.cqVPEFObQnCHi9zJeXBFsBQvyd9qr3i','nguoidung212@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(218,'nguoidung213','$2a$10$ryDpEjTA3ptLfq7EcVrj3OILyoFbKBEgwdnNPkmHphCNJJhvPCBDK','nguoidung213@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(219,'nguoidung214','$2a$10$ofY8DvDAwbVAynDotM24YeBd9qH/BoBanRYBtk3k9qQwlG82f.a9G','nguoidung214@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(220,'nguoidung215','$2a$10$WV9Okb7tCojrNo0Z3IZpZOIokux9WPhb7iX6hQA6eIkyMVP9b4Bk2','nguoidung215@gmail.com',NULL,NULL,'active','2017-10-20 22:07:43',NULL,1,NULL,'2017-10-20 22:07:43',NULL,NULL),(221,'nguoidung216','$2a$10$.2HmZfCIFFwDmckqgxQgFu9wTA2yC7p0KvBF3fkyt2ioAEyi8qlYy','nguoidung216@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(222,'nguoidung217','$2a$10$/sh9I93t99k4bC6hZMRDtOX1uYuqbgZGwvf1OaxW.AL8acjC0B2q6','nguoidung217@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(223,'nguoidung218','$2a$10$TyBHRuUHMgZsXXy13dySYeIZ.eEY3XdqaeNsu3WPpL5MHUMaPKhjm','nguoidung218@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(224,'nguoidung219','$2a$10$WQq0SNOYr4em0bUcRJ1fbuYg3m62IzLOFsd36vpZOfI3g4SpagTqu','nguoidung219@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(225,'nguoidung220','$2a$10$Tp3kjSeGE4azFCg3vw5PMulqcDg3pl/SwVS3.l89NwBdxm3OrFTUG','nguoidung220@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(226,'nguoidung221','$2a$10$HpPPWMSMcMEn/P/Em.ISxOXUQxQqqzT1SZglzMt2wdB9yrrsKpxmy','nguoidung221@gmail.com',NULL,NULL,'active','2017-10-20 22:07:44',NULL,1,NULL,'2017-10-20 22:07:44',NULL,NULL),(227,'nguoidung222','$2a$10$HxHwFJ6TIUvsT0Cji5.dj.blT5twHr8MkyS/YPDwjOom6qYB7orN.','nguoidung222@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(228,'nguoidung223','$2a$10$U4Kpu36akU0SADPmpJ/gl.4Eio5PXLg.DFj/npbwao2Kl9etzV.mS','nguoidung223@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(229,'nguoidung224','$2a$10$S5qHTarcI.TNa1wu4lOt/urAv91E0KsBpYTAfY8yTR3/Zhl7MkrXS','nguoidung224@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(230,'nguoidung225','$2a$10$9ivGaJ/4mJgwC.tbPMaga./XfZzz.toLbKJk1oYt.M9iHNJ.cfaFy','nguoidung225@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(231,'nguoidung226','$2a$10$5AWa2sUGP3mJD08qRok8Q.mfQykDGPQ7LXrz4ix.4jdFrGoYus5JK','nguoidung226@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(232,'nguoidung227','$2a$10$m7dr.TgSDXGHeAZvkoEVkOr3h12DsQzxQg851ia/jIRgoSbBIelFO','nguoidung227@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(233,'nguoidung228','$2a$10$hIZnfhpsQk43Mk4GVMMf5.guhN1eFFWUMHQncelZrv4FylOO2M6fO','nguoidung228@gmail.com',NULL,NULL,'active','2017-10-20 22:07:45',NULL,1,NULL,'2017-10-20 22:07:45',NULL,NULL),(234,'nguoidung229','$2a$10$T/JJNnYWZv3gVyDEqlSSCuRMsXbCsrsSinWXA1N/4xBWkZryLsBwi','nguoidung229@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(235,'nguoidung230','$2a$10$5sWvPt1tzUfL6Bp/NZHpo.klJ8jmJA8YsOUnvSP6oJoiZ8/xU8iry','nguoidung230@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(236,'nguoidung231','$2a$10$MRRswhfdqdXXDRoW3aFwFuCXxg/MNab0ON3OolRdyCGmgKo3/jwZS','nguoidung231@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(237,'nguoidung232','$2a$10$/Rg7BV1iqO2ALPWHBRU6seBCUYFq/6NOaDpYEn0TCG4BKTkoZcqH.','nguoidung232@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(238,'nguoidung233','$2a$10$cwxcBMpoMst8GFSJBpBY2.tthjL25hfNTtY.thOYT75G5kV1pDMa2','nguoidung233@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(239,'nguoidung234','$2a$10$TM/vUp9Bj5QXm7xKcISe6ecp5o2MGErtAGUUp2xtG8QMD5bMWHr5C','nguoidung234@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(240,'nguoidung235','$2a$10$/SqyHddI1B/zr9aa1OscZeDy4AyxOe04Mn9RHuaAlUPBCMe5uC19i','nguoidung235@gmail.com',NULL,NULL,'active','2017-10-20 22:07:46',NULL,1,NULL,'2017-10-20 22:07:46',NULL,NULL),(241,'nguoidung236','$2a$10$whHGwxUkdjVukyotn5R2wuRR3pN67.fdAJgntTYv7.2Yg.dqNd.Di','nguoidung236@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(242,'nguoidung237','$2a$10$R8U6gxWFGbRb.Ivheu91rOwyCKsuYVXwfzkR3XJUdBLi5w.TbIl8C','nguoidung237@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(243,'nguoidung238','$2a$10$G3LBlV.lCKSo75U5TI4fguaY2l/5gxK7KJQ3De7Wa3nmLEZm6ZDJG','nguoidung238@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(244,'nguoidung239','$2a$10$z7VfNdOOiCB/xHz5.C9hIOph1JGbvodC8Wgs2SiAGf.kqIql.cdlK','nguoidung239@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(245,'nguoidung240','$2a$10$6Jfps2YVTMRyM2iOfqGh8ewl8IhVphxMiqsqE5HF5.fK/B.OIq3tu','nguoidung240@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(246,'nguoidung241','$2a$10$7V8XvHiWu/QA2XxVd7EbDeGxmSokDl0rb//m/ndmWM.0gOdbhX3/a','nguoidung241@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(247,'nguoidung242','$2a$10$2QCSbOgjcicRk3oizWJqCeSB8s83GblIPXFNoOihK8UV66Nv9SCDy','nguoidung242@gmail.com',NULL,NULL,'active','2017-10-20 22:07:47',NULL,1,NULL,'2017-10-20 22:07:47',NULL,NULL),(248,'nguoidung243','$2a$10$ZV9Q7PYILda380OEBHr.Yuv8B1PxnLHKoH1J5tFmXaSJtmXlAWt/K','nguoidung243@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(249,'nguoidung244','$2a$10$LU5NsyRYz6rrXwGITmvz..lSijDp4ykIYZkfyTokP3xTa8b3rWeWW','nguoidung244@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(250,'nguoidung245','$2a$10$jsMgdgdnBHlomzBQu5LcbeJFrOCG7GEBGV8jCI4FNg5ka1X36at5m','nguoidung245@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(251,'nguoidung246','$2a$10$3B34ZH.2C5LmTx9P9sfgQu3zOz2bf.RbpLRu2nvzB84QIjmTjcN86','nguoidung246@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(252,'nguoidung247','$2a$10$bjSjK8F/qBhmshabq2zSEONuaBknxuNQmudlWzp5zOCKjIeFURBU.','nguoidung247@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(253,'nguoidung248','$2a$10$AN7LvMwZdCiJZlTOAWjmbu3LU/oUWacoxwt6xfQjFBIMy.35P5iwW','nguoidung248@gmail.com',NULL,NULL,'active','2017-10-20 22:07:48',NULL,1,NULL,'2017-10-20 22:07:48',NULL,NULL),(254,'nguoidung249','$2a$10$6wWgV0qtfxscKJG1cKgAyuqLrPtVCgXuiOKCS2Lup80AuxA34DBcS','nguoidung249@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(255,'nguoidung250','$2a$10$4g9wo5//UnF/513Ao1j.5us.QVkeip2h59FevFxtb6gTQEh65Uzxy','nguoidung250@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(256,'nguoidung251','$2a$10$13gGInY6KyUFqq1u7KZqYuKJNwLi4HjilzDmZa9/W5TmT0Bl7AnPq','nguoidung251@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(257,'nguoidung252','$2a$10$iDJp6akPDLxdcU5zde7EeeroiO6m.juzcbca/faDFHyvBr4pbm5wu','nguoidung252@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(258,'nguoidung253','$2a$10$ro68IIDB6aPrgu4D9dKzROM2yFT6L9F2IeNHl6/b587r25EYGqyOW','nguoidung253@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(259,'nguoidung254','$2a$10$6Fn.L2rqZmRIPdHdQYqsmOekWfg4ixb0b7KrWie6fBwmvFf4nDYn2','nguoidung254@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(260,'nguoidung255','$2a$10$ZO0yn/CgQCWI5/632gz/R.YTeM0T9zh27HVYNHYO00vjWskfyD9d2','nguoidung255@gmail.com',NULL,NULL,'active','2017-10-20 22:07:49',NULL,1,NULL,'2017-10-20 22:07:49',NULL,NULL),(261,'nguoidung256','$2a$10$7u..rm0gLcg6utlUckDkwOQ8lN4XSBX/gHaHPBnRh3YPv/zG4pPTu','nguoidung256@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(262,'nguoidung257','$2a$10$SLYXOr212JCPtI.zSGeZuOAGjYkF5ybbzwBtMGS3.0zgdysCcUI1O','nguoidung257@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(263,'nguoidung258','$2a$10$3B.Ji.L2h0cInHMWrbIhXO28Tuj.UAku1bhUAVndIY0UAJCDrxmn2','nguoidung258@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(264,'nguoidung259','$2a$10$iFVUPWAUuxnQRpC4K3T1TupmlHpAewDbsdAhS4WLdBQQ8aoKlYdEG','nguoidung259@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(265,'nguoidung260','$2a$10$ZZf45oOTylP2s0eYHADc6OjGCDXunVoV4HvzkG9Y48gAiFOizgbHa','nguoidung260@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(266,'nguoidung261','$2a$10$E.ZRnSMQ9dkzIuw0HSrjCeC107gFZsaFRZxJu7laRv7/HOwI68t7.','nguoidung261@gmail.com',NULL,NULL,'active','2017-10-20 22:07:50',NULL,1,NULL,'2017-10-20 22:07:50',NULL,NULL),(267,'nguoidung262','$2a$10$lJpiHGvaN5a3avzfESfY9OijBDaXCzJpGiC1MYZbyqsm5WzMb8T4S','nguoidung262@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(268,'nguoidung263','$2a$10$QxsdquywhScNyDlYsI.LuedW0Q5G.Nv6Gz49wLoDKE3A5D0JK9KTG','nguoidung263@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(269,'nguoidung264','$2a$10$whe2sSO/7ia2NBHsAZ/3aOnrFJoW26AxpvvgOMKPp/tBqMvz1LO9y','nguoidung264@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(270,'nguoidung265','$2a$10$w5raDqVd/3Scnur.Wz.xcOeOWz1Pm4IQyqF1RTGHR0UahgN9e5GC.','nguoidung265@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(271,'nguoidung266','$2a$10$NIQ74/zij3yopOR9WQ7bDeIbDn6f.zBQp0.P7xrIaKOVcRbfpoudC','nguoidung266@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(272,'nguoidung267','$2a$10$8o.lNzSFGAVC1GXwskVUjuK3u.fYVRNpGU3MM5oQfc0X2cE5Xu2/C','nguoidung267@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(273,'nguoidung268','$2a$10$903H1RT89OIvEDDHEAZ2pOIuwoWH2vHcagafcY1Vvc1iQo34IF8by','nguoidung268@gmail.com',NULL,NULL,'active','2017-10-20 22:07:51',NULL,1,NULL,'2017-10-20 22:07:51',NULL,NULL),(274,'nguoidung269','$2a$10$YhgpSSQ1IddE1L5eKLaWd.spZmyaZOSjX5V7kSm9.68dbbOMZ5qSK','nguoidung269@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(275,'nguoidung270','$2a$10$39RycyXBmqFQqdMsrxcwgOUtQGX0ddMaRZq5oGcGor3eE9qHYwlye','nguoidung270@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(276,'nguoidung271','$2a$10$O7o.NRfszuUaeV7H70CbOeWzJ7xo8AGA9dbbWnvzHC7Z4PJtkXLky','nguoidung271@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(277,'nguoidung272','$2a$10$kszojMid9HQe88i/qfhPX.ntUegDfubx/0gRadpu.gRJ/jGn1ia/S','nguoidung272@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(278,'nguoidung273','$2a$10$gKHZX4EsqP4kQ9cErP2W3.WD/YSs01oYADEQhAZaHbm9e/1mtmvlW','nguoidung273@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(279,'nguoidung274','$2a$10$5Dfse4saZ2yNQGyzm3Il1.A985B.kC4Eim/jbolLy9C9bTuKDYhP.','nguoidung274@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(280,'nguoidung275','$2a$10$29dXvX5UZmOVkTzo2y8SOuvtzFylEmvYOvfHoKAVSZ8te0QWZEPzS','nguoidung275@gmail.com',NULL,NULL,'active','2017-10-20 22:07:52',NULL,1,NULL,'2017-10-20 22:07:52',NULL,NULL),(281,'nguoidung276','$2a$10$Nwt7qqpCj3vOUGlFVE7pLeii9hGV8GxXMmRX3I1cYP0q7lRWE8bZa','nguoidung276@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(282,'nguoidung277','$2a$10$IjugbTQTYH0VLRv6K3lFbel9Futdcweel2yrdJqtrFj8ZIq8PAGAm','nguoidung277@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(283,'nguoidung278','$2a$10$Ygz6nG4VJFctO5of2s7Rbez57Md55wYPc18j/FaC3CRhnQ//tfccK','nguoidung278@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(284,'nguoidung279','$2a$10$j/XQakdiCRNDCjfSmwMwM.XivUrZDYkb/mF4m8h4adU5sEqn7FiJ.','nguoidung279@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(285,'nguoidung280','$2a$10$3aIvDAT9LnfQewBJwEmKzu1ovQjJeiUFo4fBZ1ZQs56JAgtjovL/6','nguoidung280@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(286,'nguoidung281','$2a$10$dt55IF1CtDipRoQMKXzTrON9XECW4MbYfFuVdvQFc2HF7839r/RJi','nguoidung281@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(287,'nguoidung282','$2a$10$CaAiYNqN4DbmMc71Y2EVne7yPfiH2vT1Jn2nKsoI5Eta7VVlhWddu','nguoidung282@gmail.com',NULL,NULL,'active','2017-10-20 22:07:53',NULL,1,NULL,'2017-10-20 22:07:53',NULL,NULL),(288,'nguoidung283','$2a$10$1FOT36Du1BjSN6CHNu6AtuHSQ0ESsYRWrpjUewVtBkVqlkPKSYzlS','nguoidung283@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(289,'nguoidung284','$2a$10$tA4ns9frfR9PrgxTT2zB3eedAeKabxvsaAxcsjpfREofjJqrsSWk6','nguoidung284@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(290,'nguoidung285','$2a$10$2WVLj5rbCPcmjCETGj7Zcek/qKMUbGSyUe.vEG2zWeqVlm.FOyw9m','nguoidung285@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(291,'nguoidung286','$2a$10$BagwWina08J7ixc064AOeeNQUKU.O2YbEbiQ3MFtfzSBqjtQjaDxe','nguoidung286@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(292,'nguoidung287','$2a$10$iMAYDx0ONQd01eqM2zgUJeCdI9SIaqlqeXMmmCFFWfjQcBOs1nCbC','nguoidung287@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(293,'nguoidung288','$2a$10$3WwlB7Yu/EI.gQRP0kHGdepachBOjgD22Wjhu1nPKSTpfxSyWnrHG','nguoidung288@gmail.com',NULL,NULL,'active','2017-10-20 22:07:54',NULL,1,NULL,'2017-10-20 22:07:54',NULL,NULL),(294,'nguoidung289','$2a$10$UXmgxxTt/Xx50ssjqSLclOP0ex3LVHENi2bj50GmZtCkDc06y8.lK','nguoidung289@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(295,'nguoidung290','$2a$10$MYFzHPEIEIp6wsXrtrwIr.r4N/mRFBxWkdvFQTCkf93dMz30mYZwC','nguoidung290@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(296,'nguoidung291','$2a$10$VQV2fL831CjNFDs23vplpeEbsWZAp8yx9GL.v7djZlY95l2p3jV7y','nguoidung291@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(297,'nguoidung292','$2a$10$4gxocDO12d4QKp21CnRG4OC/bPBDksigyIwpbk9SlPf4bHKMFFKZC','nguoidung292@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(298,'nguoidung293','$2a$10$0fjAr9eadHF8TnSUkNbDV.cdgszc1DZmwfxV5LZM/dTvw76Jq0sXC','nguoidung293@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(299,'nguoidung294','$2a$10$ubOxy9.N5EqC1qGDaRmT.ufxLbmF5octxYoaq8hpj1.jeT1fxWzSK','nguoidung294@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(300,'nguoidung295','$2a$10$5h8sNjaMmYmz6QgiGcebq.cQh6oOGSZvNwCfa1dXszL7mjnLN1ufW','nguoidung295@gmail.com',NULL,NULL,'active','2017-10-20 22:07:55',NULL,1,NULL,'2017-10-20 22:07:55',NULL,NULL),(301,'nguoidung296','$2a$10$5H/Y5qK0d/nPdYCotHwqYeuyGHxoLNvbNMAwGnSGtiIGBJCeJ9RR2','nguoidung296@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(302,'nguoidung297','$2a$10$nIEmGWpN6iOak1hyY5qYG.VwZypN.UKmXAjOzWcAdrrGEHKjHkPLO','nguoidung297@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(303,'nguoidung298','$2a$10$Qu5mfM0iNEqGWuUj3OcMhuuMDSPjELGkQxYwKP5g.nRKoofyb5QFy','nguoidung298@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(304,'nguoidung299','$2a$10$vtGgd/wdtRG.z4jFKbWe3eVTps48fZ7jAC/7IffCt8XkMn238R3uC','nguoidung299@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(305,'nguoidung300','$2a$10$ecT9rQN8npgs28n5ZwxVxu371JR867.ZdJAvJtyqppPj66TZHEkK2','nguoidung300@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(306,'nguoidung301','$2a$10$a5nqxqlj/Dovhz.mt5rWr.Qp1GJPBq/Xeo/XiLkQ.6B8tO7H9EVKK','nguoidung301@gmail.com',NULL,NULL,'active','2017-10-20 22:07:56',NULL,1,NULL,'2017-10-20 22:07:56',NULL,NULL),(307,'nguoidung302','$2a$10$BkNRMWQTgLoKXfFg.yZnUebpQK0z.CI5Rhf/NXHg0W4vMpKM554AS','nguoidung302@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(308,'nguoidung303','$2a$10$KPqzQezhlW59GyuTZxWsiuM293.Vn8JBsZhbDpQ79D8yGFr8mchd2','nguoidung303@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(309,'nguoidung304','$2a$10$lnRHJxhUvlNnAqhuaOqgXelKu9RaGf1wb5p8ZD0sbexGVwR5nstSC','nguoidung304@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(310,'nguoidung305','$2a$10$wEA/JwG/yaTYoM.vE.woHOCDNbhIVsZgCqKwUB351wU7ae0TLJoni','nguoidung305@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(311,'nguoidung306','$2a$10$.d43hsQrUJND.7E.WVd.RuQFLCegciBatIopJDdga9s.KAjbXJjyi','nguoidung306@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(312,'nguoidung307','$2a$10$BJeaQ37fW7tHXV.uuTjutOMduouei0arvh0pNHmVT5DM8trqnN4qi','nguoidung307@gmail.com',NULL,NULL,'active','2017-10-20 22:07:57',NULL,1,NULL,'2017-10-20 22:07:57',NULL,NULL),(313,'nguoidung308','$2a$10$UM8ekdvxkWlgvdlbcRKkBuSWCj6x3.VBwGVc0RnJN4IlbH67w23z6','nguoidung308@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(314,'nguoidung309','$2a$10$.3Lh2SeO3Od9tK3B5i4F6uY1o84roF.8tl3MBMpaSW0yPcfulRN6G','nguoidung309@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(315,'nguoidung310','$2a$10$1lY4t9nYWe5zLTaAB2Tg0ugcpd0/RbC94kSPOX6RsFW1ixRHL4A1C','nguoidung310@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(316,'nguoidung311','$2a$10$Emz0yyVj0lZ1ptMTXk6YgeWFJeO1EMevv7NzRVg05k5n4QjuDhN42','nguoidung311@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(317,'nguoidung312','$2a$10$Rx.jYMYdT9/6CvyfOJSuROhkVzh.cTeVv7tgQ.2vVM2JoDv9QSiyq','nguoidung312@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(318,'nguoidung313','$2a$10$qMp68vZASvn5gxg/0P7sje/koQ/5zpte4L5pOeYef2ymueHaCsofa','nguoidung313@gmail.com',NULL,NULL,'active','2017-10-20 22:07:58',NULL,1,NULL,'2017-10-20 22:07:58',NULL,NULL),(319,'nguoidung314','$2a$10$ga.K/aut.p4S2CqJ0qA.Rui/.zKNnhsnT2T.4YptOLSw1xDD8HciC','nguoidung314@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(320,'nguoidung315','$2a$10$xQniiYRnwkqs7EU7X2uhD.2uesVAAvP5DXoMC3wj4OR/V3V6WMwJK','nguoidung315@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(321,'nguoidung316','$2a$10$qF9sRLtQ0A7YTFqixhsACO3QBwC0OnaFuLQm1WtiqDnwMBiNZ0bA.','nguoidung316@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(322,'nguoidung317','$2a$10$S.gz6icHkre6NxpeoVdD4eOHvg8vAtq1ReZxlW32qBg9qk6bxDCjK','nguoidung317@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(323,'nguoidung318','$2a$10$tTGufO89C0UkwlOsYdS1QeWIRj3/8tUMAISgeujJYQSdQNFuoZleK','nguoidung318@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(324,'nguoidung319','$2a$10$7udmHHsevUNvMj2/WyJXc.uTBelGM.FsDk4ZV/EkqqFGtWRJEXh9G','nguoidung319@gmail.com',NULL,NULL,'active','2017-10-20 22:07:59',NULL,1,NULL,'2017-10-20 22:07:59',NULL,NULL),(325,'nguoidung320','$2a$10$aXazYNodE6avjHPq2W.2wu4I69TDOZ1w.urgoqYT1rzYsogo3t0IG','nguoidung320@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(326,'nguoidung321','$2a$10$UqXlo64cMVdnswxEIWPqnOUedahayHlywGq0g3iz/rWeRK7zO5k9q','nguoidung321@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(327,'nguoidung322','$2a$10$WyVM1wl9NKL9b.yQHs9rz.E7SA4qqlRtiBQXHU8QaGAHf/xOnrtfy','nguoidung322@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(328,'nguoidung323','$2a$10$fZgptG13lS.TpYC9SvhyVeKtK2rp5ykc.83dHkgpXS1KYla.8E6oO','nguoidung323@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(329,'nguoidung324','$2a$10$mNWEHsv0JViFwkzb8NYlae/o6R1.1KkklhL2VMfrV.x5BlUB/xIRC','nguoidung324@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(330,'nguoidung325','$2a$10$JChSgaV.qgc0tNUyEXQyU.em819rH7yDk9efH0PQWqrFjHcUQ/rB6','nguoidung325@gmail.com',NULL,NULL,'active','2017-10-20 22:08:00',NULL,1,NULL,'2017-10-20 22:08:00',NULL,NULL),(331,'nguoidung326','$2a$10$MaveAI3mZEajWBNJK7cOw.EKyMhxdEEq7wd0mqAs7/kcHZ/K53tVq','nguoidung326@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(332,'nguoidung327','$2a$10$R2iIjNdS7ZWII6lEGpRXKeRpRvmRyBbGQppTfqG0aWe5Y5xMHi95W','nguoidung327@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(333,'nguoidung328','$2a$10$0ITvedW/WQ5mY7XQrrRwjeSjcsV8uvCJJqrdi01JIk2cCdp0ZjgoK','nguoidung328@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(334,'nguoidung329','$2a$10$TzNntc9VvX69aCmnSaOxSeFRB9tJugcwo7HZGWg6XcGggeTHvTBQi','nguoidung329@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(335,'nguoidung330','$2a$10$YRur0ZrHH4yZDXm3ykGpp.RC/0ClnjtbbePYWxdpy9bpRyQbMxMrS','nguoidung330@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(336,'nguoidung331','$2a$10$dOcKGQxa0FS2nx7V/yVoaOl/vOknUhDLCpTFhpvs3g1.s9pHfirO6','nguoidung331@gmail.com',NULL,NULL,'active','2017-10-20 22:08:01',NULL,1,NULL,'2017-10-20 22:08:01',NULL,NULL),(337,'nguoidung332','$2a$10$fC85YleyYkyf3JGT7PZEIerdEXQfMnL6LJZ7hlu5xo1TSNdExcg4a','nguoidung332@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(338,'nguoidung333','$2a$10$LWLHUI4qjmrZ2GL5edIa7e/f6Ud1dWoD4iK6BNlonjGLmvWwBwuV6','nguoidung333@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(339,'nguoidung334','$2a$10$9T0cSl.HCLCg77tcuM5kEOdPFs.eZGTwnTqKSG770l7HrAlClX40y','nguoidung334@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(340,'nguoidung335','$2a$10$YzAA8FFWG9EWfEzjeh/01.ixlJiC1jL/bC.JglqHQ3sWyWte57uVK','nguoidung335@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(341,'nguoidung336','$2a$10$f.5AuKXbL0j5sWscYx5LluAqF82uZKKszLSxtpntFx/CXiYbpck3.','nguoidung336@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(342,'nguoidung337','$2a$10$RIhWfAf4ZalFcBTPkAho8u/ohcEDlSI2MlCGK/5rdalLBHyfK49Fm','nguoidung337@gmail.com',NULL,NULL,'active','2017-10-20 22:08:02',NULL,1,NULL,'2017-10-20 22:08:02',NULL,NULL),(343,'nguoidung338','$2a$10$H6LUfu1T0bKigGXia1ZuZO2xEWfif0x2gLW0mwKhQNy9LCfuRAcFW','nguoidung338@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(344,'nguoidung339','$2a$10$xAi8uvwQFKLlx40lFzXS4OW0ocDfl77H3zUF.oFILEPqM8iLvrQvW','nguoidung339@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(345,'nguoidung340','$2a$10$Rf3/LBURczHpXyi6J.Y5QOKwpPaO/dw7769yu/AlzK.EraMQfhRmu','nguoidung340@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(346,'nguoidung341','$2a$10$lUsmz7w3mHrUjDKkdznSru/Llp71UoqX8cSJcyvfq3jHAN6C5GnAC','nguoidung341@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(347,'nguoidung342','$2a$10$sFhEf.C96Sks09w4Y9/Ei.fmsIxc7kXrRvEZzSmaP0jYqh95V95ja','nguoidung342@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(348,'nguoidung343','$2a$10$lwLbX1wTSYE0ZSFtbA.BoOty3dNLSsYOVr9i.q1v.LrTaD7IO6wSC','nguoidung343@gmail.com',NULL,NULL,'active','2017-10-20 22:08:03',NULL,1,NULL,'2017-10-20 22:08:03',NULL,NULL),(349,'nguoidung344','$2a$10$AHboZDZ2F4tKC7r1AXBfIutYEyvt9tvGGUjF6xMHyuA03AuQyHGKe','nguoidung344@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(350,'nguoidung345','$2a$10$7sY/hpD1mk/HFhVoDR2cMO.InRc/FXDwtI4tnvaGPf5RNfzIjMkte','nguoidung345@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(351,'nguoidung346','$2a$10$VYqf8gmPMdMG1q/hpkHtCueNYALccPsLjCsaoZkPFa1Sbz9RWPHxe','nguoidung346@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(352,'nguoidung347','$2a$10$lmjx9wKDxJaWXYPTLoQ1HeSx08AvZdHNhFSEG6Zt5rwdTHZzruhKW','nguoidung347@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(353,'nguoidung348','$2a$10$hVQ18NOOAhoBRkaypvJ/v.nC8X0PFm.sZ/t58.qOj8L2Csh3gjjs2','nguoidung348@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(354,'nguoidung349','$2a$10$YBTIobNZfuwiIC0vGzKzrusprntfO.m5AYgB/Gh792BeHufh./QPe','nguoidung349@gmail.com',NULL,NULL,'active','2017-10-20 22:08:04',NULL,1,NULL,'2017-10-20 22:08:04',NULL,NULL),(355,'nguoidung350','$2a$10$dLrM0Wc4Q0tTmTyus1KCeu2vgxf.DxDCWpv2JYOg7WJ/n6LDqxSGW','nguoidung350@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(356,'nguoidung351','$2a$10$clzFWuNfzrVbHt2NIuZ2tubcfipVEH9LxhGOt27AHATVs1JR4g2x.','nguoidung351@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(357,'nguoidung352','$2a$10$9Y83pkkEl6d0gmZAHEw.get81OvuTK4ruSBYXtDYJkiJX63ZACSvu','nguoidung352@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(358,'nguoidung353','$2a$10$GjwWQhxqLfaGy76Kft61DeIViVNdOFu86iYzTSW8R.XHuW/KdVs7G','nguoidung353@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(359,'nguoidung354','$2a$10$6gK6lyCKU3ssAQjoX00Ej.q3IcbemqQ9JMVTqnO6kCze3Exv9CJsO','nguoidung354@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(360,'nguoidung355','$2a$10$FZVUiVDxy.CJ23EYuGQmX.EFkSS9afWn65.Ti0fipjy5XJs/UDsDW','nguoidung355@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(361,'nguoidung356','$2a$10$gkVo36KItNyH1vhU5t3p7uU4UX02lPLZjE2TQcxhT8F5jens0qaKO','nguoidung356@gmail.com',NULL,NULL,'active','2017-10-20 22:08:05',NULL,1,NULL,'2017-10-20 22:08:05',NULL,NULL),(362,'nguoidung357','$2a$10$EFztHxtzoI8LZ53awvlv1ukiLKcj/OxfiG5a/qOjEfc/t4.UhQ3wW','nguoidung357@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(363,'nguoidung358','$2a$10$Rpw7eQX72UoOv/oWsJ3H.u7ZCGml5Nhg.3s7rJKu2QkLav9emV2SW','nguoidung358@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(364,'nguoidung359','$2a$10$vybluIh5QE99pGll.OWC..5XpKY6UNze/Nov0tlPcXDE5t0aPlj/m','nguoidung359@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(365,'nguoidung360','$2a$10$KBsv2ybCP7AqSmYoJKa7NeXs8Eq3Vtevn903o1xtnW/6fC4supiyO','nguoidung360@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(366,'nguoidung361','$2a$10$LXC6Y6ukg1F.otTU813IXOs9wuN3eNKa7HZk2c6LJfk0nt8qD8xKm','nguoidung361@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(367,'nguoidung362','$2a$10$njB2edqJJofQOWiEIAynEOIpYXLxAX0Q.V1DyvclgEe2jvqevNb9m','nguoidung362@gmail.com',NULL,NULL,'active','2017-10-20 22:08:06',NULL,1,NULL,'2017-10-20 22:08:06',NULL,NULL),(368,'nguoidung363','$2a$10$tVkNApVcvJTWJpf.595JcuAatGwRu9CTsURhCv7j25F/r/PSQpjeu','nguoidung363@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(369,'nguoidung364','$2a$10$uFIMuF6Hu4XRWCJtHlnNW.EB9v2ISr9/kP97rxo25jvh1vbBD0BgC','nguoidung364@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(370,'nguoidung365','$2a$10$j1HqLDNuDzkc4SRpdoSm/eBxi3AhmToZ5FcrZWEeFxtg6c6SqXWjy','nguoidung365@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(371,'nguoidung366','$2a$10$Sd1.b/1X6taevBzekAQt1ejJpRE/dGMe6vmMrJsLi4QcZOebpckny','nguoidung366@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(372,'nguoidung367','$2a$10$VIKMIH9OFyLNGFr8Yf7XruXYTD0BmpHKuF6eFB7yW8e0abtnd0vsq','nguoidung367@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(373,'nguoidung368','$2a$10$ifjafAekFfUX60WUvUxi3uUSJc1tP9Yez00HgkMkD8gIyVJqUs1CO','nguoidung368@gmail.com',NULL,NULL,'active','2017-10-20 22:08:07',NULL,1,NULL,'2017-10-20 22:08:07',NULL,NULL),(374,'nguoidung369','$2a$10$kZlul3h37F7EXI7EMAMJQe1HOyfq1bROGOLnRwP88Vg6q/fg1pUku','nguoidung369@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(375,'nguoidung370','$2a$10$Y3CWoGKOebGeLJN9yT3.lePk3NW6ra1NL/e/6qxj5UAelDK33lWvC','nguoidung370@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(376,'nguoidung371','$2a$10$LKjeeixU2JZnSOHyl2swG.Cyy2z/P0APCnZrbYmzDXJfqFJGo.7WW','nguoidung371@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(377,'nguoidung372','$2a$10$faf7enKxgm4.l5.92ByAiOQdvStKMPfBXTmbaQTvrL8QGeyeYepAu','nguoidung372@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(378,'nguoidung373','$2a$10$6IG1TV3G2xj/0Lg6Eov6V.mAjdX2aBhaY2yq0iGgH9ZLmdTPz7h4S','nguoidung373@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(379,'nguoidung374','$2a$10$CDMvSStHkLdae5DWrUydBeCZzZNe5IpaoOMCfJqTMt0dlFl/i/SxS','nguoidung374@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(380,'nguoidung375','$2a$10$q3XNzM419tus4GIzVoB6Je.wlStNP.Xnua7niM1dxxseBMplreyeO','nguoidung375@gmail.com',NULL,NULL,'active','2017-10-20 22:08:08',NULL,1,NULL,'2017-10-20 22:08:08',NULL,NULL),(381,'nguoidung376','$2a$10$K9d0rXBYUuI/g6aSD2BWH.O5QgFk2Ljz.ZQwztArtwg2Te9Boy5t.','nguoidung376@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(382,'nguoidung377','$2a$10$xVJw41KKWBhebOUxfz9GH.D3J6uUUJa3jTlOw.6/kifO2wuVHbjqS','nguoidung377@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(383,'nguoidung378','$2a$10$5CPZbYTmfFe5zALr05hi.Ou4fYWjcAEa/fFz.nw8.h6UZ7CCU85PK','nguoidung378@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(384,'nguoidung379','$2a$10$DWvgU6O4/CX9vczGHkv/wOAONWvwMq8ohqrwT7qIRu8rAMP2AUR7y','nguoidung379@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(385,'nguoidung380','$2a$10$2qnvGsEbSUdxJKsdTk/PdedNrTJEfnQIbgjX3dk6U9oGtj6vhHv3K','nguoidung380@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(386,'nguoidung381','$2a$10$ZIG7VMzfJ.E57gRIC.RAyOljPvcDVYN0wkkRMXiBpNF9.8C7eDh5a','nguoidung381@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(387,'nguoidung382','$2a$10$1/WTsI8dnbv16L3Yd.w2yOxlxD.4AKybsgiS0E58GPsfoLV7o6yc6','nguoidung382@gmail.com',NULL,NULL,'active','2017-10-20 22:08:09',NULL,1,NULL,'2017-10-20 22:08:09',NULL,NULL),(388,'nguoidung383','$2a$10$r9qadK12qxraGEnInZSSdOkowzX.iBb5xh5QJVn8z/xh0F7fKupV6','nguoidung383@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(389,'nguoidung384','$2a$10$rW2BbEZYIWPgO4pZmqUNNuaKynzteW./bOnrYXe6fWsX8mrj6u2Xa','nguoidung384@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(390,'nguoidung385','$2a$10$.tcAmiKSnsTipoTGU3Cu6OlEwzAMe1t0Ps4HtWOIswGh2EbVr3gHa','nguoidung385@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(391,'nguoidung386','$2a$10$.hTzlassVrdlF8CEtgsqz.QLrrdQJPjZNB07aRsDucIRZC3WeV/ee','nguoidung386@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(392,'nguoidung387','$2a$10$.T51dMwvGUEl3dbgJAe/AefGxJdhsRnqba3d/qQou4dWx83TaTTB6','nguoidung387@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(393,'nguoidung388','$2a$10$Hwa4xnaryVe1z4CpB5pEQeXj.WwtIFjMJ3Cyxtjye3PnuREnNiz2S','nguoidung388@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(394,'nguoidung389','$2a$10$BfsuA/7s1lW6yOJfsfIfR.KD2KqBL.HBwbCyytVRPBEXZHChNaDxy','nguoidung389@gmail.com',NULL,NULL,'active','2017-10-20 22:08:10',NULL,1,NULL,'2017-10-20 22:08:10',NULL,NULL),(395,'nguoidung390','$2a$10$n1EFN1ZTvbIXvxBHHMD2kObL5KhRIznrrvD5pASaadLgydQWT8QKa','nguoidung390@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(396,'nguoidung391','$2a$10$1uLTsRBZGaaC./mm3a....dwOns7e.fwKI3WAiyOhBp./ZPC/K/1i','nguoidung391@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(397,'nguoidung392','$2a$10$.A.artiy.bk1pizHId1/xem61.J2chFmMdnpUYhleOBceSOg43LSq','nguoidung392@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(398,'nguoidung393','$2a$10$P9igEv0vSwM2s8bK7.aQAukaYTgPnLPtOqBuPOFrNKJX6s8PNJeU6','nguoidung393@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(399,'nguoidung394','$2a$10$gy9MEi1XIvywgmyV6JtlFuRTpB1IHcds4pq8nBu7mO2N8SQfStey.','nguoidung394@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(400,'nguoidung395','$2a$10$HIDUkWeK2lMsQ5Fgo7rvMONU/U.kQ2f8KmV5nlqSRTPk4OGv./pQC','nguoidung395@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(401,'nguoidung396','$2a$10$eBbSovq2XxWvih0ViRwMPOb//mW8mmC0X04Nzrnuzl3WdUQc4eqCu','nguoidung396@gmail.com',NULL,NULL,'active','2017-10-20 22:08:11',NULL,1,NULL,'2017-10-20 22:08:11',NULL,NULL),(402,'nguoidung397','$2a$10$vs4.q9FSSAaY/XfA4gfWpeu9tVU42L1MBmyPmOnvxyFL70Sdxmqne','nguoidung397@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(403,'nguoidung398','$2a$10$WOaSBSC5ffIEKege5MsI7O0gVic./BRUVvkk8Rg4Blv4crvxLVQLy','nguoidung398@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(404,'nguoidung399','$2a$10$0uHoL.DXt7sIFo/fPx7ldOh6VxbtzhjKg1dfwpkXBOi9vKG4zXmX.','nguoidung399@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(405,'nguoidung400','$2a$10$F/k8n2n4XXpM7p9qFlTaee60ukvQ.XuJOYLxoTpmnbDASSS9VHQ7O','nguoidung400@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(406,'nguoidung401','$2a$10$uayMH5b/zsLO2SLIuEXgOuUgreFoxu9QjbdWqKpbSoM/QX/oeOnZW','nguoidung401@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(407,'nguoidung402','$2a$10$NMgJehQv5q5/Hp9xPmWYnOJsHaFbUljqI7sfEFbRhfR4OMsydrCJC','nguoidung402@gmail.com',NULL,NULL,'active','2017-10-20 22:08:12',NULL,1,NULL,'2017-10-20 22:08:12',NULL,NULL),(408,'nguoidung403','$2a$10$/9AfnkC6tvGK/dc3.zuJ1uW9RD/QIc9pEsdrKapk1kjhru1CtXWMq','nguoidung403@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(409,'nguoidung404','$2a$10$yD1h/8iNk/nJp5J1dOrOYe4M3cg7Zmam0WnAFJpyjiNIktst23XMq','nguoidung404@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(410,'nguoidung405','$2a$10$LvX6QRsNlb1sr1US6FOtKuh2SsaHAwOBcxbr8bvDMkBec6wHGghqu','nguoidung405@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(411,'nguoidung406','$2a$10$wBmJClxQMukHenQTA7oLgua0vSAU6GmuZFXIC/zK5MAsW1xfODlL2','nguoidung406@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(412,'nguoidung407','$2a$10$yuloZygA8RjmqmP4tCITAekaUwipsTdNrmU7Z5Yg/MJwhs/CkX/76','nguoidung407@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(413,'nguoidung408','$2a$10$g/8Kd0ktF3X.EF9d.otIFes3IWTc0SJKEyKWRbGjw60fsY9eaOOO.','nguoidung408@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(414,'nguoidung409','$2a$10$4pzcmbMKxpXzn6k2hCNYf.nXIv4xxpYn9T3SPhfKV8dXslhVthWHm','nguoidung409@gmail.com',NULL,NULL,'active','2017-10-20 22:08:13',NULL,1,NULL,'2017-10-20 22:08:13',NULL,NULL),(415,'nguoidung410','$2a$10$SkrcQnmrnPg8RlgY6UoKvOf769B1aNUIGK9VHUiz/wBbeH4KusRHu','nguoidung410@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(416,'nguoidung411','$2a$10$ycJfWFWHP0kyMncfywQc.OEwAsWomMql4iJFNlLDONw4ZHhiPqt.K','nguoidung411@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(417,'nguoidung412','$2a$10$nPKUI.8NrioJzIXLrCjKMe1dilXHxSJo0K0WAdYI3ZgkoQRwQIiGG','nguoidung412@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(418,'nguoidung413','$2a$10$eBT6DTSJtpfm1/ctJVT5CeD6xMZ7GiE1HycMujO/pHX9Kl4owyRiK','nguoidung413@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(419,'nguoidung414','$2a$10$qI4fmD73Z0D9.61jZGvfQ.XQT53JuhP81g9BDiTB8uUunQOdjR.s.','nguoidung414@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(420,'nguoidung415','$2a$10$p7fTPP3p1oDdVZr8/Pr9reo6Hq4nFDwpsZUn/lts0Sw52gPnwv5kC','nguoidung415@gmail.com',NULL,NULL,'active','2017-10-20 22:08:14',NULL,1,NULL,'2017-10-20 22:08:14',NULL,NULL),(421,'nguoidung416','$2a$10$hfqTCHDSyLXVv4BBeo4Ut.rxVc87zpHZjdHBSPOa7Qq7Hh5EtzxKa','nguoidung416@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(422,'nguoidung417','$2a$10$rJHIIU8CEzSkLK2gqIySs.N7QjAcd6RKBUGOzCXxiizW.hvivizHK','nguoidung417@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(423,'nguoidung418','$2a$10$ZlM/qfdDpyR7TSsdK5g/t./KxBgQBFQVdU5Plak4XLe8M.mfsdE6e','nguoidung418@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(424,'nguoidung419','$2a$10$gRDy1YtuYcXA2U64oUIobevAmFN0HfUBJhqz4nlzYE3mtr8IwXNeC','nguoidung419@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(425,'nguoidung420','$2a$10$TTnhLaajeDzSPIQw5fZC8eyWeUqG5Fx/Xi4Q.LQhURXNwavFOicKu','nguoidung420@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(426,'nguoidung421','$2a$10$RrPlGtjO6Aw10toesZHV8O55IuMzrb.4afBdCD/BqusDaXDzVaPVC','nguoidung421@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(427,'nguoidung422','$2a$10$puMW/44nD4GQ.Q6dieIPxuJULuu0hM0GrsYx0ObxZVjTpxwCqvFhK','nguoidung422@gmail.com',NULL,NULL,'active','2017-10-20 22:08:15',NULL,1,NULL,'2017-10-20 22:08:15',NULL,NULL),(428,'nguoidung423','$2a$10$YbO1Xp8rHe17bozeTyCX5eoSSJ4pFXhYLdF01R8VBt30xMb4f8eXa','nguoidung423@gmail.com',NULL,NULL,'active','2017-10-20 22:08:16',NULL,1,NULL,'2017-10-20 22:08:16',NULL,NULL),(429,'nguoidung424','$2a$10$b3cHkJxAnc01eqbHJ5SbAOmC8BpRhqi0UUeS9h4m5yS038N9nQT9K','nguoidung424@gmail.com',NULL,NULL,'active','2017-10-20 22:08:16',NULL,1,NULL,'2017-10-20 22:08:16',NULL,NULL),(430,'nguoidung425','$2a$10$8eRjRtO0e.16RKCuu/FBQekiT2/nWYitfgvJd3xWoLFB0DQevM9U.','nguoidung425@gmail.com',NULL,NULL,'active','2017-10-20 22:08:16',NULL,1,NULL,'2017-10-20 22:08:16',NULL,NULL),(431,'nguoidung426','$2a$10$moUTiZm9MEvfUWScMxSAF.CyBjSHUkhi7elnyDIb2McwMfCCyPdva','nguoidung426@gmail.com',NULL,NULL,'active','2017-10-20 22:08:16',NULL,1,NULL,'2017-10-20 22:08:16',NULL,NULL),(432,'nguoidung427','$2a$10$WVqhkfcDERik27ENpHs5J.r4laG62RTEeuXb6tDXAExLAgeQHdTrS','nguoidung427@gmail.com',NULL,NULL,'active','2017-10-20 22:08:16',NULL,1,NULL,'2017-10-20 22:08:16',NULL,NULL),(433,'nguoidung428','$2a$10$7gTQKRRQB7zN9gRYuqgUf.BZCx0StA.n1y1dvFYbh.FdGyeRlydAq','nguoidung428@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(434,'nguoidung429','$2a$10$blEuhzvsWsa25aPmC6gUAO92MNm1SVz/CgoHjB1/dgRKQ9KjAJZyK','nguoidung429@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(435,'nguoidung430','$2a$10$cg9J/xPivpzWwzYNW14KKu531XQbuEZ39gt1KgQ0iUFMe73iH2pH6','nguoidung430@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(436,'nguoidung431','$2a$10$TU.IFF0fo./bCpunWoWaX..eYhpEjNf2LRpBuwy/5xSY8rZVPqzle','nguoidung431@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(437,'nguoidung432','$2a$10$XN/ZWraFeIH612QYnaprFuWpjCpagjVmAcoaFU.xfIrstcdJuiP62','nguoidung432@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(438,'nguoidung433','$2a$10$k.Tx.2ZF/PrCFvsB8B7j3.vFDPmHAscBGpQLxRLbdaT8PTXnX7f46','nguoidung433@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(439,'nguoidung434','$2a$10$JWu0sSXLteSYxxwcJYJTv.5d.jXN97AB9M1Ye0wEPQ.ZFLP.arc1u','nguoidung434@gmail.com',NULL,NULL,'active','2017-10-20 22:08:17',NULL,1,NULL,'2017-10-20 22:08:17',NULL,NULL),(440,'nguoidung435','$2a$10$KqkYDEQh53dkgXzuzVCh7ujlFyd2BbbWilYSGAkGT7/n5p8vAGDGm','nguoidung435@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(441,'nguoidung436','$2a$10$2eVFkOTJ3BmbMK1lhqsjaONr3MK4Jd02x5LQV8csvvBWfcw0qnm7m','nguoidung436@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(442,'nguoidung437','$2a$10$ftSVza1y6dvBZ1Ojr4Rq/Ob4rZMA0oXeskKwU6YApVJFSNg/dxRXy','nguoidung437@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(443,'nguoidung438','$2a$10$4gSUYnnCO4j.gfuxAobNM.kfD3qWL77gMqurpnnuI2AMNFZtJ95Vq','nguoidung438@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(444,'nguoidung439','$2a$10$XLzwtoSKAmvF.M5sT633g.yUyg4P2s/PLpqI7HZNaOZz0t5Aftyke','nguoidung439@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(445,'nguoidung440','$2a$10$/1acSXrs6DW9yAmAd8qz1OcctXy.BEcyjEGGL4XZ6iwQ3x.nq/1CW','nguoidung440@gmail.com',NULL,NULL,'active','2017-10-20 22:08:18',NULL,1,NULL,'2017-10-20 22:08:18',NULL,NULL),(446,'nguoidung441','$2a$10$cSKa72JMja0pjy848/.vKe42smQzaZVIJQ8VUXdmBAwb.jUteSkva','nguoidung441@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(447,'nguoidung442','$2a$10$Qmr0BvcraOKqryd/djIPCei0Y70CYiYlszY3KFyTPmRF2599fKDO.','nguoidung442@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(448,'nguoidung443','$2a$10$JXbQDMilMQRtjdIfrEzDDOrGI4T2BknW7jwW/5fZ9bMwY26stkp6C','nguoidung443@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(449,'nguoidung444','$2a$10$owXJ7PUGsLa6nvaeDcJmfue8AFjeaH/ro6F8ypYH/N/wp9pEPLXzS','nguoidung444@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(450,'nguoidung445','$2a$10$w885DHJe4W6Y4c6i4cDoQuB08xA5wAQgZmH18laeejwS7IrW/SkiO','nguoidung445@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(451,'nguoidung446','$2a$10$z2cgY.N8hu5B/OlNaKcXXe9e4INTC5IhqRZxrexE8Hpabe8YtRa9S','nguoidung446@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(452,'nguoidung447','$2a$10$98qVeoiaba/Eb2eRdSCpJ.M43etPPP5G01JT.yU4SEl.xKxCpw04O','nguoidung447@gmail.com',NULL,NULL,'active','2017-10-20 22:08:19',NULL,1,NULL,'2017-10-20 22:08:19',NULL,NULL),(453,'nguoidung448','$2a$10$ZtQNOb3qVWByM2wzGVRDVeibOMbJLRq3j3.M/CyKD68cq79NWaaje','nguoidung448@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(454,'nguoidung449','$2a$10$ExdQViiv9mwmYEE2FFf9lO.Xt/RRAA09O4o2vXE5oz91XHv4dCzZS','nguoidung449@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(455,'nguoidung450','$2a$10$HtymafLsZ8HWZQky.AB9fetUOpgZf5Fe7yBH3GN1PYTGAbBi9W5Pe','nguoidung450@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(456,'nguoidung451','$2a$10$1fxyhsu9KlEO559dfdX3eexbh2Cz01lqsmTzLwZiEM26TK4oMoFlC','nguoidung451@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(457,'nguoidung452','$2a$10$fs/1KCsw4TExnnVqtrzhi.8hOcGxwtmkUCyE6.J040v6SiFvOlHj2','nguoidung452@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(458,'nguoidung453','$2a$10$DcnHzzCsFnIJZq9QiAyXcu.MUc87VhbsCp2bfc0jLCNpwi0BqipEm','nguoidung453@gmail.com',NULL,NULL,'active','2017-10-20 22:08:20',NULL,1,NULL,'2017-10-20 22:08:20',NULL,NULL),(459,'nguoidung454','$2a$10$sh7bqO7sae26XyWuoreSvucPTmV6/iuD9Sr.QBkwpUFSPAh7j790q','nguoidung454@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(460,'nguoidung455','$2a$10$3NA1hrYo.ST23aw9KCQYQeHisp0qSFjKBcXlg1gS/cs/9nLd/bFue','nguoidung455@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(461,'nguoidung456','$2a$10$toHV5/U2zsIQgM6kyGoMv.oD8h36CyB.CU4DjBVXM0z.XN7qurEv6','nguoidung456@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(462,'nguoidung457','$2a$10$7zp8OaFU9svxI8z4VOJZbOHaj4DVmjekvbd8.04Kgo1Cu2uLCL4o2','nguoidung457@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(463,'nguoidung458','$2a$10$blOz.wL6VsSTpTu4cbvxYOte/DpNM1vyZQlIsCHNP.JiQZ51cTrvC','nguoidung458@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(464,'nguoidung459','$2a$10$J1NcWW4L5CxhxOrVFY6t5ubCx.9aEKPHzrKykkPPf3DyZeLBg594e','nguoidung459@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(465,'nguoidung460','$2a$10$hxEGstc8TXWywk/PtcCTXu/kRQ7Dni5vyjSOK7BHoJaR.v/SMDTXe','nguoidung460@gmail.com',NULL,NULL,'active','2017-10-20 22:08:21',NULL,1,NULL,'2017-10-20 22:08:21',NULL,NULL),(466,'nguoidung461','$2a$10$KcCcl8XOk8nnHwNKmdb97OYlreWZ.P8.X2NTu3T5lASt0sfmKqvjm','nguoidung461@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(467,'nguoidung462','$2a$10$uTbgJfsiNNMKZmivGEB8ae7cCMq9OJB0GhAIojxEKHbVKlvRtHLoq','nguoidung462@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(468,'nguoidung463','$2a$10$PNnq.pURs2Fosxh228AmMOy6KWNFljre83mjdSBw40bXQFeidngVa','nguoidung463@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(469,'nguoidung464','$2a$10$aFhd1mSbp9HypFTAUUcDn.3TP8FP/GpOViVuM7LaqOPQBV9XwxNVi','nguoidung464@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(470,'nguoidung465','$2a$10$L9QMS/7tjq3D3ypz5sJ5yuXtZGVkXoN3k18DeUDgBDWXv5qZ9k5vm','nguoidung465@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(471,'nguoidung466','$2a$10$6VqGCjWmplZirADv70h.9.CKfpel6mNhySYCreEseDv1pZsukrDXy','nguoidung466@gmail.com',NULL,NULL,'active','2017-10-20 22:08:22',NULL,1,NULL,'2017-10-20 22:08:22',NULL,NULL),(472,'nguoidung467','$2a$10$z/uz7/XMUOQI2TyH3M3VB.4a.gX55if0ZptmLDS0ZwPU1dfP.3gd.','nguoidung467@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(473,'nguoidung468','$2a$10$G2tK.ptTUZLf.qGZFA76y.92WpSo570FQu8NKRc17zwx9ZrWAhlLu','nguoidung468@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(474,'nguoidung469','$2a$10$e7BJpL.yvyeAD0C0cyx5yeX8TAlRQuWt3RihQeYuDxzYIYm2/UN4W','nguoidung469@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(475,'nguoidung470','$2a$10$xkkSwsWbhgGxD.zG11AsS.N.txyGP3kZ4U8WxPRFWA83HeMZ5zd46','nguoidung470@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(476,'nguoidung471','$2a$10$Yg017aWWuhFKgCgw7k5RXOECPnUH39/iS4zWZFfCudMyGLjQ7tQFq','nguoidung471@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(477,'nguoidung472','$2a$10$NctJ6LmGe4nyWuZW6/dW/er8tFUCgRNpE/lefLHMmkZt2ewPyW1Am','nguoidung472@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(478,'nguoidung473','$2a$10$moaq5D1Dne3VkdNTTRAvhuvv0NVMgXyYjibvsUVNKDg9yWqxkXzLS','nguoidung473@gmail.com',NULL,NULL,'active','2017-10-20 22:08:23',NULL,1,NULL,'2017-10-20 22:08:23',NULL,NULL),(479,'nguoidung474','$2a$10$4mw48hM7gr803CmeIXc49O27mXzSW0S3XMwqck37FHYD565Nn.H1a','nguoidung474@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(480,'nguoidung475','$2a$10$jKdHHlewFUEL16tYeOABA.OWJh8zmWlcM.vtFJCqlrsNM7URE4HDm','nguoidung475@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(481,'nguoidung476','$2a$10$l798OXBEVfV09oHHBb5kLeAl69ZWeRzLDqmElbqzFSZujuw7MLN7K','nguoidung476@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(482,'nguoidung477','$2a$10$CYc7Fhlx5emCdoiorbhcV.OhOxrVYk9.V/nxLhXtJkgiOLk8Idsxa','nguoidung477@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(483,'nguoidung478','$2a$10$mf/mIHywPhwbnX.HJDRzFOcQpCktyXL/qwnqc41hescl36w50wd1u','nguoidung478@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(484,'nguoidung479','$2a$10$9kzzu7dNED9bjlF8Ik5TU.e17zHxj9Ew8EujUaxt2S03IsoHblrsi','nguoidung479@gmail.com',NULL,NULL,'active','2017-10-20 22:08:24',NULL,1,NULL,'2017-10-20 22:08:24',NULL,NULL),(485,'nguoidung480','$2a$10$MqD0LasYJNgyI/TfxelVhOki5m0qc0SpmoYHY.HY.UgDjB72572Uq','nguoidung480@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(486,'nguoidung481','$2a$10$Yzib.H8Q6PyI5kSbE0j1qug69WglBohLQI1TihOcoZQI6LyUtFZtC','nguoidung481@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(487,'nguoidung482','$2a$10$7d.p1F7Vs7ygk9pjBkSgWu5hicUgx.yjKob1Z2nAq1nTXtQQU8CSG','nguoidung482@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(488,'nguoidung483','$2a$10$eziLKvW.vJQ0WFOhiXUQWOxvJkRqxzpoNjBn2jt0qPY/z790NXEx6','nguoidung483@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(489,'nguoidung484','$2a$10$ZYBzGaGJicPfXh5wLtd40uAZoGDaLyE.60FQ9VR6xTMjBxCd68HN2','nguoidung484@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(490,'nguoidung485','$2a$10$fgnFalOdoQXEHH4HT2NZa.FLcj4W2KfSeyDOoPK7.JaUZzcaZi3ma','nguoidung485@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(491,'nguoidung486','$2a$10$jvjMvRUPdDL5ndgqQ3i7/uk/bdubI.Ptbl2UW/NE.GcW/bNRUjzzm','nguoidung486@gmail.com',NULL,NULL,'active','2017-10-20 22:08:25',NULL,1,NULL,'2017-10-20 22:08:25',NULL,NULL),(492,'nguoidung487','$2a$10$Jei2CQDGpu0/4SW3jnHGKOkjMUEx6BjY7WAuDDleby1ODQ/duUjWG','nguoidung487@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(493,'nguoidung488','$2a$10$kZZMrOhoGcYwvJGyHGyqJ.XeT6.qx1yOzrrDnblNzRwyXIkZLagDe','nguoidung488@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(494,'nguoidung489','$2a$10$KzrY5jI0E4/Y8RyDGEMgJuWxla4CwkGlL/Zbf4MGKFUrIQCaMCICe','nguoidung489@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(495,'nguoidung490','$2a$10$Svca/mFYcUrjSfI1Sn.eSOWLv.sd3oS1wZIhUKQnOZI5rMZbMckLK','nguoidung490@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(496,'nguoidung491','$2a$10$n5PM6kSAER/TBOeojJSe1.BwvP2BoxaflE/3NjC7p4gECs8CPB5HK','nguoidung491@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(497,'nguoidung492','$2a$10$8Sx4keKLuMZ7VMCb9znHyuTC81HK5axL9mRDMatKZgVeCPucEGzuq','nguoidung492@gmail.com',NULL,NULL,'active','2017-10-20 22:08:26',NULL,1,NULL,'2017-10-20 22:08:26',NULL,NULL),(498,'nguoidung493','$2a$10$7Fk6R90SwI5NiTxx84ntoOu5v7n/EclGPZj5vNo20HMquCg/ILZL6','nguoidung493@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL),(499,'nguoidung494','$2a$10$YsNmmUeqXNdbqJ9FipkueeFIEthzx6ViaB65ievWTtp3RrL1rL9HO','nguoidung494@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL),(500,'nguoidung495','$2a$10$3hfmu8d88iimEJ8hV1TgUuYMg2PHrwzD./Ryhzcv69hUcGPEyt/aW','nguoidung495@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL),(501,'nguoidung496','$2a$10$riL2RraUIQ9uMSWzrLFl1Od50CyVd0TWORKn3P1pdniC7z0/lLC2e','nguoidung496@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL),(502,'nguoidung497','$2a$10$4zNeynuNO/EAIKKaLjrc8Oe5EXOQo911A.rRrmTnO2GLKAnF6Enba','nguoidung497@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL),(503,'nguoidung498','$2a$10$ijpMVDdPXNES7lOBUmbIiOnNgg1.x0dVpbb4x/e5m2vkwX4Ct5beq','nguoidung498@gmail.com',NULL,NULL,'active','2017-10-20 22:08:27',NULL,1,NULL,'2017-10-20 22:08:27',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_users_users_roles_idx` (`user_id`),
  KEY `fk_roles_users_roles_idx` (`role_id`),
  CONSTRAINT `FK2o0jvgh89lemvvo17cbqvdxaa` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FKj6m8fwv7oqv74fcehir1a9ffy` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`),
  CONSTRAINT `fk_roles_users_roles` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_users_roles` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (3,5),(3,6),(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6),(16,6),(17,6),(18,6),(19,6),(20,6),(21,6),(22,6),(23,6),(24,6),(25,6),(26,6),(27,6),(28,6),(29,6),(30,6),(31,6),(32,6),(33,6),(34,6),(35,6),(36,6),(37,6),(38,6),(39,6),(40,6),(41,6),(42,6),(43,6),(44,6),(45,6),(46,6),(47,6),(48,6),(49,6),(50,6),(51,6),(52,6),(53,6),(54,6),(55,6),(56,6),(57,6),(58,6),(59,6),(60,6),(61,6),(62,6),(63,6),(64,6),(65,6),(66,6),(67,6),(68,6),(69,6),(70,6),(71,6),(72,6),(73,6),(74,6),(75,6),(76,6),(77,6),(78,6),(79,6),(80,6),(81,6),(82,6),(83,6),(84,6),(85,6),(86,6),(87,6),(88,6),(89,6),(90,6),(91,6),(92,6),(93,6),(94,6),(95,6),(96,6),(97,6),(98,6),(99,6),(100,6),(101,6),(102,6),(103,6),(104,6),(105,6),(106,6),(107,6),(108,6),(109,6),(110,6),(111,6),(112,6),(113,6),(114,6),(115,6),(116,6),(117,6),(118,6),(119,6),(120,6),(121,6),(122,6),(123,6),(124,6),(125,6),(126,6),(127,6),(128,6),(129,6),(130,6),(131,6),(132,6),(133,6),(134,6),(135,6),(136,6),(137,6),(138,6),(139,6),(140,6),(141,6),(142,6),(143,6),(144,6),(145,6),(146,6),(147,6),(148,6),(149,6),(150,6),(151,6),(152,6),(153,6),(154,6),(155,6),(156,6),(157,6),(158,6),(159,6),(160,6),(161,6),(162,6),(163,6),(164,6),(165,6),(166,6),(167,6),(168,6),(169,6),(170,6),(171,6),(172,6),(173,6),(174,6),(175,6),(176,6),(177,6),(178,6),(179,6),(180,6),(181,6),(182,6),(183,6),(184,6),(185,6),(186,6),(187,6),(188,6),(189,6),(190,6),(191,6),(192,6),(193,6),(194,6),(195,6),(196,6),(197,6),(198,6),(199,6),(200,6),(201,6),(202,6),(203,6),(204,6),(205,6),(206,6),(207,6),(208,6),(209,6),(210,6),(211,6),(212,6),(213,6),(214,6),(215,6),(216,6),(217,6),(218,6),(219,6),(220,6),(221,6),(222,6),(223,6),(224,6),(225,6),(226,6),(227,6),(228,6),(229,6),(230,6),(231,6),(232,6),(233,6),(234,6),(235,6),(236,6),(237,6),(238,6),(239,6),(240,6),(241,6),(242,6),(243,6),(244,6),(245,6),(246,6),(247,6),(248,6),(249,6),(250,6),(251,6),(252,6),(253,6),(254,6),(255,6),(256,6),(257,6),(258,6),(259,6),(260,6),(261,6),(262,6),(263,6),(264,6),(265,6),(266,6),(267,6),(268,6),(269,6),(270,6),(271,6),(272,6),(273,6),(274,6),(275,6),(276,6),(277,6),(278,6),(279,6),(280,6),(281,6),(282,6),(283,6),(284,6),(285,6),(286,6),(287,6),(288,6),(289,6),(290,6),(291,6),(292,6),(293,6),(294,6),(295,6),(296,6),(297,6),(298,6),(299,6),(300,6),(301,6),(302,6),(303,6),(304,6),(305,6),(306,6),(307,6),(308,6),(309,6),(310,6),(311,6),(312,6),(313,6),(314,6),(315,6),(316,6),(317,6),(318,6),(319,6),(320,6),(321,6),(322,6),(323,6),(324,6),(325,6),(326,6),(327,6),(328,6),(329,6),(330,6),(331,6),(332,6),(333,6),(334,6),(335,6),(336,6),(337,6),(338,6),(339,6),(340,6),(341,6),(342,6),(343,6),(344,6),(345,6),(346,6),(347,6),(348,6),(349,6),(350,6),(351,6),(352,6),(353,6),(354,6),(355,6),(356,6),(357,6),(358,6),(359,6),(360,6),(361,6),(362,6),(363,6),(364,6),(365,6),(366,6),(367,6),(368,6),(369,6),(370,6),(371,6),(372,6),(373,6),(374,6),(375,6),(376,6),(377,6),(378,6),(379,6),(380,6),(381,6),(382,6),(383,6),(384,6),(385,6),(386,6),(387,6),(388,6),(389,6),(390,6),(391,6),(392,6),(393,6),(394,6),(395,6),(396,6),(397,6),(398,6),(399,6),(400,6),(401,6),(402,6),(403,6),(404,6),(405,6),(406,6),(407,6),(408,6),(409,6),(410,6),(411,6),(412,6),(413,6),(414,6),(415,6),(416,6),(417,6),(418,6),(419,6),(420,6),(421,6),(422,6),(423,6),(424,6),(425,6),(426,6),(427,6),(428,6),(429,6),(430,6),(431,6),(432,6),(433,6),(434,6),(435,6),(436,6),(437,6),(438,6),(439,6),(440,6),(441,6),(442,6),(443,6),(444,6),(445,6),(446,6),(447,6),(448,6),(449,6),(450,6),(451,6),(452,6),(453,6),(454,6),(455,6),(456,6),(457,6),(458,6),(459,6),(460,6),(461,6),(462,6),(463,6),(464,6),(465,6),(466,6),(467,6),(468,6),(469,6),(470,6),(471,6),(472,6),(473,6),(474,6),(475,6),(476,6),(477,6),(478,6),(479,6),(480,6),(481,6),(482,6),(483,6),(484,6),(485,6),(486,6),(487,6),(488,6),(489,6),(490,6),(491,6),(492,6),(493,6),(494,6),(495,6),(496,6),(497,6),(498,6),(499,6),(500,6),(501,6),(502,6),(503,6);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-22 14:15:44
