-- =========================================
-- DROP TABLES (so schema can be rerun)
-- =========================================

DROP TABLE IF EXISTS user_saved_events CASCADE;
DROP TABLE IF EXISTS user_followed_clubs CASCADE;
DROP TABLE IF EXISTS club_social_links CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS club_categories CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS user_course_schedule CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE IF EXISTS terms CASCADE;
DROP TABLE IF EXISTS clubs CASCADE;
DROP TABLE IF EXISTS users CASCADE;


-- =========================================
-- USERS
-- =========================================
-- Purpose:
-- Stores each student who uses the app. This is the main user account table
-- and supports personalization features such as following clubs, saving
-- events, and optionally connecting club discovery with a student's class
-- schedule.
--
-- Relations:
-- - Referenced by user_followed_clubs to track which clubs a user follows.
-- - Referenced by user_saved_events to track which events a user bookmarks.
-- - Referenced by user_course_schedule to store a student's class timetable.

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    student_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- CLUBS
-- =========================================
-- Purpose:
-- Stores the core profile for each Carleton club shown in the app. This table
-- acts as the central directory of clubs, holding the basic information users
-- browse when discovering organizations.
--
-- Relations:
-- - Connected to categories through club_categories because one club can belong
--   to multiple categories.
-- - Referenced by events because each event is hosted by one club.
-- - Referenced by club_social_links to attach Instagram, Discord, or website
--   links to a club.
-- - Referenced by user_followed_clubs so users can follow clubs they care
--   about.

CREATE TABLE clubs (
    club_id SERIAL PRIMARY KEY,
    club_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    website_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- CATEGORIES
-- =========================================
-- Purpose:
-- Stores the list of club categories used to organize clubs by theme or
-- interest area, such as academic, cultural, sports, or technology.
--
-- Relations:
-- - Connected to clubs through club_categories because each category can be
--   assigned to many clubs.

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);


-- =========================================
-- CLUB CATEGORIES (MANY TO MANY)
-- =========================================
-- Purpose:
-- Junction table that links clubs and categories. This exists because clubs
-- can belong to multiple categories and each category can include multiple
-- clubs.
--
-- Relations:
-- - Each row connects one club from clubs to one category from categories.
-- - Deleting a club or category removes the related link rows automatically.

CREATE TABLE club_categories (
    club_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (club_id, category_id),
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
        ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
        ON DELETE CASCADE
);


-- =========================================
-- LOCATIONS
-- =========================================
-- Purpose:
-- Stores physical event locations on or near campus. It includes building and
-- room information as well as latitude and longitude, which supports map
-- displays, visual guides, and route generation to club events.
--
-- Relations:
-- - Referenced by events because each event happens at one stored location.
-- - Intended to support frontend navigation features that use event coordinates
--   together with a student's real-time device location.

CREATE TABLE locations (
    location_id SERIAL PRIMARY KEY,
    building_name VARCHAR(100) NOT NULL,
    room_number VARCHAR(20),
    address VARCHAR(255),
    latitude DECIMAL(9,6),
    longitude DECIMAL(9,6)
);


-- =========================================
-- EVENTS
-- =========================================
-- Purpose:
-- Stores upcoming and past club events, including title, description, and
-- start/end times. This table powers the app's event feed and gives students a
-- centralized place to see what clubs are doing.
--
-- Relations:
-- - References clubs to identify which club is hosting the event.
-- - References locations to identify where the event is taking place.
-- - Referenced by user_saved_events so users can bookmark events they want to
--   attend.

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    club_id INT NOT NULL,
    location_id INT NOT NULL,
    event_title VARCHAR(150) NOT NULL,
    description TEXT,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
        ON DELETE CASCADE,
    FOREIGN KEY (location_id) REFERENCES locations(location_id)
        ON DELETE RESTRICT,
    CHECK (end_time > start_time)
);


-- =========================================
-- CLUB SOCIAL LINKS
-- =========================================
-- Purpose:
-- Stores external links related to a club, such as Instagram, Discord,
-- LinkedIn, or an official website. This helps centralize club information
-- that is otherwise scattered across different platforms.
--
-- Relations:
-- - References clubs because each social link belongs to one club.

CREATE TABLE club_social_links (
    link_id SERIAL PRIMARY KEY,
    club_id INT NOT NULL,
    platform VARCHAR(50) NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
        ON DELETE CASCADE
);


-- =========================================
-- USER FOLLOWED CLUBS
-- =========================================
-- Purpose:
-- Stores which clubs a user follows. This supports personalized experiences
-- such as a custom club feed, easier rediscovery of favorite clubs, or future
-- notifications for clubs the user is interested in.
--
-- Relations:
-- - References users for the student who is following.
-- - References clubs for the club being followed.
-- - Uses a composite primary key so a user cannot follow the same club twice.

CREATE TABLE user_followed_clubs (
    user_id INT NOT NULL,
    club_id INT NOT NULL,
    followed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, club_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (club_id) REFERENCES clubs(club_id)
        ON DELETE CASCADE
);


-- =========================================
-- USER SAVED EVENTS
-- =========================================
-- Purpose:
-- Stores which events a user has saved or bookmarked. This supports features
-- like a saved events page, reminders, or planning attendance around a
-- student's availability.
--
-- Relations:
-- - References users for the student saving the event.
-- - References events for the specific event being saved.
-- - Uses a composite primary key so the same user cannot save the same event
--   more than once.

CREATE TABLE user_saved_events (
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, event_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
        ON DELETE CASCADE
);


-- =========================================
-- TERMS
-- =========================================
-- Purpose:
-- Stores academic terms such as Fall or Winter semesters. This provides a time
-- structure for course scheduling features and keeps class timetable data tied
-- to a specific academic period.
--
-- Relations:
-- - Referenced by user_course_schedule so each scheduled class belongs to one
--   academic term.

CREATE TABLE terms (
    term_id SERIAL PRIMARY KEY,
    term_name VARCHAR(50) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date > start_date)
);


-- =========================================
-- COURSES
-- =========================================
-- Purpose:
-- Stores course definitions such as course code and course name. This supports
-- the student's academic schedule, which can later be used to recommend club
-- events that fit around classes.
--
-- Relations:
-- - Referenced by user_course_schedule because each scheduled class entry is
--   tied to one course.

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL
);


-- =========================================
-- USER COURSE SCHEDULE
-- =========================================
-- Purpose:
-- Stores a student's class timetable, including course, term, weekday, time,
-- and classroom location. While not required for a basic club directory, this
-- table can support advanced features such as recommending events between
-- classes or helping users navigate from class to an event.
--
-- Relations:
-- - References users for the student whose schedule is being stored.
-- - References courses for the class being taken.
-- - References terms for the academic period of the class.
-- - Complements the events and locations tables by enabling schedule-aware club
--   discovery and routing features.

CREATE TABLE user_course_schedule (
    schedule_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    course_id INT NOT NULL,
    term_id INT NOT NULL,
    day_of_week VARCHAR(10) NOT NULL,
    start_time TIME NOT NULL,
    end_time TIME NOT NULL,
    building_name VARCHAR(100),
    room_number VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
        ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
        ON DELETE CASCADE,
    FOREIGN KEY (term_id) REFERENCES terms(term_id)
        ON DELETE CASCADE,
    CHECK (day_of_week IN (
        'Monday','Tuesday','Wednesday',
        'Thursday','Friday','Saturday','Sunday'
    )),
    CHECK (end_time > start_time)
);
