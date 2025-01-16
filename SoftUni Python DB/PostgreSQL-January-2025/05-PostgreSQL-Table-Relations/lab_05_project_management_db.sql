CREATE DATABASE project_management;

CREATE TABLE clients
(
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees
(
    id         SERIAL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name  VARCHAR(30),
    project_id INT
);

CREATE TABLE projects
(
    id              SERIAL PRIMARY KEY,
    client_id       INT,
    project_lead_id INT,
    CONSTRAINT fk_clients
        FOREIGN KEY (client_id)
            REFERENCES clients (id),
    CONSTRAINT fk_employees
        FOREIGN KEY (project_lead_id)
            REFERENCES employees (id)
);

ALTER TABLE employees
    ADD CONSTRAINT fk_projects
        FOREIGN KEY (project_id)
            REFERENCES projects (id);



