-- User Table
CREATE TABLE AppUser (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) NOT NULL
);

-- EmailType Table
CREATE TABLE EmailType (
    email_type_id INT PRIMARY KEY,
    type VARCHAR(50) NOT NULL
);

-- Email Table
CREATE TABLE Email (
    email_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    email_type_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES AppUser(user_id),
    FOREIGN KEY (email_type_id) REFERENCES EmailType(email_type_id)
);

-- Genre Table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Author Table
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);

-- UserGenre Table
CREATE TABLE UserGenre (
    user_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (user_id, genre_id),
    FOREIGN KEY (user_id) REFERENCES AppUser(user_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- UserAuthor Table
CREATE TABLE UserAuthor (
    user_id INT NOT NULL,
    author_id INT NOT NULL,
    PRIMARY KEY (user_id, author_id),
    FOREIGN KEY (user_id) REFERENCES AppUser(user_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
