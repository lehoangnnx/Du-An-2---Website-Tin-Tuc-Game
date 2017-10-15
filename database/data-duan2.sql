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
  `article_category_id` int(11) unsigned NOT NULL,
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
  KEY `fk_users_article_idx` (`created_user_id`),
  KEY `fk_article_category_article_idx` (`article_category_id`),
  CONSTRAINT `fk_article_category_article` FOREIGN KEY (`article_category_id`) REFERENCES `article_category` (`article_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_article` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `status` tinyint(4) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_category_id`),
  UNIQUE KEY `article_category_id_UNIQUE` (`article_category_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
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
  `status` tinyint(4) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_category_forum_id`)
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
  `article_category_forum_id` int(11) unsigned NOT NULL,
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
  KEY `fk_users_article_forum_idx` (`created_user_id`),
  KEY `fk_article_category_forum_article_forum_idx` (`article_category_forum_id`),
  CONSTRAINT `fk_article_category_forum_article_forum` FOREIGN KEY (`article_category_forum_id`) REFERENCES `article_category_forum` (`article_category_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_article_forum` FOREIGN KEY (`created_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `article_like`
--

DROP TABLE IF EXISTS `article_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_like` (
  `article_like_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `article_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_like_id`),
  KEY `fk_users_article_like_idx` (`user_id`),
  KEY `fk_article_article_like_idx` (`article_id`),
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
  `article_like_forum_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `article_forum_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`article_like_forum_id`),
  KEY `fk_users_article_like_forum_idx` (`user_id`),
  KEY `fk_article_forum_article_like_forum_idx` (`article_forum_id`),
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
  KEY `fk_users_comment_idx` (`user_id`),
  KEY `fk_article_comment_idx` (`article_id`),
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
  KEY `fk_users_comment_forum_idx` (`user_id`),
  KEY `fk_article_forum_comment_forum_idx` (`article_forum_id`),
  CONSTRAINT `fk_article_forum_comment_forum` FOREIGN KEY (`article_forum_id`) REFERENCES `article_forum` (`article_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_comment_forum` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `comment_like_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `comment_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_like_id`),
  UNIQUE KEY `comment_like_id_UNIQUE` (`comment_like_id`),
  KEY `fk_users_comment_like_idx` (`user_id`),
  KEY `fk_comment_comment_like_idx` (`comment_id`),
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
  `comment_like_forum_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `comment_forum_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`comment_like_forum_id`),
  KEY `fk_users_comment_like_forum_idx` (`user_id`),
  KEY `fk_comment_forum_comment_like_forum_idx` (`comment_forum_id`),
  CONSTRAINT `fk_comment_forum_comment_like_forum` FOREIGN KEY (`comment_forum_id`) REFERENCES `comment_forum` (`comment_forum_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_comment_like_forum` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  `status` tinyint(4) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_category_id`)
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
  `game_review_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `create_date` datetime NOT NULL,
  `game_id` int(11) unsigned NOT NULL,
  `review` double NOT NULL,
  `status` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_review_id`),
  UNIQUE KEY `game_review_id_UNIQUE` (`game_review_id`),
  KEY `fk_users_game_reviews_idx` (`user_id`),
  KEY `fk_gane_game_reviews_idx` (`game_id`),
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
  `game_category_id` int(11) unsigned NOT NULL,
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
  `status` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `game_id_UNIQUE` (`game_id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `slug_UNIQUE` (`slug`),
  KEY `fk_game_category_games_idx` (`game_category_id`),
  CONSTRAINT `fk_game_category_games` FOREIGN KEY (`game_category_id`) REFERENCES `game_category` (`game_category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL,
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
  `status` tinyint(4) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `page_id_UNIQUE` (`page_id`),
  UNIQUE KEY `slug_UNIQUE` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
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
  `status` tinyint(4) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `idquyen_UNIQUE` (`role_id`),
  UNIQUE KEY `tenquyen_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin',1,'Quan Tri Vien'),(2,'Nguoi Dung',1,'Nguoi Dung');
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
  UNIQUE KEY `slug_UNIQUE` (`slug`)
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
  `user_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `pasword` varchar(70) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `phone_number` varchar(25) DEFAULT NULL,
  `is_online` tinyint(4) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `logged_in_date` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_roles_users_idx` (`role_id`),
  CONSTRAINT `fk_roles_users` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2017-10-15 13:24:12
