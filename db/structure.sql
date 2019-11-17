-- MySQL dump 10.13  Distrib 5.6.43, for osx10.14 (x86_64)
--
-- Host: localhost    Database: mercari_development
-- ------------------------------------------------------
-- Server version	5.6.43

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `postal_code` int(11) NOT NULL,
  `prefecture` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL,
  `building_name` varchar(255) NOT NULL,
  `delivery_phone` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addresses_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_48c9e0c5a2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_brands_on_ancestry` (`ancestry`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `ecard_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_cards_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_8ef7749967` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_ancestry` (`ancestry`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1471 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories_brands`
--

DROP TABLE IF EXISTS `categories_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_brands_on_brand_id` (`brand_id`) USING BTREE,
  KEY `index_categories_brands_on_category_id` (`category_id`) USING BTREE,
  CONSTRAINT `fk_rails_1139b93f2f` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `fk_rails_de9065483a` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=892 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories_sizes`
--

DROP TABLE IF EXISTS `categories_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories_sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_sizes_on_category_id` (`category_id`) USING BTREE,
  KEY `index_categories_sizes_on_size_id` (`size_id`) USING BTREE,
  CONSTRAINT `fk_rails_0cfc8cbb72` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  CONSTRAINT `fk_rails_36d718fad0` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `images_url` text NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_images_on_item_id` (`item_id`) USING BTREE,
  CONSTRAINT `fk_rails_63c410e8ba` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `item_comments`
--

DROP TABLE IF EXISTS `item_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_item_comments_on_user_id` (`user_id`),
  KEY `index_item_comments_on_item_id` (`item_id`),
  CONSTRAINT `fk_rails_447eba8ae7` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_rails_6ab0ad232b` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `explanation` text NOT NULL,
  `condition` varchar(255) NOT NULL,
  `shipping_charge` varchar(255) NOT NULL,
  `delivery_source_area` varchar(255) NOT NULL,
  `delivery_days` varchar(255) NOT NULL,
  `commission` int(11) NOT NULL,
  `profit` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `size_id` int(11) NOT NULL,
  `saler_id` int(11) NOT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `shipped_saler_id` int(11) DEFAULT NULL,
  `received_buyer_id` int(11) DEFAULT NULL,
  `like_num` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `how_to_ship` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_items_on_brand_id` (`brand_id`) USING BTREE,
  KEY `index_items_on_buyer_id` (`buyer_id`) USING BTREE,
  KEY `index_items_on_category_id` (`category_id`) USING BTREE,
  KEY `index_items_on_name` (`name`) USING BTREE,
  KEY `index_items_on_received_buyer_id` (`received_buyer_id`) USING BTREE,
  KEY `index_items_on_saler_id` (`saler_id`) USING BTREE,
  KEY `index_items_on_shipped_saler_id` (`shipped_saler_id`) USING BTREE,
  KEY `index_items_on_size_id` (`size_id`) USING BTREE,
  CONSTRAINT `fk_rails_05e766218e` FOREIGN KEY (`received_buyer_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_08d97cf4c9` FOREIGN KEY (`saler_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_0eadff840c` FOREIGN KEY (`shipped_saler_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_36708b3aa6` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`),
  CONSTRAINT `fk_rails_53a5d2c7e9` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`),
  CONSTRAINT `fk_rails_89fb86dc8b` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_rails_bac2cf3aef` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_likes_on_user_id` (`user_id`),
  KEY `index_likes_on_item_id` (`item_id`),
  CONSTRAINT `fk_rails_00045f60f7` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_rails_1e09b5dabf` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reputations`
--

DROP TABLE IF EXISTS `reputations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reputations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rater_id` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_reputations_on_rater_id` (`rater_id`),
  KEY `index_reputations_on_target_id` (`target_id`),
  CONSTRAINT `fk_rails_45751f104a` FOREIGN KEY (`rater_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_rails_70ad9a996b` FOREIGN KEY (`target_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seller_page_prefectures`
--

DROP TABLE IF EXISTS `seller_page_prefectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_page_prefectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prefecture_id` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sizes`
--

DROP TABLE IF EXISTS `sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ancestry` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sizes_on_ancestry` (`ancestry`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trade_comments`
--

DROP TABLE IF EXISTS `trade_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trade_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_trade_comments_on_user_id` (`user_id`),
  KEY `index_trade_comments_on_item_id` (`item_id`),
  CONSTRAINT `fk_rails_17d647559c` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`),
  CONSTRAINT `fk_rails_346c625550` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `image_url` varchar(255) NOT NULL,
  `profile` text,
  `family_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `ja_family_name` varchar(255) NOT NULL,
  `ja_first_name` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `authenticate_phone` varchar(255) NOT NULL,
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_authenticate_phone` (`authenticate_phone`) USING BTREE,
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'mercari_development'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-11 18:22:05
INSERT INTO `schema_migrations` (version) VALUES
('20191016133413'),
('20191016133749'),
('20191016133801'),
('20191016133817'),
('20191016133828'),
('20191016133834'),
('20191016142532'),
('20191018232143'),
('20191018233103'),
('20191018233422'),
('20191018233753'),
('20191018233809'),
('20191018234406'),
('20191018234525'),
('20191018234532'),
('20191018234538'),
('20191020045611'),
('20191020052007'),
('20191020052941'),
('20191020071339'),
('20191023113733'),
('20191023125336'),
('20191023125406'),
('20191023125419'),
('20191023125448'),
('20191023125503'),
('20191031071804'),
('20191031073325'),
('20191105102819'),
('20191107063616');


