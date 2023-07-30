-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: caf
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardId` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created` timestamp NOT NULL,
  `userId` int NOT NULL,
  `placeId` int NOT NULL,
  `placeScore` double DEFAULT NULL,
  PRIMARY KEY (`boardId`),
  KEY `fk_board_user_idx` (`userId`),
  KEY `fk_board_place1_idx` (`placeId`),
  CONSTRAINT `fk_board_place1` FOREIGN KEY (`placeId`) REFERENCES `place` (`placeId`),
  CONSTRAINT `fk_board_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'좋읍니다','2023-07-30 07:23:31',9,4,3.5);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board_like`
--

DROP TABLE IF EXISTS `board_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board_like` (
  `boardId` int NOT NULL,
  `userId` int NOT NULL,
  KEY `fk_board_like_board1_idx` (`boardId`),
  KEY `fk_board_like_user1_idx` (`userId`),
  CONSTRAINT `fk_board_like_board1` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`),
  CONSTRAINT `fk_board_like_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board_like`
--

LOCK TABLES `board_like` WRITE;
/*!40000 ALTER TABLE `board_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `board_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created` timestamp NOT NULL,
  `userId` int NOT NULL,
  `boardId` int NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `fk_comment_user1_idx` (`userId`),
  KEY `fk_comment_board1_idx` (`boardId`),
  CONSTRAINT `fk_comment_board1` FOREIGN KEY (`boardId`) REFERENCES `board` (`boardId`),
  CONSTRAINT `fk_comment_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_like`
--

DROP TABLE IF EXISTS `comment_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_like` (
  `commentId` int NOT NULL,
  `userId` int NOT NULL,
  KEY `fk_comment_like_comment1_idx` (`commentId`),
  KEY `fk_comment_like_user1_idx` (`userId`),
  CONSTRAINT `fk_comment_like_comment1` FOREIGN KEY (`commentId`) REFERENCES `comment` (`commentId`),
  CONSTRAINT `fk_comment_like_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_like`
--

LOCK TABLES `comment_like` WRITE;
/*!40000 ALTER TABLE `comment_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_place`
--

DROP TABLE IF EXISTS `my_place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my_place` (
  `placeId` int NOT NULL AUTO_INCREMENT,
  `widthCoordinate` decimal(40,30) NOT NULL,
  `heightCoordinate` decimal(40,30) NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `jibunAddress` varchar(300) DEFAULT NULL,
  `category` int DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `imgPath` longtext,
  `homepage` longtext,
  `placeInfo` varchar(1000) DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`placeId`),
  KEY `fk_my_place_user1_idx` (`userId`),
  CONSTRAINT `fk_my_place_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_place`
--

LOCK TABLES `my_place` WRITE;
/*!40000 ALTER TABLE `my_place` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `placeId` int NOT NULL AUTO_INCREMENT,
  `widthCoordinate` double NOT NULL,
  `heightCoordinate` double NOT NULL,
  `address` varchar(300) DEFAULT NULL,
  `jibunAddress` varchar(300) DEFAULT NULL,
  `avgScore` double DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `imgPath` longtext,
  `homepage` longtext,
  `placeInfo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`placeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (3,35.2000536502156,129.08923386614697,'부산 동래구 충렬대로272번길 15 2층 202호','(우) 47879 (지번) 낙민동 211-5',4.8,'100111011','얼룩개','../../resources/imgs/alookat.jpg','https://www.instagram.com/a.look.at/','엔틱한 바형 강배전 카페'),(4,35.15604680367208,129.0599790283397,'부산 부산진구 서전로10번길 41','(우)47292 (지번) 부전동 168-152',3.5,'101010111','블랙업','../../resources/imgs/blackup.png','https://blackupcoffee.com/','모던한 중약배전 카페');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_like`
--

DROP TABLE IF EXISTS `place_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_like` (
  `placeId` int NOT NULL,
  `userId` int NOT NULL,
  KEY `fk_place_like_place1_idx` (`placeId`),
  KEY `fk_place_like_user1_idx` (`userId`),
  CONSTRAINT `fk_place_like_place1` FOREIGN KEY (`placeId`) REFERENCES `place` (`placeId`),
  CONSTRAINT `fk_place_like_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_like`
--

LOCK TABLES `place_like` WRITE;
/*!40000 ALTER TABLE `place_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place_score`
--

DROP TABLE IF EXISTS `place_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place_score` (
  `placeId` int NOT NULL,
  `userId` int NOT NULL,
  `score` double NOT NULL,
  KEY `fk_comment_like_copy1_place1_idx` (`placeId`),
  KEY `fk_comment_like_copy1_user1_idx` (`userId`),
  CONSTRAINT `fk_comment_like_copy1_place1` FOREIGN KEY (`placeId`) REFERENCES `place` (`placeId`),
  CONSTRAINT `fk_comment_like_copy1_user1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place_score`
--

LOCK TABLES `place_score` WRITE;
/*!40000 ALTER TABLE `place_score` DISABLE KEYS */;
/*!40000 ALTER TABLE `place_score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `id` varchar(100) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `nickname` varchar(100) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `imgPath` longtext,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nickname_UNIQUE` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (8,'um','1112','김찬호',NULL,NULL),(9,'aa','1234','엄준식',NULL,NULL),(11,'aaa','1234','엄준식a',NULL,NULL),(13,'aaaa','1234','엄준식aa',NULL,NULL),(14,'aaaaa','1234','엄준식aaa',NULL,NULL),(15,'aaaaaa','1234','엄준식aaaa',NULL,NULL),(18,'aaaaaaa','1234','엄준식aaaaa',NULL,NULL),(19,'aaasdaaaaa','1234','엄준식aaasadaa',NULL,NULL),(20,'asd','1112','유저81',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-31  1:40:09
