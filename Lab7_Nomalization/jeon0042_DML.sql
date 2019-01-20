DELETE FROM Publisher_T;
DELETE FROM Author_T;
DELETE FROM Borrower_T;
DELETE FROM Book_T;
DELETE FROM Library_T;

INSERT INTO Publisher_T VALUES ('P001', 'HARP', 'Harper');
INSERT INTO Publisher_T VALUES ('P002', 'HARP', 'Harper');
INSERT INTO Publisher_T VALUES ('P003', 'HARP', 'Harper');
INSERT INTO Publisher_T VALUES ('P004', 'ROSI', 'Rosiya Press');
INSERT INTO Publisher_T VALUES ('P005', 'SELF', 'Self Press');
INSERT INTO Publisher_T VALUES ('P006', 'SELF', 'Self Press');
INSERT INTO Publisher_T VALUES ('P007', 'WILE', 'Wiley');
INSERT INTO Publisher_T VALUES ('P008', 'ROSI', 'Rosiya Press');

INSERT INTO Author_T VALUES ('A001', 'COELHOP', 'Paulo Coelho');
INSERT INTO Author_T VALUES ('A002', 'COELHOP', 'Paulo Coelho');
INSERT INTO Author_T VALUES ('A003', 'COELHOP', 'Paulo Coelho');
INSERT INTO Author_T VALUES ('A004', 'TOLSTOL', 'Leo Tolstoy');
INSERT INTO Author_T VALUES ('A005', 'ACHEBEC', 'Chinua Achebe');
INSERT INTO Author_T VALUES ('A006', 'ACHEBEC', 'Chinua Achebe');
INSERT INTO Author_T VALUES ('A007', 'LEEH', 'Harper Lee');
INSERT INTO Author_T VALUES ('A008', 'TOLSTOL', 'Leo Tolstoy');

INSERT INTO Borrower_T VALUES ('B001', 'MORZ', 'Zev Moriv');
INSERT INTO Borrower_T VALUES ('B002', 'GATD', 'Dof Gatum');
INSERT INTO Borrower_T VALUES ('B003', 'TOSF', 'Gin Tosing');
INSERT INTO Borrower_T VALUES ('B004', 'FELT', 'Taz Felor');
INSERT INTO Borrower_T VALUES ('B005', 'FIJJ', 'Juv Fijoy');
INSERT INTO Borrower_T VALUES ('B006', 'GATD', 'Dof Gatum');
INSERT INTO Borrower_T VALUES ('B007', 'LUHK', 'Kit Luhuh');
INSERT INTO Borrower_T VALUES ('B008', 'LUHK', 'Kit Luhuh');
INSERT INTO Borrower_T VALUES ('B009', 'SULH', 'Heyia Suls');
INSERT INTO Borrower_T VALUES ('B010', 'KURJ', 'Jileau Kurc');


INSERT INTO Book_T VALUES ('BK0001', 'ALCHE', 'The Alchemist', 'A001', 'P001');
INSERT INTO Book_T VALUES ('BK0002', 'ALCHE', 'The Alchemist', 'A002', 'P002');
INSERT INTO Book_T VALUES ('BK0003', 'ALCHE', 'The Alchemist', 'A003', 'P003');
INSERT INTO Book_T VALUES ('BK0004', 'ANNAK', 'Anna Karanina', 'A004', 'P004');
INSERT INTO Book_T VALUES ('BK0005', 'TFA', 'Things Fall Apart', 'A005', 'P005');
INSERT INTO Book_T VALUES ('BK0006', 'TFA', 'Things Fall Apart', 'A006', 'P006');
INSERT INTO Book_T VALUES ('BK0007', 'TKAMB', 'To Kill A Mocking Bird', 'A007', 'P007');
INSERT INTO Book_T VALUES ('BK0008', 'WNP', 'War and Peace', 'A008', 'P008');

INSERT INTO Library_T VALUES ('L001', '1', 'BK0001', 'B001');
INSERT INTO Library_T VALUES ('L002', '2', 'BK0002', 'B002');
INSERT INTO Library_T VALUES ('L003', '3', 'BK0003', 'B003');
INSERT INTO Library_T VALUES ('L004', '1', 'BK0004', 'B004');
INSERT INTO Library_T VALUES ('L005', '1', 'BK0005', 'B005');
INSERT INTO Library_T VALUES ('L006', '2', 'BK0006', 'B006');
INSERT INTO Library_T VALUES ('L007', '1', 'BK0007', 'B007');
INSERT INTO Library_T VALUES ('L008', '1', 'BK0008', 'B008');

-- UPDATE Statements
UPDATE Employee_T SET Borrower_Name = 'Hayia Suls' WHERE Borrower_ID = 'SULH';

-- JOIN Statements to make the 3NF relation appear as in 1NF
SELECT * 
FROM 
	Publisher_T, Author_T, Borrower_T, Book_T, Library_T
WHERE 
	Publisher_T.publisher_Num = Book_T.Publisher_Num 
	AND Author_T.Author_Num = Book_T.Author_Num 
	AND Borrower_T.Borrower_Num = Library_T.Borrower_Num
    AND Book_T.Book_Num = Library_T.Book_Num
	
-- Write a LEFT or RIGHT OUTER JOIN statement to identify 
-- the two borrowers who have not borrowed any books from the library
SELECT 
	Borrower_T.Borrower_Name
FROM 
	Borrower_T LEFT JOIN Library_T
ON 
	Borrower_T.Borrower_Num = Library_T.Borrower_Num
    WHERE Library_T.Borrower_Num IS NULL;