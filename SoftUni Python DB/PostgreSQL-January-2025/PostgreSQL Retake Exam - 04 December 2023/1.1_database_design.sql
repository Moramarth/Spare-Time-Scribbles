CREATE TABLE IF NOT EXISTS countries
(
    id   INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS customers
(
    id           INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name   VARCHAR(25) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    gender       CHAR(1) CHECK (gender = 'M' OR gender = 'F'),
    age          INT         NOT NULL CHECK ( age > 0 ),
    phone_number CHAR(10) NOT NULL,
    country_id   INT         NOT NULL REFERENCES countries
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name        VARCHAR(25)    NOT NULL,
    description VARCHAR(250),
    recipe      TEXT,
    price       NUMERIC(10, 2) NOT NULL CHECK ( price > 0 )
);

CREATE TABLE IF NOT EXISTS feedbacks
(
    id          INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    description VARCHAR,
    rate        NUMERIC(4, 2) CHECK ( rate BETWEEN 0 AND 10),
    product_id  INT NOT NULL REFERENCES products
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    customer_id INT NOT NULL REFERENCES customers
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS distributors
(
    id         INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name       VARCHAR(25)  NOT NULL UNIQUE,
    address    VARCHAR(30)  NOT NULL,
    summary    VARCHAR(200) NOT NULL,
    country_id INT          NOT NULL REFERENCES countries
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ingredients
(
    id             INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name           VARCHAR(30) NOT NULL,
    description    VARCHAR(200),
    country_id     INT         NOT NULL REFERENCES countries
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    distributor_id INT         NOT NULL REFERENCES distributors
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products_ingredients
(
    product_id    INT REFERENCES products
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    ingredient_id INT REFERENCES ingredients
        ON UPDATE CASCADE
        ON DELETE CASCADE
);