-- drop database hph_db;
-- create database hph_db;
-- use hph_db;

-- INSERT INTO `role`(created_at, updated_at, role_name, `description`)
-- VALUES (NOW(), NOW(), 'ADMIN', 'no des');

-- INSERT INTO `user` (role_id, username, updated_at, `status`, phone, `password`, gender, full_name, email, date_of_birth, created_at, avatar_image, address) VALUES
-- ( 1,'johndoe', NOW(), 'active', '1234567890', 'password123', 'male', 'John Doe', 'johndoe@example.com', '1990-01-15', NOW(), 'john_doe.jpg', '123 Main St, City, Country'),
-- ( 1, 'janesmith', NOW(), 'active', '9876543210', 'password456', 'female', 'Jane Smith', 'janesmith@example.com', '1985-03-20', NOW(), 'jane_smith.jpg', '456 Elm St, City, Country'),
-- (1, 'bobjohnson', NOW(), 'active', '5555555555', 'password789', 'male', 'Bob Johnson', 'bobjohnson@example.com', '1988-11-10', NOW(), 'bob_johnson.jpg', '789 Oak St, City, Country'),
-- (1, 'admin', NOW(), 'active', '5555555555', '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.', 'male', 'Bob Johnson', 'bobjohnson@example.com', '1988-11-10', NOW(), 'bob_johnson.jpg', '789 Oak St, City, Country');


-- Sample data for 'building' table
INSERT INTO `hph_db`.`building` (`building_name`, `created_at`, `updated_at`) VALUES
    ('Building A', NOW(), NOW()),
    ('Building B', NOW(), NOW());

-- Sample data for 'room_type' table
INSERT INTO `hph_db`.`room_type` (`room_type_description`, `room_type_name`, `created_at`, `updated_at`) VALUES
    ('Single Room', 'Single', NOW(), NOW()),
    ('Double Room', 'Double', NOW(), NOW());

-- Sample data for 'room' table
INSERT INTO `hph_db`.`room` (`floor`, `room_name`, `room_price`, `created_at`, `updated_at`, `building_id`, `room_type_id`) VALUES
    (1, '101', 500.00, NOW(), NOW(), 1, 1),
    (2, '201', 600.00, NOW(), NOW(), 2, 2);

-- Sample data for 'role' table
INSERT INTO `hph_db`.`role` (`description`, `role_name`, `created_at`, `updated_at`) VALUES
    ('Admin role', 'ADMIN', NOW(), NOW()),
    ('Student role', 'STUDENT', NOW(), NOW()),
    ('Manager role', 'MANAGER', NOW(), NOW()),
    ('GUARD ROLE','GUARD', NOW(), NOW());

-- Sample data for 'user' table
INSERT INTO `hph_db`.`user` (`full_name`, `email`, `username`, `password`, `role_id`, `created_at`, `updated_at`) VALUES
    ('HaiKN', 'haikn2@fpt.com', 'admin', '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.', 1, NOW(), NOW()),
    ('John Doe', 'john@example.com', 'student1', '$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.', 2, NOW(), NOW()),
	('Alice Smith', 'AliceSmith@example.com', 'student2','$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',2, NOW(), NOW()),
    ('Loi Cock', 'LoiCock@example.com', 'guard1','$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',3, NOW(), NOW()),
    ('Tim Cock', 'TimCock@example.com', 'guard2','$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',3, NOW(), NOW()),
	('Tom Nguyen', 'LoiCock@example.com', 'manager1','$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',4, NOW(), NOW()),
    ('Jerry Pham', 'TimCock@example.com', 'manager2','$2a$12$L/ynEoPnjQNVuEWiPWUM...0/UlzshzMfIQETRe5p1FGHBWIQZlE.',4, NOW(), NOW());

-- Sample data for 'student' table
INSERT INTO `hph_db`.`student` (`parent_name`, `roll_number`, `user_id`, `created_at`, `updated_at`) VALUES
    ('Jane Doe', '12345678', 2, NOW(), NOW()),
    ('Jane Smith', '87654321', 3, NOW(), NOW());

-- Sample data for 'bed' table
INSERT INTO `hph_db`.`bed` (`bed_name`, `created_at`, `status`, `updated_at`, `room_id`, `student_id`) VALUES
    ('Bed A1', NOW(), 'Occupied', NOW(), 1, 1),
    ('Bed B2', NOW(), 'Vacant', NOW(), 2, 2);

-- Sample data for 'semester' table
INSERT INTO `hph_db`.`semester` (`semester_name`, `start_date`, `end_date`, `created_at`, `updated_at`) VALUES
    ('Fall 2023', '2023-09-01', '2023-12-31', NOW(), NOW()),
    ('Spring 2024', '2024-01-01', '2024-05-31', NOW(), NOW());

-- Sample data for 'bed_request' table
INSERT INTO `hph_db`.`bed_request` (`status`, `created_at`, `updated_at`, `bed_id`, `semester_id`, `student_id`) VALUES
    ('Approved', NOW(), NOW(), 1, 1, 1),
    ('Pending', NOW(), NOW(), 2, 2, 2);

-- Sample data for 'faq' table
INSERT INTO `hph_db`.`faq` (`title`, `sub_title`, `content`, `created_at`, `updated_at`) VALUES
    ('FAQ 1', 'Subtitle 1', 'Content for FAQ 1', NOW(), NOW()),
    ('FAQ 2', 'Subtitle 2', 'Content for FAQ 2', NOW(), NOW());

-- Sample data for 'feature' table
INSERT INTO `hph_db`.`feature` (`feature_name`, `url`, `created_at`, `updated_at`) VALUES
    ('Feature 1', '/feature1', NOW(), NOW()),
    ('Feature 2', '/feature2', NOW(), NOW());

-- Sample data for 'guard' table
INSERT INTO `hph_db`.`guard` (`user_id`, `created_at`, `updated_at`) VALUES
    (4, NOW(), NOW()),
    (5, NOW(), NOW());

-- Sample data for 'manager' table
INSERT INTO `hph_db`.`manager` (`user_id`, `description`, `created_at`, `updated_at`) VALUES
    (6, 'Manager 1', NOW(), NOW()),
    (7, 'Manager 2', NOW(), NOW());

-- Sample data for 'guard_shift' table
INSERT INTO `hph_db`.`guard_shift` (`start_date_time`, `end_date_time`, `slot`, `created_at`, `updated_at`, `building`, `guard_id`, `assign_by_manager_id`) VALUES
    ('2023-10-16 08:00:00', '2023-10-16 16:00:00', 1, NOW(), NOW(), 1, 1, 1),
    ('2023-10-17 08:00:00', '2023-10-17 16:00:00', 1, NOW(), NOW(), 2, 2, 2);

-- Sample data for 'maintenance_report' table
INSERT INTO `hph_db`.`maintenance_report` (`note`, `status`, `created_at`, `updated_at`, `receive_by_manager_id`, `room_id`, `created_by_student_id`) VALUES
    ('Maintenance issue in Room 101', 'Pending', NOW(), NOW(), 1, 1, 1),
    ('Broken window in Room 201', 'Resolved', NOW(), NOW(), 2, 2, 2);

-- Sample data for 'news' table
INSERT INTO `hph_db`.`news` (`title`, `category`, `content`, `image`, `created_at`, `updated_at`, `manager_id`) VALUES
    ('News 1', 'Announcement', 'Important announcement...', NULL, NOW(), NOW(), 1),
    ('News 2', 'Event', 'Upcoming event details...', NULL, NOW(), NOW(), 2);

-- Sample data for 'payment' table
INSERT INTO `hph_db`.`payment` (`amount`, `status`, `created_at`, `updated_at`, `bed_request_id`, `checked_by_manager_id`, `student_id`) VALUES
    (500.00, 'Paid', NOW(), NOW(), 1, 1, 1),
    (600.00, 'Pending', NOW(), NOW(), 2, 2, 2);

-- Sample data for 'penalty_ticket' table
INSERT INTO `hph_db`.`penalty_ticket` (`title`, `content`, `status`, `created_at`, `updated_at`, `created_by_guard_id`, `student_id`) VALUES
    ('Noise Complaint', 'Excessive noise in Room 101', 'Pending', NOW(), NOW(), 1, 1),
    ('Violation Report', 'Room 201 violation report', 'Resolved', NOW(), NOW(), 2, 2);

-- Sample data for 'request_application_type' table
INSERT INTO `hph_db`.`request_application_type` (`request_application_type_name`, `created_at`, `updated_at`) VALUES
    ('Leave Request', NOW(), NOW()),
    ('Complaint', NOW(), NOW());

-- Sample data for 'request_application' table
INSERT INTO `hph_db`.`request_application` (`request_content`, `status`, `text_response`, `created_at`, `updated_at`, `take_by_manager_id`, `request_application_type_id`, `student_id`) VALUES
    ('Request for vacation leave', 'Pending', NULL, NOW(), NOW(), 1, 1, 1),
    ('Noise Complaint', 'Resolved', 'Resolved the noise issue', NOW(), NOW(), 2, 2, 2);
    
    
    select * from bed;
    select * from `user`;
