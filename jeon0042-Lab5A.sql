-- Exercise 1. Lab5A Join

SELECT Country.Code, Country.Name
FROM Country INNER JOIN city ON Country.Code = City.CountryCode

--  Exercise 2.
SELECT Country.Code, Country.Name, City.Name
From Country 
LEFT JOIN City 
On country.Code = City.CountryCode WHERE City.CountryCode is NULL;

-- Exercise 3.
SELECT Country.Code, Country.Name, CountryLanguage.CountryCode
From Country 
LEFT JOIN CountryLanguage 
On Country.Code = CountryLanguage.CountryCode WHERE CountryLanguage.CountryCode is NULL;

--Additional Exercises
SELECT Player.PlayerName, Team.TeamName
From player, Team
WHERE Player.PlayerName = Team.TeamName

-- INNER JOIN
SELECT PlayerName, TeamName
From Player
INNER JOIN
PlayerTeam USING( PlayerID )
INNER JOIN
Team USING( TeamID );

-- 