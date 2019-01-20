DROP TABLE IF EXISTS Publisher_T CASCADE;
DROP TABLE IF EXISTS Author_T CASCADE;
DROP TABLE IF EXISTS Borrower_T CASCADE;
DROP TABLE IF EXISTS Library_T CASCADE;
DROP TABLE IF EXISTS Book_T CASCADE;

CREATE TABLE Publisher_T(
	Publisher_Num	CHAR(  4 ), 
    Publisher_ID 	CHAR(  4 ) NOT NULL, 
    Publisher_Name 	VARCHAR( 20 ) NOT NULL,
    CONSTRAINT PK_Publisher PRIMARY KEY( Publisher_Num )
);
 
CREATE TABLE Author_T(
	Author_Num		CHAR(  4 ), 
    Author_ID 		VARCHAR(  8 ) NOT NULL,
    Author_Name 	VARCHAR( 20 ) NOT NULL,
    CONSTRAINT PK_Author PRIMARY KEY( Author_Num )
);

CREATE TABLE Borrower_T(
	Borrower_Num	CHAR(  4 ), 
    Borrower_ID 	CHAR(  8 ) NOT NULL,
    Borrower_Name 	CHAR( 20 ) NOT NULL,
    CONSTRAINT PK_Borrower PRIMARY KEY( Borrower_Num )
);

CREATE TABLE Book_T(
	Book_Num		CHAR(  6 ), 
    Book_ID 		VARCHAR( 5 ) NOT NULL,
    Book_Title 		VARCHAR( 40 ) NOT NULL,
	Author_Num 		VARCHAR( 8 ) NOT NULL,
	Publisher_Num 	CHAR( 4 ) NOT NULL,
    CONSTRAINT PK_Book PRIMARY KEY( Book_Num ),
	CONSTRAINT FK1_Book FOREIGN KEY( Publisher_Num ) REFERENCES Publisher_T( Publisher_Num ),
	CONSTRAINT FK2_Book FOREIGN KEY( Author_Num ) REFERENCES Author_T( Author_Num )
);

CREATE TABLE Library_T(
	Inventory_Num	CHAR( 4 ),
    Inventory_ID 	CHAR( 1 ) NOT NULL,
    Book_Num 		VARCHAR( 6 ) NOT NULL, 
    Borrower_Num 	CHAR(  4 ) NOT NULL,
    CONSTRAINT PK_Library PRIMARY KEY( Book_Num, Inventory_Num ),
	CONSTRAINT FK1_Library FOREIGN KEY( Borrower_Num ) REFERENCES Borrower_T( Borrower_Num ),
	CONSTRAINT FK2_Library FOREIGN KEY( Book_Num ) REFERENCES Book_T( Book_Num )
);
