CREATE TABLE IF NOT EXISTS accounts
(
    id        INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username  VARCHAR(30) NOT NULL UNIQUE,
    password  VARCHAR(30) NOT NULL,
    email     VARCHAR(50) NOT NULL,
    gender    CHAR(1)     NOT NULL CHECK (gender = 'M' OR gender = 'F'),
    age       INT         NOT NULL,
    job_title VARCHAR(40) NOT NULL,
    ip        VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS addresses
(
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street     VARCHAR(30) NOT NULL,
    town       VARCHAR(30) NOT NULL,
    country    VARCHAR(30) NOT NULL,
    account_id INT         NOT NULL REFERENCES accounts
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS photos
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    description  TEXT,
    capture_date TIMESTAMP NOT NULL,
    views        INT       NOT NULL DEFAULT 0 CHECK (views >= 0)
);

CREATE TABLE IF NOT EXISTS comments
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    content      VARCHAR   NOT NULL,
    published_on TIMESTAMP NOT NULL,
    photo_id     INT       NOT NULL REFERENCES photos
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS accounts_photos
(
    account_id INT NOT NULL REFERENCES accounts
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    photo_id   INT NOT NULL REFERENCES photos
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    PRIMARY KEY (account_id, photo_id)
);

CREATE TABLE IF NOT EXISTS likes
(
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    photo_id   INT NOT NULL REFERENCES photos
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    account_id INT NOT NULL REFERENCES accounts
        ON UPDATE CASCADE
        ON DELETE CASCADE
);