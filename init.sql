CREATE DATABASE hph_db;
USE hph_db;
-- drop database hph_db;
CREATE TABLE `user` (
    created_at datetime,
    updated_at datetime,
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(20) NOT NULL,
    password_hash VARCHAR(32) NOT NULL,
    full_name varchar(100),
    email varchar(100),
    gender varchar(20),
    phone varchar(20),
    address varchar(100),
    `status` varchar(50)
);
CREATE TABLE `role` (
    created_at datetime,
    updated_at datetime,
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(20) not null,
    `description` text(200)
);
CREATE TABLE `feature`(
    created_at datetime,
    updated_at datetime,
    feature_id INT AUTO_INCREMENT PRIMARY KEY,
    feature_name VARCHAR(50) NOT NULL,
    url VARCHAR(300) NOT NULL
);
CREATE TABLE `user_role` (
    created_at datetime,
    updated_at datetime,
    user_id INT not null,
    role_id INT not null,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    FOREIGN KEY (role_id) REFERENCES `role`(role_id)
);
CREATE TABLE `role_feature` (
    created_at datetime,
    updated_at datetime,
    role_id INT not null,
    feature_id INT not null,
    PRIMARY KEY (feature_id, role_id),
    FOREIGN KEY (feature_id) REFERENCES feature(feature_id),
    FOREIGN KEY (role_id) REFERENCES `role`(role_id)
);
CREATE TABLE student (
    created_at datetime,
    updated_at datetime,
    student_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int not null unique,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    `description` text(200)
);
create table `manager`(
    created_at datetime,
    updated_at datetime,
    manager_id int AUTO_INCREMENT PRIMARY KEY,
    user_id int not null unique,
    FOREIGN KEY (user_id) REFERENCES `user`(user_id),
    `description` text(200)
);
-- Inserting Sample Data into the "user" table
-- Sample User 1
INSERT INTO `user` (
        created_at,
        updated_at,
        user_name,
        password_hash,
        full_name,
        email,
        gender,
        phone,
        address,
        `status`
    )
VALUES (
        '2023-09-15 12:00:00',
        '2023-09-15 12:00:00',
        'user1',
        'password_hash1',
        'John Doe',
        'john.doe@example.com',
        'Male',
        '1234567890',
        '123 Main St',
        'Active'
    );
-- Sample User 2
INSERT INTO `user` (
        created_at,
        updated_at,
        user_name,
        password_hash,
        full_name,
        email,
        gender,
        phone,
        address,
        `status`
    )
VALUES (
        '2023-09-15 12:00:00',
        '2023-09-15 12:00:00',
        'user2',
        'password_hash2',
        'Jane Smith',
        'jane.smith@example.com',
        'Female',
        '9876543210',
        '456 Elm St',
        'Active'
    );
-- Sample User 3
INSERT INTO `user` (
        created_at,
        updated_at,
        user_name,
        password_hash,
        full_name,
        email,
        gender,
        phone,
        address,
        `status`
    )
VALUES (
        '2023-09-15 12:00:00',
        '2023-09-15 12:00:00',
        'user3',
        'password_hash3',
        'Bob Johnson',
        'bob.johnson@example.com',
        'Male',
        '5555555555',
        '789 Oak St',
        'Inactive'
    );
select *
from `user`;