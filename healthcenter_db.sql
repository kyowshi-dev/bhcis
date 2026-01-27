-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: healthcenter_db
-- ------------------------------------------------------
-- Server version	8.0.44-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `child_information`
--

DROP TABLE IF EXISTS `child_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_information` (
  `information_id` int NOT NULL AUTO_INCREMENT,
  `postpartum_id` int DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `sex` enum('M','F') DEFAULT NULL,
  `birth_length` decimal(5,2) DEFAULT NULL,
  `birth_weight` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`information_id`),
  KEY `postpartum_id` (`postpartum_id`),
  CONSTRAINT `child_information_ibfk_1` FOREIGN KEY (`postpartum_id`) REFERENCES `postpartum` (`postpartum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_information`
--

LOCK TABLES `child_information` WRITE;
/*!40000 ALTER TABLE `child_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `child_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint_lookup`
--

DROP TABLE IF EXISTS `complaint_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint_lookup` (
  `chief_complaint_id` int NOT NULL AUTO_INCREMENT,
  `complaint` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chief_complaint_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint_lookup`
--

LOCK TABLES `complaint_lookup` WRITE;
/*!40000 ALTER TABLE `complaint_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `complaint_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation_record`
--

DROP TABLE IF EXISTS `consultation_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultation_record` (
  `record_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `worker_id` int DEFAULT NULL,
  `visit_type_id` int DEFAULT NULL,
  `transaction_type_id` int DEFAULT NULL,
  `date_of_consultation` date DEFAULT NULL,
  `consultation_time` time DEFAULT NULL,
  `name_of_attending_provider` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `patient_id` (`patient_id`),
  KEY `worker_id` (`worker_id`),
  KEY `visit_type_id` (`visit_type_id`),
  KEY `transaction_type_id` (`transaction_type_id`),
  CONSTRAINT `consultation_record_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `consultation_record_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `health_worker` (`worker_id`),
  CONSTRAINT `consultation_record_ibfk_3` FOREIGN KEY (`visit_type_id`) REFERENCES `nature_of_visit` (`visit_type_id`),
  CONSTRAINT `consultation_record_ibfk_4` FOREIGN KEY (`transaction_type_id`) REFERENCES `mode_of_transaction` (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation_record`
--

LOCK TABLES `consultation_record` WRITE;
/*!40000 ALTER TABLE `consultation_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultation_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_lookup`
--

DROP TABLE IF EXISTS `diagnosis_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_lookup` (
  `diagnosis_id` int NOT NULL AUTO_INCREMENT,
  `diagnosis_name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`diagnosis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_lookup`
--

LOCK TABLES `diagnosis_lookup` WRITE;
/*!40000 ALTER TABLE `diagnosis_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_record`
--

DROP TABLE IF EXISTS `diagnosis_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_record` (
  `diagnosis_record_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `worker_id` int DEFAULT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `date_diagnosed` date DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`diagnosis_record_id`),
  KEY `patient_id` (`patient_id`),
  KEY `worker_id` (`worker_id`),
  KEY `diagnosis_id` (`diagnosis_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `diagnosis_record_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `diagnosis_record_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `health_worker` (`worker_id`),
  CONSTRAINT `diagnosis_record_ibfk_3` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnosis_lookup` (`diagnosis_id`),
  CONSTRAINT `diagnosis_record_ibfk_4` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_record`
--

LOCK TABLES `diagnosis_record` WRITE;
/*!40000 ALTER TABLE `diagnosis_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `diagnosis_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gravidity_lookup`
--

DROP TABLE IF EXISTS `gravidity_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gravidity_lookup` (
  `gravidity_id` int NOT NULL AUTO_INCREMENT,
  `gravidity_label` varchar(20) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`gravidity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gravidity_lookup`
--

LOCK TABLES `gravidity_lookup` WRITE;
/*!40000 ALTER TABLE `gravidity_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `gravidity_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `health_worker`
--

DROP TABLE IF EXISTS `health_worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `health_worker` (
  `worker_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`worker_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `health_worker_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `health_worker`
--

LOCK TABLES `health_worker` WRITE;
/*!40000 ALTER TABLE `health_worker` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `household`
--

DROP TABLE IF EXISTS `household`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `household` (
  `household_id` int NOT NULL AUTO_INCREMENT,
  `family_id` varchar(50) DEFAULT NULL,
  `household_contact` varchar(50) DEFAULT NULL,
  `zone_id` int DEFAULT NULL,
  PRIMARY KEY (`household_id`),
  KEY `zone_id` (`zone_id`),
  CONSTRAINT `household_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `zone` (`zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `household`
--

LOCK TABLES `household` WRITE;
/*!40000 ALTER TABLE `household` DISABLE KEYS */;
/*!40000 ALTER TABLE `household` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immunization`
--

DROP TABLE IF EXISTS `immunization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immunization` (
  `immunization_id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int DEFAULT NULL,
  `record_id` int DEFAULT NULL,
  `vaccine_id` int DEFAULT NULL,
  `dose_number` int DEFAULT NULL,
  `date_administered` date DEFAULT NULL,
  `follow_up_date` date DEFAULT NULL,
  `remarks` text,
  PRIMARY KEY (`immunization_id`),
  KEY `patient_id` (`patient_id`),
  KEY `record_id` (`record_id`),
  KEY `vaccine_id` (`vaccine_id`),
  CONSTRAINT `immunization_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  CONSTRAINT `immunization_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`),
  CONSTRAINT `immunization_ibfk_3` FOREIGN KEY (`vaccine_id`) REFERENCES `vaccine_lookup` (`vaccine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immunization`
--

LOCK TABLES `immunization` WRITE;
/*!40000 ALTER TABLE `immunization` DISABLE KEYS */;
/*!40000 ALTER TABLE `immunization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_findings`
--

DROP TABLE IF EXISTS `laboratory_findings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory_findings` (
  `finding_id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `test_item` varchar(100) DEFAULT NULL,
  `result` varchar(100) DEFAULT NULL,
  `normal_value` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `comment` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`finding_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `laboratory_findings_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_findings`
--

LOCK TABLES `laboratory_findings` WRITE;
/*!40000 ALTER TABLE `laboratory_findings` DISABLE KEYS */;
/*!40000 ALTER TABLE `laboratory_findings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medication_treatment`
--

DROP TABLE IF EXISTS `medication_treatment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medication_treatment` (
  `treatment_id` int NOT NULL AUTO_INCREMENT,
  `medicine_id` int DEFAULT NULL,
  `dosage` varchar(50) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `additional_notes` text,
  `provider_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`),
  KEY `medicine_id` (`medicine_id`),
  CONSTRAINT `medication_treatment_ibfk_1` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medication_treatment`
--

LOCK TABLES `medication_treatment` WRITE;
/*!40000 ALTER TABLE `medication_treatment` DISABLE KEYS */;
/*!40000 ALTER TABLE `medication_treatment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicines`
--

DROP TABLE IF EXISTS `medicines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicines` (
  `medicine_id` int NOT NULL AUTO_INCREMENT,
  `medicine_name` varchar(100) DEFAULT NULL,
  `description` text,
  `expiration_date` date DEFAULT NULL,
  PRIMARY KEY (`medicine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicines`
--

LOCK TABLES `medicines` WRITE;
/*!40000 ALTER TABLE `medicines` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mode_of_transaction`
--

DROP TABLE IF EXISTS `mode_of_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mode_of_transaction` (
  `transaction_type_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`transaction_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mode_of_transaction`
--

LOCK TABLES `mode_of_transaction` WRITE;
/*!40000 ALTER TABLE `mode_of_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `mode_of_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nature_of_visit`
--

DROP TABLE IF EXISTS `nature_of_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nature_of_visit` (
  `visit_type_id` int NOT NULL AUTO_INCREMENT,
  `visit_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`visit_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nature_of_visit`
--

LOCK TABLES `nature_of_visit` WRITE;
/*!40000 ALTER TABLE `nature_of_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `nature_of_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parity_lookup`
--

DROP TABLE IF EXISTS `parity_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parity_lookup` (
  `parity_id` int NOT NULL AUTO_INCREMENT,
  `parity_label` varchar(20) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`parity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parity_lookup`
--

LOCK TABLES `parity_lookup` WRITE;
/*!40000 ALTER TABLE `parity_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `parity_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `patient_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `residential_address` text,
  `date_of_birth` date DEFAULT NULL,
  `household_id` int DEFAULT NULL,
  `patient_enrollment_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`patient_id`),
  KEY `household_id` (`household_id`),
  CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`household_id`) REFERENCES `household` (`household_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penicillin_lookup`
--

DROP TABLE IF EXISTS `penicillin_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penicillin_lookup` (
  `penicillin_id` int NOT NULL AUTO_INCREMENT,
  `penicillin_given` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`penicillin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penicillin_lookup`
--

LOCK TABLES `penicillin_lookup` WRITE;
/*!40000 ALTER TABLE `penicillin_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `penicillin_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `postpartum`
--

DROP TABLE IF EXISTS `postpartum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `postpartum` (
  `postpartum_id` int NOT NULL AUTO_INCREMENT,
  `record_id` int DEFAULT NULL,
  `prenatal_record_id` int DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` time DEFAULT NULL,
  `date_postpartum_24hrs` date DEFAULT NULL,
  `date_postpartum_1week` date DEFAULT NULL,
  `danger_signs_mother` text,
  `danger_signs_baby` text,
  `date_vitamin_a_given` date DEFAULT NULL,
  `date_iron_given` date DEFAULT NULL,
  `number_of_iron_given` int DEFAULT NULL,
  PRIMARY KEY (`postpartum_id`),
  KEY `record_id` (`record_id`),
  KEY `prenatal_record_id` (`prenatal_record_id`),
  CONSTRAINT `postpartum_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`),
  CONSTRAINT `postpartum_ibfk_2` FOREIGN KEY (`prenatal_record_id`) REFERENCES `prenatal_record` (`prenatal_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `postpartum`
--

LOCK TABLES `postpartum` WRITE;
/*!40000 ALTER TABLE `postpartum` DISABLE KEYS */;
/*!40000 ALTER TABLE `postpartum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenatal_record`
--

DROP TABLE IF EXISTS `prenatal_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prenatal_record` (
  `prenatal_record_id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `lmp` date DEFAULT NULL,
  `edc` date DEFAULT NULL,
  `aog` int DEFAULT NULL,
  `gravidity_id` int DEFAULT NULL,
  `parity_id` int DEFAULT NULL,
  `syphilis_id` int DEFAULT NULL,
  `penicillin_id` int DEFAULT NULL,
  `fetal_heart_tone` varchar(50) DEFAULT NULL,
  `fundic_height` decimal(5,2) DEFAULT NULL,
  `schedule_of_next_visit` date DEFAULT NULL,
  PRIMARY KEY (`prenatal_record_id`),
  KEY `record_id` (`record_id`),
  KEY `gravidity_id` (`gravidity_id`),
  KEY `parity_id` (`parity_id`),
  KEY `syphilis_id` (`syphilis_id`),
  KEY `penicillin_id` (`penicillin_id`),
  CONSTRAINT `prenatal_record_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`),
  CONSTRAINT `prenatal_record_ibfk_2` FOREIGN KEY (`gravidity_id`) REFERENCES `gravidity_lookup` (`gravidity_id`),
  CONSTRAINT `prenatal_record_ibfk_3` FOREIGN KEY (`parity_id`) REFERENCES `parity_lookup` (`parity_id`),
  CONSTRAINT `prenatal_record_ibfk_4` FOREIGN KEY (`syphilis_id`) REFERENCES `syphilis_lookup` (`syphilis_id`),
  CONSTRAINT `prenatal_record_ibfk_5` FOREIGN KEY (`penicillin_id`) REFERENCES `penicillin_lookup` (`penicillin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenatal_record`
--

LOCK TABLES `prenatal_record` WRITE;
/*!40000 ALTER TABLE `prenatal_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenatal_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `syphilis_lookup`
--

DROP TABLE IF EXISTS `syphilis_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `syphilis_lookup` (
  `syphilis_id` int NOT NULL AUTO_INCREMENT,
  `syphilis_result` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`syphilis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `syphilis_lookup`
--

LOCK TABLES `syphilis_lookup` WRITE;
/*!40000 ALTER TABLE `syphilis_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `syphilis_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_admin`
--

DROP TABLE IF EXISTS `system_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `system_admin_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_admin`
--

LOCK TABLES `system_admin` WRITE;
/*!40000 ALTER TABLE `system_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `system_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaccine_lookup`
--

DROP TABLE IF EXISTS `vaccine_lookup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaccine_lookup` (
  `vaccine_id` int NOT NULL AUTO_INCREMENT,
  `vaccine_name` varchar(100) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`vaccine_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaccine_lookup`
--

LOCK TABLES `vaccine_lookup` WRITE;
/*!40000 ALTER TABLE `vaccine_lookup` DISABLE KEYS */;
/*!40000 ALTER TABLE `vaccine_lookup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vitals`
--

DROP TABLE IF EXISTS `vitals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitals` (
  `vital_id` int NOT NULL AUTO_INCREMENT,
  `record_id` int NOT NULL,
  `bp` varchar(20) DEFAULT NULL,
  `weight` decimal(5,2) DEFAULT NULL,
  `height` decimal(5,2) DEFAULT NULL,
  `temperature` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`vital_id`),
  KEY `record_id` (`record_id`),
  CONSTRAINT `vitals_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `consultation_record` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitals`
--

LOCK TABLES `vitals` WRITE;
/*!40000 ALTER TABLE `vitals` DISABLE KEYS */;
/*!40000 ALTER TABLE `vitals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `zone_id` int NOT NULL AUTO_INCREMENT,
  `zone_number` varchar(20) DEFAULT NULL,
  `assigned_worker_id` int DEFAULT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `assigned_worker_id` (`assigned_worker_id`),
  CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`assigned_worker_id`) REFERENCES `health_worker` (`worker_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-27 20:48:01
