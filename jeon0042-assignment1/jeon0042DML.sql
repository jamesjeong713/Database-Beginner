-- populate city and country table - COUNTRY_T
INSERT INTO Country_T VALUES ('RUS','Russian Federation', 144192450);
INSERT INTO Country_T VALUES ('MEX','Mexico', 119530753);
INSERT INTO Country_T VALUES ('DZA','Algeria', 40400000);
INSERT INTO Country_T VALUES ('CHN','China', 1376049000);
INSERT INTO Country_T VALUES ('CHL','Chile', 18006407);
INSERT INTO Country_T VALUES ('CAN','Canada', 36155487);
INSERT INTO Country_T VALUES ('BEL','Belgium', 10239000);
INSERT INTO Country_T VALUES ('BRA','Brazil', 170115000);
INSERT INTO Country_T VALUES ('GBR','United Kingdom',59623400);
INSERT INTO Country_T VALUES ('KOR','South Korea',46844000);
-- populate city and country table - CITY_T
INSERT INTO City_T VALUES (3580,'Moscow','RUS',8389200);
INSERT INTO City_T VALUES (3581,'St Petersburg','RUS',4694000);
INSERT INTO City_T VALUES (2597,'Soledad de Graciano Sánchez','MEX',179956);
INSERT INTO City_T VALUES (2598,'San Juan del Río','MEX',179300);
INSERT INTO City_T VALUES (35,'Alger','DZA',2168000);
INSERT INTO City_T VALUES (36,'Oran','DZA',609823);
INSERT INTO City_T VALUES (1890,'Shanghai','CHN',9696300);
INSERT INTO City_T VALUES (1891,'Peking','CHN',7472000);
INSERT INTO City_T VALUES (554,'Santiago de Chile','CHL',4703954);
INSERT INTO City_T VALUES (555,'Puente Alto','CHL',386236);
INSERT INTO City_T VALUES (1810,'Montréal','CAN',1016376);
INSERT INTO City_T VALUES (1812,'Toronto','CAN',688275);
INSERT INTO City_T VALUES (175,'Antwerpen','BEL',446525);
INSERT INTO City_T VALUES (176,'Gent','BEL',224180);
INSERT INTO City_T VALUES (206,'São Paulo','BRA',9968485);
INSERT INTO City_T VALUES (207,'Rio de Janeiro','BRA',5598953);
INSERT INTO City_T VALUES (456,'London','GBR',7285000);
INSERT INTO City_T VALUES (457,'Birmingham','GBR',1013000);
INSERT INTO City_T VALUES (2331,'Seoul','KOR',9981619);
INSERT INTO City_T VALUES (2332,'Pusan','KOR',3804522);

-- populate customer and product tables----------
-- CUSTOMER_T

INSERT INTO Customer_T VALUES ('C001', 'Seongyeop', 'Jeong', '343-988-8771', '1385 Woodroffe Ave', 'Ottawa'   ,'ON','K2G1V8', 1, 'CAN');
INSERT INTO Customer_T VALUES ('C002', 'Harah', 'Verma', '613-883-5008', '1385 Woodroffe Ave', 'Ottawa'   ,'ON','K2G1V8', 2, 'RUS');
INSERT INTO Customer_T VALUES ('C003', 'Xingyi', 'Wu', '613-600-9857', '1385 Woodroffe Ave', 'Ottawa'   ,'ON','K2G1V8', 3, 'CHN');
INSERT INTO Customer_T VALUES ('C004', 'Steven', 'Mcdavid', '613-266-3090', '854 Younge Street' , 'Toronto'  ,'ON','K2G1V8', 4, 'KOR');
INSERT INTO Customer_T VALUES ('C005', 'Thuy', 'Mai', '613-914-0109', '264 Main Street'   , 'Kitchener','ON','K2G1V8', 5, 'MEX');
INSERT INTO Customer_T VALUES ('C006', 'Yoshuya', 'Shiraishi', '604-313-7547', '357 Rue Catherine' , 'Montreal' ,'ON','K2G1V8', 6, 'GBR');

INSERT INTO Product_T VALUES ('P2011', 'Compac Presario', '2011-02-14', 20, 5, 499.99, 0, 'RUS');
INSERT INTO Product_T VALUES ('P2012', 'HP laptop', '2010-09-25', 40, 5, 529.99, 0, 'CHL');
INSERT INTO Product_T VALUES ('P2013', 'Samsung LCD', '2010-02-15', 22, 8, 329.99, 0, 'BRA');
INSERT INTO Product_T VALUES ('P2014', 'Brother Network All-In-One Laser Printer', '2010-10-10', 50, 10, 159.99, 0, 'KOR');
INSERT INTO Product_T VALUES ('P2015', 'Western Digital External Hard drive', '2010-04-08', 30, 10, 149.99, NULL, 'GBR');
INSERT INTO Product_T VALUES ('P2016', 'Apple iPad 2 with Wi-Fi + 3G', '2011-02-23', 90, 200, 849.00, 0, 'MEX');
INSERT INTO Product_T VALUES ('P2017', 'iPAD 2 Smart Cover', '2011-02-14', 70, 10, 45.00, 10, 'DZA');

-- Invoice_T / Invoice_Line_T tables
INSERT INTO Invoice_T VALUES ('I23001', 'C001', '2011-02-15');
INSERT INTO Invoice_T VALUES ('I23002', 'C001', '2011-04-25');
INSERT INTO Invoice_T VALUES ('I23003', 'C004', '2011-06-12');
INSERT INTO Invoice_T VALUES ('I23004', 'C002', '2011-07-08');
INSERT INTO Invoice_T VALUES ('I23005', 'C005', '2011-08-24');
INSERT INTO Invoice_T VALUES ('I23006', 'C006', '2011-09-07');
INSERT INTO Invoice_T VALUES ('I23007', 'C006', '2010-12-28');
INSERT INTO Invoice_T VALUES ('I23008', 'C006', '2011-12-15');

INSERT INTO Invoice_Line_T VALUES ('I23001', 1, 'P2011', 1, 650.75); 
INSERT INTO Invoice_Line_T VALUES ('I23001', 2, 'P2014', 3, 159.99);
INSERT INTO Invoice_Line_T VALUES ('I23002', 1, 'P2012', 1, 529.99);
INSERT INTO Invoice_Line_T VALUES ('I23003', 1, 'P2015', 3, 140.75);
INSERT INTO Invoice_Line_T VALUES ('I23004', 1, 'P2014', 1, 159.99);
INSERT INTO Invoice_Line_T VALUES ('I23005', 1, 'P2016', 1, 798.99);
INSERT INTO Invoice_Line_T VALUES ('I23006', 1, 'P2011', 1, 499.99);
INSERT INTO Invoice_Line_T VALUES ('I23007', 1, 'P2012', 1, 529.99);
INSERT INTO Invoice_Line_T VALUES ('I23008', 1, 'P2016', 3, 689.00);
INSERT INTO Invoice_Line_T VALUES ('I23008', 2, 'P2017', 3, 35.99);

-- Delete statement
DELETE FROM Customer_T WHERE Cust_Country = 'CHL';
DELETE FROM Product_T WHERE Prod_CountryOrigin = 'RUS';
-- the reason that there're error messages after we run the program is that each key has connected with each other by primary key and foreign key

-- Joins 1. list countries that do not have any customers 
SELECT Country_T.Country_Code, Country_Name, Customer_T.Cust_Id
FROM Country_T
LEFT JOIN Customer_T 
ON Customer_T.Cust_Country = Country_T.Country_Code
WHERE Customer_T.Cust_Country is Null;
-- Join 2. list countries from which no products are boughts.
SELECT Country_T.Country_Code, Country_Name, Prod_Code
FROM Country_T
LEFT JOIN Product_T 
ON Product_T.Prod_CountryOrigin = Country_T.Country_Code
WHERE Product_T.Prod_CountryOrigin is Null;