-- Query 1
SELECT * From country;
-- Query 2
SELECT code, name, continent FROM country;
-- Query 3
SELECT code, name, continent 
FROM country 
ORDER BY name ASC;
-- Query 4
SELECT name, surfacearea 
From country 
ORDER BY surfacearea  DESC;
-- Query 5
SELECT name FROM country WHERE name LIKE '%m';
-- Query 6
SELECT name, lifeexpectancy FROM country 
WHERE lifeexpectancy = (SELECT MAX(lifeexpectancy) FROM country);
-- Query 7
SELECT AVG(LifeExpectancy) FROM country;
-- Query 8
SELECT name, population From city
WHERE population = (SELECT MAX(population) FROM city);
-- Query 9
SELECT name, countrycode From city
WHERE countrycode Like 'CAN';
--query 10 
INSERT INTO city( ID, name, countrycode, district, population ) 
VALUES( 4084, 'Victoria', 'CAN', 'British Columbia', 80032 );
	--Error messages
	ERROR:  duplicate key value violates unique constraint "city_pkey"
	DETAIL:  Key (id)=(4083) already exists.