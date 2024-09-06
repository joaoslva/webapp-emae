DROP SCHEMA IF EXISTS dev CASCADE;
CREATE SCHEMA IF NOT EXISTS dev;
SET search_path TO dev;

DROP TABLE IF EXISTS Faq;
DROP TABLE IF EXISTS ClassYear;
DROP TABLE IF EXISTS Efficiency;
DROP TABLE IF EXISTS Measure;
DROP TABLE IF EXISTS MeasureAggregation;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Subject_Class;
DROP TABLE IF EXISTS "subject";
DROP TABLE IF EXISTS School_SchoolarYear;
DROP TABLE IF EXISTS SchoolarYear;
DROP TABLE IF EXISTS Teacher_Class;
DROP TABLE IF EXISTS Teacher;
DROP TABLE IF EXISTS Class;
DROP TABLE IF EXISTS School;
DROP TABLE IF EXISTS SchoolDistrict;
DROP TABLE IF EXISTS ClassYear;

CREATE TABLE Faq (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    answer TEXT NOT NULL  
);

CREATE TABLE ClassYear (
    id SERIAL PRIMARY KEY,
    "year" VARCHAR(4) NOT NULL
);

CREATE TABLE SchoolDistrict (
    id SERIAL PRIMARY KEY,
    "name" TEXT
);

CREATE TABLE School (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    schooldistrict_id INT NOT NULL,
    FOREIGN KEY (schooldistrict_id) REFERENCES SchoolDistrict (id)
);

CREATE TABLE Class (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    classYear_id INT NOT NULL,
    school_id INT NOT NUll,
    FOREIGN KEY (classYear_id) REFERENCES ClassYear (id),
    FOREIGN KEY (school_id) REFERENCES School (id)
);


CREATE TABLE Teacher (
    id SERIAL PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    "password" TEXT NOT NULL,
    isAdmin BOOLEAN NOT NULL
);

CREATE TABLE Teacher_Class (
    teacher_id INT NOT NULL,
    class_id INT NOT NUll,
    PRIMARY KEY (teacher_id, class_id),
    FOREIGN KEY (teacher_id) REFERENCES Teacher (id),
    FOREIGN KEY (class_id) REFERENCES Class (id)
);

CREATE TABLE SchoolarYear (
    id SERIAL PRIMARY KEY,
    "year" VARCHAR(9) NOT NULL
);

CREATE TABLE School_SchoolarYear (
    school_id INT NOT NULL,
    schoolaryear_id INT NOT NULL,
    PRIMARY KEY (school_id, schoolaryear_id),
    FOREIGN KEY (school_id) REFERENCES School (id),
    FOREIGN KEY (schoolaryear_id) REFERENCES SchoolarYear (id)
);

CREATE TABLE "subject" (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE Subject_Class (
    subject_id INT NOT NULL,
    class_id INT NOT NULL,
    PRIMARY KEY (subject_id, class_id),
    FOREIGN KEY (subject_id) REFERENCES "subject" (id),
    FOREIGN KEY (class_id) REFERENCES Class (id)
);

CREATE TABLE Student (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (id)
);

CREATE TABLE MeasureAggregation (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL
);

CREATE TABLE Measure (
    id SERIAL PRIMARY KEY,
    "name" TEXT NOT NULL,
    aggregation_id INT NOT NULL,
    FOREIGN KEY (aggregation_id) REFERENCES MeasureAggregation (id)
);

CREATE TABLE Efficiency (
    measure_id INT NOT NULL,
    student_id INT NOT NULL,
    PRIMARY KEY (measure_id, student_id),
    FOREIGN KEY (measure_id) REFERENCES Measure (id),
    FOREIGN KEY (student_id) REFERENCES Student (id)
);