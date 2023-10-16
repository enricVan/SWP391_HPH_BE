drop database hph_db;
create database hph_db;
use hph_db;

INSERT INTO `role`(created_at, updated_at, role_name, `description`)
VALUES (NOW(), NOW(), 'ADMIN', 'no des');

INSERT INTO `user` (role_id, username, updated_at, `status`, phone, `password`, gender, full_name, email, date_of_birth, created_at, avatar_image, address) VALUES
( 1,'johndoe', NOW(), 'active', '1234567890', 'password123', 'male', 'John Doe', 'johndoe@example.com', '1990-01-15', NOW(), 'john_doe.jpg', '123 Main St, City, Country'),
( 1, 'janesmith', NOW(), 'active', '9876543210', 'password456', 'female', 'Jane Smith', 'janesmith@example.com', '1985-03-20', NOW(), 'jane_smith.jpg', '456 Elm St, City, Country'),
(1, 'bobjohnson', NOW(), 'active', '5555555555', 'password789', 'male', 'Bob Johnson', 'bobjohnson@example.com', '1988-11-10', NOW(), 'bob_johnson.jpg', '789 Oak St, City, Country'),
(1, 'admin', NOW(), 'active', '5555555555', '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.', 'male', 'Bob Johnson', 'bobjohnson@example.com', '1988-11-10', NOW(), 'bob_johnson.jpg', '789 Oak St, City, Country');