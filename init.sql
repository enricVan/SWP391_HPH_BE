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
-- Table `hph_db`.`room_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`room_type` (
                                                    `room_type_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `room_type_name` VARCHAR(20) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`room_type_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 5
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`room` (
                                               `room_id` BIGINT NOT NULL AUTO_INCREMENT,
                                               `belong_dom` VARCHAR(20) NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `floor` BIGINT NULL DEFAULT NULL,
    `room_name` VARCHAR(20) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `room_type_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`room_id`),
    UNIQUE INDEX `UK_2tklvare2e5touoeqsdgdsdgm` (`room_name` ASC) VISIBLE,
    INDEX `FKd468eq7j1cbue8mk20qfrj5et` (`room_type_id` ASC) VISIBLE,
    CONSTRAINT `FKd468eq7j1cbue8mk20qfrj5et`
    FOREIGN KEY (`room_type_id`)
    REFERENCES `hph_db`.`room_type` (`room_type_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 9
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`bed` (
                                              `bed_id` BIGINT NOT NULL AUTO_INCREMENT,
                                              `bed_name` VARCHAR(20) NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `price` FLOAT NULL DEFAULT NULL,
    `status` VARCHAR(50) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `room_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`bed_id`),
    INDEX `FK115cuh725wpbt8yxq2lvgg1c9` (`room_id` ASC) VISIBLE,
    CONSTRAINT `FK115cuh725wpbt8yxq2lvgg1c9`
    FOREIGN KEY (`room_id`)
    REFERENCES `hph_db`.`room` (`room_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 57
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role` (
                                               `role_id` BIGINT NOT NULL AUTO_INCREMENT,
                                               `created_at` DATETIME(6) NULL DEFAULT NULL,
    `description` VARCHAR(200) NULL DEFAULT NULL,
    `role_name` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`role_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`user` (
                                               `id` INT NOT NULL AUTO_INCREMENT,
                                               `address` VARCHAR(100) NULL DEFAULT NULL,
    `avatar_image` VARCHAR(300) NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `date_of_birth` DATE NULL DEFAULT NULL,
    `email` VARCHAR(100) NULL DEFAULT NULL,
    `full_name` VARCHAR(100) NULL DEFAULT NULL,
    `gender` VARCHAR(20) NULL DEFAULT NULL,
    `password` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(20) NULL DEFAULT NULL,
    `status` VARCHAR(50) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `username` VARCHAR(20) NOT NULL,
    `role_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username` ASC) VISIBLE,
    INDEX `FKdl9dqp078pc03g6kdnxmnlqpc` (`role_id` ASC) VISIBLE,
    CONSTRAINT `FKdl9dqp078pc03g6kdnxmnlqpc`
    FOREIGN KEY (`role_id`)
    REFERENCES `hph_db`.`role` (`role_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 8
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`student` (
                                                  `student_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                  `created_at` DATETIME(6) NULL DEFAULT NULL,
    `description` VARCHAR(200) NULL DEFAULT NULL,
    `parent_name` VARCHAR(100) NOT NULL,
    `roll_number` VARCHAR(8) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `user_id` INT NOT NULL,
    PRIMARY KEY (`student_id`),
    UNIQUE INDEX `UK_bkix9btnoi1n917ll7bplkvg5` (`user_id` ASC) VISIBLE,
    UNIQUE INDEX `UK_o1g1spw0ecyidv94ka2dk88wf` (`roll_number` ASC) VISIBLE,
    CONSTRAINT `FKl0k3f11t4o6e28f8aw8bkd31s`
    FOREIGN KEY (`user_id`)
    REFERENCES `hph_db`.`user` (`id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 2
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`bed_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`bed_request` (
                                                      `bed_request_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                      `created_at` DATETIME(6) NULL DEFAULT NULL,
    `semester_id` BIGINT NULL DEFAULT NULL,
    `status` VARCHAR(20) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `bed_id` BIGINT NULL DEFAULT NULL,
    `student_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`bed_request_id`),
    INDEX `FK9mh01gkerx5rc54mgtx2yc34s` (`bed_id` ASC) VISIBLE,
    INDEX `FK61lhdae6b14pavjvwqsvcn8gj` (`student_id` ASC) VISIBLE,
    CONSTRAINT `FK61lhdae6b14pavjvwqsvcn8gj`
    FOREIGN KEY (`student_id`)
    REFERENCES `hph_db`.`student` (`student_id`),
    CONSTRAINT `FK9mh01gkerx5rc54mgtx2yc34s`
    FOREIGN KEY (`bed_id`)
    REFERENCES `hph_db`.`bed` (`bed_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`faq`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`faq` (
                                              `faq_id` BIGINT NOT NULL AUTO_INCREMENT,
                                              `content` TEXT NULL DEFAULT NULL,
                                              `created_at` DATETIME(6) NULL DEFAULT NULL,
    `sub_title` TEXT NULL DEFAULT NULL,
    `title` TEXT NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`faq_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`feature` (
                                                  `feature_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                  `created_at` DATETIME(6) NULL DEFAULT NULL,
    `feature_name` VARCHAR(50) NOT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `url` VARCHAR(300) NOT NULL,
    PRIMARY KEY (`feature_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`manager` (
                                                  `manager_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                  `created_at` DATETIME(6) NULL DEFAULT NULL,
    `description` VARCHAR(200) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `user_id` INT NULL DEFAULT NULL,
    PRIMARY KEY (`manager_id`),
    UNIQUE INDEX `UK_4vbgsjl6mcxrqyvts0hlilhob` (`user_id` ASC) VISIBLE,
    CONSTRAINT `FKlydl1hgqhi0ogywnwwfxh3bqe`
    FOREIGN KEY (`user_id`)
    REFERENCES `hph_db`.`user` (`id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 2
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`news` (
                                               `news_id` BIGINT NOT NULL AUTO_INCREMENT,
                                               `category` VARCHAR(50) NULL DEFAULT NULL,
    `content` TEXT NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `image` TEXT NULL DEFAULT NULL,
    `title` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `manager_id` BIGINT NOT NULL,
    PRIMARY KEY (`news_id`),
    INDEX `FKb3wmgkbeu1pqf74xk944s333h` (`manager_id` ASC) VISIBLE,
    CONSTRAINT `FKb3wmgkbeu1pqf74xk944s333h`
    FOREIGN KEY (`manager_id`)
    REFERENCES `hph_db`.`manager` (`manager_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 17
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`role_feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role_feature` (
                                                       `role_feature_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `created_at` DATETIME(6) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `feature_id` BIGINT NULL DEFAULT NULL,
    `role_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`role_feature_id`),
    INDEX `FK602jkws28uc62gtuyokf4ke07` (`feature_id` ASC) VISIBLE,
    INDEX `FKkvt34970jxowf984hrm3loqlg` (`role_id` ASC) VISIBLE,
    CONSTRAINT `FK602jkws28uc62gtuyokf4ke07`
    FOREIGN KEY (`feature_id`)
    REFERENCES `hph_db`.`feature` (`feature_id`),
    CONSTRAINT `FKkvt34970jxowf984hrm3loqlg`
    FOREIGN KEY (`role_id`)
    REFERENCES `hph_db`.`role` (`role_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 4
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`semester` (
                                                   `semester_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                   `created_at` DATETIME(6) NULL DEFAULT NULL,
    `end_date` DATE NULL DEFAULT NULL,
    `semester_name` VARCHAR(255) NULL DEFAULT NULL,
    `start_date` DATE NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`semester_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 6
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`student_request_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`student_request_type` (
                                                               `student_request_type_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                               `created_at` DATETIME(6) NULL DEFAULT NULL,
    `student_request_type_name` VARCHAR(300) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`student_request_type_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 3
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`student_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`student_request` (
                                                          `request_id` BIGINT NOT NULL AUTO_INCREMENT,
                                                          `created_at` DATETIME(6) NULL DEFAULT NULL,
    `request_content` TEXT NULL DEFAULT NULL,
    `status` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `student_id` BIGINT NULL DEFAULT NULL,
    `student_request_type_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`request_id`),
    INDEX `FKlpxdaeqgtjh5gmqqksl59565n` (`student_id` ASC) VISIBLE,
    INDEX `FK1pvk2ipjpcwsxgvpqrqrc5r5h` (`student_request_type_id` ASC) VISIBLE,
    CONSTRAINT `FK1pvk2ipjpcwsxgvpqrqrc5r5h`
    FOREIGN KEY (`student_request_type_id`)
    REFERENCES `hph_db`.`student_request_type` (`student_request_type_id`),
    CONSTRAINT `FKlpxdaeqgtjh5gmqqksl59565n`
    FOREIGN KEY (`student_id`)
    REFERENCES `hph_db`.`student` (`student_id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 3
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hph_db`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`token` (
                                                `id` INT NOT NULL AUTO_INCREMENT,
                                                `expired` BIT(1) NOT NULL,
    `revoked` BIT(1) NOT NULL,
    `token` VARCHAR(255) NULL DEFAULT NULL,
    `token_type` ENUM('BEARER') NULL DEFAULT NULL,
    `user_id` INT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_pddrhgwxnms2aceeku9s2ewy5` (`token` ASC) VISIBLE,
    INDEX `FKl10xjn274m2rkxo54knt2xqvy` (`user_id` ASC) VISIBLE,
    CONSTRAINT `FKl10xjn274m2rkxo54knt2xqvy`
    FOREIGN KEY (`user_id`)
    REFERENCES `hph_db`.`user` (`id`))
    ENGINE = InnoDB
    AUTO_INCREMENT = 16
    DEFAULT CHARACTER SET = utf8mb4
    COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
