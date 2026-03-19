-- =========================================
-- TEMP SEED DATA
-- Run this after schema.sql
-- =========================================

-- USERS
INSERT INTO users (first_name, last_name, email, student_number) VALUES
('Aisha', 'Khan', 'aisha.khan@cmail.carleton.ca', '101234567'),
('Daniel', 'Chen', 'daniel.chen@cmail.carleton.ca', '101234568'),
('Priya', 'Patel', 'priya.patel@cmail.carleton.ca', '101234569'),
('Noah', 'Smith', 'noah.smith@cmail.carleton.ca', '101234570'),
('Maya', 'Singh', 'maya.singh@cmail.carleton.ca', '101234571'),
('Ethan', 'Brown', 'ethan.brown@cmail.carleton.ca', '101234572'),
('Sara', 'Ahmed', 'sara.ahmed@cmail.carleton.ca', '101234573'),
('Lucas', 'Martin', 'lucas.martin@cmail.carleton.ca', '101234574'),
('Jasmine', 'Lopez', 'jasmine.lopez@cmail.carleton.ca', '101234575'),
('Omar', 'Hassan', 'omar.hassan@cmail.carleton.ca', '101234576');

-- CLUBS
INSERT INTO clubs (club_name, description, website_url) VALUES
('Carleton Computer Science Society', 'Student society for computer science students with workshops, socials, and networking events.', 'https://example.com/ccss'),
('Carleton Debate Society', 'A club for students interested in public speaking, debate tournaments, and argumentation practice.', 'https://example.com/debate'),
('Carleton International Students Association', 'Community events and support for international students on campus.', 'https://example.com/cisa'),
('Ravens Basketball Club', 'Recreational and competitive basketball activities for Carleton students.', 'https://example.com/ravens-basketball'),
('Carleton Environmental Action Network', 'Promotes sustainability initiatives, awareness campaigns, and volunteer opportunities.', 'https://example.com/cean'),
('Women in STEM Carleton', 'Supports women and underrepresented students in STEM through mentorship and events.', 'https://example.com/wistem'),
('Carleton Entrepreneurship Club', 'Connects aspiring founders and innovators through startup events and pitch practice.', 'https://example.com/cec'),
('Carleton Photography Society', 'Brings together students interested in photography walks, editing, and exhibitions.', 'https://example.com/photo'),
('Carleton Music Collective', 'Hosts jam sessions, showcases, and music collaboration opportunities.', 'https://example.com/music'),
('Carleton Robotics Team', 'Students collaborate on robotics projects, competitions, and hands-on design workshops.', 'https://example.com/robotics');

-- CATEGORIES
INSERT INTO categories (category_name) VALUES
('Academic'),
('Technology'),
('Cultural'),
('Sports'),
('Advocacy'),
('Social'),
('Career');

-- CLUB CATEGORIES
INSERT INTO club_categories (club_id, category_id) VALUES
(1, 1),
(1, 2),
(1, 7),
(2, 1),
(2, 6),
(3, 3),
(3, 6),
(4, 4),
(4, 6),
(5, 5),
(5, 6),
(6, 2),
(6, 5),
(6, 7),
(7, 1),
(7, 7),
(8, 6),
(8, 7),
(9, 3),
(9, 6),
(10, 1),
(10, 2),
(10, 7);

-- LOCATIONS
INSERT INTO locations (building_name, room_number, address, latitude, longitude) VALUES
('Nicol Building', '4020', '1125 Colonel By Dr, Ottawa, ON', 45.385300, -75.697900),
('University Centre', '401', '1125 Colonel By Dr, Ottawa, ON', 45.384800, -75.697200),
('Richcraft Hall', '2200', '1125 Colonel By Dr, Ottawa, ON', 45.385900, -75.696500),
('Athletics Centre', 'Gym 1', '1125 Colonel By Dr, Ottawa, ON', 45.383900, -75.698200),
('Canal Building', '1111', '1125 Colonel By Dr, Ottawa, ON', 45.386100, -75.699000),
('Library', '482', '1125 Colonel By Dr, Ottawa, ON', 45.385000, -75.698500),
('Southam Hall', '302', '1125 Colonel By Dr, Ottawa, ON', 45.384500, -75.696900),
('Loeb Building', 'A900', '1125 Colonel By Dr, Ottawa, ON', 45.385600, -75.697600),
('Fieldhouse', 'Main Floor', '1125 Colonel By Dr, Ottawa, ON', 45.383500, -75.698700),
('Dunton Tower', '2017', '1125 Colonel By Dr, Ottawa, ON', 45.384700, -75.697400);

-- EVENTS
INSERT INTO events (club_id, location_id, event_title, description, start_time, end_time) VALUES
(1, 1, 'Intro to Git Workshop', 'Hands-on workshop covering branching, pull requests, and collaboration basics.', '2026-03-24 17:30:00', '2026-03-24 19:00:00'),
(1, 3, 'Tech Career Panel', 'Alumni and industry guests discuss internships and software careers.', '2026-03-29 18:00:00', '2026-03-29 20:00:00'),
(2, 2, 'Weekly Debate Night', 'Open practice session with impromptu and prepared debate rounds.', '2026-03-25 18:00:00', '2026-03-25 20:00:00'),
(3, 2, 'International Coffee House', 'Casual social for meeting students from different backgrounds.', '2026-03-27 16:00:00', '2026-03-27 18:00:00'),
(4, 4, 'Open Gym Scrimmage', 'Drop-in basketball scrimmage for all skill levels.', '2026-03-26 19:00:00', '2026-03-26 21:00:00'),
(5, 5, 'Campus Clean-Up Day', 'Volunteer event focused on campus sustainability and environmental awareness.', '2026-03-30 12:00:00', '2026-03-30 14:30:00'),
(6, 6, 'Women in STEM Networking Mixer', 'Networking event with mentors, students, and local professionals.', '2026-04-02 17:00:00', '2026-04-02 19:30:00'),
(7, 7, 'Startup Pitch Night', 'Students present startup ideas and receive feedback from peers and mentors.', '2026-04-03 18:00:00', '2026-04-03 20:30:00'),
(8, 10, 'Golden Hour Photo Walk', 'Guided campus photo walk focused on portrait and landscape practice.', '2026-04-05 17:30:00', '2026-04-05 19:00:00'),
(9, 2, 'Open Mic and Jam Session', 'Students perform, collaborate, and meet other musicians on campus.', '2026-04-06 18:30:00', '2026-04-06 21:00:00'),
(10, 8, 'Robotics Build Sprint', 'Hands-on prototyping session for students working on robot subsystems.', '2026-04-07 16:00:00', '2026-04-07 19:00:00'),
(1, 6, 'Resume Review Drop-In', 'Quick feedback sessions on resumes for tech internships and co-op applications.', '2026-04-08 15:00:00', '2026-04-08 17:00:00'),
(3, 2, 'Cultural Showcase Planning Meeting', 'Volunteers coordinate performances and logistics for the annual showcase.', '2026-04-09 17:00:00', '2026-04-09 18:30:00'),
(5, 9, 'Sustainability in Sport Panel', 'Discussion on greener practices in athletics and student recreation spaces.', '2026-04-10 13:00:00', '2026-04-10 14:30:00');

-- CLUB SOCIAL LINKS
INSERT INTO club_social_links (club_id, platform, url) VALUES
(1, 'Instagram', 'https://instagram.com/carletoncss'),
(1, 'Discord', 'https://discord.gg/example-ccss'),
(2, 'Instagram', 'https://instagram.com/carletondebate'),
(3, 'Website', 'https://example.com/cisa/home'),
(4, 'Instagram', 'https://instagram.com/ravensbasketballclub'),
(5, 'LinkedIn', 'https://linkedin.com/company/cean'),
(6, 'Instagram', 'https://instagram.com/wistemcarleton'),
(6, 'Website', 'https://example.com/wistem'),
(7, 'Instagram', 'https://instagram.com/carletonentrepreneurs'),
(7, 'LinkedIn', 'https://linkedin.com/company/carleton-entrepreneurship-club'),
(8, 'Instagram', 'https://instagram.com/carletonphoto'),
(8, 'Website', 'https://example.com/photo/gallery'),
(9, 'Instagram', 'https://instagram.com/carletonmusiccollective'),
(10, 'Discord', 'https://discord.gg/example-robotics'),
(10, 'Website', 'https://example.com/robotics/team');

-- USER FOLLOWED CLUBS
INSERT INTO user_followed_clubs (user_id, club_id) VALUES
(1, 1),
(1, 6),
(2, 1),
(2, 4),
(3, 3),
(3, 5),
(4, 2),
(5, 5),
(5, 6),
(6, 7),
(6, 10),
(7, 3),
(7, 9),
(8, 4),
(8, 8),
(9, 1),
(9, 10),
(10, 5),
(10, 7);

-- USER SAVED EVENTS
INSERT INTO user_saved_events (user_id, event_id) VALUES
(1, 1),
(1, 7),
(2, 2),
(2, 5),
(3, 4),
(3, 6),
(4, 3),
(5, 6),
(5, 7),
(6, 8),
(6, 11),
(7, 4),
(7, 12),
(8, 5),
(8, 9),
(9, 10),
(9, 13),
(10, 6),
(10, 8);

-- TERMS
INSERT INTO terms (term_name, start_date, end_date) VALUES
('Fall 2025', '2025-09-04', '2025-12-20'),
('Winter 2026', '2026-01-06', '2026-04-12'),
('Summer 2026', '2026-05-05', '2026-08-18');

-- COURSES
INSERT INTO courses (course_code, course_name) VALUES
('COMP 2401', 'Introduction to Systems Programming'),
('COMP 2406', 'Fundamentals of Web Applications'),
('STAT 2507', 'Introduction to Statistical Modelling I'),
('BUSI 1001', 'Financial Accounting for Business Students'),
('PSCI 2101', 'Politics and Government in Canada'),
('SYSC 2004', 'Object-Oriented Software Development'),
('MATH 1104', 'Linear Algebra for Engineering or Science'),
('COMM 2001', 'Introduction to Communication Studies');

-- USER COURSE SCHEDULE
INSERT INTO user_course_schedule (
    user_id, course_id, term_id, day_of_week, start_time, end_time, building_name, room_number
) VALUES
(1, 1, 2, 'Monday', '08:35:00', '09:55:00', 'Herzberg Laboratories', 'HP 4351'),
(1, 2, 2, 'Wednesday', '11:35:00', '12:55:00', 'Nicol Building', 'NI 3040'),
(2, 3, 2, 'Tuesday', '10:05:00', '11:25:00', 'Loeb Building', 'LA B146'),
(2, 4, 2, 'Thursday', '13:05:00', '14:25:00', 'Richcraft Hall', 'RB 2200'),
(3, 5, 2, 'Friday', '09:05:00', '11:55:00', 'Southam Hall', 'SA 505'),
(4, 2, 2, 'Monday', '14:35:00', '15:55:00', 'Nicol Building', 'NI 3040'),
(5, 1, 2, 'Tuesday', '16:05:00', '17:25:00', 'Herzberg Laboratories', 'HP 4351'),
(6, 6, 2, 'Wednesday', '08:35:00', '09:55:00', 'Canal Building', 'CB 5101'),
(6, 7, 2, 'Friday', '13:05:00', '14:25:00', 'Steacie Building', 'SC 214'),
(7, 8, 2, 'Thursday', '10:05:00', '11:25:00', 'Paterson Hall', 'PA 303'),
(8, 3, 2, 'Monday', '12:05:00', '13:25:00', 'Loeb Building', 'LA A900'),
(9, 6, 2, 'Tuesday', '08:35:00', '09:55:00', 'Canal Building', 'CB 5101'),
(9, 2, 2, 'Thursday', '16:05:00', '17:25:00', 'Nicol Building', 'NI 3040'),
(10, 4, 2, 'Wednesday', '14:35:00', '15:55:00', 'Richcraft Hall', 'RB 2200');
