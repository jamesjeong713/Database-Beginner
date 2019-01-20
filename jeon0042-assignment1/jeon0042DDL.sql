-- DROP VIEW LIST
DROP VIEW IF EXISTS Country_V;
DROP VIEW IF EXISTS Product_V;
-- DROP TABLE LIST 
DROP TABLE IF EXISTS Invoice_Line_T;
DROP TABLE IF EXISTS Product_T;
DROP TABLE IF EXISTS Invoice_T;
DROP TABLE IF EXISTS Customer_T;
DROP TABLE IF EXISTS City_T;
DROP TABLE IF EXISTS Country_T;
/* When I changed the order in the drop table list, it caused some error messages below
ERROR:  cannot drop table invoice_t because other objects depend on it
DETAIL:  constraint fk1_invoice_line on table invoice_line_t depends on table invoice_t
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
********** Error **********

ERROR: cannot drop table invoice_t because other objects depend on it
SQL state: 2BP01
Detail: constraint fk1_invoice_line on table invoice_line_t depends on table invoice_t
Hint: Use DROP ... CASCADE to drop the dependent objects too. */

-- country table
CREATE TABLE Country_T (
Country_code CHAR( 3 ), 
Country_name VARCHAR( 30 ) NOT NULL,
Country_Population INTEGER, 
CONSTRAINT PK_Country_code PRIMARY KEY( Country_code )
);

-- city table
CREATE TABLE CITY_T (
City_ID INTEGER,
City_Name VARCHAR( 30 ),
Country_Code NCHAR( 3 ),
City_Population INTEGER,
CONSTRAINT PK_City PRIMARY KEY( City_ID ),
CONSTRAINT FK_City FOREIGN KEY( Country_code ) REFERENCES COUNTRY_T( Country_code )

);


CREATE TABLE Customer_T (
Cust_Id CHAR( 4 ),
Cust_Fname VARCHAR( 30 ) NULL,
Cust_Lname VARCHAR( 30 ) NOT NULL,
Cust_Phone VARCHAR( 15 ) NOT NULL,
Cust_Address VARCHAR( 20 ) NOT NULL,
Cust_City VARCHAR( 15 ) NOT NULL,
Cust_Prov CHAR( 2 ) NULL,
Cust_PostCode CHAR( 6 ) NOT NULL,
Cust_Balance DECIMAL( 9,2 ), 
Cust_Country CHAR( 3 ),
CONSTRAINT PK_Customer PRIMARY KEY( Cust_Id ),
CONSTRAINT FK_Customoer_T FOREIGN KEY( Cust_Country ) REFERENCES Country_T( Country_Code ) -- new one
);

CREATE TABLE Invoice_T (
Invoice_Number CHAR( 6 ),
Cust_Id CHAR( 4 ) NOT NULL,
Invoice_Date DATE,
CONSTRAINT PK_Invoice PRIMARY KEY( Invoice_Number ),
CONSTRAINT FK_Cust_ID FOREIGN KEY( Cust_Id ) REFERENCES Customer_T( Cust_ID )
);

CREATE TABLE Product_T (
Prod_Code CHAR( 5 ),
Prod_Description VARCHAR( 60 ) NOT NULL,
Prod_Indate DATE NOT NULL,
Prod_QOH INTEGER NOT NULL,
Prod_Min INTEGER,
Prod_Price DECIMAL( 5,2 ) NOT NULL,
Prod_Discount INTEGER,
Prod_CountryOrigin CHAR( 3 ),
CONSTRAINT PK_Product PRIMARY KEY( Prod_Code ),
CONSTRAINT FK_Product_T FOREIGN KEY(Prod_CountryOrigin) REFERENCES Country_T( Country_Code )
);

CREATE TABLE Invoice_Line_T (
Invoice_Number CHAR( 6 ),
Invoice_Line INTEGER,
Prod_Code CHAR( 5 ) NOT NULL,
Line_units INTEGER NOT NULL,
Line_Price DECIMAL( 5,2 ) NOT NULL,
CONSTRAINT PK_Invoice_Line PRIMARY KEY( Invoice_Number, Invoice_Line ),
CONSTRAINT FK1_Invoice_Line FOREIGN KEY( Invoice_Number ) REFERENCES Invoice_T( Invoice_Number ),
CONSTRAINT FK2_Invoice_Line FOREIGN KEY( Prod_Code ) REFERENCES Product_T( Prod_Code )
);

-- Creating first View 'Country_V'
CREATE VIEW Country_V AS
SELECT Country_code, Country_Population
FROM Country_T
WHERE Country_Population > (SELECT AVG(Country_Population) FROM Country_T);
-- Creating second view 'Product_V'
CREATE VIEW Product_V AS
SELECT Prod_code, Prod_Description, Prod_Price
FROM Product_T
WHERE Prod_price < (SELECT AVG(Prod_price) FROM Product_T);
