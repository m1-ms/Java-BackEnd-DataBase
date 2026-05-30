-- Q1. Display current date in the format 'DD-MON-YYYY'.
-- Q2. Display current date in the format 'Month YYYY'.
-- Q3. Convert a number to character using TO_CHAR with formatting (e.g., 12345.67 as '12,345.67').
-- Q4. Show salary formatted with a currency symbol.



-- 01
SELECT TO_CHAR(SYSDATE , 'DD-MON-YYYY') AS formatted_date FROM dual;


-- 02
SELECT TO_CHAR(SYSDATE , 'Month YYYY') AS formatted_date FROM dual;


-- 03
SELECT TO_CHAR(12345.67 , '99,999.99') AS formatted_number FROM dual;


-- 04
SELECT first_name , salary , TO_CHAR(salary , '$99,999') AS formatted_salary FROM EMPLOYEES;