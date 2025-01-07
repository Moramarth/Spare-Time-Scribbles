CREATE TABLE IF NOT EXISTS employees
(
    id             SERIAL PRIMARY KEY NOT NULL,
    first_name     VARCHAR(30),
    last_name      VARCHAR(50),
    hiring_date    DATE DEFAULT '2023-01-01',
    salary         NUMERIC(10, 2),
    devices_number INTEGER
);

CREATE TABLE IF NOT EXISTS departments
(
    id          SERIAL PRIMARY KEY NOT NULL,
    name        VARCHAR(50),
    code        CHAR(3),
    description TEXT

);

CREATE TABLE IF NOT EXISTS issues
(
    id          SERIAL PRIMARY KEY UNIQUE,
    description VARCHAR(150),
    date        DATE,
    start       TIMESTAMP
);