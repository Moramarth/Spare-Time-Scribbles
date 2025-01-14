-- Creating the initial table
CREATE TABLE bookings_calculation AS
SELECT booked_for
FROM bookings
WHERE apartment_id = 93;

-- Adding extra columns
ALTER TABLE bookings_calculation
    ADD COLUMN multiplication NUMERIC,
    ADD COLUMN modulo         NUMERIC;

-- Update new columns for all rows
UPDATE bookings_calculation
SET multiplication = booked_for * 50,
    modulo         = booked_for % 50;

-- Get the results from DB
SELECT booked_for, multiplication, modulo
FROM bookings_calculation;