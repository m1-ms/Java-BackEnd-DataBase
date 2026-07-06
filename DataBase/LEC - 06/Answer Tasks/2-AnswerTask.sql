/*

🛠️ 2. Adding Constraints via ALTER TABLE (Code Samples)
Add a NOT NULL constraint to the email column in the Customers table.

Add a UNIQUE constraint to the username column in the Users table.

Add a FOREIGN KEY constraint on Orders.customer_id referencing Customers(id).

Use ALTER TABLE to add a CHECK constraint to the Accounts table to ensure balance >= 0.

Add a PRIMARY KEY constraint to the Departments table on the dept_id column.

*/

DROP TABLE CUSTOMERS;

CREATE TABLE CUSTOMERS (

	id     	 NUMBER PRIMARY KEY,
    name  	 VARCHAR2(100),
    email  	 VARCHAR2(100)

);

SELECT * FROM CUSTOMERS;

ALTER TABLE CUSTOMERS MODIFY email NOT NULL;

--------------------------------------------------------

DROP TABLE User2;

CREATE TABLE User2 (

	id        	NUMBER PRIMARY KEY,
    userName  	VARCHAR2(50)

);

SELECT * FROM User2;

ALTER TABLE User2 ADD CONSTRAINT User2_userName UNIQUE (userName);

--------------------------------------------------------

CREATE TABLE CUSTOMERS3 (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100)

);

CREATE TABLE Orders3 (

	id			NUMBER PRIMARY KEY,
	customer_id NUMBER  

);

ALTER TABLE Orders3 ADD CONSTRAINT Orders3_customer FOREIGN KEY 
									(customer_id) REFERENCES CUSTOMERS3 (id);

--------------------------------------------------------

CREATE TABLE Account3 (


	id			NUMBER PRIMARY KEY ,
	balance		NUMBER

);

ALTER TABLE Account3 ADD CONSTRAINT Account3_Balance CHECK (Balance >= 0);

--------------------------------------------------------

CREATE TABLE Departments3 (

    dept_id   NUMBER,
    dept_name VARCHAR2(100)
    
);
SELECT * FROM Departments3;

ALTER TABLE Departments3 ADD CONSTRAINT Departments_id PRIMARY KEY (dept_id);


