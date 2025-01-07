SELECT C.name || ' ' || C.state AS "Cities Information",
       C.area                   AS "Area (km2)"
FROM cities C
ORDER BY id;