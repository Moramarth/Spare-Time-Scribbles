CREATE TABLE countries
(
    id        SERIAL PRIMARY KEY,
    name      VARCHAR(40) NOT NULL UNIQUE,
    continent VARCHAR(40) NOT NULL,
    currency  VARCHAR(5)
);

CREATE TABLE categories
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE actors
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(50)   NOT NULL,
    last_name  VARCHAR(50)   NOT NULL,
    birthdate  DATE          NOT NULL,
    height     INT,
    awards     INT DEFAULT 0 NOT NULL CHECK ( awards >= 0 ),
    country_id INT           NOT NULL,
    FOREIGN KEY (country_id)
        REFERENCES countries (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE productions_info
(
    id            SERIAL PRIMARY KEY,
    rating        NUMERIC(4, 2)         NOT NULL,
    duration      INT                   NOT NULL CHECK ( duration > 0),
    budget        NUMERIC(10, 2),
    release_date  DATE                  NOT NULL,
    has_subtitles BOOLEAN DEFAULT FALSE NOT NULL,
    synopsis      TEXT
);

CREATE TABLE productions
(
    id                 SERIAL PRIMARY KEY,
    title              VARCHAR(70) NOT NULL UNIQUE,
    country_id         INT         NOT NULL,
    production_info_id INT         NOT NULL UNIQUE,
    FOREIGN KEY (country_id)
        REFERENCES countries (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (production_info_id)
        REFERENCES productions_info (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE productions_actors
(
    production_id INT NOT NULL,
    actor_id      INT NOT NULL,
    PRIMARY KEY (production_id, actor_id),
    FOREIGN KEY (production_id)
        REFERENCES productions (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (actor_id)
        REFERENCES actors (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE categories_productions
(
    category_id   INT NOT NULL,
    production_id INT NOT NULL,
    PRIMARY KEY (category_id, production_id),
    FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (production_id)
        REFERENCES productions (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);