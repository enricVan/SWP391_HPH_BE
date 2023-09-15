-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hph_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hph_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hph_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `hph_db` ;

-- -----------------------------------------------------
-- Table `hph_db`.`feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`feature` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `featureId` INT NOT NULL AUTO_INCREMENT,
  `featureName` VARCHAR(50) NOT NULL,
  `url` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`featureId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`user` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `userId` INT NOT NULL AUTO_INCREMENT,
  `userName` VARCHAR(20) NOT NULL,
  `passwordHash` VARCHAR(32) NOT NULL,
  `fullName` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `gender` VARCHAR(20) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `avatarLink` TEXT NULL DEFAULT NULL,
  `status` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`manager` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `managerId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`managerId`),
  UNIQUE INDEX `userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `manager_ibfk_1`
    FOREIGN KEY (`userId`)
    REFERENCES `hph_db`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `roleId` INT NOT NULL AUTO_INCREMENT,
  `roleName` VARCHAR(20) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`roleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`role_feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role_feature` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `roleId` INT NOT NULL,
  `featureId` INT NOT NULL,
  PRIMARY KEY (`featureId`, `roleId`),
  INDEX `roleId` (`roleId` ASC) VISIBLE,
  CONSTRAINT `role_feature_ibfk_1`
    FOREIGN KEY (`featureId`)
    REFERENCES `hph_db`.`feature` (`featureId`),
  CONSTRAINT `role_feature_ibfk_2`
    FOREIGN KEY (`roleId`)
    REFERENCES `hph_db`.`role` (`roleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`student` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `studentId` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  UNIQUE INDEX `userId` (`userId` ASC) VISIBLE,
  CONSTRAINT `student_ibfk_1`
    FOREIGN KEY (`userId`)
    REFERENCES `hph_db`.`user` (`userId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`user_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`user_role` (
  `createdAt` DATETIME NULL DEFAULT NULL,
  `updateAt` DATETIME NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  `roleId` INT NOT NULL,
  PRIMARY KEY (`userId`, `roleId`),
  INDEX `roleId` (`roleId` ASC) VISIBLE,
  CONSTRAINT `user_role_ibfk_1`
    FOREIGN KEY (`userId`)
    REFERENCES `hph_db`.`user` (`userId`),
  CONSTRAINT `user_role_ibfk_2`
    FOREIGN KEY (`roleId`)
    REFERENCES `hph_db`.`role` (`roleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
