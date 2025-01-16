-- Solution for judge system
CREATE TABLE mountains
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks
(
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    mountain_id INT,
    CONSTRAINT fk_mountain_id
        FOREIGN KEY (mountain_id)
            REFERENCES mountains (id)
            ON DELETE CASCADE
);

-- Add On Delete Cascade on existing tables
ALTER TABLE peaks
    DROP CONSTRAINT fk_peaks_mountains,
    ADD CONSTRAINT fk_mountain_id
        FOREIGN KEY (mountain_id)
            REFERENCES mountains (id)
            ON DELETE CASCADE