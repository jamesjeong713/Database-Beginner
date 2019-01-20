-- Query 1
SELECT * FROM Practice WHERE Part = 'BOLT';
-- Query 2
SELECT * FROM Practice WHERE Material = 'BRASS';
-- Query 3
SELECT * FROM Practice Where Part = 'SCREW' OR Part = 'WASHER'
-- Query 4
SELECT COUNT(*) FROM Practice WHERE Material = 'STEEL';
-- Query 5
SELECT Part, Material
FROM Practice
WHERE Material != ('BRASS');