-- Exercise 3) Publication Usage 

-- Publication Table

CREATE TABLE Publication (
    pub_id INT PRIMARY KEY,
    pub_title VARCHAR(100) NOT NULL,
    last_rev DATE NOT NULL
);

-- MonthlyUsage Table

CREATE TABLE MonthlyUsage (
    monthly_usage_id INT PRIMARY KEY,
    month DATE NOT NULL,
    pub_id INT NOT NULL,
    FOREIGN KEY (pub_id) REFERENCES Publication(pub_id)
);

-- DailyUsage Table

CREATE TABLE DailyUsage (
    daily_usage_id INT PRIMARY KEY,
    date DATE NOT NULL,
    usage INT NOT NULL,
    monthly_usage_id INT NOT NULL,
    FOREIGN KEY (monthly_usage_id) REFERENCES MonthlyUsage(monthly_usage_id)
);
