SELECT ROUND(AVG(lat_n),4) AS median
FROM
    (
        SELECT lat_n, ROW_NUMBER() OVER (ORDER BY lat_n) AS row_num, COUNT(*) OVER () AS total_rows FROM station
    ) 
WHERE
    row_num IN (CEIL(total_rows / 2));
