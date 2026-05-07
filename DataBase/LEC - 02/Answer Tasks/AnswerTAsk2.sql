/*
 
create Employees table wiith column ( EmployeeID, FirstName, LastName, Department, Salary )
-----------------------------------------------------------------------------------
Insert a new record into the Employees table.

EmployeeID     FirstName   LastName  Department      Salary
101            'John1'      'Doe1'     'HR'            20000
102            'John2'      'Doe2'     'IT'            50000
103            'John3'      'Doe3'     'CS'            40000
104            'John4'      'Doe4'     'IT'            10000
105            'John5'      'Doe5'     'ZX'            30000
-----------------------------------------------------------------------------------
Update the salary of an employee to 600000 with EmployeeID     101.
-----------------------------------------------------------------------------------
Delete a record of an employee who Department = 101.
-----------------------------------------------------------------------------------
Retrieve all employees in the IT department.
-----------------------------------------------------------------------------------
select * data from table but conatination  FirstName, LastName as one column
-----------------------------------------------------------------------------------

 */

-- create Employees table wiith column 
-- ( EmployeeID, FirstName, LastName, Department, Salary )
CREATE TABLE EmployeesNew ( 
       EmployeeID NUMBER,
       FirstName VARCHAR2(50),
       LastName VARCHAR2(50),
       Department VARCHAR2(50),
       Salary NUMBER
);

-- DROP TABLE EmployeesNew;


-- Insert a new record into the Employees table.
INSERT INTO EmployeesNew ( EmployeeID , FirstName , LastName , Department , Salary )
VALUES (101,'John1','Doe1','HR',20000);

INSERT INTO EmployeesNew ( EmployeeID , FirstName , LastName , Department , Salary )
VALUES (102,'John2','Doe2','IT',50000);

INSERT INTO EmployeesNew ( EmployeeID , FirstName , LastName , Department , Salary )
VALUES (103,'John3','Doe3','CS',40000);

INSERT INTO EmployeesNew ( EmployeeID , FirstName , LastName , Department , Salary )
VALUES (104,'John4','Doe4','IT',10000);

INSERT INTO EmployeesNew ( EmployeeID , FirstName , LastName , Department , Salary )
VALUES (105,'John5','Doe5','ZX',30000);


-- Update the salary of an employee to 600000 with EmployeeID     101.
UPDATE EmployeesNew SET SALARY = 60000 WHERE EmployeeID = 101;


-- Delete a record of an employee who Department = 101.
DELETE FROM EmployeesNew WHERE EmployeeID = 101;


-- Retrieve all employees in the IT department.
SELECT * FROM EmployeesNew WHERE DEPARTMENT ='IT';

-- select * data from table but conatination  FirstName, LastName as one column
SELECT FIRSTNAME   || ' ' || LASTNAME   AS FullName FROM EmployeesNew;








