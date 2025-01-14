WITH UTC_time AS (SELECT booked_at AT TIME ZONE 'UTC' AS booked_at_utc
                  FROM bookings)
SELECT EXTRACT(year FROM booked_at_utc)            AS "YEAR",
       EXTRACT(month FROM booked_at_utc)           AS "MONTH",
       EXTRACT(day FROM booked_at_utc)             AS "DAY",
       EXTRACT(hour FROM booked_at_utc)            AS "HOUR",
       EXTRACT(minute FROM booked_at_utc)          AS "MINUTE",
       CEILING(EXTRACT(second FROM booked_at_utc)) AS "SECOND"

FROM UTC_time;