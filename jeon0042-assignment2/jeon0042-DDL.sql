DROP TABLE IF EXISTS User_T CASCADE;
DROP TABLE IF EXISTS Level_T CASCADE;
DROP TABLE IF EXISTS Item_T CASCADE;
DROP TABLE IF EXISTS Inventory_T CASCADE;
DROP TABLE IF EXISTS Character_T CASCADE;
DROP TABLE IF EXISTS LoginHistory_T CASCADE;

CREATE TABLE User_T (
User_ID CHAR( 6 ),
User_Name VARCHAR( 64 ) NOT NULL,
User_Password VARCHAR( 64 ) NOT NULL,
CONSTRAINT PK_User PRIMARY KEY( User_ID )
);

CREATE TABLE Level_T (
Level_ID CHAR( 6 ),
Level_Value CHAR( 5 ) NOT NULL,
Level_DateStart TIMESTAMP, 
Level_DateEnd TIMESTAMP,
CONSTRAINT PK_Level PRIMARY KEY( Level_ID )
);

CREATE TABLE Item_T (
Item_ID CHAR( 6 ),
Item_Name VARCHAR( 64 ) NOT NULL, 
Item_Disassemble BOOLEAN NOT NULL,
Item_Description VARCHAR( 255 ),
Item_StandPrice VARCHAR( 8 ),
Item_Size CHAR( 1 ),
Item_Code VARCHAR( 10 ) NOT NULL, -- can be weapon / amor / potion etc
Item_Part VARCHAR( 10 ) NULL, -- can be Shoulder, hand, leg	
CONSTRAINT PK_Item PRIMARY KEY( Item_ID )
);

CREATE TABLE Inventory_T (
Inven_ID CHAR( 8 ), 
Item_ID CHAR( 6 ) NOT NULL,
Inven_Money INTEGER NOT NULL,
Inven_Size CHAR( 2 ), 
Inven_Transactions BOOLEAN NOT NULL,
CONSTRAINT PK_Inventory PRIMARY KEY( Inven_ID ),
CONSTRAINT FK_Inventory FOREIGN KEY( Item_ID ) REFERENCES Item_T( Item_ID )
);

CREATE TABLE Character_T (
Char_ID CHAR( 8 ),
Char_Name VARCHAR ( 64 ) NOT NULL,
Char_Job CHAR( 3 ) NOT NULL,
Char_Gender BOOLEAN NOT NULL,
User_ID CHAR( 6 ) NOT NULL,
Level_ID CHAR( 6 ) NOT NULL,
Inven_ID CHAR( 8 ) NOT NULL,	
CONSTRAINT PK_Character PRIMARY KEY( Char_ID ),
CONSTRAINT FK1_Character FOREIGN KEY( User_ID ) REFERENCES User_T( User_ID ),
CONSTRAINT FK2_Character FOREIGN KEY( Level_ID ) REFERENCES Level_T( Level_ID ),
CONSTRAINT FK3_Character FOREIGN KEY( Inven_ID ) REFERENCES Inventory_T( Inven_ID )
);

CREATE TABLE LogHistory_T (
Log_ID CHAR( 8 ),
Char_ID CHAR( 8 ) NOT NULL,
Inven_ID CHAR( 8 ) NOT NULL,
Log_InTime TIMESTAMP,
Log_OutTime TIMESTAMP,
CONSTRAINT PK1_LogHistory PRIMARY KEY( Log_ID ),
CONSTRAINT FK1_LoginHistory FOREIGN KEY( Char_ID ) REFERENCES Character_T( Char_ID ),
CONSTRAINT FK2_LoginHistory FOREIGN KEY( Inven_ID ) REFERENCES Inventory_T( Inven_ID )
);

-- INDEX One for Level
DROP INDEX IF EXISTS Level_IDX;
CREATE INDEX Level_IDX ON Level_T (Level_ID, Level_Value);

-- INDEX Two for Character
DROP INDEX IF EXISTS Character_IDX;
CREATE INDEX Character_IDX ON Character_T (Char_ID, Char_Gender);


-- First VIEW; to figure out how much do users have money
DROP VIEW IF EXISTS UserMoney_V;

CREATE VIEW UserMoney_V AS 
SELECT Inventory_T.Inven_Money, Character_T.Char_Name
FROM Inventory_T JOIN Character_T
ON Character_T.Inven_ID = Inventory_T.Inven_ID
WHERE Inven_Money <= (SELECT MAX(Inven_Money) FROM Inventory_T)
ORDER BY Inven_Money DESC;

-- Second VIEW; to figure out total money in game
DROP VIEW IF EXISTS TotalMoney_V;

CREATE VIEW TotalMoney_V AS 
SELECT SUM(Inven_Money) AS SumMoney
FROM Inventory_T

