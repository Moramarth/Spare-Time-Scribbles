SELECT R.start_point,
       R.end_point,
       R.leader_id,
       CONCAT(C.first_name, ' ', C.last_name) AS leader_name
FROM campers C
         JOIN routes R on C.id = R.leader_id;