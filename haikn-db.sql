-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS,
    UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS,
    FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE,
    SQL_MODE = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hph_db
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hph_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hph_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `hph_db`;
-- -----------------------------------------------------
-- Table `hph_db`.`building`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`building` (
    `building_id` BIGINT NOT NULL AUTO_INCREMENT,
    `building_name` VARCHAR(255) NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`building_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`room_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`room_type` (
    `room_type_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `room_type_description` VARCHAR(255) NULL DEFAULT NULL,
    `room_type_name` VARCHAR(20) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`room_type_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`room` (
    `room_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `floor` BIGINT NULL DEFAULT NULL,
    `room_name` VARCHAR(20) NULL DEFAULT NULL,
    `room_price` FLOAT NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `building_id` BIGINT NULL DEFAULT NULL,
    `room_type_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`room_id`),
    UNIQUE INDEX `UK_2tklvare2e5touoeqsdgdsdgm` (`room_name` ASC) VISIBLE,
    INDEX `FK4kmfw73x2vpfymk0ml875rh2q` (`building_id` ASC) VISIBLE,
    INDEX `FKd468eq7j1cbue8mk20qfrj5et` (`room_type_id` ASC) VISIBLE,
    CONSTRAINT `FK4kmfw73x2vpfymk0ml875rh2q` FOREIGN KEY (`building_id`) REFERENCES `hph_db`.`building` (`building_id`),
    CONSTRAINT `FKd468eq7j1cbue8mk20qfrj5et` FOREIGN KEY (`room_type_id`) REFERENCES `hph_db`.`room_type` (`room_type_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role` (
    `role_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `description` VARCHAR(200) NULL DEFAULT NULL,
    `role_name` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`role_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT,
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
    INDEX `FKcg8vm2yga4tm8kvsid9aqkt55` (`role_id` ASC) VISIBLE,
    CONSTRAINT `FKcg8vm2yga4tm8kvsid9aqkt55` FOREIGN KEY (`role_id`) REFERENCES `hph_db`.`role` (`role_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY (`student_id`),
    UNIQUE INDEX `UK_bkix9btnoi1n917ll7bplkvg5` (`user_id` ASC) VISIBLE,
    UNIQUE INDEX `UK_o1g1spw0ecyidv94ka2dk88wf` (`roll_number` ASC) VISIBLE,
    CONSTRAINT `FKl0k3f11t4o6e28f8aw8bkd31s` FOREIGN KEY (`user_id`) REFERENCES `hph_db`.`user` (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`bed`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`bed` (
    `bed_id` BIGINT NOT NULL AUTO_INCREMENT,
    `bed_name` VARCHAR(20) NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `status` VARCHAR(50) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `room_id` BIGINT NULL DEFAULT NULL,
    `student_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`bed_id`),
    UNIQUE INDEX `UK_ll08rt0pbj1eh4j2yrarod0lm` (`student_id` ASC) VISIBLE,
    INDEX `FK115cuh725wpbt8yxq2lvgg1c9` (`room_id` ASC) VISIBLE,
    CONSTRAINT `FK115cuh725wpbt8yxq2lvgg1c9` FOREIGN KEY (`room_id`) REFERENCES `hph_db`.`room` (`room_id`),
    CONSTRAINT `FKawvg73odc61efa14yxmosiyn4` FOREIGN KEY (`student_id`) REFERENCES `hph_db`.`student` (`student_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
    PRIMARY KEY (`semester_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`bed_request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`bed_request` (
    `bed_request_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `status` VARCHAR(20) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `bed_id` BIGINT NULL DEFAULT NULL,
    `semester_id` BIGINT NULL DEFAULT NULL,
    `student_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`bed_request_id`),
    INDEX `FK9mh01gkerx5rc54mgtx2yc34s` (`bed_id` ASC) VISIBLE,
    INDEX `FKftatpe9cprf80cgwnctmm5u3b` (`semester_id` ASC) VISIBLE,
    INDEX `FK61lhdae6b14pavjvwqsvcn8gj` (`student_id` ASC) VISIBLE,
    CONSTRAINT `FK61lhdae6b14pavjvwqsvcn8gj` FOREIGN KEY (`student_id`) REFERENCES `hph_db`.`student` (`student_id`),
    CONSTRAINT `FK9mh01gkerx5rc54mgtx2yc34s` FOREIGN KEY (`bed_id`) REFERENCES `hph_db`.`bed` (`bed_id`),
    CONSTRAINT `FKftatpe9cprf80cgwnctmm5u3b` FOREIGN KEY (`semester_id`) REFERENCES `hph_db`.`semester` (`semester_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
    `created_by_user_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`faq_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`feature` (
    `feature_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `feature_name` VARCHAR(50) NOT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `url` VARCHAR(300) NOT NULL,
    PRIMARY KEY (`feature_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`guard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`guard` (
    `guard_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `user_id` BIGINT NOT NULL,
    PRIMARY KEY (`guard_id`),
    UNIQUE INDEX `UK_ba18xfcy947lw9jwau3c6rk1a` (`user_id` ASC) VISIBLE,
    CONSTRAINT `FKqj1yw92acn37p8kxqp0g4gmih` FOREIGN KEY (`user_id`) REFERENCES `hph_db`.`user` (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`manager`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`manager` (
    `manager_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `description` VARCHAR(200) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `user_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`manager_id`),
    UNIQUE INDEX `UK_4vbgsjl6mcxrqyvts0hlilhob` (`user_id` ASC) VISIBLE,
    CONSTRAINT `FKlydl1hgqhi0ogywnwwfxh3bqe` FOREIGN KEY (`user_id`) REFERENCES `hph_db`.`user` (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`guard_shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`guard_shift` (
    `guard_shift_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `end_date_time` DATETIME(6) NULL DEFAULT NULL,
    `slot` INT NULL DEFAULT NULL,
    `start_date_time` DATETIME(6) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `building` BIGINT NULL DEFAULT NULL,
    `guard_id` BIGINT NULL DEFAULT NULL,
    `assign_by_manager_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`guard_shift_id`),
    INDEX `FK23owyj9tii82s86hgoh6tqxhy` (`building` ASC) VISIBLE,
    INDEX `FKiyq74gy7yxgwsl71e6lr718xt` (`guard_id` ASC) VISIBLE,
    INDEX `FKgtxd6knd5j2r2fsxg1pcuqmxo` (`assign_by_manager_id` ASC) VISIBLE,
    CONSTRAINT `FK23owyj9tii82s86hgoh6tqxhy` FOREIGN KEY (`building`) REFERENCES `hph_db`.`building` (`building_id`),
    CONSTRAINT `FKgtxd6knd5j2r2fsxg1pcuqmxo` FOREIGN KEY (`assign_by_manager_id`) REFERENCES `hph_db`.`manager` (`manager_id`),
    CONSTRAINT `FKiyq74gy7yxgwsl71e6lr718xt` FOREIGN KEY (`guard_id`) REFERENCES `hph_db`.`guard` (`guard_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`maintenance_report`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`maintenance_report` (
    `maintenance_report_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `note` TEXT NULL DEFAULT NULL,
    `status` VARCHAR(50) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `receive_by_manager_id` BIGINT NULL DEFAULT NULL,
    `room_id` BIGINT NULL DEFAULT NULL,
    `created_by_student_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`maintenance_report_id`),
    INDEX `FKo16g9078dh78tsydvuehtirj6` (`receive_by_manager_id` ASC) VISIBLE,
    INDEX `FKqmqakl4v5n54foe07cm9cea49` (`room_id` ASC) VISIBLE,
    INDEX `FKio88r83dkal1wf5iinej4stll` (`created_by_student_id` ASC) VISIBLE,
    CONSTRAINT `FKio88r83dkal1wf5iinej4stll` FOREIGN KEY (`created_by_student_id`) REFERENCES `hph_db`.`student` (`student_id`),
    CONSTRAINT `FKo16g9078dh78tsydvuehtirj6` FOREIGN KEY (`receive_by_manager_id`) REFERENCES `hph_db`.`manager` (`manager_id`),
    CONSTRAINT `FKqmqakl4v5n54foe07cm9cea49` FOREIGN KEY (`room_id`) REFERENCES `hph_db`.`room` (`room_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
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
    CONSTRAINT `FKb3wmgkbeu1pqf74xk944s333h` FOREIGN KEY (`manager_id`) REFERENCES `hph_db`.`manager` (`manager_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`payment` (
    `payment_id` BIGINT NOT NULL AUTO_INCREMENT,
    `amount` DOUBLE NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `status` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `bed_request_id` BIGINT NOT NULL,
    `checked_by_manager_id` BIGINT NOT NULL,
    `student_id` BIGINT NOT NULL,
    PRIMARY KEY (`payment_id`),
    UNIQUE INDEX `UK_6jd4oa8467p4k5nedh6uxm0ey` (`bed_request_id` ASC) VISIBLE,
    INDEX `FKlgi22d9smuknidkpy77grwvhr` (`checked_by_manager_id` ASC) VISIBLE,
    INDEX `FKq0mpbhvyrwyggk1gwjams69wf` (`student_id` ASC) VISIBLE,
    CONSTRAINT `FKi5hitqdbcf7vxw7a242tjgays` FOREIGN KEY (`bed_request_id`) REFERENCES `hph_db`.`bed_request` (`bed_request_id`),
    CONSTRAINT `FKlgi22d9smuknidkpy77grwvhr` FOREIGN KEY (`checked_by_manager_id`) REFERENCES `hph_db`.`manager` (`manager_id`),
    CONSTRAINT `FKq0mpbhvyrwyggk1gwjams69wf` FOREIGN KEY (`student_id`) REFERENCES `hph_db`.`student` (`student_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`penalty_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`penalty_ticket` (
    `penalty_ticket_id` BIGINT NOT NULL AUTO_INCREMENT,
    `content` TEXT NULL DEFAULT NULL,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `status` VARCHAR(255) NULL DEFAULT NULL,
    `title` VARCHAR(255) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `created_by_guard_id` BIGINT NOT NULL,
    `student_id` BIGINT NOT NULL,
    PRIMARY KEY (`penalty_ticket_id`),
    INDEX `FK1ux9jtat8x5h0ojx9mrnhadeu` (`created_by_guard_id` ASC) VISIBLE,
    INDEX `FK9u6fhq9uske5o1mt127nvu4d2` (`student_id` ASC) VISIBLE,
    CONSTRAINT `FK1ux9jtat8x5h0ojx9mrnhadeu` FOREIGN KEY (`created_by_guard_id`) REFERENCES `hph_db`.`guard` (`guard_id`),
    CONSTRAINT `FK9u6fhq9uske5o1mt127nvu4d2` FOREIGN KEY (`student_id`) REFERENCES `hph_db`.`student` (`student_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`request_application_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`request_application_type` (
    `request_application_type_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `request_application_type_name` VARCHAR(300) NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    PRIMARY KEY (`request_application_type_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`request_application`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`request_application` (
    `request_application_id` BIGINT NOT NULL AUTO_INCREMENT,
    `created_at` DATETIME(6) NULL DEFAULT NULL,
    `request_content` TEXT NULL DEFAULT NULL,
    `status` VARCHAR(255) NULL DEFAULT NULL,
    `text_response` TEXT NULL DEFAULT NULL,
    `updated_at` DATETIME(6) NULL DEFAULT NULL,
    `take_by_manager_id` BIGINT NULL DEFAULT NULL,
    `request_application_type_id` BIGINT NULL DEFAULT NULL,
    `student_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`request_application_id`),
    INDEX `FKnybjnakovu6ouc27fdg4cxaqv` (`take_by_manager_id` ASC) VISIBLE,
    INDEX `FK84sbiaiy31c7u8k4iw1vcuk9m` (`request_application_type_id` ASC) VISIBLE,
    INDEX `FK47l9s3lnc3mapt1m9j93508uq` (`student_id` ASC) VISIBLE,
    CONSTRAINT `FK47l9s3lnc3mapt1m9j93508uq` FOREIGN KEY (`student_id`) REFERENCES `hph_db`.`student` (`student_id`),
    CONSTRAINT `FK84sbiaiy31c7u8k4iw1vcuk9m` FOREIGN KEY (`request_application_type_id`) REFERENCES `hph_db`.`request_application_type` (`request_application_type_id`),
    CONSTRAINT `FKnybjnakovu6ouc27fdg4cxaqv` FOREIGN KEY (`take_by_manager_id`) REFERENCES `hph_db`.`manager` (`manager_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`role_feature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`role_feature` (
    `role_id` BIGINT NOT NULL,
    `feature_id` BIGINT NOT NULL,
    INDEX `FK602jkws28uc62gtuyokf4ke07` (`feature_id` ASC) VISIBLE,
    INDEX `FKdvn8a8caf8ckyjtdl4rc3x0tb` (`role_id` ASC) VISIBLE,
    CONSTRAINT `FK602jkws28uc62gtuyokf4ke07` FOREIGN KEY (`feature_id`) REFERENCES `hph_db`.`feature` (`feature_id`),
    CONSTRAINT `FKdvn8a8caf8ckyjtdl4rc3x0tb` FOREIGN KEY (`role_id`) REFERENCES `hph_db`.`role` (`role_id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `hph_db`.`token`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hph_db`.`token` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `expired` BIT(1) NOT NULL,
    `revoked` BIT(1) NOT NULL,
    `token` VARCHAR(255) NULL DEFAULT NULL,
    `token_type` ENUM('BEARER') NULL DEFAULT NULL,
    `user_id` BIGINT NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `UK_pddrhgwxnms2aceeku9s2ewy5` (`token` ASC) VISIBLE,
    INDEX `FKl10xjn274m2rkxo54knt2xqvy` (`user_id` ASC) VISIBLE,
    CONSTRAINT `FKl10xjn274m2rkxo54knt2xqvy` FOREIGN KEY (`user_id`) REFERENCES `hph_db`.`user` (`id`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;