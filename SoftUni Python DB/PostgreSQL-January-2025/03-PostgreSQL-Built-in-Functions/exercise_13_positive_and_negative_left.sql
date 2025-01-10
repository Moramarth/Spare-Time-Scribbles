SELECT peak_name,
       LEFT(peak_name, 4) AS positive_left,
       LEFT(peak_name, CASE
                           WHEN LENGTH(peak_name) > 4 THEN LENGTH(peak_name) - 4
                           ELSE 0
           END)           AS negative_left
FROM peaks;