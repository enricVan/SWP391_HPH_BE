-- CREATE DATABASE hph_db;
-- USE hph_db;
-- drop database hph_db;

CREATE TABLE `role` (
                        created_at datetime,
                        updated_at datetime,
                        role_id INT AUTO_INCREMENT PRIMARY KEY,
                        role_name VARCHAR(20) not null,
                        `description` text(200)
);

CREATE TABLE `user` (
                        created_at datetime,
                        updated_at datetime,
                        user_id INT AUTO_INCREMENT PRIMARY KEY,
                        role_id INT NOT NULL,
                        foreign key (role_id) references `role`(role_id),
                        username VARCHAR(20) NOT NULL UNIQUE,
                        password_hash VARCHAR(32) NOT NULL,
                        full_name varchar(100),
                        email varchar(100),
                        gender varchar(20),
                        phone varchar(20),
                        address varchar(100),
                        avatar_image text,
                        `status` varchar(50)
);

CREATE TABLE `feature`(
                          created_at datetime,
                          updated_at datetime,
                          feature_id INT AUTO_INCREMENT PRIMARY KEY,
                          feature_name VARCHAR(50) NOT NULL,
                          url VARCHAR(300) NOT NULL
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
                         user_id int not null,
                         FOREIGN KEY (user_id) REFERENCES `user`(user_id),
                         parent_name varchar(100) not null,
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

create table `news` (
                        created_at datetime,
                        updated_at datetime,
                        news_id int auto_increment primary key,
                        manager_id int not null,
                        foreign key (manager_id) references `manager`(manager_id),
                        category varchar(50),
                        title varchar(50),
                        content text,
                        image text
);

create table faq (
                     created_at datetime,
                     updated_at datetime,
                     faq_id int auto_increment primary key,
                     title text,
                     sub_title text,
                     content text
);

create table feedback (
                          created_at datetime,
                          updated_at datetime,
                          feedback_id int auto_increment primary key,
                          user_id int,
                          foreign key (user_id) references `user`(user_id),
                          title text,
                          content text
);

-- Insert data demo
-- Insert data into the 'role' table
INSERT INTO `role` (created_at, updated_at, role_name, `description`)
VALUES
    (NOW(), NOW(), 'Admin', 'Administrator role'),
    (NOW(), NOW(), 'Student', 'Regular user role'),
    (NOW(), NOW(), 'Manager', 'Manager role');

-- Insert data into the 'user' table
INSERT INTO `user` (created_at, updated_at, role_id, username, password_hash, full_name, email, gender, phone, address, avatar_image, `status`)
VALUES
    (NOW(), NOW(), 1, 'admin_user', 'admin_password_hash', 'Admin User', 'admin@example.com', 'Male', '1234567890', '123 Main St', 'admin.jpg', 'Active'),
    (NOW(), NOW(), 2, 'regular_user1', 'regular_password_hash1', 'Regular User 1', 'user1@example.com', 'Female', '9876543210', '456 Elm St', 'user1.jpg', 'Active'),
    (NOW(), NOW(), 2, 'regular_user2', 'regular_password_hash2', 'Regular User 2', 'user2@example.com', 'Male', '5555555555', '789 Oak St', 'user2.jpg', 'Active');

-- Insert data into the 'feature' table
INSERT INTO `feature` (created_at, updated_at, feature_name, url)
VALUES
    (NOW(), NOW(), 'Feature 1', '/feature1'),
    (NOW(), NOW(), 'Feature 2', '/feature2'),
    (NOW(), NOW(), 'Feature 3', '/feature3');

-- Insert data into the 'role_feature' table
INSERT INTO `role_feature` (created_at, updated_at, role_id, feature_id)
VALUES
    (NOW(), NOW(), 1, 1),
    (NOW(), NOW(), 2, 2),
    (NOW(), NOW(), 3, 3);

-- Insert data into the 'student' table
INSERT INTO `student` (created_at, updated_at, user_id, parent_name, `description`)
VALUES
    (NOW(), NOW(), 2, 'Parent 1', 'Student 1'),
    (NOW(), NOW(), 3, 'Parent 2', 'Student 2'),
    (NOW(), NOW(), 3, 'Parent 3', 'Student 3');

-- Insert data into the 'manager' table
INSERT INTO `manager` (created_at, updated_at, user_id, `description`)
VALUES
    (NOW(), NOW(), 1, 'Manager 1'),
    (NOW(), NOW(), 3, 'Manager 2'),
    (NOW(), NOW(), 2, 'Manager 3');

-- Insert data into the 'news' table
INSERT INTO `news` (created_at, updated_at, manager_id, category, title, content, image)
VALUES
    (NOW(), NOW(), 1, 'General', 'News 1', 'This is the content of news 1.', 'news1.jpg'),
    (NOW(), NOW(), 2, 'Sports', 'News 2', 'This is the content of news 2.', 'news2.jpg'),
    (NOW(), NOW(), 3, 'Entertainment', 'News 3', 'This is the content of news 3.', 'news3.jpg');

-- Insert data into the 'faq' table
INSERT INTO `faq` (created_at, updated_at, title, sub_title, content)
VALUES
    (NOW(), NOW(), 'FAQ 1', 'Subtitle 1', 'This is the content of FAQ 1.'),
    (NOW(), NOW(), 'FAQ 2', 'Subtitle 2', 'This is the content of FAQ 2.'),
    (NOW(), NOW(), 'FAQ 3', 'Subtitle 3', 'This is the content of FAQ 3.');

-- Insert data into the 'feedback' table
INSERT INTO `feedback` (created_at, updated_at, user_id, title, content)
VALUES
    (NOW(), NOW(), 2, 'Feedback 1', 'This is the feedback content 1.'),
    (NOW(), NOW(), 3, 'Feedback 2', 'This is the feedback content 2.'),
    (NOW(), NOW(), 1, 'Feedback 3', 'This is the feedback content 3.');
