-- Query 1
SELECT Part, Material, Cost FROM Part_T;
-- Query 2
SELECT Part, Material, Cost 
FROM Part_T
WHERE Cost > 2.10;
-- Query 3
SELECT AVG(Cost)
FROM Part_T
WHERE Part = 'SCREW';
-- Query 4
SELECT SUBSTRING(Material FROM 1 FOR 5) FROM Part_T;
-- Query 5
INSERT INTO Part_T(Part, Material, Size, Cost)
VALUES ('HAMMER', 'STEEL', 'SMALL', 7.15);