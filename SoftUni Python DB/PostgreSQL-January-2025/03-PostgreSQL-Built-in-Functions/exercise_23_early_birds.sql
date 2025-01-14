-- Not included in Judge System

-- Add new column and constraint
ALTER TABLE bookings
    ADD COLUMN early_birds INTERVAL;

-- Set values.
-- Values are set as the following example: 0 years 1 mons 3 days 5 hours 13 mins 9.928 secs
UPDATE bookings
SET early_birds = AGE(starts_at, booked_at);

-- Select desired fields
SELECT user_id,
       -- custom format the column early_birds as desired in the task
       TO_CHAR(early_birds, 'MM "mons" DD "days" HH24:MI:SS.MS') as early_birds
FROM bookings
WHERE early_birds >= INTERVAL '10 months';