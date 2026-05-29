/*

1. Find all employee where the emp_id is within a certain range  100  and  105.
2. Find all employee that belong to a specific set of emp_id  151 , 152, 153, 154 , 155.
3. Retrieve all employee where the employee first_name starts with the letter 'P' OR 'p'
4. Retrieve all employee where the employee first_name end with the letter 'A' OR 'a'
5. Retrieve all employee where the employee first_name with the letter 'A' OR 'a'
6. Retrieve all employee where the employee first_name  third char with the letter 'e' OR 'E'
7. Retrieve all employees who don't have a manager assigned (i.e., manager_id is NULL).
8. Find all employees who have a manager assigned.
9. Insert a new employee without assigning a manager (NULL value for manager_id).
10. Find all employees who work either in the 'AD_VP' JOB_ID or the 'IT_PROG' JOB_ID.
11. Retrieve all employees sorted by their last_name in ascending order.
12. Retrieve all employees sorted by their hire_date in descending order.
13. Sort employees first by department in ascending order and then by salary in descending order within each department_id.
14. Retrieve all employees with their last_name in lowercase.
15. Retrieve all employees with their first_name in uppercase.
16. Retrieve all employees with their first_name and last_name in title case (first letter capitalized).
17. Find employees whose last_name is 'smith', regardless of the case.

*/

-- 01 
SELECT * FROM employees 
              WHERE employee_id BETWEEN 100 AND 105;


-- 02
SELECT * FROM employees 
              WHERE EMPLOYEE_ID IN ( 151 , 152 , 153 , 154 , 155 );


-- 03
SELECT * FROM employees 
              WHERE upper (FIRST_name) LIKE 'P%';


-- 04
SELECT * FROM employees 
              WHERE upper (FIRST_name) LIKE '%A';


-- 05
SELECT * FROM employees 
              WHERE upper (FIRST_name) LIKE '%A%';


-- 06
SELECT * FROM employees 
              WHERE upper (FIRST_name) LIKE '__E%';


-- 07
SELECT * FROM EMPLOYEES 
              WHERE MANAGER_ID IS NULL;


-- 08
SELECT * FROM EMPLOYEES 
              WHERE MANAGER_ID IS NOT NULL;


-- 09
INSERT INTO employees (employee_id, first_name, last_name,email, hire_date, job_id, manager_id)
            VALUES (301, 'Ahmed', 'Hassan', 'AHASSAN1', SYSDATE, 'AD_PRES', NULL);


-- 10
SELECT * FROM EMPLOYEES 
              WHERE JOB_ID IN ( 'AD_VP' , 'IT_PROG' );


-- 11
SELECT * FROM employees
              ORDER BY LAST_NAME ASC;


-- 12
SELECT * FROM EMPLOYEES
              ORDER BY HIRE_DATE DESC;


-- 13
SELECT * FROM EMPLOYEES
              ORDER BY DEPARTMENT_ID ASC , SALARY DESC;

-- 14
SELECT employee_id , first_name , LOWER(LAST_name) AS last_name FROM EMPLOYEES;


-- 15
SELECT employee_id , UPPER(FIRST_NAME) AS FIRST_name , LAST_name FROM EMPLOYEES;


-- 16
SELECT INITCAP(first_name) AS first_name , INITCAP(last_name) AS last_name FROM EMPLOYEES;


-- 17
SELECT * FROM EMPLOYEES WHERE LOWER(LAST_NAME) = 'smith';



