-- ENSF 300 L02 – 52
-- Group name: My coding can’t be this kawaii
-- Group members: MD Sakil Al Mahmud, MD Touhidul Tonmoy, Saim Shahzad

DROP DATABASE IF EXISTS MUSEUM;
CREATE DATABASE MUSEUM; 
USE MUSEUM;

DROP TABLE IF EXISTS ART_OBJECT;
CREATE TABLE ART_OBJECT
( Id_no CHAR(9) NOT NULL,
  Title VARCHAR(30) NOT NULL,
  Year INT,
  Origin VARCHAR(30) NOT NULL,
  Epoch VARCHAR(30) NOT NULL,
  Description TEXT,
  PRIMARY KEY (Id_no));
  
DROP TABLE IF EXISTS ARTIST;
CREATE TABLE ARTIST
( Fname VARCHAR(20) NOT NULL,
  Minit CHAR,
  Lname VARCHAR(30) NOT NULL,
  Main_style VARCHAR(30),
  Country_of_origin VARCHAR(30),
  DateBorn DATE,
  DateDied DATE,
  Epoch VARCHAR(30),
  Description TEXT,
  PRIMARY KEY (Fname, Minit, Lname));

DROP TABLE IF EXISTS EXHIBITION;
CREATE TABLE EXHIBITION
( Name VARCHAR(50) NOT NULL,
  Start_date DATE,
  End_date DATE,
  PRIMARY KEY (Name));

DROP TABLE IF EXISTS PAINTING;
CREATE TABLE PAINTING
( Paint_type VARCHAR(30),
  Drawn_on VARCHAR(30),
  Style VARCHAR(30),
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS OTHER;
CREATE TABLE OTHER
( Type VARCHAR(30),
  Style VARCHAR(30),
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS SCULPTURE_TYPE;
CREATE TABLE SCULPTURE_TYPE
( Material VARCHAR(30),
  Style VARCHAR(30),
  Height VARCHAR(9),
  Weight VARCHAR(9),
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS STATUE;
CREATE TABLE STATUE
( Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES SCULPTURE_TYPE(Id_no));

DROP TABLE IF EXISTS SCULPTURE;
CREATE TABLE SCULPTURE
( Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES SCULPTURE_TYPE(Id_no));

DROP TABLE IF EXISTS PERMANENT_COLLECTION;
CREATE TABLE PERMANENT_COLLECTION
( Status VARCHAR(30),
  Cost VARCHAR(20),
  Date_acquired DATE,
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS BORROWED;
CREATE TABLE BORROWED
( Date_borrowed DATE NOT NULL,
  Date_returned DATE NOT NULL,
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Id_no),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS CREATES;
CREATE TABLE CREATES
( Fname VARCHAR(20) NOT NULL,
  Minit CHAR NOT NULL,
  Lname VARCHAR(30) NOT NULL,
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Fname, Minit, Lname, Id_no),
  FOREIGN KEY (Fname, Minit, Lname) REFERENCES ARTIST(Fname, Minit, Lname),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS EXHIBITED_AT;
CREATE TABLE EXHIBITED_AT
( Name VARCHAR(50) NOT NULL,
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Name, Id_no),
  FOREIGN KEY (Name) REFERENCES EXHIBITION(Name),
  FOREIGN KEY (Id_no) REFERENCES ART_OBJECT(Id_no));

DROP TABLE IF EXISTS COLLECTION;
CREATE TABLE COLLECTION
( Phone INT,
  Description TEXT,
  Type VARCHAR(30),
  Address VARCHAR(50),
  Contact_person VARCHAR(30),
  Name VARCHAR(50) NOT NULL,
  Id_no CHAR(9) NOT NULL,
  PRIMARY KEY (Name, Id_no),
  FOREIGN KEY (Id_no) REFERENCES BORROWED(Id_no));

DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    is_blocked BOOLEAN NOT NULL DEFAULT 0
);

-- Populate database 

-- ('Id_no', 'Title', Year, 'Origin', 'Epoch', 'Description'),
INSERT INTO ART_OBJECT
VALUES      ('567489345','Salome', 1916, 'Dutch','Modern','Salome sits at the center of a sinuous vine.'),
			('175648754','Elizabeth I', 1567, 'British','Renaissance','The Hampden Portrait.'),
            ('456782345','Angel Bearing Candlestick', 1524, 'Italian','Renaissance','An Angel carrying a candlestick.'),
            ('795642364','Trompe l’Oeil Still Life', 1658, 'Dutch','Baroque','Trompe l’Oeil Still Life with Flower Garland and Curtain is a painting of flowers that seemingly crosses over into the viewer’s space.'),
            ('482364594','The Absinthe Glass', 1914, 'French','Modern','Picasso’s life-size rendering of a glass of alcohol was shocking for its banality'),
            ('256346534','Temperance', 1584, 'Italian','Renaissance','This Temperance is identified by the items she holds: a bridle in one hand and dividers and ruler in the other.'),
            ('345732852','Orpheus', 1601, 'Italian','Renaissance','The statue was carved for the Palazzo Corsi, Florence.'),
            ('645826343','Mechanical table', 1763, 'French','Baroque','This table has long been recognized as one of the masterpieces of Jean-François Oeben, cabinetmaker to Louis XV.'),
            ('849567384','Étagère', 1885, 'American','Rococo','This rosewood étagère is a superb example of the Rococo Revival style.');


-- ('Fname', 'Minit', 'Lname', 'Main_style', 'Country_of_origin', 'DateBorn', 'DateDied', 'Epoch', 'Description'),
INSERT INTO ARTIST
VALUES      ('Willem', '', 'Arondeus', 'Portraits', 'Dutch', '1894-08-22', '1943-06-01', 'Modern', 'Dutch artist and author who joined the Dutch anti-Nazi resistance movement during World War II.'),
			('George ', '', 'Gower', 'Self-protrait', 'English', '1540-08-01', '1596-05-21', 'Renaissance', 'English portrait painter who became Serjeant Painter to Queen Elizabeth I in 1581.'),
            ('Benedetto', 'D', 'Rovezzano', 'Sculpture', 'Italian', '1524-10-11', '1529-02-09', 'Renaissance', 'Benedetto da Rovezzano was an Italian architect and sculptor who worked mainly in Florence.'),
            ('Adriaen', 'V', 'Spelt', 'Flower Painting', 'Dutch', '1630-11-14', '1673-06-11', 'Baroque', 'Adriaen van der Spelt, was a Dutch Golden Age flower painter.'),
            ('Pablo', 'R', 'Picasso', 'Cubism', 'Spanish', '1881-10-25', '1973-04-08', 'Modern', 'Pablo Ruiz Picasso was a Spanish painter, sculptor, printmaker, ceramicist and theatre designer who spent most of his adult life in France.'),
            ('Giovanni', 'B', 'Caccini', 'Statue', 'Italian', '1556-10-24', '1613-03-13', 'Renaissance', 'Giovanni Battista Caccini or Giovan Battista Caccini was an Italian sculptor from Florence.'),
            ('Cristofano ', 'D', 'Bracciano', 'Statue', 'Italian', '1556-01-09', '1619-04-17', 'Renaissance', 'He was a little-known sculptor who also worked on the restoration of marble works excavated from archaeological sites.'),
            ('Jean', 'F', 'Oeben', 'cabinetmaker', 'French', '1721-08-09', '1763-01-18', 'Baroque', 'Jean-François Oeben, or Johann Franz Oeben was a German ébéniste whose career was spent in Paris.'),
            ('Alexander', '', 'Roux', 'cabinetmaker', 'American', '1813-07-19', '1886-03-08', 'Rococo', 'Alexander Roux was a French-trained ébéniste.');
            

-- ('Name', 'Start_date', 'End_date'),
INSERT INTO EXHIBITION
VALUES      ('The Metropolitan Museum of Art', '2022-06-07', '2022-10-11'),
			('Cleveland Museum of Art', '2022-02-26', '2023-05-14'),
            ('Hayward Gallery', '1997-10-09', '1998-01-04'),
            ('Fine Arts Museums of San Francisco', '2022-06-24', '2023-09-24'),
            ('New York. Gagosian Gallery', '2003-04-03', '2003-05-10'),
			('Staatliche Museen zu Berlin', '2007-05-31', '2007-07-19');
	
	

-- ('Paint_type', 'Drawn_on', 'Style', 'Id_no'),
INSERT INTO PAINTING
VALUES     ('Ink', 'Canvas', 'Modern', '567489345'),
		   ('Oil', 'Canvas', 'Renaissance', '175648754'),
           ('Oil', 'Panel', 'Modern', '795642364');


-- ('Material', 'Style', 'Height', 'Weight', 'Id_no'),
INSERT INTO SCULPTURE_TYPE
VALUES      ('Bronze', 'Renaissance', '101 cm', '141 kg', '456782345'),
			('Bronze', 'Modern', '22.5 cm', '206.5 kg', '482364594'),
            ('Marble', 'Renaissance', '176.8 cm', '302.3 kg', '256346534'),
            ('Marble', 'Renaissance', '195.9 cm', '351.5 kg', '345732852');



-- ('Id_no'),
INSERT INTO SCULPTURE
VALUES      ('456782345'),
			('482364594');

-- ('Id_no'),
INSERT INTO STATUE
VALUES      ('256346534'),
			('345732852');


-- ('Type', 'Style', 'Id_no'),
INSERT INTO OTHER
VALUES      ('Woodwork-Furniture', 'Baroque', '645826343'),
			('Woodwork-Furniture', 'Rococo', '849567384');
            
-- ('Name', 'Id_no'),            
INSERT INTO EXHIBITED_AT
VALUES      ('The Metropolitan Museum of Art', '567489345'),
		   -- ('The Metropolitan Museum of Art', '482364594'),
            ('Cleveland Museum of Art', '175648754'),
            ('Hayward Gallery', '482364594'),
            ('Fine Arts Museums of San Francisco', '456782345'),
            ('New York. Gagosian Gallery', '482364594'),
            ('Staatliche Museen zu Berlin', '256346534');
           -- ('The Metropolitan Museum of Art', '34573285'),
           -- ('The Metropolitan Museum of Art', '645826343');
		   -- ('The Metropolitan Museum of Art', '849567384');
            
            
-- ('Status', 'Cost', 'Date_acquired', 'Id_no'),
INSERT INTO PERMANENT_COLLECTION
VALUES      ('Stored', '$30,000', '2006-11-08', '567489345'),
			('Display', '$3.4m', '2007-11-22', '175648754'),
            ('Display', '€20,000', '2011-01-10', '456782345'),
            ('Display', '€15,000', '2002-08-25', '795642364'),
            ('Loan', '$179.4m', '2008-11-03', '482364594'),
            ('Stored', '£180,000', '2018-06-03', '256346534'),
            ('Loan', '£100,000', '2009-07-19', '345732852');


-- ('Date_borrowed', 'Date_returned', 'Id_no'),
INSERT INTO BORROWED
VALUES      ('2002-04-13', '2004-06-13', '645826343'),
			('2014-08-21', '2018-08-21', '849567384');

-- ('Fname', 'Minit', 'Lname', 'Id_no'),
INSERT INTO CREATES
VALUES      ('Willem', '', 'Arondeus', '567489345'),
			('George ', '', 'Gower', '175648754'),
            ('Benedetto', 'D', 'Rovezzano', '456782345'),
            ('Adriaen', 'V', 'Spelt', '795642364'),
			('Pablo', 'R', 'Picasso', '482364594'),
            ('Giovanni', 'B', 'Caccini', '256346534'),
            ('Cristofano ', 'D', 'Bracciano', '345732852'),
			('Jean', 'F', 'Oeben', '645826343'),
            ('Alexander', '', 'Roux', '849567384');
           
-- (Phone, 'Description', 'Type', 'Address', 'Contact_person', 'Name', 'Id_no')
INSERT INTO COLLECTION
VALUES      (1-212-535-7710, 'Museum curators in the Departments of European Paintings, European Sculpture and Decorative Arts, and Medieval Art (1984).', 'Museum', '1000 5th Ave, New York', 'Jamie Kelleher', 'The Jack and Belle Linsky Collection', '645826343'),
			(1-202-633-1000, 'The Smithsonian American Art Museum is a museum in Washington, D.C., part of the Smithsonian Institution.', 'Museum', '8th St NW, Washington, DC', 'Stephanie Stebich', 'Name', '849567384');




DROP ROLE IF EXISTS db_admin@localhost, read_access@localhost;
CREATE ROLE db_admin@localhost, read_access@localhost;
GRANT ALL PRIVILEGES ON MUSEUM.* TO db_admin@localhost;
GRANT Select ON MUSEUM.* TO read_access@localhost;

DROP USER IF EXISTS 'username'@localhost;
DROP USER IF EXISTS guest@localhost;
CREATE USER 'username'@localhost IDENTIFIED WITH mysql_native_password BY 'password';
CREATE USER guest@localhost;
GRANT db_admin@localhost TO 'username'@localhost;
GRANT read_access@localhost TO guest@localhost;
SET DEFAULT ROLE ALL TO 'username'@localhost;
SET DEFAULT ROLE ALL TO guest@localhost;

