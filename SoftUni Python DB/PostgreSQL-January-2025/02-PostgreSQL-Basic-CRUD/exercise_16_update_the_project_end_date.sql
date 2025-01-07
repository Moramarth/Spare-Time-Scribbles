UPDATE projects
SET end_date = start_date + INTERVAL '1 month' * 5
WHERE end_date IS NULL;