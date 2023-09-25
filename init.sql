CREATE DATABASE hph_db;
USE hph_db;
-- drop database hph_db;

CREATE TABLE `role`
(
    created_at    datetime,
    updated_at    datetime,
    role_id       INT AUTO_INCREMENT PRIMARY KEY,
    role_name     VARCHAR(20) not null,
    `description` text
);

CREATE TABLE `user`
(
    created_at   datetime,
    updated_at   datetime,
    user_id      INT AUTO_INCREMENT PRIMARY KEY,
    role_id      INT         NOT NULL,
    foreign key (role_id) references `role` (role_id),
    username     VARCHAR(20) NOT NULL UNIQUE,
    `password`   VARCHAR(255) NOT NULL,
    full_name    varchar(100),
    email        varchar(100),
    gender       varchar(20),
    phone        varchar(20),
    address      varchar(100),
    avatar_image text,
    `status`     varchar(50)
);

CREATE TABLE `feature`
(
    created_at   datetime,
    updated_at   datetime,
    feature_id   INT AUTO_INCREMENT PRIMARY KEY,
    feature_name VARCHAR(50)  NOT NULL,
    url          VARCHAR(300) NOT NULL
);

CREATE TABLE `role_feature`
(
    created_at datetime,
    updated_at datetime,
    role_feature_id int auto_increment primary key,
    role_id    INT not null,
    feature_id INT not null,
    FOREIGN KEY (feature_id) REFERENCES feature (feature_id),
    FOREIGN KEY (role_id) REFERENCES `role` (role_id)
);
CREATE TABLE student
(
    created_at    datetime,
    updated_at    datetime,
    student_id    int AUTO_INCREMENT PRIMARY KEY,
    user_id       int          not null,
    FOREIGN KEY (user_id) REFERENCES `user` (user_id),
    parent_name   varchar(100) not null,
    `description` text(200)
);
create table `manager`
(
    created_at    datetime,
    updated_at    datetime,
    manager_id    int AUTO_INCREMENT PRIMARY KEY,
    user_id       int not null unique,
    FOREIGN KEY (user_id) REFERENCES `user` (user_id),
    `description` text(200)
);

create table `news`
(
    created_at datetime,
    updated_at datetime,
    news_id    int auto_increment primary key,
    manager_id int not null,
    foreign key (manager_id) references `manager` (manager_id),
    category   varchar(50),
    title      varchar(50),
    content    text,
    image      text
);

create table faq
(
    created_at datetime,
    updated_at datetime,
    faq_id     int auto_increment primary key,
    title      text,
    sub_title  text,
    content    text
);

create table feedback
(
    created_at  datetime,
    updated_at  datetime,
    feedback_id int auto_increment primary key,
    user_id     int,
    foreign key (user_id) references `user` (user_id),
    title       text,
    content     text
);

create table `room_type`
(
    created_at     datetime,
    updated_at     datetime,
    room_type_id   int auto_increment primary key,
    room_type_name varchar(20)
); -- type: 1: 8 male, 2: 6 male, 3: 8 female, 4: 6 female

create table room
(
    created_at   datetime,
    updated_at   datetime,
    room_id      int auto_increment primary key,
    room_type_id int,
    foreign key (room_type_id) references `room_type` (room_type_id),
    room_name    varchar(20) unique,
    belong_Dom   varchar(20),
    `floor`      int
);

create table bed
(
    created_at datetime,
    updated_at datetime,
    bed_id     int auto_increment primary key,
    room_id    int,
    foreign key (room_id) references `room` (room_id),
    bed_name   varchar(20),
    price float,
    `status`   varchar(20) -- available/ not allow
);

create table semester
(
    created_at    datetime,
    updated_at    datetime,
    semester_id   int auto_increment primary key,
    semester_name varchar(50),
    start_date    date,
    end_date      date
);

create table bed_request
(
    created_at     datetime,
    updated_at     datetime,
    bed_request_id int auto_increment primary key,
    bed_id         int,
    foreign key (bed_id) references bed (bed_id),
    student_id     int,
    foreign key (student_id) references `student` (student_id),
    semester_id    int,
    `status`       varchar(20)
);


-- Insert data demo
USE hph_db;
-- Insert records into semester table
INSERT INTO `role` (created_at, updated_at, role_name, `description`)
VALUES (NOW(), NOW(), 'ADMIN', 'Administrator Role'),
       (NOW(), NOW(), 'STUDENT', 'Student Role'),
       (NOW(), NOW(), 'MANAGER', 'Manager Role');

-- Insert records into the room_type table
INSERT INTO `room_type` (created_at, updated_at, room_type_name)
VALUES (NOW(), NOW(), '8 male'),
       (NOW(), NOW(), '6 male'),
       (NOW(), NOW(), '8 female'),
       (NOW(), NOW(), '6 female');

-- Insert records into the room table
INSERT INTO room (created_at, updated_at, room_type_id, room_name, belong_Dom, `floor`)
VALUES (NOW(), NOW(), 1, 'A101', 'A', 1),
       (NOW(), NOW(), 1, 'A102', 'A', 1),
       (NOW(), NOW(), 1, 'A103', 'A', 1),
       (NOW(), NOW(), 1, 'A104', 'A', 1),
       (NOW(), NOW(), 1, 'A105', 'A', 1),
       (NOW(), NOW(), 2, 'B202', 'B', 2),
       (NOW(), NOW(), 3, 'F321', 'F', 3),
       (NOW(), NOW(), 4, 'F412', 'F', 4);

INSERT INTO semester (created_at, updated_at, semester_name, start_date, end_date)
VALUES
    (NOW(), NOW(), 'Spring23', '2023-01-02', '2023-05-06'),
    (NOW(), NOW(), 'Summer23', '2023-05-08', '2023-09-02'),
    (NOW(), NOW(), 'Fall23', '2023-09-04', '2023-12-23'),
    (NOW(), NOW(), 'Spring24', '2024-01-04', '2024-05-08'),
    (NOW(), NOW(), 'Summer24', '2024-05-11', '2024-09-04');


INSERT INTO `user` (created_at, updated_at, role_id, username, `password`, full_name, email, gender, phone, address, avatar_image, `status`)
VALUES (NOW(), NOW(), 1, 'admin', 'admin', 'Admin User', 'admin@example.com', 'Male', '1234567890',
        'Admin Address', 'admin.jpg', 'Active'),
       (NOW(), NOW(), 2, 'student1', 'hashed_password_2', 'Student User 1', 'student1@example.com', 'Female',
        '9876543210', 'Student Address 1', 'student1.jpg', 'Active'),
       (NOW(), NOW(), 2, 'student2', 'hashed_password_3', 'Student User 2', 'student2@example.com', 'Male',
        '5555555555', 'Student Address 2', 'student2.jpg', 'Active');

INSERT INTO `feature` (created_at, updated_at, feature_name, url)
VALUES (NOW(), NOW(), 'Feature 1', 'URL 1'),
       (NOW(), NOW(), 'Feature 2', 'URL 2'),
       (NOW(), NOW(), 'Feature 3', 'URL 3');

INSERT INTO `role_feature` (created_at, updated_at, role_id, feature_id)
VALUES (NOW(), NOW(), 1, 1),
       (NOW(), NOW(), 2, 2),
       (NOW(), NOW(), 3, 3);

INSERT INTO `student` (created_at, updated_at, user_id, parent_name, `description`)
VALUES (NOW(), NOW(), 1, 'Parent 1', 'Description 1'),
       (NOW(), NOW(), 2, 'Parent 2', 'Description 2'),
       (NOW(), NOW(), 3, 'Parent 3', 'Description 3');

INSERT INTO `manager` (created_at, updated_at, user_id, `description`)
VALUES (NOW(), NOW(), 1, 'Manager 1 Description');

INSERT INTO `news` (created_at, updated_at, manager_id, category, title, content, image)
VALUES (NOW(), NOW(), 1, 'Category 1', 'News Title 1', 'News Content 1', 'Image URL 1'),
       (NOW(), NOW(), 1, 'Category 2', 'News Title 2', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Category 3', 'News Title 3', 'News Content 3', 'Image URL 3');

INSERT INTO `faq` (created_at, updated_at, title, sub_title, content)
VALUES (NOW(), NOW(), 'FAQ Title 1', 'FAQ Subtitle 1', 'FAQ Content 1'),
       (NOW(), NOW(), 'FAQ Title 2', 'FAQ Subtitle 2', 'FAQ Content 2'),
       (NOW(), NOW(), 'FAQ Title 3', 'FAQ Subtitle 3', 'FAQ Content 3');

INSERT INTO `feedback` (created_at, updated_at, user_id, title, content)
VALUES (NOW(), NOW(), 1, 'Feedback Title 1', 'Feedback Content 1'),
       (NOW(), NOW(), 2, 'Feedback Title 2', 'Feedback Content 2'),
       (NOW(), NOW(), 3, 'Feedback Title 3', 'Feedback Content 3');

INSERT INTO `bed` (created_at, updated_at, room_id, bed_name, price, `status`)
VALUES (NOW(), NOW(), 1, 'Bed 1', 4200000, 'available'),
       (NOW(), NOW(), 2, 'Bed 2', 4400000, 'not allow'),
       (NOW(), NOW(), 3, 'Bed 3', 4600000, 'available');

INSERT INTO `bed_request` (created_at, updated_at, bed_id, student_id, semester_id, `status`)
VALUES (NOW(), NOW(), 1, 1, 1, 'pending'),
       (NOW(), NOW(), 2, 2, 2, 'approved'),
       (NOW(), NOW(), 3, 3, 3, 'denied');

-- check data
-- select * from room;
-- select * from room_type;
-- select * from user;
-- select * from semester;








