-- Filename: LearnTrig-DDL.sql

-- DROP TRIGGER first becuase TRIGGER uses FUNCTION
DROP TRIGGER IF EXISTS Emp_Last_Name_Change ON Employee;
DROP FUNCTION IF EXISTS Log_Last_Name_Change();
DROP TRIGGER IF EXISTS Emp_First_Name_Change ON Employee;
DROP FUNCTION IF EXISTS Log_First_Name_Change();

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Employee_Audit;


-- create employee table
CREATE TABLE Employee(
   ID SERIAL primary key,
   First_name VARCHAR(40) NOT NULL,
   Last_Name  VARCHAR(40) NOT NULL
);


-- create table to store audit detail
CREATE TABLE Employee_Audit (
   ID SERIAL PRIMARY KEY,
   Employee_ID INT4 NOT NULL,
   Last_Name VARCHAR(40) NOT NULL,
   First_Name VARCHAR(40) NOT NULL,
   Changed_ON TIMESTAMP(6) NOT NULL
);

-- Run the statements one by one from LearnTrigger-Query.sql file. Convince yourself on the reason why
-- some statements will not insert an entry in the Employee_Audit Table??
-- : the reason that it doesn't change some data is that there's no matched data with old one. 

-- function to use in trigger
CREATE OR REPLACE FUNCTION Log_FLname_Name_Change()
  RETURNS TRIGGER AS
$Emp_FLname_Name_Change$
BEGIN

    IF NEW.first_name <> OLD.first_name THEN -- if (new first name) and (old first name) is not equal, insert data.
		INSERT INTO employee_audit( Employee_ID, First_Name, Last_Name, Changed_ON )
		VALUES( OLD.id, OLD.First_Name, OLD.Last_Name, NOW() );

	END IF;
    
	IF NEW.last_name <> OLD.last_name THEN -- if (new last name) and (old last name) is not equal, insert data.
		INSERT INTO employee_audit( Employee_ID, First_Name, Last_Name, Changed_ON )
		VALUES( OLD.id, OLD.First_Name, OLD.Last_Name, NOW() );
	
    END IF;

    RETURN NEW;
END;
$Emp_FLname_Name_Change$ LANGUAGE plpgSQL;

CREATE TRIGGER Emp_FLname_Name_Change BEFORE UPDATE ON Employee_Audit
FOR EACH ROW EXECUTE PROCEDURE Log_FLname_Name_Change();