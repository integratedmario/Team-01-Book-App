create table Users(
	UserID varchar(8) NOT NULL UNIQUE,
	PRIMARY KEY (UserID),
	Username varchar(32),
	UNIQUE (Username),
	PW varchar(32),
	FullName varchar(32),
	EmailAddress varchar(32),
	HomeAddress varchar(64)
	);
	
create table Authors(
	AuthorID varchar(8) NOT NULL,
	PRIMARY KEY (AuthorID),
	FirstName varchar(16),
	LastName varchar(16)
	);
    
create table Books(
	ISBN varchar(13) UNIQUE,
	PRIMARY KEY (ISBN),
	BookName varchar(64),
	BookDesc varchar(500),
	Price DOUBLE,
	Genre varchar(16),
	Publisher varchar(32),
	YearPublished int,
	CopiesSold int,
    AuthorID varchar(8) NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
	);
	
create table CreditCards(
	CardNum BIGINT NOT NULL,
    CVV int NOT NULL,
    ExpDate DATE NOT NULL,
	UserID varchar(8) NOT NULL,
	PRIMARY KEY (CardNum),
	FOREIGN KEY (UserID) REFERENCES Users(UserID)
	);
	
create table ShoppingCart(
	CartID BIGINT NOT NULL AUTO_INCREMENT,
	UserID varchar(8) NOT NULL,
	PRIMARY KEY (CartID),
	FOREIGN KEY (UserID) REFERENCES Users(UserID)
	);
	
create table ShoppingCartItems(
	CartItemID BIGINT NOT NULL AUTO_INCREMENT,
	CartID BIGINT NOT NULL,
	ISBN varchar(13) NOT NULL,
	Quantity int,
	PRIMARY KEY (CartItemID),
	FOREIGN KEY (CartID) REFERENCES ShoppingCart(CartID),
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
	);
	
create table WishLists(
	WishID BIGINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (WishID),
	UserID varchar(8) NOT NULL
	);
	
create table WishListItems(
	WishListItemID BIGINT NOT NULL AUTO_INCREMENT,
	WishID BIGINT NOT NULL,
	ISBN varchar(13) NOT NULL,
	PRIMARY KEY (WishListItemID),
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (WishID) REFERENCES WishLists(WishID)
	);
	
create table Ratings(
	RatingID BIGINT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (RatingID),
	UserID varchar(8) NOT NULL,
	ISBN varchar(13) NOT NULL,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
	Rating DOUBLE,
	Datestamp DATE,
    CHECK (1 <= Rating AND Rating <= 5)
	);
	
create table Comments(
	CommentID BIGINT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (CommentID),
	UserID varchar(8) NOT NULL,
	ISBN varchar(13) NOT NULL,
	FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
	FOREIGN KEY (UserID) REFERENCES Users(UserID),
	UserComment varchar(2500),
	Datestamp DATE
	);
    
create table Publishers(
	PubID BIGINT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (PubID),
    PubName varchar(32)
    );

INSERT INTO Authors (AuthorID, FirstName, LastName)
VALUES
('A0000000', 'Howard Phillips', 'Lovecraft'),
('B0000000', 'Stephen', 'King'),
('C0000000', 'Jane', 'Austen'),
('G0000000', 'Homer', NULL),
('J1111111', 'John', 'Grisham'),
('M1111111', 'Maya', 'Angelou'),
('N2222222', 'J.K', 'Rowling'),
('R2222222', 'George R.R', 'Martin');

INSERT INTO Users (UserID, Username, PW, FullName, EmailAddress, HomeAddress)
VALUES
('U0000000', 'jandoe01', 'password321', 'Jane Doe', 'jandoe01@gmail.com', '123 Smith St'),
('U1111111', 'alxsmit02', 'password333', 'Alex Smith', 'alxsmit02@gmail.com', '987 Birch St'),
('U2222222', 'jamwest03', 'password271', 'James West', 'jamwest03@gmail.com', '555 Acacia Rd'),
('U3333333', 'rachgrn04', 'password314', 'Rachel Green', 'rachgrn04@gmail.com', '256 Spruce Ln'),
('U4444444', 'isablan05', 'password!', 'Isabella Blanco', 'isablan05@gmail.com', '777 Peace Ct'),
('U5555555', 'destroy06', 'notpassword', 'Destroyer of Worlds', 'destroy06@gmail.com', '575 Fire Rd');

INSERT INTO Books (ISBN, BookName, BookDesc, Price, Genre, Publisher, YearPublished, CopiesSold, AuthorID)
VALUES
('9780345337795', 'The Dream-Quest of Unknown Kaddath', 'Psychological science-fiction horror story', 19.99, 'Horror', 'Arkham House', 1943, 5000, 'A0000000'),
('9780743210898', 'The Green Mile', 'Dark Fantasy by Stephen King', 14.99, 'Dark Fantasy', 'Signet House', 2000, 10000, 'B0000000'),
('9780140449112', 'The Odyssey', 'Ancient Greek epic', 14.99, 'Epic', 'Penguin Classics', 2003, 2000, 'G0000000'),
('9780141040349', 'Pride and Prejudice', 'Famous Jane Austen Romance novel', 17.99, 'Romance', 'Penguin Classics', 2009, 5500, 'C0000000');

INSERT INTO Books (ISBN, BookName, BookDesc, Price, Genre, Publisher, YearPublished, CopiesSold, AuthorID)
VALUES
('9780440245919', 'A Time to Kill', 'Legal thriller by John Grisham', 12.99, 'Thriller', 'Vintage', 1989, 12000, 'J1111111'),
('9780345514400', 'I Know Why The Caged Bird Sings', 'Autobiography of Maya Angelous childhood and social experiences', 15.99, 'Autobiography', 'Penguin Classics', 2009, 11500, 'M1111111'),
('9780439064873', 'Harry Potter and the Chamber of Secrets', 'Second installment in Harry Potter series', 10.99, 'Fantasy', 'Scholastic', 2000, 25000, 'N2222222'),
('9780553582017', 'A Dance with Dragons', 'Fifth installment in the famous A Song of Ice and Fire series', 7.99, 'Fantasy', 'Bantam', 2013, 24000, 'R2222222');

INSERT INTO Publishers(PubName)
SELECT DISTINCT Publisher FROM Books;

INSERT INTO Ratings (UserID, ISBN, Rating, Datestamp)
VALUES
('U0000000', '9780345337795', 5, '2023-09-16');

INSERT INTO Ratings (UserID, ISBN, Rating, Datestamp)
VALUES
('U1111111', '9780743210898', 4, '2023-09-08'),
('U1111111', '9780345514400', 5, '2023-09-09'),
('U2222222', '9780140449112', 5, '2023-09-12'),
('U2222222', '9780439064873', 4, '2023-09-12'),
('U2222222', '9780345514400', 3, '2023-09-12'),
('U2222222', '9780141040349', 4, '2023-09-13'),
('U3333333', '9780440245919', 4, '2023-09-04'),
('U3333333', '9780553582017', 4, '2023-09-05'),
('U4444444', '9780553582017', 4, '2023-09-05'),
('U4444444', '9780140449112', 4, '2023-09-06'),
('U4444444', '9780439064873', 3, '2023-09-07'),
('U5555555', '9780345337795', 5, '2023-09-01'),
('U5555555', '9780743210898', 5, '2023-09-01'),
('U5555555', '9780141040349', 1, '2023-09-01');

INSERT INTO Comments (UserID, ISBN, UserComment, Datestamp)
Values
('U0000000', '9780345337795', 'This book destroyed my mind, but in a good way.', '2023-09-16'),
('U2222222', '9780439064873', 'Pretty good but not enough explosions.', '2023-09-12'),
('U5555555', '9780743210898', 'I LIKEY THE BOOK', '2023-09-01'),
('U2222222', '9780345514400', 'The book isnt bad but i didnt see any birds', '2023-09-12');

INSERT INTO WishLists(UserID)
SELECT UserID FROM Users;

INSERT INTO ShoppingCart(UserID)
SELECT UserID FROM Users;

INSERT INTO CreditCards (CardNum, CVV, ExpDate, UserID)
Values
(122334455667788990, 100, '2028-08-01', 'U0000000'),
(9040759890191690, 200, '2027-06-01', 'U1111111'),
(0230611340532700, 256, '2027-09-01', 'U2222222'),
(2292312333197607, 271, '2025-02-01', 'U3333333'),
(0434711306356481, 500, '2028-05-01', 'U4444444'),
(9999999999999999, 999, '2100-12-01', 'U5555555');

INSERT INTO ShoppingCartItems(CartID, ISBN, Quantity)
Values
(6, '9780140449112', 55),
(5, '9780345337795', 1),
(2, '9780141040349', 2);

INSERT INTO WishListItems(WishID, ISBN)
Values
(1, '9780140449112'),
(4, '9780345514400'),
(3, '9780743210898');
	
	


	
	