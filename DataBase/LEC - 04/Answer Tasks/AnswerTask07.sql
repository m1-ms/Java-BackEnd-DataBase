/*

1. Character Functions – Part 3 (TRIM, LTRIM, RTRIM)
Create a table customers with a full_name column. Insert names with extra spaces at the beginning and/or end.

Write a query to remove both leading and trailing spaces from the names using TRIM.

Display only the names with leading spaces removed using LTRIM.

Display only the names with trailing spaces removed using RTRIM.

Trim specific characters (e.g., $, *, or #) from both sides of a given string.

----------------------
2. Character Functions – Part 4 (REPLACE, LPAD, RPAD)
Replace all occurrences of the letter 'o' with '0' in the word “promotion”.

Replace the word “basic” with “advanced” in the sentence “This is a basic course”.

Create a departments table with dept_name column. Insert at least 3 department names.

Format each department name to 15 characters by padding with ‘*’ on the left using LPAD.

Format each department name to 15 characters by padding with ‘-’ on the right using RPAD.
--------------------------------
3. TO_CHAR Function
Display the current date in the format DD-MON-YYYY.

Display the current date in the format Day, Month YYYY.

Convert a number to a formatted string with commas and two decimal places using TO_CHAR.

Format an employee’s salary to include a currency symbol using TO_CHAR.

Display system date in the format: YYYY/MM/DD HH24:MI:SS.
----------------------------------------
4. Oracle Conditional Expressions – CASE Expressions
Create a students table with name and score columns. Insert at least 5 records.

Write a query using CASE to assign grades based on the score:

90 and above: A

80–89: B

70–79: C

Below 70: F

Modify the query to display “Pass” if score is 60 or more, otherwise “Fail”.

Use CASE to display a message for each student:

"Excellent" for A, "Good" for B, "Average" for C, and "Needs Improvement" for F.

Write a CASE expression using system date to return the name of the day (e.g., “Today is Monday”).
------------------------------
5. Oracle Conditional Expressions – DECODE Function
Use DECODE to return grade letters ('A', 'B', 'C', 'F') based on specific score values (e.g., 100 = A, 90 = B, etc.).

Create a status_log table with a status_code column containing values like ‘N’, ‘I’, ‘C’.

Use DECODE to convert:

‘N’ → ‘New’

‘I’ → ‘In Progress’

‘C’ → ‘Completed’

Use DECODE to check if a product’s quantity is 0, and display “Out of Stock”, otherwise “Available”.

Write a query using DECODE to display a bonus:

If department is ‘HR’ → 500

If department is ‘IT’ → 1000

If department is ‘Sales’ → 1500

Else → 300

*/


CREATE TABLE customers ( 
		full_name VARCHAR2(100)
);

INSERT INTO customers VALUES ('   Ahmed Mohamed   ');
INSERT INTO customers VALUES ('   Sara Ali');
INSERT INTO customers VALUES ('Mona Hassan   ');
INSERT INTO customers VALUES ('   Khaled Omar   ');
INSERT INTO customers VALUES ('Yasmin Samy');

SELECT * FROM customers;

-- Trim
SELECT full_name , TRIM(full_name) AS trimmed FROM CUSTOMERS;

-- LTRIM 
SELECT full_name , LTRIM(full_name) AS L_trimmed FROM CUSTOMERS;

-- RLTRIM
SELECT full_name , RTRIM(full_name) AS R_trimmed FROM CUSTOMERS;


SELECT TRIM('$' FROM '$$$Hello World$$$') AS trimmed FROM dual;
SELECT TRIM('*' FROM '***Hello World***') AS trimmed FROM dual;
SELECT TRIM('#' FROM '###Hello World###') AS trimmed FROM dual;



SELECT REPLACE('promotion', 'o', '0') AS result FROM dual;
SELECT REPLACE('This is a basic course', 'basic', 'advanced') AS result FROM dual;


CREATE TABLE department_1 (
	
	depart_name VARCHAR2(100)

);


INSERT INTO DEPARTMENT_1 VALUES ('HR');
INSERT INTO DEPARTMENT_1 VALUES ('IT');
INSERT INTO DEPARTMENT_1 VALUES ('SALES');
INSERT INTO DEPARTMENT_1 VALUES ('MARKETING');

SELECT * FROM DEPARTMENT_1;



SELECT depart_name , LPAD(depart_name , 15 ,'*' ) AS lpadded FROM DEPARTMENT_1;

SELECT depart_name, RPAD(depart_name, 15, '-') AS rpadded FROM DEPARTMENT_1;



SELECT TO_CHAR(SYSDATE , 'DD-MON-YYYY') AS formatted_date FROM dual;

SELECT TO_CHAR(SYSDATE, 'Day, Month YYYY') AS formatted_date FROM dual;



SELECT TO_CHAR(1234567.89, '9,999,999.99') AS formatted_number FROM dual;


SELECT first_name, salary,

       TO_CHAR(salary, '$99,999.00') AS formatted_salary

FROM employees;


SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS full_datetime FROM dual;




CREATE TABLE STUDENT (
	name VARCHAR2(50), score NUMBER(3)
);


INSERT INTO STUDENT VALUES ('Ahmed',  95);
INSERT INTO STUDENT VALUES ('Sara',   85);
INSERT INTO STUDENT VALUES ('Ali',    75);
INSERT INTO STUDENT VALUES ('Mona',   65);
INSERT INTO STUDENT VALUES ('Khaled', 55);
INSERT INTO STUDENT VALUES ('Yasmin', 90);
INSERT INTO STUDENT VALUES ('Omar',   80);


SELECT * FROM STUDENT;




SELECT name, score,
       CASE
           WHEN score >= 90 THEN 'A'
           WHEN score >= 80 THEN 'B'
           WHEN score >= 70 THEN 'C'
           ELSE 'F'
       END AS grade
FROM STUDENT;


SELECT name, score,
       CASE
           WHEN score >= 60 THEN 'Pass'
           ELSE 'Fail'
       END AS result
FROM STUDENT;


SELECT name, score,
       CASE
           WHEN score >= 90 THEN 'Excellent'
           WHEN score >= 80 THEN 'Good'
           WHEN score >= 70 THEN 'Average'
           ELSE 'Needs Improvement'
       END AS message
FROM STUDENT;


SELECT TO_CHAR(SYSDATE, 'Day') AS today,
       'Today is ' || TRIM(TO_CHAR(SYSDATE, 'Day')) AS message FROM dual;




SELECT name ,  score , DECODE(score , 100 , 'A' , 90 , 'A' , 80 , 'B' , 70 , 'C' , 'F') 
	AS grade FROM STUDENT;

CREATE TABLE Status_LOG (
	
	status_code VARCHAR2(1)

);

INSERT INTO STATUS_LOG VALUES ('N');
INSERT INTO STATUS_LOG VALUES ('I');
INSERT INTO STATUS_LOG VALUES ('C');
INSERT INTO STATUS_LOG VALUES ('N');
INSERT INTO STATUS_LOG VALUES ('I');

SELECT * FROM STATUS_LOG;


SELECT status_code, DECODE(status_code , 'N' , 'New' , 'I' , 'In Progress' , 'C' , 'Completed' , 'Unknown') 
	AS status_description FROM STATUS_LOG;

DROP TABLE PRODUCT;

CREATE TABLE PRODUCT (
    product_name VARCHAR2(50),
    quantity     NUMBER(5)
);

INSERT INTO PRODUCT VALUES ('Laptop',   10);
INSERT INTO PRODUCT VALUES ('Mouse',     0);
INSERT INTO PRODUCT VALUES ('Keyboard',  5);
INSERT INTO PRODUCT VALUES ('Monitor',   0);
INSERT INTO PRODUCT VALUES ('Headset',   3);


SELECT * FROM PRODUCT;

SELECT product_name , quantity , DECODE(quantity , 0 , 'Out of Stock' , 'Available' ) 
	AS availability FROM PRODUCT;

/*
SELECT first_name , department_id , DECODE(department_id , 40 , 500 , 60 , 1000 , 80 , 1500 , 300)
		AS bonus FROM EMPLOYEES;
*/

CREATE TABLE EMP_DEPT (
    emp_name   VARCHAR2(50),
    department VARCHAR2(20)
);

INSERT INTO EMP_DEPT VALUES ('Ahmed',  'HR');
INSERT INTO EMP_DEPT VALUES ('Sara',   'IT');
INSERT INTO EMP_DEPT VALUES ('Ali',    'Sales');
INSERT INTO EMP_DEPT VALUES ('Mona',   'HR');
INSERT INTO EMP_DEPT VALUES ('Khaled', 'Finance');

SELECT * FROM EMP_DEPT;


SELECT emp_name , department , DECODE(department , 'HR' , 500 , 'IT' , 1000 , 'Sales' , 1500 , 300)
	AS bonus FROM EMP_DEPT;



/*
SELECT column_name, data_type
FROM user_tab_columns
WHERE table_name = 'PRODUCT';
*/













