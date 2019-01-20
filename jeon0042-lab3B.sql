--Exercise 1.

-- Query 1
SELECT * FROM Customer_T;

-- Query 2
SELECT * FROM Invoice_T;

-- Query 3
SELECT * FROM Product_T;

-- Query 4
SELECT * FROM Invoice_Line_T;



--Exercise 2.

-- Query 1
SELECT Cust_Lname, Cust_Fname FROM Customer_T
ORDER BY Cust_Lname;
-- Query 2
SELECT Invoice_Number, Invoice_Date FROM Invoice_T;
-- Query 3
SELECT Invoice_Number, Prod_Code, Line_Price FROM Invoice_Line_T;
-- Query 4
SELECT Prod_Code, Prod_Description FROM Product_T;
-- Query 5
SELECT Cust_Fname, Cust_Lname, Cust_City FROM Customer_T
WHERE Cust_City != ('Ottawa');

--Exercise 3.
jeon0042-Lab3B.png with attachment.
--Exercise 4. 
an identifying relationship is represented by a solid line; 
in table Invoice_Lin_T an entry can be identified only if an Invoice_Number exists in the Inovice_T table.
On the other hand, an non-identifying relationship is represented by a broken (dashed) line;  
an entry in a child table can be uniquely identified without a corresponding entry in the parent table.
there is a non-identifying relationship between Invoice_T and Customer_T.
--Exercise 5.
Invoice_Line_T is an assciative entity which is the instances of one or more entity types. (like many to many relation) 
For example, Invoice_Line_T has each prime foreign, prime, foreign key, connecting with Invoice_T and Product_T.  
An entity, connected with a parent entity through an identifying relationship, is called "dependent" entity and is shown in a model with rounded corners.