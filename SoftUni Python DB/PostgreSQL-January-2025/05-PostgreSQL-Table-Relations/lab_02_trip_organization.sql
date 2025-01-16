SELECT V.driver_id,
       V.vehicle_type,
       C.first_name || ' ' || C.last_name AS driver_name
FROM campers C
         JOIN vehicles V on C.id = V.driver_id;
