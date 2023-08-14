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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (16,'서면치곤 맛있네 ㄹㅇ','2023-08-03 13:48:32',25,4,4),(17,'강배전 진짜 큰일나노','2023-08-03 13:48:52',25,3,5),(18,'스모크커피 신박하긴한데 별로','2023-08-03 13:49:05',25,18,3.5),(19,'고수맞노 사장님','2023-08-03 13:49:34',25,25,4.5),(20,'개 개귀엽다','2023-08-03 13:49:44',25,7,4.5),(21,'다쿠아즈만 먹을만함','2023-08-03 13:49:54',25,17,3),(22,'스콘종류가 심하노 ㅋㅋ','2023-08-03 13:50:06',25,16,4.5),(23,'-틀-','2023-08-03 13:50:21',25,22,3.5),(24,'-틀-2','2023-08-03 13:50:29',25,21,3.5),(25,'빵','2023-08-03 13:50:50',25,23,4.5),(26,'글램핑장인줄','2023-08-03 13:51:08',25,19,2),(27,'빵과 뷰 끝','2023-08-03 13:51:20',25,15,2),(28,'집옆에 있었으면 좋겠다','2023-08-03 13:51:50',25,14,4.5),(29,'30대 입밴당할듯','2023-08-03 13:52:13',25,13,3),(30,'가는길 심하긴하노','2023-08-03 13:52:30',25,24,3),(31,'뷰만 좋음','2023-08-03 13:52:47',25,8,1.5),(32,'벡스코인줄 알음','2023-08-03 13:53:09',25,9,4.5),(33,'계곡카페1','2023-08-03 13:53:21',25,11,3),(34,'계곡카페2','2023-08-03 13:53:25',25,10,3.5),(35,'계곡카페3','2023-08-03 13:53:29',25,12,3.5),(36,'에그타르트 무한으로 먹고싶다','2023-08-03 13:53:47',25,20,4.5),(37,'너무멀어 부산에도 지점좀','2023-08-03 13:54:00',25,26,4.5),(38,'생각보다 저렴하노','2023-08-03 13:54:44',26,4,4.5),(39,'무조건 다찌에앉으세요','2023-08-03 13:55:00',26,3,5),(40,'그럭저럭','2023-08-03 13:55:11',26,18,3),(41,'ㄹㅇ','2023-08-03 13:55:22',26,25,5),(42,'개 개귀엽다2','2023-08-03 13:55:34',26,7,5),(43,'광안대교','2023-08-03 13:56:05',26,17,4),(44,'스콘좋아하면 천국일듯','2023-08-03 13:56:33',26,16,3),(45,'틀이긴하네','2023-08-03 13:56:45',26,21,4.5),(46,'틀치곤 괜찮음','2023-08-03 13:56:53',26,22,5),(47,'차없으면 시도도하지말것','2023-08-03 13:57:08',26,24,1.5),(48,'집옆에있으면 좋겠다','2023-08-03 13:57:25',26,9,5),(49,'이게 왜 김해에있노?','2023-08-03 13:57:39',26,14,5),(50,'20대는좋음','2023-08-03 13:57:48',26,13,4),(51,'뷰는 좋네','2023-08-03 13:57:59',26,8,3),(52,'힐링카페','2023-08-03 13:58:12',26,11,4),(53,'자연인살겠노','2023-08-03 13:58:24',26,10,2.5),(54,'남자끼리 오긴 좀','2023-08-03 13:58:31',26,12,2),(55,'맛있는데 너무멈','2023-08-03 13:58:48',26,23,4.5),(56,'자연커피','2023-08-03 13:59:07',26,19,4),(57,'빵은 맛있다','2023-08-03 13:59:27',26,15,4),(58,'ㄹㅇ','2023-08-03 13:59:40',26,26,5),(59,'에그타르트 마렵다','2023-08-03 13:59:55',26,20,5),(60,'난비싸던데','2023-08-03 14:00:45',27,4,3.5),(61,'비와서못봄 ㅅㄱ','2023-08-03 14:01:44',27,17,1.5),(62,'과자맛있네','2023-08-03 14:01:56',27,16,4),(63,'ㄹㅇ','2023-08-03 14:02:10',27,7,4),(64,'안유명해지면좋겠다','2023-08-03 14:02:30',27,3,5),(65,'커피라도맛있으면','2023-08-03 14:02:55',27,24,3),(66,'원두사러가야지','2023-08-03 14:03:15',27,9,5),(67,'뷰굿','2023-08-03 14:03:31',27,8,4.5),(68,'좀치네','2023-08-03 14:05:25',28,4,4.5),(69,'왜안가노','2023-08-03 14:05:41',28,3,4.5),(70,'신박하긴하노','2023-08-03 14:06:23',28,18,4.5);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_place`
--

LOCK TABLES `my_place` WRITE;
/*!40000 ALTER TABLE `my_place` DISABLE KEYS */;
INSERT INTO `my_place` VALUES (8,35.156817198905520000000000000000,129.066332555005830000000000000000,'부산광역시 부산진구 동성로71번길 35','부산 부산진구 전포동 305-6',110101010,'얼룩개','C:/upload/temp3/b829437c-22ce-4083-9168-0e31ec12b8db_alookat.png',NULL,'강배전 최고',29);
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
  `category` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `imgPath` longtext,
  `homepage` longtext,
  `placeInfo` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`placeId`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (3,35.2000536502156,129.08923386614697,'부산 동래구 충렬대로272번길 15 2층 202호','(우) 47879 (지번) 낙민동 211-5','100111011','얼룩개','../../resources/imgs/alookat.png','https://www.instagram.com/a.look.at/','부산 최고의 강배전카페. 다찌에서 사장님과의 대화는 덤.'),(4,35.15604680367208,129.0599790283397,'부산 부산진구 서전로10번길 41','(우)47292 (지번) 부전동 168-152','101010111','블랙업','../../resources/imgs/blackup.png','https://blackupcoffee.com/','서면 카페중에 드문 맛있는 카페.'),(7,35.15634542971108,129.1181559073746,'부산 수영구 광안로49번길 25-1 . 1층(광안동)','48296 광안동 153-32','111000111','노아브루어스','../../resources/imgs/noa.png','https://www.instagram.com/noah.brws/','플로랄계열 약배전이 매우 훌륭함.+ 시바견이 귀엽다.'),(8,35.145445868409396,128.88575215592024,'부산 강서구 범방4로 32 범방동,이프리오','46727 범방동 1912-2','111010101','이프리오','../../resources/imgs/ifrio.png','https://smartstore.naver.com/ifrio','명지 최고의 뷰카페. 맛은 글쎄?'),(9,35.11509029186796,128.9222352681854,'부산 강서구 새진목길 58','46717 명지동 3175-17','100101111','로스터리카페미루','../../resources/imgs/miru.png','https://www.instagram.com/miru__cafe/','커피박람회보다 원두종류가 많다. 핸드드립 한잔에 3천원? 안가고 뭐함?'),(10,35.184968833050526,128.774022626168,'경남 김해시 대청계곡길 188-35','50991 대청동 787-2','100110101','에븐','../../resources/imgs/even.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EA%B9%80%ED%95%B4+%EC%97%90%EB%B8%90','전통 한옥 인테리어의 산속 카페. 자연인 매니아라면 가보는것도.'),(11,35.18390333439262,128.77570092368308,'경남 김해시 대청계곡길 182','50991 대청동 787-18','100110000','카페킨니아','../../resources/imgs/kinnia.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%B9%B4%ED%8E%98%ED%82%A8%EB%8B%88%EC%95%84','계곡속의 정원카페. 휴양지느낌. 커피는 아메리카노뿐.'),(12,35.18474946947639,128.77038437885412,'경남 김해시 대청계곡길 234 마리봉포레','50991 대청동 535-4','100110000','마리봉포레','../../resources/imgs/mari.png','https://www.instagram.com/marybong.foret/','계곡안의 홍차 아뜰리에. 커핑보다 다도회 느낌.'),(13,35.22829301635456,128.87904342508006,'경남 김해시 가락로23번길 32','50926 봉황동 213-22','110010000','밤비공기','../../resources/imgs/bambi.png','https://www.instagram.com/bbgg.cafe','몽글몽글한 소품들로 가득체워진 밀크티 카페. 30대에겐 투머치 힙일지도?'),(14,35.22824762709288,128.87819394760675,'경남 김해시 김해대로2301번길 23','50927 봉황동 217-6','100111011','황실로스터스','../../resources/imgs/hwangsil.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%ED%99%A9%EC%8B%A4%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4','맛으로만 따지면 김해 원탑. 황실아인슈페너/라떼 안먹으면 씹손해.'),(15,35.2657851678987,128.8940229830849,'경남 김해시 인제로 433','50811 삼방동  1092-1','101010111','카페 달리아','../../resources/imgs/dalia.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%B9%B4%ED%8E%98+%EB%8B%AC%EB%A6%AC%EC%95%84','빵집보다 빵이 맛있다. 멋진 뷰는 덤'),(16,35.138101702570054,129.1129905090418,'부산 수영구 광안해변로 27-6 1층 101호','48310 남천동 558-21','110110111','일기장','../../resources/imgs/ilgijang.png','https://www.instagram.com/illgi__jang','사장님이 휘낭시에, 스콘에 진심임. 커피도 수준급'),(17,35.137491192676286,129.11260174137195,'부산 수영구 광안해변로 21 1층 마잘로스터스','48310 남천동 558-6','101010111','마잘로스터스','../../resources/imgs/majal.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EB%A7%88%EC%9E%98%EB%A1%9C%EC%8A%A4%ED%84%B0%EC%8A%A4','다쿠아즈는 맛있다. 광안대교 뷰도 맛있다.'),(18,35.19306037326107,129.09967016547034,'부산 동래구 온천천로431번길 27 1층 러셀커피','47901 안락동 633-7','100101111','러셀커피','../../resources/imgs/russell.png','https://www.instagram.com/russel_roasters_official/','수준급 핸드드립. 시그니처 스모크커피도 한번쯤은 마셔볼만.'),(19,35.3407801062437,129.1777996892255,'부산 기장군 정관읍 병산로 117','46004 용수리 382-1','101010000','브레이크인커피','../../resources/imgs/breakin.png','https://www.instagram.com/break_in_coffee','무수한 빵과 글램핑 뺨치는 산속 뷰. 커피는 기대하지 말것.'),(20,34.79567437015224,126.43064004769957,'전남 목포시 평화로 51','58748 상동 1147-7','100110000','커피창고로','../../resources/imgs/changgoro.png','https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=%EC%BB%A4%ED%94%BC%EC%B0%BD%EA%B3%A0%EB%A1%9C','딴건 모르겠고 에그타르트 100개 사놓고 먹고싶다'),(21,35.17610034741284,129.19657353392373,'부산 해운대구 송정중앙로6번길 188 4층 수월경화','48073 송정동 442-2','100110000','수월경화','../../resources/imgs/suwal.png','https://www.instagram.com/swgh_official/','한식 디저트와 전통 차 + 해운대 뷰. 한국식 카페 그자체.'),(22,35.16255593947151,129.18501358391364,'부산 해운대구 달맞이길 239-16','48115 중동 1533-9','100110000','비비비당','../../resources/imgs/bibibidang.png','https://www.bibibidang.com/','한국식 디저트와 전통차를 젊은 감성으로 표현한 한국식 카페'),(23,35.29982698204829,129.2591620051552,'부산 기장군 일광읍 칠암1길 7-10','칠암리 4','101010000','비비비당','../../resources/imgs/chilam.png','https://www.instagram.com/chilamsagye/','빵 명장 이흥용 형님의 미친 빵을 맛볼수 있는곳.'),(24,35.088090035745076,129.06089393606368,'부산 영도구 와치로51번길 2','49084 청학동 148-203','111000100','신기산업','../../resources/imgs/singi.png','https://www.instagram.com/sinkicoffee','밤에 가면 미친 야경에 커피를 즐길 수 있다. 가는길은 극혐이니 각오할것.'),(25,35.1753870604791,129.10041998850213,'부산 수영구 망미배산로76번길 11-1 가배향화','48200 망미동 884-41','100101111','가배향화','../../resources/imgs/gabe.png','https://www.instagram.com/__gabaehhcoffee__','주택가에 숨어있는 고수 사장님의 솜씨가 훌륭함. 운좋으면 융드립을 맛볼수도?'),(26,37.541019579737195,126.94906766133137,'서울 마포구 새창로2길 17','04168 도화동 179-9','110110111','프릿츠','../../resources/imgs/fritz.png','https://www.fritz.co.kr/','디저트계의 어벤저스가 만든 카페. 빵은 무조건 다 먹어봐야.');
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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (25,'a','1112','엄준식','0000-000-0000','C:/upload/temp3/69b0bb85-4add-467e-8066-cd56d3748ee8_images.png'),(26,'b','1112','김찬호','1231-232-1312','C:/upload/temp3/6c9775eb-f276-48c2-8616-345f41d412ae_icon_6.png'),(27,'c','1112','paka','123-123-1321','C:/upload/temp3/0bc06fee-4642-4a33-82b7-060e976631f7_paka.png'),(28,'d','1112','blacknut','2103-120-9321',NULL),(29,'um','1112','bongo_cat','','C:/upload/temp3/e75bda49-aa8e-4e83-bc7d-b2ce207a0e14_Bongo_Cat_Redraw.png'),(30,'assssdasd','1112','유저51',NULL,NULL),(31,'testman','1112','동탄엄준식','1231-232-1321','C:/upload/temp3/a9e1efc4-b4cf-4b1f-989c-90cb6adf220a_Bongo_Cat_Redraw.png');
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

-- Dump completed on 2023-08-13 20:53:54
