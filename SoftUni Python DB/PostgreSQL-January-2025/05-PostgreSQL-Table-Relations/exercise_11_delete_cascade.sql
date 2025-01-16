ALTER TABLE countries
    ADD CONSTRAINT curr_code
        FOREIGN KEY (currency_code)
            REFERENCES currencies (currency_code)
            ON DELETE CASCADE,
    ADD CONSTRAINT cont_code
        FOREIGN KEY (continent_code)
            REFERENCES continents (continent_code)
            ON DELETE CASCADE
