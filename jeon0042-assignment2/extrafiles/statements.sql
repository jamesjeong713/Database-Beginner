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
