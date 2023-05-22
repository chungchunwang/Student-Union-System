-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: schoolsystest.chungchun.wang    Database: main
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `Attendance`
--

DROP TABLE IF EXISTS `Attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Attendance` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_Users_Attendance` int unsigned DEFAULT NULL,
  `Required` tinyint(1) DEFAULT NULL,
  `Status` text,
  `Excused_Absence_Request` text,
  `Points` float(8,2) DEFAULT NULL,
  `fk_Events_Attendance` int unsigned DEFAULT NULL,
  `Quarter` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_event_user_combo` (`fk_Events_Attendance`,`fk_Users_Attendance`),
  KEY `attendance_fk_users_attendance_foreign` (`fk_Users_Attendance`),
  KEY `attendance_fk_events_attendance_foreign` (`fk_Events_Attendance`),
  CONSTRAINT `attendance_fk_events_attendance_foreign` FOREIGN KEY (`fk_Events_Attendance`) REFERENCES `Events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attendance_fk_users_attendance_foreign` FOREIGN KEY (`fk_Users_Attendance`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=195 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attendance`
--

LOCK TABLES `Attendance` WRITE;
/*!40000 ALTER TABLE `Attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Attendance_User_Info`
--

DROP TABLE IF EXISTS `Attendance_User_Info`;
/*!50001 DROP VIEW IF EXISTS `Attendance_User_Info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Attendance_User_Info` AS SELECT 
 1 AS `Attendance_id`,
 1 AS `User_Chinese_First_Name`,
 1 AS `User_Chinese_Last_Name`,
 1 AS `User_English_First_Name`,
 1 AS `User_English_Last_Name`,
 1 AS `Group_Name`,
 1 AS `Group_Description`,
 1 AS `Event_Name`,
 1 AS `Event_Description`,
 1 AS `Event_Location`,
 1 AS `Event_id`,
 1 AS `Host_Chinese_First_Name`,
 1 AS `Host_Chinese_Last_Name`,
 1 AS `Host_English_First_Name`,
 1 AS `Host_English_Last_Name`,
 1 AS `Host_Email`,
 1 AS `User_Email`,
 1 AS `Attendance_Required`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Awards`
--

DROP TABLE IF EXISTS `Awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Awards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Files` text,
  `fk_Users_Awards` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `awards_fk_users_awards_foreign` (`fk_Users_Awards`),
  CONSTRAINT `awards_fk_users_awards_foreign` FOREIGN KEY (`fk_Users_Awards`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Awards`
--

LOCK TABLES `Awards` WRITE;
/*!40000 ALTER TABLE `Awards` DISABLE KEYS */;
/*!40000 ALTER TABLE `Awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Documents`
--

DROP TABLE IF EXISTS `Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Files` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Documents`
--

LOCK TABLES `Documents` WRITE;
/*!40000 ALTER TABLE `Documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Events`
--

DROP TABLE IF EXISTS `Events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Events` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Image` longtext,
  `Date` datetime DEFAULT NULL,
  `Location` text,
  `Code` text,
  `Public` tinyint(1) DEFAULT NULL,
  `Notes` text,
  `fk_Users_Events` int unsigned DEFAULT NULL,
  `Completed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_fk_users_events_foreign` (`fk_Users_Events`),
  CONSTRAINT `events_fk_users_events_foreign` FOREIGN KEY (`fk_Users_Events`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Events`
--

LOCK TABLES `Events` WRITE;
/*!40000 ALTER TABLE `Events` DISABLE KEYS */;
/*!40000 ALTER TABLE `Events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Files`
--

DROP TABLE IF EXISTS `Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_Users_Files` int unsigned DEFAULT NULL,
  `Files` longtext,
  `Name` text,
  `Description` text,
  PRIMARY KEY (`id`),
  KEY `files_fk_users_files_foreign` (`fk_Users_Files`),
  CONSTRAINT `files_fk_users_files_foreign` FOREIGN KEY (`fk_Users_Files`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Files`
--

LOCK TABLES `Files` WRITE;
/*!40000 ALTER TABLE `Files` DISABLE KEYS */;
/*!40000 ALTER TABLE `Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Files_No_Files`
--

DROP TABLE IF EXISTS `Files_No_Files`;
/*!50001 DROP VIEW IF EXISTS `Files_No_Files`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Files_No_Files` AS SELECT 
 1 AS `id`,
 1 AS `fk_Users_Files`,
 1 AS `Name`,
 1 AS `Description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Global_Variables`
--

DROP TABLE IF EXISTS `Global_Variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Global_Variables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Global_Variables`
--

LOCK TABLES `Global_Variables` WRITE;
/*!40000 ALTER TABLE `Global_Variables` DISABLE KEYS */;
INSERT INTO `Global_Variables` VALUES (1,'Quarter','Q1');
/*!40000 ALTER TABLE `Global_Variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Group_Tasks_No_File`
--

DROP TABLE IF EXISTS `Group_Tasks_No_File`;
/*!50001 DROP VIEW IF EXISTS `Group_Tasks_No_File`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Group_Tasks_No_File` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Due`,
 1 AS `Completed`,
 1 AS `Report`,
 1 AS `Points`,
 1 AS `Quarter`,
 1 AS `Comments`,
 1 AS `Groupid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Groups`
--

DROP TABLE IF EXISTS `Groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Groups` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Level` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Groups`
--

LOCK TABLES `Groups` WRITE;
/*!40000 ALTER TABLE `Groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `Groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Project_Proposals`
--

DROP TABLE IF EXISTS `Project_Proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project_Proposals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Status` text,
  `Files` longtext,
  `Quarter` text,
  `Comments` text,
  `Report` text,
  `Points` float(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project_Proposals`
--

LOCK TABLES `Project_Proposals` WRITE;
/*!40000 ALTER TABLE `Project_Proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `Project_Proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Project_Proposals_No_Files`
--

DROP TABLE IF EXISTS `Project_Proposals_No_Files`;
/*!50001 DROP VIEW IF EXISTS `Project_Proposals_No_Files`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Project_Proposals_No_Files` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Status`,
 1 AS `Quarter`,
 1 AS `Comments`,
 1 AS `Report`,
 1 AS `Points`,
 1 AS `Userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Response` text,
  `Answered` tinyint(1) DEFAULT NULL,
  `fk_Users_Questions` int unsigned DEFAULT NULL,
  `Date_Created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_fk_users_questions_foreign` (`fk_Users_Questions`),
  CONSTRAINT `questions_fk_users_questions_foreign` FOREIGN KEY (`fk_Users_Questions`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task_Repeaters`
--

DROP TABLE IF EXISTS `Task_Repeaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Task_Repeaters` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Files` longtext,
  `fk_Groups_Task Repeaters` int unsigned DEFAULT NULL,
  `Hour` text,
  `Points` float(8,2) DEFAULT NULL,
  `Days` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task repeaters_fk_groups_task repeaters_foreign` (`fk_Groups_Task Repeaters`),
  CONSTRAINT `task repeaters_fk_groups_task repeaters_foreign` FOREIGN KEY (`fk_Groups_Task Repeaters`) REFERENCES `Groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task_Repeaters`
--

LOCK TABLES `Task_Repeaters` WRITE;
/*!40000 ALTER TABLE `Task_Repeaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `Task_Repeaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Task_Repeaters_No_Files`
--

DROP TABLE IF EXISTS `Task_Repeaters_No_Files`;
/*!50001 DROP VIEW IF EXISTS `Task_Repeaters_No_Files`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Task_Repeaters_No_Files` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `fk_Groups_Task Repeaters`,
 1 AS `Hour`,
 1 AS `Points`,
 1 AS `Days`,
 1 AS `Userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Tasks`
--

DROP TABLE IF EXISTS `Tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tasks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` text,
  `Description` text,
  `Files` longtext,
  `Due` datetime DEFAULT NULL,
  `Completed` tinyint(1) DEFAULT NULL,
  `Report` text,
  `Points` float(8,2) DEFAULT NULL,
  `Quarter` text,
  `Comments` text,
  `fk_Tasks_Group` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_fk_tasks_group_foreign` (`fk_Tasks_Group`),
  CONSTRAINT `tasks_fk_tasks_group_foreign` FOREIGN KEY (`fk_Tasks_Group`) REFERENCES `Groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tasks`
--

LOCK TABLES `Tasks` WRITE;
/*!40000 ALTER TABLE `Tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Tasks_No_Files`
--

DROP TABLE IF EXISTS `Tasks_No_Files`;
/*!50001 DROP VIEW IF EXISTS `Tasks_No_Files`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Tasks_No_Files` AS SELECT 
 1 AS `id`,
 1 AS `Name`,
 1 AS `Description`,
 1 AS `Due`,
 1 AS `Completed`,
 1 AS `Report`,
 1 AS `Points`,
 1 AS `Quarter`,
 1 AS `Comments`,
 1 AS `fk_Tasks_Group`,
 1 AS `Userid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `User_Attendance_Points`
--

DROP TABLE IF EXISTS `User_Attendance_Points`;
/*!50001 DROP VIEW IF EXISTS `User_Attendance_Points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `User_Attendance_Points` AS SELECT 
 1 AS `sum(Attendance.Points)`,
 1 AS `id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `User_Event_Points`
--

DROP TABLE IF EXISTS `User_Event_Points`;
/*!50001 DROP VIEW IF EXISTS `User_Event_Points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `User_Event_Points` AS SELECT 
 1 AS `Email`,
 1 AS `Grade`,
 1 AS `Points`,
 1 AS `Attended_Events_Count`,
 1 AS `Absent_Events_Count`,
 1 AS `Pending_Events_Count`,
 1 AS `Excused_Events_Count`,
 1 AS `Not_Attended_Events_Count`,
 1 AS `Q1_Points`,
 1 AS `Q2_Points`,
 1 AS `Q3_Points`,
 1 AS `Q4_Points`,
 1 AS `Q1_Global_Rank`,
 1 AS `Q2_Global_Rank`,
 1 AS `Q3_Global_Rank`,
 1 AS `Q4_Global_Rank`,
 1 AS `Q1_Grade_Rank`,
 1 AS `Q2_Grade_Rank`,
 1 AS `Q3_Grade_Rank`,
 1 AS `Q4_Grade_Rank`,
 1 AS `Global_Rank`,
 1 AS `Grade_Rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `User_Files`
--

DROP TABLE IF EXISTS `User_Files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Files` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_User_Files_User` int unsigned DEFAULT NULL,
  `Profile_Picture` longtext,
  `Banner_Picture` longtext,
  PRIMARY KEY (`id`),
  KEY `user_files_fk_user_files_user_foreign` (`fk_User_Files_User`),
  CONSTRAINT `user_files_fk_user_files_user_foreign` FOREIGN KEY (`fk_User_Files_User`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Files`
--

LOCK TABLES `User_Files` WRITE;
/*!40000 ALTER TABLE `User_Files` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `User_Project_Proposal_Points`
--

DROP TABLE IF EXISTS `User_Project_Proposal_Points`;
/*!50001 DROP VIEW IF EXISTS `User_Project_Proposal_Points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `User_Project_Proposal_Points` AS SELECT 
 1 AS `Email`,
 1 AS `Grade`,
 1 AS `Points`,
 1 AS `Completed_Project_Proposals_Count`,
 1 AS `Uncompleted_Project_Proposals_Count`,
 1 AS `Q1_Points`,
 1 AS `Q2_Points`,
 1 AS `Q3_Points`,
 1 AS `Q4_Points`,
 1 AS `Q1_Global_Rank`,
 1 AS `Q2_Global_Rank`,
 1 AS `Q3_Global_Rank`,
 1 AS `Q4_Global_Rank`,
 1 AS `Q1_Grade_Rank`,
 1 AS `Q2_Grade_Rank`,
 1 AS `Q3_Grade_Rank`,
 1 AS `Q4_Grade_Rank`,
 1 AS `Global_Rank`,
 1 AS `Grade_Rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `User_Task_Points`
--

DROP TABLE IF EXISTS `User_Task_Points`;
/*!50001 DROP VIEW IF EXISTS `User_Task_Points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `User_Task_Points` AS SELECT 
 1 AS `Email`,
 1 AS `Grade`,
 1 AS `Points`,
 1 AS `Completed_Tasks_Count`,
 1 AS `Uncompleted_Tasks_Count`,
 1 AS `Q1_Points`,
 1 AS `Q2_Points`,
 1 AS `Q3_Points`,
 1 AS `Q4_Points`,
 1 AS `Q1_Global_Rank`,
 1 AS `Q2_Global_Rank`,
 1 AS `Q3_Global_Rank`,
 1 AS `Q4_Global_Rank`,
 1 AS `Q1_Grade_Rank`,
 1 AS `Q2_Grade_Rank`,
 1 AS `Q3_Grade_Rank`,
 1 AS `Q4_Grade_Rank`,
 1 AS `Global_Rank`,
 1 AS `Grade_Rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `User_Total_Points`
--

DROP TABLE IF EXISTS `User_Total_Points`;
/*!50001 DROP VIEW IF EXISTS `User_Total_Points`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `User_Total_Points` AS SELECT 
 1 AS `Email`,
 1 AS `Grade`,
 1 AS `Points`,
 1 AS `Q1_Points`,
 1 AS `Q2_Points`,
 1 AS `Q3_Points`,
 1 AS `Q4_Points`,
 1 AS `Q1_Global_Rank`,
 1 AS `Q2_Global_Rank`,
 1 AS `Q3_Global_Rank`,
 1 AS `Q4_Global_Rank`,
 1 AS `Q1_Grade_Rank`,
 1 AS `Q2_Grade_Rank`,
 1 AS `Q3_Grade_Rank`,
 1 AS `Q4_Grade_Rank`,
 1 AS `Global_Rank`,
 1 AS `Grade_Rank`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Email` text NOT NULL,
  `fk_Users_Group` int unsigned DEFAULT NULL,
  `English_First_Name` text,
  `English_Last_Name` text,
  `Chinese_First_Name` text,
  `Chinese_Last_Name` text,
  `About` text,
  `Grade` float(8,2) DEFAULT NULL,
  `Class` text,
  `Position` text,
  PRIMARY KEY (`id`),
  KEY `users_fk_users_group_foreign` (`fk_Users_Group`) /*!80000 INVISIBLE */,
  CONSTRAINT `users_fk_users_group_foreign` FOREIGN KEY (`fk_Users_Group`) REFERENCES `Groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `Users_Events_Attendance`
--

DROP TABLE IF EXISTS `Users_Events_Attendance`;
/*!50001 DROP VIEW IF EXISTS `Users_Events_Attendance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `Users_Events_Attendance` AS SELECT 
 1 AS `Hostid`,
 1 AS `Attendanceid`,
 1 AS `Userid`,
 1 AS `Eventid`,
 1 AS `Required`,
 1 AS `Points`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `jt_Project_Proposals_Users_Users_Project_Proposals`
--

DROP TABLE IF EXISTS `jt_Project_Proposals_Users_Users_Project_Proposals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jt_Project_Proposals_Users_Users_Project_Proposals` (
  `Project_Proposalsid` int unsigned NOT NULL,
  `Usersid` int unsigned NOT NULL,
  PRIMARY KEY (`Project_Proposalsid`,`Usersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jt_Project_Proposals_Users_Users_Project_Proposals`
--

LOCK TABLES `jt_Project_Proposals_Users_Users_Project_Proposals` WRITE;
/*!40000 ALTER TABLE `jt_Project_Proposals_Users_Users_Project_Proposals` DISABLE KEYS */;
/*!40000 ALTER TABLE `jt_Project_Proposals_Users_Users_Project_Proposals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jt_Task_Repeaters_Users_Users_Task_Repeaters`
--

DROP TABLE IF EXISTS `jt_Task_Repeaters_Users_Users_Task_Repeaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jt_Task_Repeaters_Users_Users_Task_Repeaters` (
  `Task_Repeatersid` int unsigned NOT NULL,
  `Usersid` int unsigned NOT NULL,
  PRIMARY KEY (`Task_Repeatersid`,`Usersid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jt_Task_Repeaters_Users_Users_Task_Repeaters`
--

LOCK TABLES `jt_Task_Repeaters_Users_Users_Task_Repeaters` WRITE;
/*!40000 ALTER TABLE `jt_Task_Repeaters_Users_Users_Task_Repeaters` DISABLE KEYS */;
/*!40000 ALTER TABLE `jt_Task_Repeaters_Users_Users_Task_Repeaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jt_Users_Tasks_Tasks_Users`
--

DROP TABLE IF EXISTS `jt_Users_Tasks_Tasks_Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jt_Users_Tasks_Tasks_Users` (
  `Usersid` int unsigned NOT NULL,
  `Tasksid` int unsigned NOT NULL,
  PRIMARY KEY (`Usersid`,`Tasksid`),
  KEY `jt_users_tasks_tasks_users_tasksid_foreign` (`Tasksid`),
  CONSTRAINT `jt_users_tasks_tasks_users_tasksid_foreign` FOREIGN KEY (`Tasksid`) REFERENCES `Tasks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `jt_users_tasks_tasks_users_usersid_foreign` FOREIGN KEY (`Usersid`) REFERENCES `Users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jt_Users_Tasks_Tasks_Users`
--

LOCK TABLES `jt_Users_Tasks_Tasks_Users` WRITE;
/*!40000 ALTER TABLE `jt_Users_Tasks_Tasks_Users` DISABLE KEYS */;
/*!40000 ALTER TABLE `jt_Users_Tasks_Tasks_Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Attendance_User_Info`
--

/*!50001 DROP VIEW IF EXISTS `Attendance_User_Info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Attendance_User_Info` AS select `Attendance`.`id` AS `Attendance_id`,`Users`.`Chinese_First_Name` AS `User_Chinese_First_Name`,`Users`.`Chinese_Last_Name` AS `User_Chinese_Last_Name`,`Users`.`English_First_Name` AS `User_English_First_Name`,`Users`.`English_Last_Name` AS `User_English_Last_Name`,`Groups`.`Name` AS `Group_Name`,`Groups`.`Description` AS `Group_Description`,`Events`.`Name` AS `Event_Name`,`Events`.`Description` AS `Event_Description`,`Events`.`Location` AS `Event_Location`,`Events`.`id` AS `Event_id`,`Host_User`.`Chinese_First_Name` AS `Host_Chinese_First_Name`,`Host_User`.`Chinese_Last_Name` AS `Host_Chinese_Last_Name`,`Host_User`.`English_First_Name` AS `Host_English_First_Name`,`Host_User`.`English_Last_Name` AS `Host_English_Last_Name`,`Host_User`.`Email` AS `Host_Email`,`Users`.`Email` AS `User_Email`,`Attendance`.`Required` AS `Attendance_Required` from ((((`Attendance` left join `Users` on((`Attendance`.`fk_Users_Attendance` = `Users`.`id`))) left join `Events` on((`Attendance`.`fk_Events_Attendance` = `Events`.`id`))) left join `Groups` on((`Users`.`fk_Users_Group` = `Groups`.`id`))) left join `Users` `Host_User` on((`Events`.`fk_Users_Events` = `Host_User`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Files_No_Files`
--

/*!50001 DROP VIEW IF EXISTS `Files_No_Files`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Files_No_Files` AS select `Files`.`id` AS `id`,`Files`.`fk_Users_Files` AS `fk_Users_Files`,`Files`.`Name` AS `Name`,`Files`.`Description` AS `Description` from `Files` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Group_Tasks_No_File`
--

/*!50001 DROP VIEW IF EXISTS `Group_Tasks_No_File`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Group_Tasks_No_File` AS select `Tasks`.`id` AS `id`,`Tasks`.`Name` AS `Name`,`Tasks`.`Description` AS `Description`,`Tasks`.`Due` AS `Due`,`Tasks`.`Completed` AS `Completed`,`Tasks`.`Report` AS `Report`,`Tasks`.`Points` AS `Points`,`Tasks`.`Quarter` AS `Quarter`,`Tasks`.`Comments` AS `Comments`,`Groups`.`id` AS `Groupid` from (`Tasks` left join `Groups` on((`Tasks`.`fk_Tasks_Group` = `Groups`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Project_Proposals_No_Files`
--

/*!50001 DROP VIEW IF EXISTS `Project_Proposals_No_Files`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Project_Proposals_No_Files` AS select `Project_Proposals`.`id` AS `id`,`Project_Proposals`.`Name` AS `Name`,`Project_Proposals`.`Description` AS `Description`,`Project_Proposals`.`Status` AS `Status`,`Project_Proposals`.`Quarter` AS `Quarter`,`Project_Proposals`.`Comments` AS `Comments`,`Project_Proposals`.`Report` AS `Report`,`Project_Proposals`.`Points` AS `Points`,`Users`.`id` AS `Userid` from ((`Project_Proposals` left join `jt_Project_Proposals_Users_Users_Project_Proposals` on((`Project_Proposals`.`id` = `jt_Project_Proposals_Users_Users_Project_Proposals`.`Project_Proposalsid`))) left join `Users` on((`Users`.`id` = `jt_Project_Proposals_Users_Users_Project_Proposals`.`Usersid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Task_Repeaters_No_Files`
--

/*!50001 DROP VIEW IF EXISTS `Task_Repeaters_No_Files`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Task_Repeaters_No_Files` AS select `Task_Repeaters`.`id` AS `id`,`Task_Repeaters`.`Name` AS `Name`,`Task_Repeaters`.`Description` AS `Description`,`Task_Repeaters`.`fk_Groups_Task Repeaters` AS `fk_Groups_Task Repeaters`,`Task_Repeaters`.`Hour` AS `Hour`,`Task_Repeaters`.`Points` AS `Points`,`Task_Repeaters`.`Days` AS `Days`,`Users`.`id` AS `Userid` from ((`Task_Repeaters` left join `jt_Task_Repeaters_Users_Users_Task_Repeaters` on((`Task_Repeaters`.`id` = `jt_Task_Repeaters_Users_Users_Task_Repeaters`.`Task_Repeatersid`))) left join `Users` on((`Users`.`id` = `jt_Task_Repeaters_Users_Users_Task_Repeaters`.`Usersid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Tasks_No_Files`
--

/*!50001 DROP VIEW IF EXISTS `Tasks_No_Files`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Tasks_No_Files` AS select `Tasks`.`id` AS `id`,`Tasks`.`Name` AS `Name`,`Tasks`.`Description` AS `Description`,`Tasks`.`Due` AS `Due`,`Tasks`.`Completed` AS `Completed`,`Tasks`.`Report` AS `Report`,`Tasks`.`Points` AS `Points`,`Tasks`.`Quarter` AS `Quarter`,`Tasks`.`Comments` AS `Comments`,`Tasks`.`fk_Tasks_Group` AS `fk_Tasks_Group`,`Users`.`id` AS `Userid` from ((`Tasks` left join `jt_Users_Tasks_Tasks_Users` on((`Tasks`.`id` = `jt_Users_Tasks_Tasks_Users`.`Tasksid`))) left join `Users` on((`Users`.`id` = `jt_Users_Tasks_Tasks_Users`.`Usersid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `User_Attendance_Points`
--

/*!50001 DROP VIEW IF EXISTS `User_Attendance_Points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `User_Attendance_Points` AS select sum(`Attendance`.`Points`) AS `sum(Attendance.Points)`,`Users`.`id` AS `id` from (`Users` left join `Attendance` on((`Attendance`.`fk_Users_Attendance` = `Users`.`id`))) group by `Users`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `User_Event_Points`
--

/*!50001 DROP VIEW IF EXISTS `User_Event_Points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `User_Event_Points` AS select `Users`.`Email` AS `Email`,`Users`.`Grade` AS `Grade`,sum(if((`Attendance`.`Status` = 'Attended'),`Attendance`.`Points`,0)) AS `Points`,sum(if((`Attendance`.`Status` = 'Attended'),1,0)) AS `Attended_Events_Count`,sum(if((`Attendance`.`Status` = 'Absent'),1,0)) AS `Absent_Events_Count`,sum(if((`Attendance`.`Status` = 'Pending'),1,0)) AS `Pending_Events_Count`,sum(if((`Attendance`.`Status` = 'Excused'),1,0)) AS `Excused_Events_Count`,sum(if((`Attendance`.`Status` <> 'Attended'),1,0)) AS `Not_Attended_Events_Count`,sum(if(((`Attendance`.`Quarter` = 'Q1') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) AS `Q1_Points`,sum(if(((`Attendance`.`Quarter` = 'Q2') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) AS `Q2_Points`,sum(if(((`Attendance`.`Quarter` = 'Q3') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) AS `Q3_Points`,sum(if(((`Attendance`.`Quarter` = 'Q4') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) AS `Q4_Points`,rank() OVER (ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q1') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q1_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q2') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q2_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q3') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q3_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q4') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q4_Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q1') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q1_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q2') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q2_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q3') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q3_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Attendance`.`Quarter` = 'Q4') and (`Attendance`.`Status` = 'Attended')),`Attendance`.`Points`,0)) desc )  AS `Q4_Grade_Rank`,rank() OVER (ORDER BY sum(if((`Attendance`.`Status` = 'Attended'),`Attendance`.`Points`,0)) desc )  AS `Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if((`Attendance`.`Status` = 'Attended'),`Attendance`.`Points`,0)) desc )  AS `Grade_Rank` from (`Users` left join `Attendance` on((`Users`.`id` = `Attendance`.`fk_Users_Attendance`))) group by `Users`.`Email`,`Users`.`Grade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `User_Project_Proposal_Points`
--

/*!50001 DROP VIEW IF EXISTS `User_Project_Proposal_Points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `User_Project_Proposal_Points` AS select `Users`.`Email` AS `Email`,`Users`.`Grade` AS `Grade`,sum(if((`Project_Proposals`.`Status` = 'Completed'),`Project_Proposals`.`Points`,0)) AS `Points`,sum(if((`Project_Proposals`.`Status` = 'Completed'),1,0)) AS `Completed_Project_Proposals_Count`,sum(if((`Project_Proposals`.`Status` <> 'Completed'),1,0)) AS `Uncompleted_Project_Proposals_Count`,sum(if(((`Project_Proposals`.`Quarter` = 'Q1') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) AS `Q1_Points`,sum(if(((`Project_Proposals`.`Quarter` = 'Q2') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) AS `Q2_Points`,sum(if(((`Project_Proposals`.`Quarter` = 'Q3') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) AS `Q3_Points`,sum(if(((`Project_Proposals`.`Quarter` = 'Q4') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) AS `Q4_Points`,rank() OVER (ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q1') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q1_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q2') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q2_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q3') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q3_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q4') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q4_Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q1') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q1_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q2') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q2_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q3') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q3_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Project_Proposals`.`Quarter` = 'Q4') and (`Project_Proposals`.`Status` = 'Completed')),`Project_Proposals`.`Points`,0)) desc )  AS `Q4_Grade_Rank`,rank() OVER (ORDER BY sum(if((`Project_Proposals`.`Status` = 'Completed'),`Project_Proposals`.`Points`,0)) desc )  AS `Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if((`Project_Proposals`.`Status` = 'Completed'),`Project_Proposals`.`Points`,0)) desc )  AS `Grade_Rank` from ((`Users` left join `jt_Project_Proposals_Users_Users_Project_Proposals` on((`Users`.`id` = `jt_Project_Proposals_Users_Users_Project_Proposals`.`Usersid`))) left join `Project_Proposals` on((`jt_Project_Proposals_Users_Users_Project_Proposals`.`Project_Proposalsid` = `Project_Proposals`.`id`))) group by `Users`.`Email`,`Users`.`Grade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `User_Task_Points`
--

/*!50001 DROP VIEW IF EXISTS `User_Task_Points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `User_Task_Points` AS select `Users`.`Email` AS `Email`,`Users`.`Grade` AS `Grade`,sum(if((`Tasks`.`Completed` = 1),`Tasks`.`Points`,0)) AS `Points`,sum(if((`Tasks`.`Completed` = 1),1,0)) AS `Completed_Tasks_Count`,sum(if((`Tasks`.`Completed` <> 1),1,0)) AS `Uncompleted_Tasks_Count`,sum(if(((`Tasks`.`Quarter` = 'Q1') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) AS `Q1_Points`,sum(if(((`Tasks`.`Quarter` = 'Q2') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) AS `Q2_Points`,sum(if(((`Tasks`.`Quarter` = 'Q3') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) AS `Q3_Points`,sum(if(((`Tasks`.`Quarter` = 'Q4') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) AS `Q4_Points`,rank() OVER (ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q1') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q1_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q2') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q2_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q3') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q3_Global_Rank`,rank() OVER (ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q4') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q4_Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q1') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q1_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q2') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q2_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q3') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q3_Grade_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if(((`Tasks`.`Quarter` = 'Q4') and (`Tasks`.`Completed` = 1)),`Tasks`.`Points`,0)) desc )  AS `Q4_Grade_Rank`,rank() OVER (ORDER BY sum(if((`Tasks`.`Completed` = 1),`Tasks`.`Points`,0)) desc )  AS `Global_Rank`,rank() OVER (PARTITION BY `Users`.`Grade` ORDER BY sum(if((`Tasks`.`Completed` = 1),`Tasks`.`Points`,0)) desc )  AS `Grade_Rank` from ((`Users` left join `jt_Users_Tasks_Tasks_Users` on((`Users`.`id` = `jt_Users_Tasks_Tasks_Users`.`Usersid`))) left join `Tasks` on((`jt_Users_Tasks_Tasks_Users`.`Tasksid` = `Tasks`.`id`))) group by `Users`.`Email`,`Users`.`Grade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `User_Total_Points`
--

/*!50001 DROP VIEW IF EXISTS `User_Total_Points`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `User_Total_Points` AS select `User_Project_Proposal_Points`.`Email` AS `Email`,`User_Project_Proposal_Points`.`Grade` AS `Grade`,sum(((`User_Project_Proposal_Points`.`Points` + `User_Task_Points`.`Points`) + `User_Event_Points`.`Points`)) AS `Points`,sum(((`User_Project_Proposal_Points`.`Q1_Points` + `User_Task_Points`.`Q1_Points`) + `User_Event_Points`.`Q1_Points`)) AS `Q1_Points`,sum(((`User_Project_Proposal_Points`.`Q2_Points` + `User_Task_Points`.`Q2_Points`) + `User_Event_Points`.`Q2_Points`)) AS `Q2_Points`,sum(((`User_Project_Proposal_Points`.`Q3_Points` + `User_Task_Points`.`Q3_Points`) + `User_Event_Points`.`Q3_Points`)) AS `Q3_Points`,sum(((`User_Project_Proposal_Points`.`Q4_Points` + `User_Task_Points`.`Q4_Points`) + `User_Event_Points`.`Q4_Points`)) AS `Q4_Points`,rank() OVER (ORDER BY sum(((`User_Project_Proposal_Points`.`Q1_Points` + `User_Task_Points`.`Q1_Points`) + `User_Event_Points`.`Q1_Points`)) desc )  AS `Q1_Global_Rank`,rank() OVER (ORDER BY sum(((`User_Project_Proposal_Points`.`Q2_Points` + `User_Task_Points`.`Q2_Points`) + `User_Event_Points`.`Q2_Points`)) desc )  AS `Q2_Global_Rank`,rank() OVER (ORDER BY sum(((`User_Project_Proposal_Points`.`Q3_Points` + `User_Task_Points`.`Q3_Points`) + `User_Event_Points`.`Q3_Points`)) desc )  AS `Q3_Global_Rank`,rank() OVER (ORDER BY sum(((`User_Project_Proposal_Points`.`Q4_Points` + `User_Task_Points`.`Q4_Points`) + `User_Event_Points`.`Q4_Points`)) desc )  AS `Q4_Global_Rank`,rank() OVER (PARTITION BY `User_Project_Proposal_Points`.`Grade` ORDER BY sum(((`User_Project_Proposal_Points`.`Q1_Points` + `User_Task_Points`.`Q1_Points`) + `User_Event_Points`.`Q1_Points`)) desc )  AS `Q1_Grade_Rank`,rank() OVER (PARTITION BY `User_Project_Proposal_Points`.`Grade` ORDER BY sum(((`User_Project_Proposal_Points`.`Q2_Points` + `User_Task_Points`.`Q2_Points`) + `User_Event_Points`.`Q2_Points`)) desc )  AS `Q2_Grade_Rank`,rank() OVER (PARTITION BY `User_Project_Proposal_Points`.`Grade` ORDER BY sum(((`User_Project_Proposal_Points`.`Q3_Points` + `User_Task_Points`.`Q3_Points`) + `User_Event_Points`.`Q3_Points`)) desc )  AS `Q3_Grade_Rank`,rank() OVER (PARTITION BY `User_Project_Proposal_Points`.`Grade` ORDER BY sum(((`User_Project_Proposal_Points`.`Q4_Points` + `User_Task_Points`.`Q4_Points`) + `User_Event_Points`.`Q4_Points`)) desc )  AS `Q4_Grade_Rank`,rank() OVER (ORDER BY sum(((`User_Project_Proposal_Points`.`Points` + `User_Task_Points`.`Points`) + `User_Event_Points`.`Points`)) desc )  AS `Global_Rank`,rank() OVER (PARTITION BY `User_Project_Proposal_Points`.`Grade` ORDER BY sum(((`User_Project_Proposal_Points`.`Points` + `User_Task_Points`.`Points`) + `User_Event_Points`.`Points`)) desc )  AS `Grade_Rank` from ((`User_Project_Proposal_Points` join `User_Task_Points` on((`User_Project_Proposal_Points`.`Email` = `User_Task_Points`.`Email`))) join `User_Event_Points` on((`User_Project_Proposal_Points`.`Email` = `User_Event_Points`.`Email`))) group by `User_Task_Points`.`Email`,`User_Project_Proposal_Points`.`Grade` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Users_Events_Attendance`
--

/*!50001 DROP VIEW IF EXISTS `Users_Events_Attendance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `Users_Events_Attendance` AS select `Users`.`id` AS `Hostid`,`Attendance`.`id` AS `Attendanceid`,`Attendance`.`fk_Users_Attendance` AS `Userid`,`Events`.`id` AS `Eventid`,`Attendance`.`Required` AS `Required`,`Attendance`.`Points` AS `Points` from ((`Attendance` left join `Events` on((`Events`.`id` = `Attendance`.`fk_Events_Attendance`))) left join `Users` on((`Users`.`id` = `Events`.`fk_Users_Events`))) where (`Attendance`.`Status` = 'Pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-18 10:03:35
