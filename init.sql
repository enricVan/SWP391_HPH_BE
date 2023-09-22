CREATE
DATABASE hph_db;
USE
hph_db;
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
    role_id    INT not null,
    feature_id INT not null,
    PRIMARY KEY (feature_id, role_id),
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
    foreign key (semester_id) references `semester` (semester_id),
    `status`       varchar(20)
);


-- Insert data demo
INSERT INTO `role` (created_at, updated_at, role_name, `description`)
VALUES (NOW(), NOW(), 'ADMIN', 'Administrator Role'),
       (NOW(), NOW(), 'STUDENT', 'Student Role'),
       (NOW(), NOW(), 'SECURITY', 'Security Role');



-- Insert records into the room_type table
-- Insert records into the room_type table
INSERT INTO `room_type` (created_at, updated_at, room_type_id, room_type_name)
VALUES (NOW(), NOW(), 1, '8 male'),
       (NOW(), NOW(), 2, '6 male'),
       (NOW(), NOW(), 3, '8 female'),
       (NOW(), NOW(), 4, '6 female');

-- Insert records into the room table
INSERT INTO room (created_at, updated_at, room_id, room_type_id, room_name, belong_Dom, `floor`)
VALUES (NOW(), NOW(), 1, 1, 'Room 101', 'Alpha', 1),
       (NOW(), NOW(), 2, 2, 'Room 102', 'Beta', 2),
       (NOW(), NOW(), 3, 3, 'Room 201', 'Alpha', 3),
       (NOW(), NOW(), 4, 4, 'Room 202', 'Beta', 4);

-- Insert records into semester table
INSERT INTO semester (created_at, updated_at, semester_name, start_date, end_date)
VALUES (NOW(), NOW(), 'Spring - 23', '2023-01-05', '2023-04-29'),
       (NOW(), NOW(), 'Summer - 23', '2023-05-15', '2023-08-10'),
       (NOW(), NOW(), 'Fall - 23', '2023-09-01', '2023-12-20'),
       (NOW(), NOW(), 'Winter - 24', '2024-01-10', '2024-04-05'),
       (NOW(), NOW(), 'Spring - 24', '2024-04-20', '2024-07-15');

-- check data
select *
from room;
select *
from room_type;
select *
from user;
select *
from semester




