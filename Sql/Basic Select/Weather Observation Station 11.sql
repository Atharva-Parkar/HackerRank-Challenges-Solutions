SELECT DISTINCT city FROM station
WHERE city REGEXP '^[^AEIOU].*' OR city REGEXP '.*[^aeiou]$';