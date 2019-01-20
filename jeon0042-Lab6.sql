-- Q1
SELECT * from information_schema.columns
WHERE table_name='city';

SELECT * from information_schema.columns 
WHERE table_name = 'country';

-- Q2
SELECT city.countrycode, country.name AS country, city.name AS city, city.population 
FROM city, country
WHERE city.countrycode=country.code AND country.name LIKE 'Canada'

-- Q3 Explicit JOIN
SELECT city.countrycode, country.name AS country, city.name AS city, city.population
FROM city JOIN country
ON city.countrycode=country.code AND country.name LIKE 'Canada'

-- Q4
SELECT 
	country.name AS country, 
    city.name AS city, 
    city.population
FROM 
	city JOIN country
ON 
	city.countrycode = country.code 
WHERE 
	(city.population BETWEEN 200000 AND 300000) 
     AND (country.name LIKE 'Canada')


-- Q5 task 1
SELECT 
	country.name, 
    SUM(city.population) 
FROM 
	city JOIN country
ON
	country.code=city.countrycode
WHERE
	city.countrycode IN ('CMR', 'CUB', 'JAM')
GROUP BY
	country.name;
-- task 2
SELECT 
	country.name, 
    SUM(city.population) 
FROM 
	city JOIN country
ON
	country.code=city.countrycode
WHERE
	city.countrycode IN ('ECU', 'HTI', 'FRA')
GROUP BY
	country.name
ORDER BY
	country.name;

-- Q6
DROP VIEW IF EXISTS Avg_V;

CREATE VIEW Avg_V AS 
SELECT name, population
FROM country
WHERE population < (SELECT AVG(population) FROM country)
ORDER BY name DESC;

-- Q7_first solution
SELECT name 
FROM 
	country 
WHERE
	country.code LIKE (SELECT countrycode from city WHERE name LIKE 'Zukovski')	
-- Q7_second solution
SELECT country.name 
FROM 
	city JOIN country
ON
	country.code = city.countrycode	
WHERE
	country.code LIKE 'Zukovski'
	
-- Q8_first
SELECT * FROM city LIMIT 10;
-- Q8_second
SELECT * FROM city LIMIT 10 OFFSET 10;

-- Q9_first
SELECT 
	countrycode, 
    count(*)
FROM 
	city
GROUP BY 
	countrycode
HAVING 
	count(*) > 200;
-- Q9_second
SELECT 
	country.name, 
    count(*)
FROM 
	city JOIN country
    ON
    city.countrycode = country.code
GROUP BY 
	country.name
HAVING 
	count(*) > 200;