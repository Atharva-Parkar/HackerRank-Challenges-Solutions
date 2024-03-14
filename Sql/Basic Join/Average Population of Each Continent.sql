SELECT DISTINCT country.continent, FLOOR(AVG(city.population)) FROM city
JOIN country ON city.countrycode = country.code
GROUP BY country.continent;