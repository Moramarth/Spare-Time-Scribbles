SELECT peak_name,
       RIGHT(peak_name, 4) AS positive_right,
       RIGHT(peak_name, CASE
                            WHEN LENGTH(peak_name) > 4 THEN LENGTH(peak_name) - 4
                            ELSE 0
           END)            AS negative_right
FROM peaks;