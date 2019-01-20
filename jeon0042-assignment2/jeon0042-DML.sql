DELETE FROM LogHistory_T;
DELETE FROM Character_T;
DELETE FROM Inventory_T;
DELETE FROM Item_T;
DELETE FROM User_T;
DELETE FROM Level_T;

INSERT INTO User_T VALUES ('UK0000', 'flower001', 'PassWorD@001');
INSERT INTO User_T VALUES ('UK0001', 'weapon123', 'PassWorD@123');
INSERT INTO User_T VALUES ('UK0002', 'armors456', 'PassWorD@45678');
INSERT INTO User_T VALUES ('UK0003', 'prime01', 'PassWorD@4561010');
INSERT INTO User_T VALUES ('UK0004', 'seongyeopjeong012345', 'PassWorD@456222334123');

INSERT INTO Level_T VALUES ('LK0000', '101', '2011-02-15 15:00:00', '2011-02-18 17:00:00');
INSERT INTO Level_T VALUES ('LK0001', '43', '2011-02-15 15:00:00', '2011-02-15 17:00:00');
INSERT INTO Level_T VALUES ('LK0002', '12', '2011-02-15 15:00:00', '2011-02-15 20:13:57');
INSERT INTO Level_T VALUES ('LK0003', '33', '2011-02-15 15:00:00', '2011-02-15 19:34:31');
INSERT INTO Level_T VALUES ('LK0004', '170', '2011-02-15 15:00:00', '2011-02-15 16:50:11');

INSERT INTO Item_T VALUES ('I00001', 'Healing Potion', 'FALSE', 'Red potion for healing user', '10', '1', 'portion', 'NULL');
INSERT INTO Item_T VALUES ('I00002', 'Mana Potion', 'FALSE', 'Blue potion for fill up mana of user', '15', '1', 'potion', 'NULL');
INSERT INTO Item_T VALUES ('I00003', 'Red wolf Katana Sword', 'TRUE', 'red potion for healing user', '100', '3', 'weapon', 'HAND');
INSERT INTO Item_T VALUES ('I00004', 'Blood Lance', 'TRUE', 'This lance looks creepy due to the color of blood', '150', '3', 'weapon', 'HAND');
INSERT INTO Item_T VALUES ('I00005', 'Armor for beginner', 'FALSE', 'It is armor for beginner', '0', '4', 'armor', 'BODY');

INSERT INTO Inventory_T VALUES ('IN000000', 'I00001', '2500', '20', 'TRUE' ); -- '2011-02-16 13:00:00'
INSERT INTO Inventory_T VALUES ('IN000001', 'I00001', '12500', '20', 'TRUE'); -- '2011-02-15 16:00:00'
INSERT INTO Inventory_T VALUES ('IN000002', 'I00002', '455500', '20', 'FALSE'); -- '2011-02-16 12:00:00'
INSERT INTO Inventory_T VALUES ('IN000003', 'I00002', '35200', '20', 'TRUE'); -- '2011-02-15 17:00:00'
INSERT INTO Inventory_T VALUES ('IN000004', 'I00003', '224100', '20', 'FALSE'); -- '2011-02-15 16:00:00'
INSERT INTO Inventory_T VALUES ('IN000005', 'I00004', '1344', '20', 'FALSE'); -- '2011-02-15 16:00:00'
INSERT INTO Inventory_T VALUES ('IN000006', 'I00004', '167430', '20', 'FALSE'); -- '2011-02-15 16:00:00'
INSERT INTO Inventory_T VALUES ('IN000007', 'I00005', '241563', '20', 'FALSE'); -- '2011-02-15 16:00:00'
INSERT INTO Inventory_T VALUES ('IN000008', 'I00003', '21123', '20', 'FALSE'); -- '2011-02-15 16:00:00'

INSERT INTO Character_T VALUES ('CK000000', 'Cseongyeop001', 'WAR', 'FALSE', 'UK0000', 'LK0000', 'IN000000');
INSERT INTO Character_T VALUES ('CK000001', 'Cseongyeop002', 'KNI', 'TRUE', 'UK0001', 'LK0001', 'IN000001');
INSERT INTO Character_T VALUES ('CK000002', 'Cjinsu001', 'MAG', 'FALSE', 'UK0002', 'LK0002', 'IN000002');
INSERT INTO Character_T VALUES ('CK000003', 'Csamsung001', 'WAR', 'FALSE', 'UK0003', 'LK0003', 'IN000003');
INSERT INTO Character_T VALUES ('CK000004', 'Clg001', 'ARC', 'TRUE', 'UK0004', 'LK0004', 'IN000004');

INSERT INTO LogHistory_T VALUES ('LH000001', 'CK000000', 'IN000000', '2011-02-15 15:00:00', '2011-02-19 17:00:00');
INSERT INTO LogHistory_T VALUES ('LH000002', 'CK000001', 'IN000001', '2011-02-15 15:00:00', '2011-02-15 17:50:11');
INSERT INTO LogHistory_T VALUES ('LH000003', 'CK000002', 'IN000002', '2011-02-15 15:00:00', '2011-02-16 16:50:17');
INSERT INTO LogHistory_T VALUES ('LH000004', 'CK000003', 'IN000003', '2011-02-15 15:00:00', '2011-02-15 19:50:13');
INSERT INTO LogHistory_T VALUES ('LH000005', 'CK000004', 'IN000004', '2011-02-15 15:00:00', '2011-02-15 17:00:00');

-- Simple statement Using SELECT and WHERE; What gender do users prefer to play as warrior?
SELECT 
	Char_Gender, 
    Char_Job
FROM 
	Character_T 
WHERE 
	Character_T.Char_Job LIKE 'WAR'
	
-- Simple statement Using SELECT and WHERE; Time of activity with each level of user	
SELECT 
	Level_Value, 
	Level_DateStart, 
    Level_DateEnd, 
    (Level_DateEnd - Level_DateStart) AS TotalTime
FROM 
	 Level_T
WHERE
	Level_T.Level_DateEnd BETWEEN '2011-02-15 18:00:00' AND '2011-02-15 23:59:59' 

-- Simple statement Using SELECT and WHERE; How many items can it be disasemble?
SELECT 
	Item_Name, Item_Disassemble
FROM
	Item_T
WHERE
	Item_Disassemble = true;
	
	
	
-- SUB QUERY 1: LEFT 
SELECT 
	Character_T.Char_Name, Inventory_T.Inven_Money
FROM 
	Character_T LEFT OUTER JOIN Inventory_T
ON
	Character_T.Inven_ID = Inventory_T.Inven_ID 
    WHERE Inventory_T.Inven_Money BETWEEN 10000 AND 120000
	
-- SUB QUERY 2: RIGHT JOINS; What kind of items do users have? with level. 
SELECT 
	Character_T.Char_Name, Item_T.Item_Name
FROM 
	Character_T 
    RIGHT OUTER JOIN Inventory_T
ON
	Character_T.Inven_ID = Inventory_T.Inven_ID
	RIGHT OUTER JOIN Item_T
ON
	Inventory_T.Item_ID = Item_T.Item_ID WHERE Char_Name IS NOT NULL
	
	
-- UNION 
SELECT User_ID, User_Name
FROM User_T
	UNION
SELECT Char_ID, Char_Name
FROM Character_T;