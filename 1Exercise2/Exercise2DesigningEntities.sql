-- Exercise 2: Designing Entities

-- 1. A student at a university

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    enrollment_year DATE NOT NULL,
    major VARCHAR(100)
);

-- 2. A faculty member at a university

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    hire_date DATE NOT NULL,
    position VARCHAR(100) NOT NULL
);

CREATE TABLE Gallery (
    gallery_id INT PRIMARY KEY,
    gallery_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);

CREATE TABLE ArtWork (
    artwork_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    artist VARCHAR(100) NOT NULL,
    year_created DATE,
    type VARCHAR(50),
    gallery_id INT,
    FOREIGN KEY (gallery_id) REFERENCES Gallery(gallery_id)
);

-- 4. An automobile that is registered with the Motor Vehicle Department

CREATE TABLE Owner (
    owner_id INT PRIMARY KEY,
    owner_name VARCHAR(100) NOT NULL,
    address VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(20),
    postal_code VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE Automobile (
    vin CHAR(17) PRIMARY KEY,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year INT NOT NULL,
    color VARCHAR(50) NOT NULL,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES Owner(owner_id)
);

-- 5. A pizza that is on the menu at a restaurant

CREATE TABLE Pizza (
    pizza_id INT PRIMARY KEY,
    pizza_name VARCHAR(100) NOT NULL,
    size VARCHAR(50) NOT NULL,
    price DECIMAL(5, 2) NOT NULL
);

-- 6. Household furniture

CREATE TABLE Furniture (
    furniture_id INT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    furniture_name VARCHAR(100) NOT NULL,
    type VARCHAR(50) NOT NULL,
    material VARCHAR(50),
    room VARCHAR(50)
);