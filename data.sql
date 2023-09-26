USE hph_db;

INSERT INTO `role` (created_at, updated_at, role_name, `description`)
VALUES (NOW(), NOW(), 'ADMIN', 'Administrator Role'),
       (NOW(), NOW(), 'STUDENT', 'Student Role'),
       (NOW(), NOW(), 'MANAGER', 'Manager Role');

INSERT INTO `room_type` (created_at, updated_at, room_type_name)
VALUES (NOW(), NOW(), '8 male'),
       (NOW(), NOW(), '8 female'),
       (NOW(), NOW(), '6 male'),
       (NOW(), NOW(), '6 female');

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

INSERT INTO `student` (created_at, updated_at, roll_number, user_id, parent_name, `description`)
VALUES (NOW(), NOW(), 'HE173334', 1, 'Parent 1', 'Description 1'),
       (NOW(), NOW(), 'HE123456', 2, 'Parent 2', 'Description 2'),
       (NOW(), NOW(), 'HE111111', 3, 'Parent 3', 'Description 3');

INSERT INTO `manager` (created_at, updated_at, user_id, `description`)
VALUES (NOW(), NOW(), 1, 'Manager 1 Description');

INSERT INTO `news` (created_at, updated_at, manager_id, category, title, content, image)
VALUES (NOW(), NOW(), 1, 'Notice', 'Renewal of dormitory registration for Fall 2023 term', 'News Content 1', 'Image URL 1'),
       (NOW(), NOW(), 1, 'Tips', 'MANUAL FOR PREVENTION OF DENGUE FEVER EPIDEMIC', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'POWER LOSS ON August 6, 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'DECISION 139/QD-CTGDFPT DATED DECEMBER 20, 2022 ON THE ISSUANCE OF FINANCIAL REGULATIONS FOR SCHOOL YEAR 2023-2024 FOR STUDENTS OF TRAINING SYSTEMS UNDER THE FPT EDUCATION SYSTEM', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Notice', 'REGISTRATION/CANCELLATION OF KTX FALL 2023 Dormitory Rooms', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Notice', 'Regarding the second spraying of mosquito and insecticides to prevent epidemics in 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'CUT WATER TO CLEAN STORAGE TANKS', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', '[Important]ANNOUNCEMENT REGARDING CHANGE IN TIME FOR NEW REGISTRATION IN KY SU23 Dormitory Room', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'REGISTRATION/CANCELLATION OF SUMMER 2023 Dormitory', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'Dormitory air conditioning maintenance schedule for phase 1 of 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'Plan to receive dormitory registration at Hoa Lac campus from Fall 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', '1st SPRAYING OF MOSQUITOES AND INSECTS TO PREVENT DISEASES IN 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'Dormitory air conditioning maintenance schedule, phase 1 of 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'Dormitory air conditioning maintenance schedule, phase 2 of 2023', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Announcement', 'New Dorm Buiding Open', 'News Content 2', 'Image URL 2'),
       (NOW(), NOW(), 1, 'Tip', 'News Title 3', 'Where to go when having missing items', 'Image URL 3');

INSERT INTO `faq` (created_at, updated_at, title, sub_title, content)
VALUES (NOW(), NOW(), 'FAQ Title 1', 'FAQ Subtitle 1', 'FAQ Content 1'),
       (NOW(), NOW(), 'FAQ Title 2', 'FAQ Subtitle 2', 'FAQ Content 2'),
       (NOW(), NOW(), 'FAQ Title 3', 'FAQ Subtitle 3', 'FAQ Content 3');

INSERT INTO room (created_at, updated_at, room_type_id, room_name, belong_Dom, `floor`)
VALUES (NOW(), NOW(), 1, 'A101', 'A', 1), -- ROOM 1
       (NOW(), NOW(), 2, 'A102', 'A', 1), -- ROOM 2
       (NOW(), NOW(), 3, 'B101', 'B', 1), -- ROOM 3
       (NOW(), NOW(), 4, 'B102', 'B', 1), -- ROOM 4
       (NOW(), NOW(), 1, 'C101', 'C', 1), -- ROOM 5
       (NOW(), NOW(), 2, 'C102', 'C', 1), -- ROOM 6
       (NOW(), NOW(), 3, 'D101', 'D', 1), -- ROOM 7
       (NOW(), NOW(), 4, 'D102', 'D', 1) -- ROOM 8
;

INSERT INTO `bed` (created_at, updated_at, room_id, bed_name, price, `status`)
VALUES
    (NOW(), NOW(), 1, 'A101 - Bed 1', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 2', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 3', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 4', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 5', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 6', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 7', 4200000, 'available'),
    (NOW(), NOW(), 1, 'A101 - Bed 8', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 1', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 2', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 3', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 4', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 5', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 6', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 7', 4200000, 'available'),
    (NOW(), NOW(), 2, 'A102 - Bed 8', 4200000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 1', 4400000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 2', 4400000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 3', 4400000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 4', 4400000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 5', 4400000, 'available'),
    (NOW(), NOW(), 3, 'B101 - Bed 6', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 1', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 2', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 3', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 4', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 5', 4400000, 'available'),
    (NOW(), NOW(), 4, 'B102 - Bed 6', 4400000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 1', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 2', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 3', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 4', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 5', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 6', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 7', 4200000, 'available'),
    (NOW(), NOW(), 5, 'C101 - Bed 8', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 1', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 2', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 3', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 4', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 5', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 6', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 7', 4200000, 'available'),
    (NOW(), NOW(), 6, 'C102 - Bed 8', 4200000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 1', 4400000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 2', 4400000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 3', 4400000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 4', 4400000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 5', 4400000, 'available'),
    (NOW(), NOW(), 7, 'D101 - Bed 6', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 1', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 2', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 3', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 4', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 5', 4400000, 'available'),
    (NOW(), NOW(), 8, 'D102 - Bed 6', 4400000, 'available')
;


INSERT INTO `bed_request` (created_at, updated_at, bed_id, student_id, semester_id, `status`)
VALUES (NOW(), NOW(), 1, 1, 1, 'pending'),
       (NOW(), NOW(), 2, 2, 2, 'approved'),
       (NOW(), NOW(), 3, 3, 3, 'denied');

INSERT INTO `student_request_type` (created_at, updated_at, student_request_type_name)
VALUES (NOW(), NOW(), 'Skill issues'),
       (NOW(), NOW(), 'Fix devices')
;

INSERT INTO `student_request` (created_at, updated_at, student_id, student_request_type_id, request_content, `status`)
VALUES (NOW(), NOW(), 2, 1, 'Skill issues', 'pending'),
       (NOW(), NOW(), 2, 2, 'Fix devices', 'approved')
;


-- check data
-- select * from room;
-- select * from room_type;
-- select * from user;
-- select * from semester;
-- select * from bed_request;
-- select * from request_type;
-- select * from request;
