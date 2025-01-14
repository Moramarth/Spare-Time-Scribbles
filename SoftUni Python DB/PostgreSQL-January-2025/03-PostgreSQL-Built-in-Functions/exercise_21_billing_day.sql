-- Add a column with default value
ALTER TABLE bookings
    -- Values are set as the following example: 2025-01-14 16:56:17.246496 +00:00
    ADD COLUMN billing_day TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP;

-- Select billing day with custom format
SELECT TO_CHAR(billing_day,'DD "Day" MM "Month" YYYY "Year" HH24:MI:SS') AS "Billing Day"
FROM bookings;