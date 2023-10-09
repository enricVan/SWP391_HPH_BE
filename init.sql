CREATE DATABASE IF NOT EXISTS `hph_db`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;
USE `hph_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hph_db
-- ------------------------------------------------------
-- Server version	8.0.34
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!50503 SET NAMES utf8 */
;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;
/*!40103 SET TIME_ZONE='+00:00' */
;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;
--
-- Table structure for table `bed`
--

DROP TABLE IF EXISTS `bed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `bed` (
    `bed_id` bigint NOT NULL AUTO_INCREMENT,
    `bed_name` varchar(20) DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `price` float DEFAULT NULL,
    `status` varchar(50) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `room_id` bigint DEFAULT NULL,
    PRIMARY KEY (`bed_id`),
    KEY `FK115cuh725wpbt8yxq2lvgg1c9` (`room_id`),
    CONSTRAINT `FK115cuh725wpbt8yxq2lvgg1c9` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 57 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `bed`
--

LOCK TABLES `bed` WRITE;
/*!40000 ALTER TABLE `bed` DISABLE KEYS */
;
INSERT INTO `bed`
VALUES (
        1,
        'A101 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        2,
        'A101 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        3,
        'A101 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        4,
        'A101 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        5,
        'A101 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        6,
        'A101 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        7,
        'A101 - Bed 7',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        8,
        'A101 - Bed 8',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        9,
        'A102 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        10,
        'A102 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        11,
        'A102 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        12,
        'A102 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        13,
        'A102 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        14,
        'A102 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        15,
        'A102 - Bed 7',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        16,
        'A102 - Bed 8',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        17,
        'B101 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        18,
        'B101 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        19,
        'B101 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        20,
        'B101 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        21,
        'B101 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        22,
        'B101 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        23,
        'B102 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        24,
        'B102 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        25,
        'B102 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        26,
        'B102 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        27,
        'B102 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        28,
        'B102 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        29,
        'C101 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        30,
        'C101 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        31,
        'C101 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        32,
        'C101 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        33,
        'C101 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        34,
        'C101 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        35,
        'C101 - Bed 7',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        36,
        'C101 - Bed 8',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        5
    ),
(
        37,
        'C102 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        38,
        'C102 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        39,
        'C102 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        40,
        'C102 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        41,
        'C102 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        42,
        'C102 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        43,
        'C102 - Bed 7',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        44,
        'C102 - Bed 8',
        '2023-10-06 22:58:05.000000',
        4200000,
        'available',
        '2023-10-06 22:58:05.000000',
        6
    ),
(
        45,
        'D101 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        46,
        'D101 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        47,
        'D101 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        48,
        'D101 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        49,
        'D101 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        50,
        'D101 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        7
    ),
(
        51,
        'D102 - Bed 1',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    ),
(
        52,
        'D102 - Bed 2',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    ),
(
        53,
        'D102 - Bed 3',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    ),
(
        54,
        'D102 - Bed 4',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    ),
(
        55,
        'D102 - Bed 5',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    ),
(
        56,
        'D102 - Bed 6',
        '2023-10-06 22:58:05.000000',
        4400000,
        'available',
        '2023-10-06 22:58:05.000000',
        8
    );
/*!40000 ALTER TABLE `bed` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `bed_request`
--

DROP TABLE IF EXISTS `bed_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `bed_request` (
    `bed_request_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `semester_id` bigint DEFAULT NULL,
    `status` varchar(20) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `bed_id` bigint DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    PRIMARY KEY (`bed_request_id`),
    KEY `FK9mh01gkerx5rc54mgtx2yc34s` (`bed_id`),
    KEY `FK61lhdae6b14pavjvwqsvcn8gj` (`student_id`),
    CONSTRAINT `FK61lhdae6b14pavjvwqsvcn8gj` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
    CONSTRAINT `FK9mh01gkerx5rc54mgtx2yc34s` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `bed_request`
--

LOCK TABLES `bed_request` WRITE;
/*!40000 ALTER TABLE `bed_request` DISABLE KEYS */
;
INSERT INTO `bed_request`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        2,
        'pending',
        '2023-10-06 22:58:05.000000',
        1,
        1
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        2,
        'approved',
        '2023-10-06 22:58:05.000000',
        2,
        1
    ),
(
        3,
        '2023-10-06 22:58:05.000000',
        3,
        'denied',
        '2023-10-06 22:58:05.000000',
        3,
        1
    );
/*!40000 ALTER TABLE `bed_request` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `faq` (
    `faq_id` bigint NOT NULL AUTO_INCREMENT,
    `content` text,
    `created_at` datetime(6) DEFAULT NULL,
    `sub_title` text,
    `title` text,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`faq_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */
;
INSERT INTO `faq`
VALUES (
        1,
        'FAQ Content 1',
        '2023-10-06 22:58:05.000000',
        'FAQ Subtitle 1',
        'FAQ Title 1',
        '2023-10-06 22:58:05.000000'
    ),
(
        2,
        'FAQ Content 2',
        '2023-10-06 22:58:05.000000',
        'FAQ Subtitle 2',
        'FAQ Title 2',
        '2023-10-06 22:58:05.000000'
    ),
(
        3,
        'FAQ Content 3',
        '2023-10-06 22:58:05.000000',
        'FAQ Subtitle 3',
        'FAQ Title 3',
        '2023-10-06 22:58:05.000000'
    );
/*!40000 ALTER TABLE `faq` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `feature` (
    `feature_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `feature_name` varchar(50) NOT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `url` varchar(300) NOT NULL,
    PRIMARY KEY (`feature_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */
;
INSERT INTO `feature`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        'Feature 1',
        '2023-10-06 22:58:05.000000',
        'URL 1'
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        'Feature 2',
        '2023-10-06 22:58:05.000000',
        'URL 2'
    ),
(
        3,
        '2023-10-06 22:58:05.000000',
        'Feature 3',
        '2023-10-06 22:58:05.000000',
        'URL 3'
    );
/*!40000 ALTER TABLE `feature` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `manager` (
    `manager_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `description` varchar(200) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    PRIMARY KEY (`manager_id`),
    UNIQUE KEY `UK_4vbgsjl6mcxrqyvts0hlilhob` (`user_id`),
    CONSTRAINT `FKlydl1hgqhi0ogywnwwfxh3bqe` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */
;
INSERT INTO `manager`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        'Manager 1 Description',
        '2023-10-06 22:58:05.000000',
        1
    );
/*!40000 ALTER TABLE `manager` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `news` (
    `news_id` bigint NOT NULL AUTO_INCREMENT,
    `category` varchar(50) DEFAULT NULL,
    `content` text,
    `created_at` datetime(6) DEFAULT NULL,
    `image` text,
    `title` varchar(255) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `manager_id` bigint NOT NULL,
    PRIMARY KEY (`news_id`),
    KEY `FKb3wmgkbeu1pqf74xk944s333h` (`manager_id`),
    CONSTRAINT `FKb3wmgkbeu1pqf74xk944s333h` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 17 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */
;
INSERT INTO `news`
VALUES (
        1,
        'Notice',
        'News Content 1',
        '2023-10-06 22:58:05.000000',
        'Image URL 1',
        'Renewal of dormitory registration for Fall 2023 term',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        2,
        'Tips',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'MANUAL FOR PREVENTION OF DENGUE FEVER EPIDEMIC',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        3,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'POWER LOSS ON August 6, 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        4,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'DECISION 139/QD-CTGDFPT DATED DECEMBER 20, 2022 ON THE ISSUANCE OF FINANCIAL REGULATIONS FOR SCHOOL YEAR 2023-2024 FOR STUDENTS OF TRAINING SYSTEMS UNDER THE FPT EDUCATION SYSTEM',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        5,
        'Notice',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'REGISTRATION/CANCELLATION OF KTX FALL 2023 Dormitory Rooms',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        6,
        'Notice',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'Regarding the second spraying of mosquito and insecticides to prevent epidemics in 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        7,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'CUT WATER TO CLEAN STORAGE TANKS',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        8,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        '[Important]ANNOUNCEMENT REGARDING CHANGE IN TIME FOR NEW REGISTRATION IN KY SU23 Dormitory Room',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        9,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'REGISTRATION/CANCELLATION OF SUMMER 2023 Dormitory',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        10,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'Dormitory air conditioning maintenance schedule for phase 1 of 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        11,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'Plan to receive dormitory registration at Hoa Lac campus from Fall 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        12,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        '1st SPRAYING OF MOSQUITOES AND INSECTS TO PREVENT DISEASES IN 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        13,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'Dormitory air conditioning maintenance schedule, phase 1 of 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        14,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'Dormitory air conditioning maintenance schedule, phase 2 of 2023',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        15,
        'Announcement',
        'News Content 2',
        '2023-10-06 22:58:05.000000',
        'Image URL 2',
        'New Dorm Buiding Open',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        16,
        'Tip',
        'Where to go when having missing items',
        '2023-10-06 22:58:05.000000',
        'Image URL 3',
        'News Title 3',
        '2023-10-06 22:58:05.000000',
        1
    );
/*!40000 ALTER TABLE `news` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `role` (
    `role_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `description` varchar(200) DEFAULT NULL,
    `role_name` varchar(255) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */
;
INSERT INTO `role`
VALUES (1, NULL, NULL, 'ADMIN', NULL),
(2, NULL, NULL, 'STUDENT', NULL),
(3, NULL, NULL, 'MANAGER', NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `role_feature`
--

DROP TABLE IF EXISTS `role_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `role_feature` (
    `role_feature_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `feature_id` bigint DEFAULT NULL,
    `role_id` bigint DEFAULT NULL,
    PRIMARY KEY (`role_feature_id`),
    KEY `FK602jkws28uc62gtuyokf4ke07` (`feature_id`),
    KEY `FKkvt34970jxowf984hrm3loqlg` (`role_id`),
    CONSTRAINT `FK602jkws28uc62gtuyokf4ke07` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`),
    CONSTRAINT `FKkvt34970jxowf984hrm3loqlg` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `role_feature`
--

LOCK TABLES `role_feature` WRITE;
/*!40000 ALTER TABLE `role_feature` DISABLE KEYS */
;
INSERT INTO `role_feature`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        '2023-10-06 22:58:05.000000',
        1,
        1
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        '2023-10-06 22:58:05.000000',
        2,
        2
    ),
(
        3,
        '2023-10-06 22:58:05.000000',
        '2023-10-06 22:58:05.000000',
        3,
        3
    );
/*!40000 ALTER TABLE `role_feature` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `room` (
    `room_id` bigint NOT NULL AUTO_INCREMENT,
    `belong_dom` varchar(20) DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `floor` bigint DEFAULT NULL,
    `room_name` varchar(20) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `room_type_id` bigint DEFAULT NULL,
    PRIMARY KEY (`room_id`),
    UNIQUE KEY `UK_2tklvare2e5touoeqsdgdsdgm` (`room_name`),
    KEY `FKd468eq7j1cbue8mk20qfrj5et` (`room_type_id`),
    CONSTRAINT `FKd468eq7j1cbue8mk20qfrj5et` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */
;
INSERT INTO `room`
VALUES (
        1,
        'A',
        '2023-10-06 22:58:05.000000',
        1,
        'A101',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        2,
        'A',
        '2023-10-06 22:58:05.000000',
        1,
        'A102',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        3,
        'B',
        '2023-10-06 22:58:05.000000',
        1,
        'B101',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        4,
        'B',
        '2023-10-06 22:58:05.000000',
        1,
        'B102',
        '2023-10-06 22:58:05.000000',
        4
    ),
(
        5,
        'C',
        '2023-10-06 22:58:05.000000',
        1,
        'C101',
        '2023-10-06 22:58:05.000000',
        1
    ),
(
        6,
        'C',
        '2023-10-06 22:58:05.000000',
        1,
        'C102',
        '2023-10-06 22:58:05.000000',
        2
    ),
(
        7,
        'D',
        '2023-10-06 22:58:05.000000',
        1,
        'D101',
        '2023-10-06 22:58:05.000000',
        3
    ),
(
        8,
        'D',
        '2023-10-06 22:58:05.000000',
        1,
        'D102',
        '2023-10-06 22:58:05.000000',
        4
    );
/*!40000 ALTER TABLE `room` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `room_type` (
    `room_type_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `room_type_name` varchar(20) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`room_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */
;
INSERT INTO `room_type`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        '8 male',
        '2023-10-06 22:58:05.000000'
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        '8 female',
        '2023-10-06 22:58:05.000000'
    ),
(
        3,
        '2023-10-06 22:58:05.000000',
        '6 male',
        '2023-10-06 22:58:05.000000'
    ),
(
        4,
        '2023-10-06 22:58:05.000000',
        '6 female',
        '2023-10-06 22:58:05.000000'
    );
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `semester` (
    `semester_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `end_date` date DEFAULT NULL,
    `semester_name` varchar(255) DEFAULT NULL,
    `start_date` date DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`semester_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */
;
INSERT INTO `semester`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        '2023-05-06',
        'Spring23',
        '2023-01-02',
        '2023-10-06 22:58:05.000000'
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        '2023-09-02',
        'Summer23',
        '2023-05-08',
        '2023-10-06 22:58:05.000000'
    ),
(
        3,
        '2023-10-06 22:58:05.000000',
        '2023-12-23',
        'Fall23',
        '2023-09-04',
        '2023-10-06 22:58:05.000000'
    ),
(
        4,
        '2023-10-06 22:58:05.000000',
        '2024-05-08',
        'Spring24',
        '2024-01-04',
        '2023-10-06 22:58:05.000000'
    ),
(
        5,
        '2023-10-06 22:58:05.000000',
        '2024-09-04',
        'Summer24',
        '2024-05-11',
        '2023-10-06 22:58:05.000000'
    );
/*!40000 ALTER TABLE `semester` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `student` (
    `student_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `description` varchar(200) DEFAULT NULL,
    `parent_name` varchar(100) NOT NULL,
    `roll_number` varchar(8) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_id` int NOT NULL,
    PRIMARY KEY (`student_id`),
    UNIQUE KEY `UK_bkix9btnoi1n917ll7bplkvg5` (`user_id`),
    UNIQUE KEY `UK_o1g1spw0ecyidv94ka2dk88wf` (`roll_number`),
    CONSTRAINT `FKl0k3f11t4o6e28f8aw8bkd31s` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */
;
INSERT INTO `student`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        'Description 1',
        'Parent 1',
        'HE173334',
        '2023-10-06 22:58:05.000000',
        2
    );
/*!40000 ALTER TABLE `student` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `student_request`
--

DROP TABLE IF EXISTS `student_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `student_request` (
    `request_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `request_content` text,
    `status` varchar(255) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    `student_request_type_id` bigint DEFAULT NULL,
    PRIMARY KEY (`request_id`),
    KEY `FKlpxdaeqgtjh5gmqqksl59565n` (`student_id`),
    KEY `FK1pvk2ipjpcwsxgvpqrqrc5r5h` (`student_request_type_id`),
    CONSTRAINT `FK1pvk2ipjpcwsxgvpqrqrc5r5h` FOREIGN KEY (`student_request_type_id`) REFERENCES `student_request_type` (`student_request_type_id`),
    CONSTRAINT `FKlpxdaeqgtjh5gmqqksl59565n` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `student_request`
--

LOCK TABLES `student_request` WRITE;
/*!40000 ALTER TABLE `student_request` DISABLE KEYS */
;
INSERT INTO `student_request`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        'Skill issues',
        'pending',
        '2023-10-06 22:58:05.000000',
        1,
        1
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        'Fix devices',
        'approved',
        '2023-10-06 22:58:05.000000',
        1,
        2
    );
/*!40000 ALTER TABLE `student_request` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `student_request_type`
--

DROP TABLE IF EXISTS `student_request_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `student_request_type` (
    `student_request_type_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `student_request_type_name` varchar(300) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`student_request_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `student_request_type`
--

LOCK TABLES `student_request_type` WRITE;
/*!40000 ALTER TABLE `student_request_type` DISABLE KEYS */
;
INSERT INTO `student_request_type`
VALUES (
        1,
        '2023-10-06 22:58:05.000000',
        'Skill issues',
        '2023-10-06 22:58:05.000000'
    ),
(
        2,
        '2023-10-06 22:58:05.000000',
        'Fix devices',
        '2023-10-06 22:58:05.000000'
    );
/*!40000 ALTER TABLE `student_request_type` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `token` (
    `id` int NOT NULL AUTO_INCREMENT,
    `expired` bit(1) NOT NULL,
    `revoked` bit(1) NOT NULL,
    `token` varchar(255) DEFAULT NULL,
    `token_type` enum('BEARER') DEFAULT NULL,
    `user_id` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
    KEY `FKl10xjn274m2rkxo54knt2xqvy` (`user_id`),
    CONSTRAINT `FKl10xjn274m2rkxo54knt2xqvy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 16 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */
;
INSERT INTO `token`
VALUES (
        1,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjYwNzg3OCwiZXhwIjoxNjk2Njk0Mjc4fQ.WjxhZaavqdDhzvPyEzHJ0hzfvxvJNRHllrO34-XLogc',
        'BEARER',
        1
    ),
(
        2,
        _binary '\0',
        _binary '\0',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHVkZW50IiwiaWF0IjoxNjk2NjA3ODc4LCJleHAiOjE2OTY2OTQyNzh9.iDW7i-FROOAMIly970XrJnOmqNXjA0ejdtNtDGZsZI8',
        'BEARER',
        2
    ),
(
        3,
        _binary '\0',
        _binary '\0',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJtYW5hZ2VyIiwiaWF0IjoxNjk2NjA3ODc4LCJleHAiOjE2OTY2OTQyNzh9.9M1H-NnJR3kVPTNzK5NRk7JaOBzb9VU3cSREd_H9prY',
        'BEARER',
        3
    ),
(
        4,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjYwODc1NCwiZXhwIjoxNjk2Njk1MTU0fQ.8NuGi-mu8CxaGlgcqYJEYXFUL2mB0OeMmp8Wp7a_oxI',
        'BEARER',
        1
    ),
(
        5,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjYwODc3OSwiZXhwIjoxNjk2Njk1MTc5fQ.BZXOgXepa4Zjx19U4vFjIoqrWIrtucRLMROHXaeMPZE',
        'BEARER',
        1
    ),
(
        6,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY2OTM0MiwiZXhwIjoxNjk2NzU1NzQyfQ.MZiDSeNXQw-lArMABSt6x109fq5S9gFiCJIceldETZQ',
        'BEARER',
        1
    ),
(
        7,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY2OTM5OSwiZXhwIjoxNjk2NzU1Nzk5fQ.4K6K4Kxu4JkNCxy4ZmNgDix6FE2Y8UWGjh7L9Gq71Es',
        'BEARER',
        1
    ),
(
        8,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3Mzc3MCwiZXhwIjoxNjk2NzYwMTcwfQ.3mR7DU-32E_J8YTHYmluPfxwgtgguNj7WSrtzrSmXtc',
        'BEARER',
        1
    ),
(
        9,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NDU1MiwiZXhwIjoxNjk2NzYwOTUyfQ.drzRw2HEJlwLyTe0qvQQLs7zczqNj3MW8gEOQgc9VJE',
        'BEARER',
        1
    ),
(
        10,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NDYyMywiZXhwIjoxNjk2NzYxMDIzfQ.4NJK7xr2kkBJPoLAD4GxmMbz6UyvYdpiUN85MKwmNkc',
        'BEARER',
        1
    ),
(
        11,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NDY1MiwiZXhwIjoxNjk2NzYxMDUyfQ.oBECUui2s1YWp1wSM0L6qzniLfa2bJLBxFkzqI0RTIQ',
        'BEARER',
        1
    ),
(
        12,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NTA4OSwiZXhwIjoxNjk2NzYxNDg5fQ.CobYk_OrqK_YGyOa1HPc2BFhdNRjuxYnbPL0SuMTMLk',
        'BEARER',
        1
    ),
(
        13,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NTM0NiwiZXhwIjoxNjk2NzYxNzQ2fQ.7t8jDlifxTCBHm_SVYNPTsyStnx3C-L04QK-8STduKc',
        'BEARER',
        1
    ),
(
        14,
        _binary '',
        _binary '',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NTQwMiwiZXhwIjoxNjk2NzYxODAyfQ.ch2SFvShqv4HG90jbrqy0syarBPEiQP7PeXbQA3hWQ4',
        'BEARER',
        1
    ),
(
        15,
        _binary '\0',
        _binary '\0',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NjY3NTYwNywiZXhwIjoxNjk2NzYyMDA3fQ.hGTxnXprDzR-C0J5Fx6tAljxOYQR1uR8QqP00Mwo2tE',
        'BEARER',
        1
    );
/*!40000 ALTER TABLE `token` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `user` (
    `id` int NOT NULL AUTO_INCREMENT,
    `address` varchar(100) DEFAULT NULL,
    `avatar_image` varchar(300) DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `date_of_birth` date DEFAULT NULL,
    `email` varchar(100) DEFAULT NULL,
    `full_name` varchar(100) DEFAULT NULL,
    `gender` varchar(20) DEFAULT NULL,
    `password` varchar(255) NOT NULL,
    `phone` varchar(20) DEFAULT NULL,
    `status` varchar(50) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `username` varchar(20) NOT NULL,
    `role_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
    KEY `FKdl9dqp078pc03g6kdnxmnlqpc` (`role_id`),
    CONSTRAINT `FKdl9dqp078pc03g6kdnxmnlqpc` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */
;
INSERT INTO `user`
VALUES (
        1,
        NULL,
        NULL,
        '2023-10-06 22:57:57.982000',
        NULL,
        NULL,
        NULL,
        NULL,
        '$2a$10$bSNwWJXhfX/tsfRGc1.Fcu4BWVAxqqANVMjbOADaKJ2q2nftw464O',
        NULL,
        'inactive',
        '2023-10-06 22:57:57.982000',
        'admin',
        1
    ),
(
        2,
        NULL,
        NULL,
        '2023-10-06 22:57:58.083000',
        NULL,
        NULL,
        NULL,
        NULL,
        '$2a$10$83sAWeZKYPP23wI4iutszOMCt/9QY4XNtJ8YDlK5ljY9XZ1UPz5ly',
        NULL,
        'inactive',
        '2023-10-06 22:57:58.083000',
        'student',
        2
    ),
(
        3,
        NULL,
        NULL,
        '2023-10-06 22:57:58.167000',
        NULL,
        NULL,
        NULL,
        NULL,
        '$2a$10$srqHtkT.WV7kTSpFyLzpt.qdVXPnulxuojWouxtBoAolrRBBF6Bpa',
        NULL,
        'inactive',
        '2023-10-06 22:57:58.167000',
        'manager',
        3
    ),
(
        4,
        'Admin Address',
        'admin.jpg',
        '2023-10-06 22:58:05.000000',
        NULL,
        'admin@example.com',
        'Admin User',
        'Male',
        'admin',
        '1234567890',
        'active',
        '2023-10-06 22:58:05.000000',
        'admin1',
        1
    ),
(
        5,
        'Student Address 1',
        'student1.jpg',
        '2023-10-06 22:58:05.000000',
        NULL,
        'student1@example.com',
        'Student User 1',
        'Female',
        'hashed_password_2',
        '9876543210',
        'active',
        '2023-10-06 22:58:05.000000',
        'student1',
        2
    ),
(
        6,
        'Student Address 2',
        'student2.jpg',
        '2023-10-06 22:58:05.000000',
        NULL,
        'student2@example.com',
        'Student User 2',
        'Male',
        'hashed_password_3',
        '5555555555',
        'inactive',
        '2023-10-06 22:58:05.000000',
        'student2',
        2
    ),
(
        7,
        'Student Address 3',
        'student3.jpg',
        '2023-10-06 22:58:05.000000',
        NULL,
        'student3@example.com',
        'Student User 3',
        'Male',
        'hashed_password_4',
        '5555555555',
        'active',
        '2023-10-06 22:58:05.000000',
        'student3',
        2
    );
/*!40000 ALTER TABLE `user` ENABLE KEYS */
;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;
-- Dump completed on 2023-10-08 20:13:16