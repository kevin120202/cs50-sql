SELECT city, COUNT(*) AS 'Number of schools' FROM schools
WHERE type = 'Public School'
GROUP BY city
ORDER BY "Number of schools" DESC, city LIMIT 10;