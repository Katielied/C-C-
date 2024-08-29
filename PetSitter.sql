/*
Created the table for storing the user's data
*/
create table people(
userID varchar(50) not null,
pass varchar(50) not null,
lastName varchar(25) not null,
firstName varchar(25) not null,
role char(1) not null,
phoneNumber varchar(12) null,
emailAddress varchar(100) null,
ipAddress varchar(12) not null,
PRIMARY KEY (userID),
CHECK (role in('C', 'H', 'S'))
);

/*
Creating the table to store the orders from the users
*/
CREATE TABLE orders (
   orderNo INT NOT NULL AUTO_INCREMENT,
   orderType CHAR(1) NOT NULL,
   petType CHAR(2) NOT NULL,
   clientID VARCHAR(50) NOT NULL,
   sitterID VARCHAR(50) NULL,
   status CHAR(1) NOT NULL,
   clientConfirmed INT NOT NULL,
   sitterConfirmed INT NOT NULL,
   date DATE NOT NULL,
   PRIMARY KEY (orderNo),
   FOREIGN KEY (clientID) REFERENCES people(userID),
   FOREIGN KEY (sitterID) REFERENCES people(userID),
   CHECK (orderType IN ('W', 'G', 'P')),
   CHECK (petType IN ('C', 'D', 'CD')),
   CHECK (status IN ('P', 'A', 'C'))
);

/*
Creating the table that's meant to the store the comments from the user about their order
*/
create table comments(
commentID int not null auto_increment,
userID varchar(50) not null,
orderNo int not null,
comments varchar(2000) null,
PRIMARY KEY (commentID),
FOREIGN KEY (userID) REFERENCES people(userID),
FOREIGN KEY (orderNo) REFERENCES orders(orderNo)
);

/*
Inserting data into each table
*/

/* Inserti/Users/katarinaliedbeck/Desktop/TEAM CPU FINAL PROJECTng users into the people table */
INSERT INTO people (userID, pass, lastName, firstName, role, phoneNumber, emailAddress, ipAddress)
VALUES
    ('client1', 'password123', 'Doe', 'John', 'C', '555-1234', NULL, '192.168.1.1'),
    ('client2', 'pass456', 'Smith', 'Jane', 'C', '555-5678', 'jane.smith@example.com', '192.168.1.2'),
    ('helper1', 'pass789', 'Johnson', 'Robert', 'H', '555-9876', 'robert.johnson@example.com', '192.168.1.3'),
    ('sitter1', 'sitterpass', 'Williams', 'Emily', 'S', '555-4321', NULL, '192.168.1.4');

/* Inserting orders into the orders table */
INSERT INTO orders (orderType, petType, clientID, sitterID, status, clientConfirmed, sitterConfirmed, date)
VALUES
    ('W', 'C', 'client1', 'sitter1', 'P', 0, 1, '2023-01-15'),
    ('G', 'D', 'client2', NULL, 'A', 1, 1, '2023-02-20'),
    ('P', 'CD', 'client1', 'sitter1', 'C', 1, 1, '2023-03-25'), 
    ('W', 'C', 'client2', NULL, 'P', 0, 0, '2023-04-30');

/* Inserting comments into the comments table */
INSERT INTO comments (userID, orderNo, comments)
VALUES
    ('client1', 1, 'He loves the park!'),
    ('helper1', 1, 'Emily is a great sitter, loves cats.'),
    ('client2', 2, 'Be careful, can bite when grooming.'),
    ('sitter1', 3, 'Had a good time helping out.'),
    ('client2', 4, 'Enjoy! She loves people.');