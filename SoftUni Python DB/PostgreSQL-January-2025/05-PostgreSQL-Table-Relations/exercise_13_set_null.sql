CREATE TABLE customers
(
    id            SERIAL PRIMARY KEY,
    customer_name VARCHAR
);

CREATE TABLE contacts
(
    id           SERIAL PRIMARY KEY,
    contact_name VARCHAR,
    phone        VARCHAR,
    email        VARCHAR,
    customer_id  INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

INSERT INTO customers (customer_name)
VALUES ('BlueBird Inc'),
       ('Dolphin LLC');

INSERT INTO contacts (contact_name, phone, email, customer_id)
VALUES ('John Doe', '(408)-111-1234', 'john.doe@bluebird.dev', 1),
       ('Jane Doe', '(408)-111-1235', 'jane.doe@bluebird.dev', 1),
       ('David Wright', '(408)-222-1234', 'david.wright@dolphin.dev', 2);

DELETE
FROM customers
WHERE id = 1;