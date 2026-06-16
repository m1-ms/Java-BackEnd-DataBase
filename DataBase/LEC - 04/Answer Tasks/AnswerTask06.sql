-- Q1. Use DECODE to achieve the same result as the CASE example above.
-- Q2. Create a table ORDERS with a column status ('P', 'S', 'D').
-- Q3. Use DECODE to display full form of status:
--     'P' => 'Pending', 'S' => 'Shipped', 'D' => 'Delivered'



SELECT * FROM EMPLOYEES;

--- Q 01

SELECT first_name , last_name , job_id , salary , 
		DECODE( job_id , 
		'ST_CLERK', salary * 1.2,
        'SA_REP',   salary * 1.3,
        'IT_PROG',  salary * 1.4,
		salary) AS "Updated Salary" FROM EMPLOYEES;


--- Q 02

CREATE TABLE ORDERS_1 (
		order_id   NUMBER(5),
    	customer   VARCHAR2(100),
    	status     VARCHAR2(1)
);

INSERT INTO ORDERS_1 VALUES (1, 'Manar', 'P');
INSERT INTO ORDERS_1 VALUES (2, 'Mohamed', 'S');
INSERT INTO ORDERS_1 VALUES (3, 'Sara', 'D');
INSERT INTO ORDERS_1 VALUES (4, 'Ali','');
INSERT INTO ORDERS_1 VALUES (5, 'Mona', 'P');
INSERT INTO ORDERS_1 VALUES (6, 'Mai', 'S');
INSERT INTO ORDERS_1 VALUES (7, 'Ahmed', 'D');
INSERT INTO ORDERS_1 VALUES (8, 'Bilal', '');
INSERT INTO ORDERS_1 VALUES (9, 'Mena', 'P');
INSERT INTO ORDERS_1 VALUES (10, 'Ayman', 'S');

SELECT * FROM ORDERS_1;


--- Q 03

SELECT order_id , customer , status , 
		DECODE( status ,
			  'P', 'Pending',
              'S', 'Shipped',
              'D', 'Delivered',
              'Unknown' ) AS status_description FROM ORDERS_1;

-- > I use 'Unknown' instead of 'Null' in no status don't have ('P', 'S', 'D').













