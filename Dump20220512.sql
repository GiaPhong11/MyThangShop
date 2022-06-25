-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `tbl_category`
--

DROP TABLE IF EXISTS `tbl_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_internal_idx` (`parent_id`),
  CONSTRAINT `fk_internal` FOREIGN KEY (`parent_id`) REFERENCES `tbl_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_category`
--

LOCK TABLES `tbl_category` WRITE;
/*!40000 ALTER TABLE `tbl_category` DISABLE KEYS */;
INSERT INTO `tbl_category` VALUES (21,'JAVA','JAVA',NULL,NULL,NULL,NULL,NULL,1,'java'),(22,'.NET','.NET',NULL,NULL,NULL,NULL,NULL,1,'dot-net'),(23,'Spring Framework','Spring Framework',NULL,NULL,NULL,NULL,21,1,NULL),(24,'Spring MVC','Spring MVC',NULL,NULL,NULL,NULL,23,1,NULL),(25,'1','2',NULL,NULL,NULL,NULL,NULL,1,NULL),(27,'1','1',NULL,NULL,NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `tbl_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_confirmationtoken`
--

DROP TABLE IF EXISTS `tbl_confirmationtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_confirmationtoken` (
  `id` int NOT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_confirmationtoken`
--

LOCK TABLES `tbl_confirmationtoken` WRITE;
/*!40000 ALTER TABLE `tbl_confirmationtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_confirmationtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_contact`
--

DROP TABLE IF EXISTS `tbl_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `request_type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin liên hệ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_contact`
--

LOCK TABLES `tbl_contact` WRITE;
/*!40000 ALTER TABLE `tbl_contact` DISABLE KEYS */;
INSERT INTO `tbl_contact` VALUES (3,'tho','truong','asbasasd','sdfdsfas','asasdasda',NULL,NULL,NULL,NULL,1),(9,'','','','','',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products`
--

DROP TABLE IF EXISTS `tbl_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(13,2) NOT NULL,
  `price_sale` decimal(13,2) DEFAULT NULL,
  `short_description` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `detail_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `seo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `is_hot` tinyint(1) DEFAULT '0',
  `so_luong_ton` int DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_category_products_idx` (`category_id`),
  CONSTRAINT `fk_category_products` FOREIGN KEY (`category_id`) REFERENCES `tbl_category` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa danh mục sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products`
--

LOCK TABLES `tbl_products` WRITE;
/*!40000 ALTER TABLE `tbl_products` DISABLE KEYS */;
INSERT INTO `tbl_products` VALUES (68,'Java Core Part 01',100000.00,100000.00,'Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.','<p>Java is a high-level programming language originally developed by Sun\r\n Microsystems and released in 1995. Java runs on a variety of platforms,\r\n such as Windows, Mac OS, and the various versions of UNIX. This \r\ntutorial gives a complete understanding of Java. This reference will \r\ntake you through simple and practical approaches while learning Java \r\nProgramming language.</p>\r\n<h2>Why to Learn java Programming?</h2>\r\n<p>Java is a MUST for students and working professionals to become a \r\ngreat Software Engineer specially when they are working in Software \r\nDevelopment Domain. I will list down some of the key advantages of \r\nlearning Java Programming:</p>\r\n<ul class=\"list\"><li><p><b>Object Oriented</b> − In Java, everything is an Object. Java can be easily extended since it is based on the Object model.</p></li><li><p><b>Platform Independent</b> − Unlike many other programming \r\nlanguages including C and C++, when Java is compiled, it is not compiled\r\n into platform specific machine, rather into platform independent byte \r\ncode. This byte code is distributed over the web and interpreted by the \r\nVirtual Machine (JVM) on whichever platform it is being run on.</p></li><li><p><b>Simple</b> − Java is designed to be easy to learn. If you understand the basic concept of OOP Java, it would be easy to master.</p></li><li><p><b>Secure</b> − With Java\'s secure feature it enables to develop \r\nvirus-free, tamper-free systems. Authentication techniques are based on \r\npublic-key encryption.</p></li><li><p><b>Architecture-neutral</b> − Java compiler generates an \r\narchitecture-neutral object file format, which makes the compiled code \r\nexecutable on many processors, with the presence of Java runtime system.</p></li><li><p><b>Portable</b> − Being architecture-neutral and having no \r\nimplementation dependent aspects of the specification makes Java \r\nportable. Compiler in Java is written in ANSI C with a clean portability\r\n boundary, which is a POSIX subset.</p></li><li><p><b>Robust</b> − Java makes an effort to eliminate error prone \r\nsituations by emphasizing mainly on compile time error checking and \r\nruntime checking.</p></li></ul>\r\n<h2>Hello World using Java Programming.</h2>\r\n<p>Just to give you a little excitement about Java programming, I\'m \r\ngoing to give you a small conventional C Programming Hello World \r\nprogram, You can try it using Demo link.</p>\r\n<div class=\"demo-view\">\r\n<a href=\"http://tpcg.io/JFXzYe\" target=\"_blank\" rel=\"nofollow\" class=\"demo\"> Live Demo</a>\r\n</div>\r\n<pre class=\"prettyprint notranslate prettyprinted\" style=\"\"><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">class</span><span class=\"pln\"> </span><span class=\"typ\">MyFirstJavaProgram</span><span class=\"pln\"> </span><span class=\"pun\">{</span><span class=\"pln\">\r\n\r\n   </span><span class=\"com\">/* This is my first java program.\r\n    * This will print \'Hello World\' as the output\r\n    */</span><span class=\"pln\">\r\n\r\n   </span><span class=\"kwd\">public</span><span class=\"pln\"> </span><span class=\"kwd\">static</span><span class=\"pln\"> </span><span class=\"kwd\">void</span><span class=\"pln\"> main</span><span class=\"pun\">(</span><span class=\"typ\">String</span><span class=\"pln\"> </span><span class=\"pun\">[]</span><span class=\"pln\">args</span><span class=\"pun\">)</span><span class=\"pln\"> </span><span class=\"pun\">{</span><span class=\"pln\">\r\n      </span><span class=\"typ\">System</span><span class=\"pun\">.</span><span class=\"kwd\">out</span><span class=\"pun\">.</span><span class=\"pln\">println</span><span class=\"pun\">(</span><span class=\"str\">\"Hello World\"</span><span class=\"pun\">);</span><span class=\"pln\"> </span><span class=\"com\">// prints Hello World</span><span class=\"pln\">\r\n   </span><span class=\"pun\">}</span><span class=\"pln\">\r\n</span><span class=\"pun\">}</span></pre>\r\n<h2>Applications of Java Programming</h2>\r\n<p>The latest release of the Java Standard Edition is Java SE 8. With \r\nthe advancement of Java and its widespread popularity, multiple \r\nconfigurations were built to suit various types of platforms. For \r\nexample: J2EE for Enterprise Applications, J2ME for Mobile Applications.</p>\r\n<p>The new J2 versions were renamed as Java SE, Java EE, and Java ME respectively. Java is guaranteed to be <b>Write Once, Run Anywhere.</b></p>\r\n<ul class=\"list\"><li><p><b>Multithreaded</b> − With Java\'s multithreaded feature it is \r\npossible to write programs that can perform many tasks simultaneously. \r\nThis design feature allows the developers to construct interactive \r\napplications that can run smoothly.</p></li><li><p><b>Interpreted</b> − Java byte code is translated on the fly to \r\nnative machine instructions and is not stored anywhere. The development \r\nprocess is more rapid and analytical since the linking is an incremental\r\n and light-weight process.</p></li><li><p><b>High Performance</b> − With the use of Just-In-Time compilers, Java enables high performance.</p></li><li><p><b>Distributed</b> − Java is designed for the distributed environment of the internet.</p></li><li><p><b>Dynamic</b> − Java is considered to be more dynamic than C or \r\nC++ since it is designed to adapt to an evolving environment. Java \r\nprograms can carry extensive amount of run-time information that can be \r\nused to verify and resolve accesses to objects on run-time.</p></li></ul>\r\n<h2>Audience</h2>\r\n<p>This tutorial has been prepared for the beginners to help them \r\nunderstand the basic to advanced concepts related to Java Programming \r\nlanguage.</p>\r\n<h2>Prerequisites</h2>\r\n<p>Before you start practicing various types of examples given in this \r\nreference, we assume that you are already aware about computer programs \r\nand computer programming languages.</p>','product/avatar/31.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0,2),(69,'.NET Core Part 01',20000.00,20000.00,'.NET is a framework to develop software applications. It is designed and developed by Microsoft and the first beta version released in 2000.','.NET is a framework to develop software applications. It is designed and developed by Microsoft and the first beta version released in 2000.','product/avatar/14.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0,1),(70,'.NET Core Part 01',20000.00,20000.00,'.NET is a framework to develop software applications. It is designed and developed by Microsoft and the first beta version released in 2000.','.NET is a framework to develop software applications. It is designed and developed by Microsoft and the first beta version released in 2000.','product/avatar/18.jpg',22,NULL,NULL,NULL,NULL,1,NULL,0,-3),(71,'test delete',12.00,12.00,'test delete','<p>test delete<br></p>','product/avatar/25.jpg',21,NULL,NULL,NULL,NULL,1,NULL,0,0),(72,'Áo Polo Nam Pique Mắt Chim Basic Co Giãn Thoáng Khí',250000.00,220000.00,'Chất liệu: Pique mắt chim với thành phần 60% Cotton USA + 35% Polyester + 5% Spandex\r\n\r\nSử dụng Cotton USA - sợi cotton tốt nhất trên thế giới','<h2 class=\"title_km\" style=\"margin-bottom: 10px; font-family: &quot;svn-gilroy bold&quot;; line-height: 1.4; font-size: 16px;\">Đặc điểm sản phẩm</h2><div class=\"box-promotion\" style=\"font-family: svn-gilroy, sans-serif; font-size: 14px;\"><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Chất liệu: Pique mắt chim với thành phần 60% Cotton USA&nbsp;+ 35% Polyester + 5% Spandex</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Sử dụng&nbsp;Cotton USA - sợi cotton&nbsp;tốt nhất trên thế giới</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Công nghệ nhuộm Solid Dyed tạo nên hiệu ứng bắt mắt</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Chất liệu vải độc đáo với hiệu ứng mắt chim độc đáo, mới lạ và trẻ trung</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Vải pique&nbsp;thông thoáng, thấm hút tốt có độ bền cao</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">Áo co giãn tốt, luôn giữ được form và bền màu</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background: url(&quot;tick-line.svg&quot;) 0px 4px no-repeat;\">YODY - Look good. Feel good</p></div>','product/avatar/31.jpg',21,NULL,NULL,NULL,NULL,1,NULL,1,2),(73,'Áo Polo Nam Cafe Phối Nẹp Thấm Hút Mồ Hôi',250000.00,220000.00,'Chất liệu: Sợi Café với thành phần 50% sợi cafe và 50% sợi PET\r\n\r\nChất Siêu nhẹ, siêu mát.','<p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Chất liệu: Sợi Café với thành phần 50% sợi cafe và 50% sợi PET</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Chất Siêu nhẹ, siêu mát.</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Vải cafe thấm hút mồ hôi, kiểm soát khử mùi cơ thể tốt</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Có khả năng kháng khuẩn</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Chống tia UV</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">Thiết kế dáng suông, đơn giản, dễ mặc, dễ phối đồ</p><p style=\"margin-right: 0px; margin-bottom: 5px; margin-left: 0px; padding-left: 25px; background-image: url(&quot;tick-line.svg&quot;); background-position: 0px 4px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial; font-family: svn-gilroy, sans-serif; font-size: 14px;\">YODY - Look good. Feel good.</p>','product/avatar/14.jpg',21,NULL,NULL,NULL,NULL,1,NULL,1,2);
/*!40000 ALTER TABLE `tbl_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_products_images`
--

DROP TABLE IF EXISTS `tbl_products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_products_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `product_id` int NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_product_images_idx` (`product_id`),
  CONSTRAINT `fk_product_images` FOREIGN KEY (`product_id`) REFERENCES `tbl_products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu danh sách ảnh sản phẩm';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_products_images`
--

LOCK TABLES `tbl_products_images` WRITE;
/*!40000 ALTER TABLE `tbl_products_images` DISABLE KEYS */;
INSERT INTO `tbl_products_images` VALUES (35,'c.jpg','product/pictures/c.jpg',69,NULL,NULL,NULL,NULL,1),(36,'java.jpg','product/pictures/java.jpg',69,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_roles`
--

DROP TABLE IF EXISTS `tbl_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `description` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_roles`
--

LOCK TABLES `tbl_roles` WRITE;
/*!40000 ALTER TABLE `tbl_roles` DISABLE KEYS */;
INSERT INTO `tbl_roles` VALUES (11,'ADMIN','ADMIN',NULL,NULL,NULL,NULL,1),(12,'GUEST','GUEST',NULL,NULL,NULL,NULL,1),(28,'GUEST','GUEST',NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder`
--

DROP TABLE IF EXISTS `tbl_saleorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `total` decimal(13,2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `customer_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `customer_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `seo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `customer_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cutomer_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tinh_trang` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder`
--

LOCK TABLES `tbl_saleorder` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder` DISABLE KEYS */;
INSERT INTO `tbl_saleorder` VALUES (27,'1650895607408',NULL,NULL,NULL,NULL,NULL,NULL,1,'tho','',NULL,'','','chưa thanh toán'),(29,'1650895787669',12,NULL,NULL,NULL,NULL,NULL,1,'guest','',NULL,'','guest@example.com','1'),(30,'1650963847017',NULL,NULL,NULL,NULL,NULL,NULL,1,'tho','',NULL,'','','1'),(34,'1651671108860',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'1','1@gmail.com','1'),(35,'1651671136243',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','123',NULL,'asdfasfasf','1@gmail.com','1'),(36,'1651682325302',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(37,'1651682536125',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(38,'1651682570262',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','Đang giao hàng'),(39,'1651682979478',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(40,'1651683970832',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(41,'1651684249050',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(42,'1651684291622',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(43,'1651684331086',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(44,'1651684512690',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(45,'1651684671192',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(46,'1651684752840',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com','1'),(47,'1651684850077',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com',NULL),(48,'1651685093601',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1',NULL),(49,'1651685142808',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com',NULL),(50,'1651685164748',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com',NULL),(51,'1651685204574',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com',NULL),(52,'1651685282559',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'asdfasfasf','1@gmail.com',NULL),(53,'1651685452990',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'0388022379','1@gmail.com',NULL),(54,'1651891700291',NULL,NULL,NULL,NULL,NULL,NULL,1,'tho','asdfsaf',NULL,'0388022379','1@gmail.com','Chưa thanh toán'),(55,'1651893610140',NULL,NULL,NULL,NULL,NULL,NULL,1,'Thơ','123',NULL,'0388022379','truongtho@gmail.com','Đã thanh toán'),(56,'1652079796313',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','asdfsaf',NULL,'0388022379','1@gmail.com','Chưa thanh toán'),(57,'1652080053521',NULL,NULL,NULL,NULL,NULL,NULL,1,'1','123',NULL,'0388022379','1@gmail.com','Chưa thanh toán'),(58,'1652080656721',NULL,NULL,'2022-05-09',NULL,NULL,NULL,1,'tho','123',NULL,'0388022379','truongtho@gmail.com','Đã thanh toán'),(59,'1652089083393',NULL,NULL,'2022-05-09',NULL,NULL,NULL,1,'tho','123',NULL,'0388022379','1@gmail.com','Chưa thanh toán'),(60,'1652186448867',NULL,NULL,'2022-05-10',NULL,NULL,NULL,1,'1','123',NULL,'0388022379','1@gmail.com','Chưa thanh toán');
/*!40000 ALTER TABLE `tbl_saleorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_saleorder_products`
--

DROP TABLE IF EXISTS `tbl_saleorder_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_saleorder_products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `saleorder_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quality` int NOT NULL,
  `created_date` date DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_saleorder_product_idx` (`saleorder_id`),
  CONSTRAINT `fk_saleorder_product` FOREIGN KEY (`saleorder_id`) REFERENCES `tbl_saleorder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa phiếu mua hàng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_saleorder_products`
--

LOCK TABLES `tbl_saleorder_products` WRITE;
/*!40000 ALTER TABLE `tbl_saleorder_products` DISABLE KEYS */;
INSERT INTO `tbl_saleorder_products` VALUES (35,27,69,1,NULL,NULL,NULL,NULL,1),(37,29,69,1,NULL,NULL,NULL,NULL,1),(38,30,70,3,NULL,NULL,NULL,NULL,1),(42,34,70,1,NULL,NULL,NULL,NULL,1),(43,35,69,1,NULL,NULL,NULL,NULL,1),(44,36,69,1,NULL,NULL,NULL,NULL,1),(45,37,69,2,NULL,NULL,NULL,NULL,1),(46,38,72,1,NULL,NULL,NULL,NULL,1),(47,39,71,1,NULL,NULL,NULL,NULL,1),(48,39,70,1,NULL,NULL,NULL,NULL,1),(49,40,70,1,NULL,NULL,NULL,NULL,1),(50,40,69,2,NULL,NULL,NULL,NULL,1),(51,41,69,1,NULL,NULL,NULL,NULL,1),(52,42,69,1,NULL,NULL,NULL,NULL,1),(53,43,70,1,NULL,NULL,NULL,NULL,1),(54,44,69,1,NULL,NULL,NULL,NULL,1),(55,45,70,1,NULL,NULL,NULL,NULL,1),(56,46,68,1,NULL,NULL,NULL,NULL,1),(57,47,70,1,NULL,NULL,NULL,NULL,1),(58,48,70,1,NULL,NULL,NULL,NULL,1),(59,49,70,1,NULL,NULL,NULL,NULL,1),(60,50,70,1,NULL,NULL,NULL,NULL,1),(61,51,69,1,NULL,NULL,NULL,NULL,1),(62,52,69,1,NULL,NULL,NULL,NULL,1),(63,53,69,2,NULL,NULL,NULL,NULL,1),(64,54,71,1,NULL,NULL,NULL,NULL,1),(65,55,70,1,NULL,NULL,NULL,NULL,1),(66,56,70,1,NULL,NULL,NULL,NULL,1),(67,57,70,4,NULL,NULL,NULL,NULL,1),(68,58,71,1,NULL,NULL,NULL,NULL,1),(69,59,69,2,'2022-05-10',NULL,NULL,NULL,1),(70,60,71,1,'2022-05-10',NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tbl_saleorder_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `avatar` varchar(200) COLLATE utf8mb4_bin DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='Bảng dữ liệu chứa thông tin người dùng';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (11,'admin','$2a$04$VfMI75Jcf5S/vx2ENFwUu.SjP.EbPjIJhScGMxKsTKTIlrEF9D.e6','admin@example.com',NULL,NULL,NULL,NULL,1,NULL,NULL),(12,'guest','$2a$04$zTk8tCMki7a8QE/QJlmyTumW/4suxwY8XPVVFBdP8feLPKryZxGV6','guest@example.com',NULL,NULL,NULL,NULL,1,NULL,NULL),(15,'1','$2a$10$7GcBqF4AJAy9a9zbVI7KOuMS6prMHDllcLXvf67BQX4yzLVTrqh8i','1@gmail.com',NULL,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users_roles`
--

DROP TABLE IF EXISTS `tbl_users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_users_roles` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_roles_idx` (`role_id`),
  CONSTRAINT `fk_roles` FOREIGN KEY (`role_id`) REFERENCES `tbl_roles` (`id`),
  CONSTRAINT `fk_users` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='bảng trung gian thể hiện quan hệ n-n của users và roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users_roles`
--

LOCK TABLES `tbl_users_roles` WRITE;
/*!40000 ALTER TABLE `tbl_users_roles` DISABLE KEYS */;
INSERT INTO `tbl_users_roles` VALUES (11,11),(12,12),(15,28);
/*!40000 ALTER TABLE `tbl_users_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'newschema'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-12 23:01:03
