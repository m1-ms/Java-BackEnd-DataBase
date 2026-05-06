/*

create table Doctor contain
id, name , salary , address  // Done
----------------------------------
please insert 10 row with Data as you like // Done
-----------------------------------------
update record number 3 with salary 20000 // Done
----------------------------------
delete record number 9 // Done
-----------------------------------------
 please Concatenation all name with salary  of all rows // Done
----------------------------------
display all record with salary * 2  // Done
-----------------------------------------
 select all data with salary  1000 , 2000 , 3000  // Done
----------------------------------
rename table Doctor to PRD_DOCTOR // Done

*/


-- create table Doctor contain
CREATE TABLE Doctor ( 

      id NUMBER(4) NOT NULL,
      name VARCHAR2(100),
      salary NUMBER(10, 2),
      address VARCHAR2(100)
      
      );

SELECT * FROM Doctor;

-- please insert 10 row with Data as you like
INSERT INTO Doctor VALUES (1  , 'Ahmed Ali'     , 7000 , 'Cairo');
INSERT INTO Doctor VALUES (2  , 'Mohamed Ahmed' , 9000 , 'Giza');
INSERT INTO Doctor VALUES (3  , 'Sara Mohsen'   , 8000 , 'Tanta');
INSERT INTO Doctor VALUES (4  , 'Omar Nassar'   , 1000 , 'Luxor');
INSERT INTO Doctor VALUES (5  , 'Manar Mahmoud' , 9000 , 'Monofeya');
INSERT INTO Doctor VALUES (6  , 'Dina Amr'      , 8000 , 'Alex');
INSERT INTO Doctor VALUES (7  , 'Rania Mostafa' , 9000 , 'Monofeya');
INSERT INTO Doctor VALUES (8  , 'Aya Ahmed'     , 2000 , 'Tanta');
INSERT INTO Doctor VALUES (9  , 'Ahmed Mahfoz'  , 9000 , 'Cairo');
INSERT INTO Doctor VALUES (10 , 'Fawzy Saad'    , 3000 , 'Aswan');


-- update record number 3 with salary 20000
-- update id = 3
UPDATE
	Doctor
SET
	salary = 20000
WHERE
	id = 3;


-- delete record number 9
DELETE
FROM
	Doctor
WHERE
	id = 9;


-- please Concatenation all name with salary  of all rows
SELECT name || ' - Salary : ' || salary AS name_Salary
FROM Doctor;


-- display all record with salary * 2
SELECT id, name, salary * 2 AS double_salary
FROM Doctor;


-- select all data with salary  1000 , 2000 , 3000 
SELECT * FROM Doctor
WHERE salary IN (1000, 2000, 3000);


-- rename table Doctor to PRD_DOCTOR
RENAME Doctor TO PRD_DOCTOR;

-- DROP TABLE PRD_DOCTOR;
