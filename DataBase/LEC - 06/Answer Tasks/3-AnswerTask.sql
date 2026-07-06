/*

❌ 3. Dropping (Removing) Constraints (Code Samples)
Drop a CHECK constraint named chk_salary from the Employees table.

Remove the UNIQUE constraint on email from the Users table.

Drop the PRIMARY KEY from the Products table.

Drop a FOREIGN KEY constraint named fk_order_customer from the Orders table.

Write SQL to remove a NOT NULL constraint from the phone column in the Contacts table.

*/

DROP TABLE EMPLOYEES2;

CREATE TABLE EMPLOYEES2 (

	id			NUMBER PRIMARY KEY,
	name        VARCHAR2 (100),
	salary		NUMBER
	
 -- Done Add 10 Roy Data 
	
	CONSTRAINT chk_salary CHECK (salary > 0)

);

SELECT * FROM EMPLOYEES2;

ALTER TABLE EMPLOYEES2 DROP CONSTRAINT chk_salary;


-------------------------------------------------------------------------------


CREATE TABLE Users2 (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	email		VARCHAR2 (200)
	
	 -- Done Add 5 Roy Data

	CONSTRAINT Users2_email UNIQUE 
	
);

SELECT * FROM Users2;

ALTER TABLE Users2 DROP CONSTRAINT USERS2_email ;


-------------------------------------------------------------------------------

SELECT * FROM PRODUCTS2;

ALTER TABLE PRODUCTS2 DROP PRIMARY KEY;


-------------------------------------------------------------------------------


CREATE TABLE Customers2 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100)
    
	 -- Done Add 5 Roy Data

);


CREATE TABLE Orders2 (

    id           NUMBER PRIMARY KEY,
    customer_id  NUMBER,
    
	 -- Done Add 5 Roy Data

    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES Customers2(id)

);


SELECT * FROM Customers2;
SELECT * FROM Orders2;

ALTER TABLE Orders2 DROP CONSTRAINT fk_order_customer;


-------------------------------------------------------------------------------

CREATE TABLE Contacts2 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100),
    phone   VARCHAR2(20) NOT NULL

);

SELECT * FROM Contacts2;

ALTER TABLE Contacts2 MODIFY phone NULL;



