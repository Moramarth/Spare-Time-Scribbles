-- There are cascade operation on table creation, so delete should apply with this single query
DELETE FROM distributors
WHERE LEFT(name, 1) = 'L';