-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dormitory_management
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dormitory_management
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dormitory_management` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dormitory_management` ;

-- -----------------------------------------------------
-- Table `dormitory_management`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(20) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Feature` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `url` VARCHAR(100) NULL DEFAULT NULL,
  `tableName` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Authen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Authen` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleId` INT NULL DEFAULT NULL,
  `featureId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roleId` (`roleId` ASC) VISIBLE,
  INDEX `featureId` (`featureId` ASC) VISIBLE,
  CONSTRAINT `Authen_ibfk_1`
    FOREIGN KEY (`roleId`)
    REFERENCES `dormitory_management`.`Role` (`id`),
  CONSTRAINT `Authen_ibfk_2`
    FOREIGN KEY (`featureId`)
    REFERENCES `dormitory_management`.`Feature` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`RoomType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`RoomType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roomTypeName` VARCHAR(100) NULL DEFAULT NULL,
  `bedPrice` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `type` (`type` ASC) VISIBLE,
  CONSTRAINT `Room_ibfk_1`
    FOREIGN KEY (`type`)
    REFERENCES `dormitory_management`.`RoomType` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Bed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roomId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roomId` (`roomId` ASC) VISIBLE,
  CONSTRAINT `Bed_ibfk_1`
    FOREIGN KEY (`roomId`)
    REFERENCES `dormitory_management`.`Room` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `fullname` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  `phone` VARCHAR(10) NULL DEFAULT NULL,
  `address` VARCHAR(200) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `major` VARCHAR(100) NULL DEFAULT NULL,
  `enrollmentYear` INT NULL DEFAULT NULL,
  `role` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `Student_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `dormitory_management`.`User` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`BedRequest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`BedRequest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `studentId` INT NULL DEFAULT NULL,
  `bedId` INT NULL DEFAULT NULL,
  `status` ENUM('pending', 'approve', 'reject') NULL DEFAULT 'pending',
  PRIMARY KEY (`id`),
  INDEX `studentId` (`studentId` ASC) VISIBLE,
  INDEX `bedId` (`bedId` ASC) VISIBLE,
  CONSTRAINT `BedRequest_ibfk_1`
    FOREIGN KEY (`studentId`)
    REFERENCES `dormitory_management`.`Student` (`id`),
  CONSTRAINT `BedRequest_ibfk_2`
    FOREIGN KEY (`bedId`)
    REFERENCES `dormitory_management`.`Bed` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`BedPayment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`BedPayment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `bedRequestId` INT NULL DEFAULT NULL,
  `fromDate` DATE NULL DEFAULT NULL,
  `toDate` DATE NULL DEFAULT NULL,
  `amount` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `bedRequestId` (`bedRequestId` ASC) VISIBLE,
  CONSTRAINT `BedPayment_ibfk_1`
    FOREIGN KEY (`bedRequestId`)
    REFERENCES `dormitory_management`.`BedRequest` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`BillingType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`BillingType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `billTypeName` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Billing` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `studentId` INT NULL DEFAULT NULL,
  `type` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `studentId` (`studentId` ASC) VISIBLE,
  INDEX `type` (`type` ASC) VISIBLE,
  CONSTRAINT `Billing_ibfk_1`
    FOREIGN KEY (`studentId`)
    REFERENCES `dormitory_management`.`Student` (`id`),
  CONSTRAINT `Billing_ibfk_2`
    FOREIGN KEY (`type`)
    REFERENCES `dormitory_management`.`BillingType` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Device`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Device` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL DEFAULT NULL,
  `roomTypeId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roomTypeId` (`roomTypeId` ASC) VISIBLE,
  CONSTRAINT `Device_ibfk_1`
    FOREIGN KEY (`roomTypeId`)
    REFERENCES `dormitory_management`.`RoomType` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`DeviceStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`DeviceStatus` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `deviceId` INT NULL DEFAULT NULL,
  `roomId` INT NULL DEFAULT NULL,
  `effective` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `deviceId` (`deviceId` ASC) VISIBLE,
  INDEX `roomId` (`roomId` ASC) VISIBLE,
  CONSTRAINT `DeviceStatus_ibfk_1`
    FOREIGN KEY (`deviceId`)
    REFERENCES `dormitory_management`.`Device` (`id`),
  CONSTRAINT `DeviceStatus_ibfk_2`
    FOREIGN KEY (`roomId`)
    REFERENCES `dormitory_management`.`Room` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Help`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Help` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`LogType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`LogType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Log` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` INT NULL DEFAULT NULL,
  `createdBy` INT NULL DEFAULT NULL,
  `targetTable` VARCHAR(100) NULL DEFAULT NULL,
  `targetId` INT NULL DEFAULT NULL,
  `time` TIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `type` (`type` ASC) VISIBLE,
  INDEX `createdBy` (`createdBy` ASC) VISIBLE,
  CONSTRAINT `Log_ibfk_1`
    FOREIGN KEY (`type`)
    REFERENCES `dormitory_management`.`LogType` (`id`),
  CONSTRAINT `Log_ibfk_2`
    FOREIGN KEY (`createdBy`)
    REFERENCES `dormitory_management`.`User` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`News`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`News` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`ReportType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`ReportType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `reportTypeName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` INT NULL DEFAULT NULL,
  `studentId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `type` (`type` ASC) VISIBLE,
  INDEX `studentId` (`studentId` ASC) VISIBLE,
  CONSTRAINT `Report_ibfk_1`
    FOREIGN KEY (`type`)
    REFERENCES `dormitory_management`.`ReportType` (`id`),
  CONSTRAINT `Report_ibfk_2`
    FOREIGN KEY (`studentId`)
    REFERENCES `dormitory_management`.`Student` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Rule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Rule` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ruleName` VARCHAR(100) CHARACTER SET 'utf8mb3' NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Staff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `roleId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `roleId` (`roleId` ASC) VISIBLE,
  CONSTRAINT `Staff_ibfk_1`
    FOREIGN KEY (`id`)
    REFERENCES `dormitory_management`.`User` (`id`),
  CONSTRAINT `Staff_ibfk_2`
    FOREIGN KEY (`roleId`)
    REFERENCES `dormitory_management`.`Role` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dormitory_management`.`Task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dormitory_management`.`Task` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `staffId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `staffId` (`staffId` ASC) VISIBLE,
  CONSTRAINT `Task_ibfk_1`
    FOREIGN KEY (`staffId`)
    REFERENCES `dormitory_management`.`Staff` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
