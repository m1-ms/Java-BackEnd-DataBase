/*

✅ 1. CHECK Constraint (Code Samples)
Create a table Employees with a CHECK constraint that ensures age is greater than or equal to 18.

Write a SQL query to enforce that salary in a Staff table must be between 3000 and 10000.

Add a CHECK constraint to an existing table Products that ensures price is greater than 0.

Create a table Students where the grade column only allows values from A to F using a CHECK constraint.

*/

CREATE TABLE Employees2 (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	age			NUMBER,
	
	CONSTRAINT Employees2_age CHECK (age>=18)

);



CREATE TABLE Staff2 (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	salary		NUMBER,
	
	CONSTRAINT Staff2_salary CHECK (salary BETWEEN 3000 AND 10000)

	-- CONSTRAINT Staff_salary CHECK (salary >= 3000 AND salary <= 10000)
);



CREATE TABLE Products2 (

	id			NUMBER PRIMARY KEY ,
	name		VARCHAR2 (100),
	price		NUMBER,
	
	CONSTRAINT Products2 CHECK (price >0)

);


CREATE TABLE Students2 (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	grade		CHAR (1),
	
	CONSTRAINT Students2_grade CHECK (grade IN ('A','B','C','D','E','F'))

);
