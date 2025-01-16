CREATE TABLE item_types
(
    id             SERIAL PRIMARY KEY,
    item_type_name VARCHAR(30)
);

CREATE TABLE items
(
    id           SERIAL PRIMARY KEY,
    item_name    VARCHAR,
    item_type_id INT,
    FOREIGN KEY (item_type_id)
        REFERENCES item_types (id)
);
CREATE TABLE cities
(
    id        SERIAL PRIMARY KEY,
    city_name VARCHAR
);

CREATE TABLE customers
(
    id            SERIAL PRIMARY KEY,
    customer_name VARCHAR,
    birthday      DATE,
    city_id       INT,
    FOREIGN KEY (city_id)
        REFERENCES cities (id)
);

CREATE TABLE orders
(
    id          SERIAL PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
);


CREATE TABLE order_items
(
    order_id INT,
    item_id  INT,
    PRIMARY KEY (order_id, item_id),
    FOREIGN KEY (order_id)
        REFERENCES orders (id),
    FOREIGN KEY (item_id)
        REFERENCES items (id)
);
