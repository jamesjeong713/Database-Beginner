/* -- DDL
SET ROLE web;

-- create views for listing tables and databases
DROP VIEW IF EXISTS view_tables;
DROP VIEW IF EXISTS view_databases;
DROP VIEW IF EXISTS view_views;
DROP VIEW IF EXISTS view_indexes;

CREATE VIEW view_tables AS
    SELECT tablename AS table, tableowner AS owner FROM pg_tables WHERE schemaname = 'public';
CREATE VIEW view_databases AS
    SELECT datname AS database FROM pg_database WHERE datname NOT IN ('template1', 'template0', 'postgres');
CREATE VIEW view_views AS
    SELECT viewname AS view, viewowner as owner, definition FROM pg_views WHERE schemaname = 'public';
CREATE VIEW view_indexes AS
    SELECT class.relname AS index, roles.rolname AS owner FROM pg_class AS class
        JOIN pg_roles AS roles ON roles.oid = class.relowner
        WHERE class.relkind = 'i' AND class.relnamespace =
            (SELECT oid FROM pg_namespace WHERE nspname = 'public'); 
 */
-- country table
/* DROP TABLE IF EXISTS Country;
CREATE TABLE Country (
  Cntry_Code TEXT NOT NULL default '',
  Name TEXT NOT NULL default '',
  Continent TEXT NOT NULL default 'Asia',
  Region TEXT NOT NULL default '',
  SurfaceArea NUMERIC(12,2) NOT NULL default '0.00',
  IndepYear INTEGER default NULL,
  Population INTEGER NOT NULL default '0',
  LifeExpectancy NUMERIC(4,1) default NULL,
  GNP NUMERIC default NULL,
  GNPOld NUMERIC default NULL,
  LocalName TEXT NOT NULL default '',
  GovernmentForm TEXT NOT NULL default '',
  HeadOfState TEXT default NULL,
  Capital INTEGER default NULL,
  Code2 TEXT NOT NULL default ''
);
 */
 DROP VIEW IF EXISTS ViewTables_V;
 
 CREATE VIEW ViewTables_V AS
    SELECT tablename AS table, tableowner AS owner FROM pg_tables WHERE schemaname = 'public';
--country table
DROP TABLE IF EXISTS CITY_T;
DROP TABLE IF EXISTS COUNTRY_T;

CREATE TABLE COUNTRY_T (
Country_code CHAR( 3 ), 
Country_name VARCHAR( 30 ) NOT NULL,
Country_Population INTEGER, 
CONSTRAINT PK_Country_code PRIMARY KEY( Country_code )
   )
   
--city table
CREATE TABLE CITY_T (
City_ID INTEGER,
City_Name VARCHAR( 30 ),
Country_Code NCHAR( 3 ),
City_Population INTEGER,
CONSTRAINT FK_CITY FOREIGN KEY( Country_code ) REFERENCES COUNTRY_T( Country_code )
)

--customer key>>????
CREATE TABLE Customer_T (
Cust_ID INTEGER,
Cust_FName VARCHAR( 30 ),
Cust_LName VARCHAR( 30 ),
Cust_City VARCHAR( 20 ), 
Cust_Country INTEGER, --(?)
CONSTRAINT FK_Customoer_T FOREIGN KEY( Cust_Country ) REFERENCES COUNTRY_T( Country_Code )
)

--Product_T
CREATE TABLE  Product_T (
Prod_Code CHAR( 5 )
Prod_Country_Origin VARCHAR( 30 ),
CONSTRAINT FK_Product_T FOREIGN KEY(Prod_Country_Origin) REFERENCES COUNTRY_T( Country_T )
)
