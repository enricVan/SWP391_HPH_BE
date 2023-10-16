CREATE DATABASE IF NOT EXISTS `hph_db`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;
USE `hph_db`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hph_db
-- ------------------------------------------------------
-- Server version	8.1.0
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
    `status` varchar(50) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `room_id` bigint DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    PRIMARY KEY (`bed_id`),
    UNIQUE KEY `UK_ll08rt0pbj1eh4j2yrarod0lm` (`student_id`),
    KEY `FK115cuh725wpbt8yxq2lvgg1c9` (`room_id`),
    CONSTRAINT `FK115cuh725wpbt8yxq2lvgg1c9` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
    CONSTRAINT `FKawvg73odc61efa14yxmosiyn4` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        'Bed A1',
        '2023-10-16 00:31:08.000000',
        'Occupied',
        '2023-10-16 00:31:08.000000',
        1,
        1
    ),
    (
        2,
        'Bed B2',
        '2023-10-16 00:31:08.000000',
        'Vacant',
        '2023-10-16 00:31:08.000000',
        2,
        2
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
    `status` varchar(20) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `bed_id` bigint DEFAULT NULL,
    `semester_id` bigint DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    PRIMARY KEY (`bed_request_id`),
    KEY `FK9mh01gkerx5rc54mgtx2yc34s` (`bed_id`),
    KEY `FKftatpe9cprf80cgwnctmm5u3b` (`semester_id`),
    KEY `FK61lhdae6b14pavjvwqsvcn8gj` (`student_id`),
    CONSTRAINT `FK61lhdae6b14pavjvwqsvcn8gj` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
    CONSTRAINT `FK9mh01gkerx5rc54mgtx2yc34s` FOREIGN KEY (`bed_id`) REFERENCES `bed` (`bed_id`),
    CONSTRAINT `FKftatpe9cprf80cgwnctmm5u3b` FOREIGN KEY (`semester_id`) REFERENCES `semester` (`semester_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        'Approved',
        '2023-10-16 00:31:08.000000',
        1,
        1,
        1
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Pending',
        '2023-10-16 00:31:08.000000',
        2,
        2,
        2
    );
/*!40000 ALTER TABLE `bed_request` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `building` (
    `building_id` bigint NOT NULL AUTO_INCREMENT,
    `building_name` varchar(255) DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`building_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */
;
INSERT INTO `building`
VALUES (
        1,
        'Building A',
        '2023-10-16 00:31:08.000000',
        '2023-10-16 00:31:08.000000'
    ),
    (
        2,
        'Building B',
        '2023-10-16 00:31:08.000000',
        '2023-10-16 00:31:08.000000'
    );
/*!40000 ALTER TABLE `building` ENABLE KEYS */
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
    `created_by_user_id` bigint DEFAULT NULL,
    PRIMARY KEY (`faq_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        'Content for FAQ 1',
        '2023-10-16 00:31:08.000000',
        'Subtitle 1',
        'FAQ 1',
        '2023-10-16 00:31:08.000000',
        NULL
    ),
    (
        2,
        'Content for FAQ 2',
        '2023-10-16 00:31:08.000000',
        'Subtitle 2',
        'FAQ 2',
        '2023-10-16 00:31:08.000000',
        NULL
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        'Feature 1',
        '2023-10-16 00:31:08.000000',
        '/feature1'
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Feature 2',
        '2023-10-16 00:31:08.000000',
        '/feature2'
    );
/*!40000 ALTER TABLE `feature` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `guard`
--

DROP TABLE IF EXISTS `guard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `guard` (
    `guard_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `user_id` bigint NOT NULL,
    PRIMARY KEY (`guard_id`),
    UNIQUE KEY `UK_ba18xfcy947lw9jwau3c6rk1a` (`user_id`),
    CONSTRAINT `FKqj1yw92acn37p8kxqp0g4gmih` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `guard`
--

LOCK TABLES `guard` WRITE;
/*!40000 ALTER TABLE `guard` DISABLE KEYS */
;
INSERT INTO `guard`
VALUES (
        1,
        '2023-10-16 00:31:08.000000',
        '2023-10-16 00:31:08.000000',
        4
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        '2023-10-16 00:31:08.000000',
        5
    );
/*!40000 ALTER TABLE `guard` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `guard_shift`
--

DROP TABLE IF EXISTS `guard_shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `guard_shift` (
    `guard_shift_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `end_date_time` datetime(6) DEFAULT NULL,
    `slot` int DEFAULT NULL,
    `start_date_time` datetime(6) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `building` bigint DEFAULT NULL,
    `guard_id` bigint DEFAULT NULL,
    `assign_by_manager_id` bigint DEFAULT NULL,
    PRIMARY KEY (`guard_shift_id`),
    KEY `FK23owyj9tii82s86hgoh6tqxhy` (`building`),
    KEY `FKiyq74gy7yxgwsl71e6lr718xt` (`guard_id`),
    KEY `FKgtxd6knd5j2r2fsxg1pcuqmxo` (`assign_by_manager_id`),
    CONSTRAINT `FK23owyj9tii82s86hgoh6tqxhy` FOREIGN KEY (`building`) REFERENCES `building` (`building_id`),
    CONSTRAINT `FKgtxd6knd5j2r2fsxg1pcuqmxo` FOREIGN KEY (`assign_by_manager_id`) REFERENCES `manager` (`manager_id`),
    CONSTRAINT `FKiyq74gy7yxgwsl71e6lr718xt` FOREIGN KEY (`guard_id`) REFERENCES `guard` (`guard_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `guard_shift`
--

LOCK TABLES `guard_shift` WRITE;
/*!40000 ALTER TABLE `guard_shift` DISABLE KEYS */
;
INSERT INTO `guard_shift`
VALUES (
        1,
        '2023-10-16 00:31:08.000000',
        '2023-10-16 16:00:00.000000',
        1,
        '2023-10-16 08:00:00.000000',
        '2023-10-16 00:31:08.000000',
        1,
        1,
        1
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        '2023-10-17 16:00:00.000000',
        1,
        '2023-10-17 08:00:00.000000',
        '2023-10-16 00:31:08.000000',
        2,
        2,
        2
    );
/*!40000 ALTER TABLE `guard_shift` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `maintenance_report`
--

DROP TABLE IF EXISTS `maintenance_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `maintenance_report` (
    `maintenance_report_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `note` text,
    `status` varchar(50) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `receive_by_manager_id` bigint DEFAULT NULL,
    `room_id` bigint DEFAULT NULL,
    `created_by_student_id` bigint DEFAULT NULL,
    PRIMARY KEY (`maintenance_report_id`),
    KEY `FKo16g9078dh78tsydvuehtirj6` (`receive_by_manager_id`),
    KEY `FKqmqakl4v5n54foe07cm9cea49` (`room_id`),
    KEY `FKio88r83dkal1wf5iinej4stll` (`created_by_student_id`),
    CONSTRAINT `FKio88r83dkal1wf5iinej4stll` FOREIGN KEY (`created_by_student_id`) REFERENCES `student` (`student_id`),
    CONSTRAINT `FKo16g9078dh78tsydvuehtirj6` FOREIGN KEY (`receive_by_manager_id`) REFERENCES `manager` (`manager_id`),
    CONSTRAINT `FKqmqakl4v5n54foe07cm9cea49` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `maintenance_report`
--

LOCK TABLES `maintenance_report` WRITE;
/*!40000 ALTER TABLE `maintenance_report` DISABLE KEYS */
;
INSERT INTO `maintenance_report`
VALUES (
        1,
        '2023-10-16 00:31:08.000000',
        'Maintenance issue in Room 101',
        'Pending',
        '2023-10-16 00:31:08.000000',
        1,
        1,
        1
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Broken window in Room 201',
        'Resolved',
        '2023-10-16 00:31:08.000000',
        2,
        2,
        2
    );
/*!40000 ALTER TABLE `maintenance_report` ENABLE KEYS */
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
    `user_id` bigint DEFAULT NULL,
    PRIMARY KEY (`manager_id`),
    UNIQUE KEY `UK_4vbgsjl6mcxrqyvts0hlilhob` (`user_id`),
    CONSTRAINT `FKlydl1hgqhi0ogywnwwfxh3bqe` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        'Manager 1',
        '2023-10-16 00:31:08.000000',
        6
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Manager 2',
        '2023-10-16 00:31:08.000000',
        7
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        'Announcement',
        'Important announcement...',
        '2023-10-16 00:31:08.000000',
        NULL,
        'News 1',
        '2023-10-16 00:31:08.000000',
        1
    ),
    (
        2,
        'Event',
        'Upcoming event details...',
        '2023-10-16 00:31:08.000000',
        NULL,
        'News 2',
        '2023-10-16 00:31:08.000000',
        2
    );
/*!40000 ALTER TABLE `news` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `payment` (
    `payment_id` bigint NOT NULL AUTO_INCREMENT,
    `amount` double DEFAULT NULL,
    `created_at` datetime(6) DEFAULT NULL,
    `status` varchar(255) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `bed_request_id` bigint NOT NULL,
    `checked_by_manager_id` bigint NOT NULL,
    `student_id` bigint NOT NULL,
    PRIMARY KEY (`payment_id`),
    UNIQUE KEY `UK_6jd4oa8467p4k5nedh6uxm0ey` (`bed_request_id`),
    KEY `FKlgi22d9smuknidkpy77grwvhr` (`checked_by_manager_id`),
    KEY `FKq0mpbhvyrwyggk1gwjams69wf` (`student_id`),
    CONSTRAINT `FKi5hitqdbcf7vxw7a242tjgays` FOREIGN KEY (`bed_request_id`) REFERENCES `bed_request` (`bed_request_id`),
    CONSTRAINT `FKlgi22d9smuknidkpy77grwvhr` FOREIGN KEY (`checked_by_manager_id`) REFERENCES `manager` (`manager_id`),
    CONSTRAINT `FKq0mpbhvyrwyggk1gwjams69wf` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */
;
INSERT INTO `payment`
VALUES (
        1,
        500,
        '2023-10-16 00:31:08.000000',
        'Paid',
        '2023-10-16 00:31:08.000000',
        1,
        1,
        1
    ),
    (
        2,
        600,
        '2023-10-16 00:31:08.000000',
        'Pending',
        '2023-10-16 00:31:08.000000',
        2,
        2,
        2
    );
/*!40000 ALTER TABLE `payment` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `penalty_ticket`
--

DROP TABLE IF EXISTS `penalty_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `penalty_ticket` (
    `penalty_ticket_id` bigint NOT NULL AUTO_INCREMENT,
    `content` text,
    `created_at` datetime(6) DEFAULT NULL,
    `status` varchar(255) DEFAULT NULL,
    `title` varchar(255) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `created_by_guard_id` bigint NOT NULL,
    `student_id` bigint NOT NULL,
    PRIMARY KEY (`penalty_ticket_id`),
    KEY `FK1ux9jtat8x5h0ojx9mrnhadeu` (`created_by_guard_id`),
    KEY `FK9u6fhq9uske5o1mt127nvu4d2` (`student_id`),
    CONSTRAINT `FK1ux9jtat8x5h0ojx9mrnhadeu` FOREIGN KEY (`created_by_guard_id`) REFERENCES `guard` (`guard_id`),
    CONSTRAINT `FK9u6fhq9uske5o1mt127nvu4d2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `penalty_ticket`
--

LOCK TABLES `penalty_ticket` WRITE;
/*!40000 ALTER TABLE `penalty_ticket` DISABLE KEYS */
;
INSERT INTO `penalty_ticket`
VALUES (
        1,
        'Excessive noise in Room 101',
        '2023-10-16 00:31:09.000000',
        'Pending',
        'Noise Complaint',
        '2023-10-16 00:31:09.000000',
        1,
        1
    ),
    (
        2,
        'Room 201 violation report',
        '2023-10-16 00:31:09.000000',
        'Resolved',
        'Violation Report',
        '2023-10-16 00:31:09.000000',
        2,
        2
    );
/*!40000 ALTER TABLE `penalty_ticket` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `request_application`
--

DROP TABLE IF EXISTS `request_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `request_application` (
    `request_application_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `request_content` text,
    `status` varchar(255) DEFAULT NULL,
    `text_response` text,
    `updated_at` datetime(6) DEFAULT NULL,
    `take_by_manager_id` bigint DEFAULT NULL,
    `request_application_type_id` bigint DEFAULT NULL,
    `student_id` bigint DEFAULT NULL,
    PRIMARY KEY (`request_application_id`),
    KEY `FKnybjnakovu6ouc27fdg4cxaqv` (`take_by_manager_id`),
    KEY `FK84sbiaiy31c7u8k4iw1vcuk9m` (`request_application_type_id`),
    KEY `FK47l9s3lnc3mapt1m9j93508uq` (`student_id`),
    CONSTRAINT `FK47l9s3lnc3mapt1m9j93508uq` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
    CONSTRAINT `FK84sbiaiy31c7u8k4iw1vcuk9m` FOREIGN KEY (`request_application_type_id`) REFERENCES `request_application_type` (`request_application_type_id`),
    CONSTRAINT `FKnybjnakovu6ouc27fdg4cxaqv` FOREIGN KEY (`take_by_manager_id`) REFERENCES `manager` (`manager_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `request_application`
--

LOCK TABLES `request_application` WRITE;
/*!40000 ALTER TABLE `request_application` DISABLE KEYS */
;
INSERT INTO `request_application`
VALUES (
        1,
        '2023-10-16 00:31:09.000000',
        'Request for vacation leave',
        'Pending',
        NULL,
        '2023-10-16 00:31:09.000000',
        1,
        1,
        1
    ),
    (
        2,
        '2023-10-16 00:31:09.000000',
        'Noise Complaint',
        'Resolved',
        'Resolved the noise issue',
        '2023-10-16 00:31:09.000000',
        2,
        2,
        2
    );
/*!40000 ALTER TABLE `request_application` ENABLE KEYS */
;
UNLOCK TABLES;
--
-- Table structure for table `request_application_type`
--

DROP TABLE IF EXISTS `request_application_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */
;
/*!50503 SET character_set_client = utf8mb4 */
;
CREATE TABLE `request_application_type` (
    `request_application_type_id` bigint NOT NULL AUTO_INCREMENT,
    `created_at` datetime(6) DEFAULT NULL,
    `request_application_type_name` varchar(300) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`request_application_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `request_application_type`
--

LOCK TABLES `request_application_type` WRITE;
/*!40000 ALTER TABLE `request_application_type` DISABLE KEYS */
;
INSERT INTO `request_application_type`
VALUES (
        1,
        '2023-10-16 00:31:09.000000',
        'Leave Request',
        '2023-10-16 00:31:09.000000'
    ),
    (
        2,
        '2023-10-16 00:31:09.000000',
        'Complaint',
        '2023-10-16 00:31:09.000000'
    );
/*!40000 ALTER TABLE `request_application_type` ENABLE KEYS */
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */
;
INSERT INTO `role`
VALUES (
        1,
        '2023-10-16 00:31:08.000000',
        'Admin role',
        'ADMIN',
        '2023-10-16 00:31:08.000000'
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Student role',
        'STUDENT',
        '2023-10-16 00:31:08.000000'
    ),
    (
        3,
        '2023-10-16 00:31:08.000000',
        'Manager role',
        'MANAGER',
        '2023-10-16 00:31:08.000000'
    ),
    (
        4,
        '2023-10-16 00:31:08.000000',
        'GUARD ROLE',
        'GUARD',
        '2023-10-16 00:31:08.000000'
    );
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
    `role_id` bigint NOT NULL,
    `feature_id` bigint NOT NULL,
    KEY `FK602jkws28uc62gtuyokf4ke07` (`feature_id`),
    KEY `FKdvn8a8caf8ckyjtdl4rc3x0tb` (`role_id`),
    CONSTRAINT `FK602jkws28uc62gtuyokf4ke07` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`feature_id`),
    CONSTRAINT `FKdvn8a8caf8ckyjtdl4rc3x0tb` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */
;
--
-- Dumping data for table `role_feature`
--

LOCK TABLES `role_feature` WRITE;
/*!40000 ALTER TABLE `role_feature` DISABLE KEYS */
;
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
    `created_at` datetime(6) DEFAULT NULL,
    `floor` bigint DEFAULT NULL,
    `room_name` varchar(20) DEFAULT NULL,
    `room_price` float DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    `building_id` bigint DEFAULT NULL,
    `room_type_id` bigint DEFAULT NULL,
    PRIMARY KEY (`room_id`),
    UNIQUE KEY `UK_2tklvare2e5touoeqsdgdsdgm` (`room_name`),
    KEY `FK4kmfw73x2vpfymk0ml875rh2q` (`building_id`),
    KEY `FKd468eq7j1cbue8mk20qfrj5et` (`room_type_id`),
    CONSTRAINT `FK4kmfw73x2vpfymk0ml875rh2q` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`),
    CONSTRAINT `FKd468eq7j1cbue8mk20qfrj5et` FOREIGN KEY (`room_type_id`) REFERENCES `room_type` (`room_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        1,
        '101',
        500,
        '2023-10-16 00:31:08.000000',
        1,
        1
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        2,
        '201',
        600,
        '2023-10-16 00:31:08.000000',
        2,
        2
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
    `room_type_description` varchar(255) DEFAULT NULL,
    `room_type_name` varchar(20) DEFAULT NULL,
    `updated_at` datetime(6) DEFAULT NULL,
    PRIMARY KEY (`room_type_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        'Single Room',
        'Single',
        '2023-10-16 00:31:08.000000'
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        'Double Room',
        'Double',
        '2023-10-16 00:31:08.000000'
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
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        '2023-12-31',
        'Fall 2023',
        '2023-09-01',
        '2023-10-16 00:31:08.000000'
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        '2024-05-31',
        'Spring 2024',
        '2024-01-01',
        '2023-10-16 00:31:08.000000'
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
    `user_id` bigint NOT NULL,
    PRIMARY KEY (`student_id`),
    UNIQUE KEY `UK_bkix9btnoi1n917ll7bplkvg5` (`user_id`),
    UNIQUE KEY `UK_o1g1spw0ecyidv94ka2dk88wf` (`roll_number`),
    CONSTRAINT `FKl0k3f11t4o6e28f8aw8bkd31s` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        NULL,
        'Jane Doe',
        '12345678',
        '2023-10-16 00:31:08.000000',
        2
    ),
    (
        2,
        '2023-10-16 00:31:08.000000',
        NULL,
        'Jane Smith',
        '87654321',
        '2023-10-16 00:31:08.000000',
        3
    );
/*!40000 ALTER TABLE `student` ENABLE KEYS */
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
    `user_id` bigint DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
    KEY `FKl10xjn274m2rkxo54knt2xqvy` (`user_id`),
    CONSTRAINT `FKl10xjn274m2rkxo54knt2xqvy` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NzQxNjMyMSwiZXhwIjoxNjk3NTAyNzIxfQ.2ffDkPz7goKBJGscCXj3_zXxgI3ytIXefwZ5WM-a4Z0',
        'BEARER',
        1
    ),
    (
        2,
        _binary '\0',
        _binary '\0',
        'eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY5NzQxNjQ3NSwiZXhwIjoxNjk3NTAyODc1fQ.4sOgKT8Z11ScvqY-uJPgnsTtORuL_1PyklIrxZfJOaU',
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
    `id` bigint NOT NULL AUTO_INCREMENT,
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
    KEY `FKcg8vm2yga4tm8kvsid9aqkt55` (`role_id`),
    CONSTRAINT `FKcg8vm2yga4tm8kvsid9aqkt55` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
        '2023-10-16 00:31:08.000000',
        NULL,
        'haikn2@fpt.com',
        'HaiKN',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'admin',
        1
    ),
    (
        2,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'john@example.com',
        'John Doe',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'student1',
        2
    ),
    (
        3,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'AliceSmith@example.com',
        'Alice Smith',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'student2',
        2
    ),
    (
        4,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'LoiCock@example.com',
        'Loi Cock',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'guard1',
        3
    ),
    (
        5,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'TimCock@example.com',
        'Tim Cock',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'guard2',
        3
    ),
    (
        6,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'LoiCock@example.com',
        'Tom Nguyen',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'manager1',
        4
    ),
    (
        7,
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        NULL,
        'TimCock@example.com',
        'Jerry Pham',
        NULL,
        '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',
        NULL,
        NULL,
        '2023-10-16 00:31:08.000000',
        'manager2',
        4
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
-- Dump completed on 2023-10-16  7:36:13