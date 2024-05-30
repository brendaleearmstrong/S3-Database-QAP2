CREATE TABLE Province (
    province_code CHAR(2) PRIMARY KEY,
    province_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE City (
    city_id INT PRIMARY KEY,
    city_name VARCHAR(100) NOT NULL,
    province_code CHAR(2),
    FOREIGN KEY (province_code) REFERENCES Province(province_code)
);
