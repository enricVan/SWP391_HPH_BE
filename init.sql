CREATE DATABASE hph_db;
USE hph_db;
-- drop database hph_db;

CREATE TABLE `role`
(
    created_at    datetime,
    updated_at    datetime,
    role_id       INT AUTO_INCREMENT PRIMARY KEY,
    role_name     VARCHAR(20) not null,
    `description` text(200)
);

CREATE TABLE `user`
(
    created_at   datetime,
    updated_at   datetime,
    user_id      INT AUTO_INCREMENT PRIMARY KEY,
    role_id      INT         NOT NULL,
    foreign key (role_id) references `role` (role_id),
    username     VARCHAR(20) NOT NULL UNIQUE,
    `password`   VARCHAR(32) NOT NULL,
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
    roll_number   varchar(6) unique,
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

-- create table feedback
-- (
--     created_at  datetime,
--     updated_at  datetime,
--     feedback_id int auto_increment primary key,
--     user_id     int,
--     foreign key (user_id) references `user` (user_id),
--     title       text,
--     content     text
-- );

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

create table student_request_type
(
    created_at     datetime,
    updated_at     datetime,
    student_request_type_id	   int auto_increment primary key,
    student_request_type_name nvarchar(300)
);

create table `student_request`
(
    created_at     datetime,
    updated_at     datetime,
    student_request_id	   int auto_increment primary key,
    student_id     int,
    foreign key (student_id) references `student` (student_id),
    student_request_type_id int,
    foreign key (request_type_id) references request_type(request_type_id),
    request_content text,
    `status` varchar(20)
);

-- Insert data demo








