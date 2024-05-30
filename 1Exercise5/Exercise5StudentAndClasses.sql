-- Exercise 5) Students and Classes

CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    unit_number VARCHAR(255),
    postal_code VARCHAR(20),
    city_id INT,
    province_id INT
);

CREATE TABLE University (
    university_id INT PRIMARY KEY,
    university_name VARCHAR(255),
    university_head VARCHAR(255),
    university_email VARCHAR(255),
    location INT,
    FOREIGN KEY (location) REFERENCES Location(location_id)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255),
    department_head VARCHAR(255),
    department_email VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_first_name VARCHAR(255),
    faculty_last_name VARCHAR(255),
    faculty_email VARCHAR(255),
    university_id INT,
    department_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id),
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_first_name VARCHAR(255),
    student_last_name VARCHAR(255),
    student_email VARCHAR(255),
    university_id INT,
    FOREIGN KEY (university_id) REFERENCES University(university_id)
);

CREATE TABLE Class (
    class_id INT PRIMARY KEY,
    class_name VARCHAR(255)
);

CREATE TABLE Semester (
    semester_id INT PRIMARY KEY,
    semester_name VARCHAR(255)
);

CREATE TABLE SemesterClass (
    semester_class_id INT PRIMARY KEY,
    semester_id INT,
    class_id INT,
    FOREIGN KEY (semester_id) REFERENCES Semester(semester_id),
    FOREIGN KEY (class_id) REFERENCES Class(class_id)
);

CREATE TABLE StudentSemesterClass (
    student_semester_class_id INT PRIMARY KEY,
    student_id INT,
    semester_class_id INT,
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (semester_class_id) REFERENCES SemesterClass(semester_class_id)
);

CREATE TABLE FacultySemesterClass (
    faculty_id INT,
    semester_class_id INT,
    PRIMARY KEY (faculty_id, semester_class_id),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (semester_class_id) REFERENCES SemesterClass(semester_class_id)
);

CREATE TABLE ExamStudentGrade (
    exam_type_id INT PRIMARY KEY,
    exam_type VARCHAR(255),
    grade VARCHAR(2),
    student_semester_class_id INT,
    FOREIGN KEY (student_semester_class_id) REFERENCES StudentSemesterClass(student_semester_class_id)
);
