SELECT * FROM EMPLOYEES;

-- 1. AVG Function
SELECT AVG(SALARY) FROM EMPLOYEES;

-- 2. Count Function
SELECT COUNT (*) FROM EMPLOYEES;

-- 3. Max Function
SELECT MAX(SALARY) FROM EMPLOYEES;

-- 4. Min Function
SELECT MIN(SALARY) FROM EMPLOYEES;

-- 5. Sum Function
SELECT SUM(SALARY) FROM EMPLOYEES;

-- 6. GROUP BY Clause (Part 1)
SELECT Department_id , AVG(SALARY) FROM EMPLOYEES
		GROUP BY Department_id;

-- 7. GROUP BY Clause (Part 2)
SELECT JOB_ID , COUNT(*) FROM EMPLOYEES 
		GROUP BY JOB_ID;

-- 8. HAVING Clause
SELECT Department_id , SUM(SALARY) FROM EMPLOYEES
		GROUP BY Department_id HAVING SUM(SALARY) > 50000;

-- 9. AVG Function (Advanced)
SELECT AVG(COMMISSION_PCT) FROM EMPLOYEES
		WHERE COMMISSION_PCT IS NOT NULL;

-- 10. COUNT Function (Advanced)
SELECT COUNT(*) FROM EMPLOYEES 
		WHERE  SALARY > 10000;

-- 11. MAX and MIN Together
SELECT Job_id , MAX(salary) AS max_salary , MIN(salary) AS min_salary
		FROM EMPLOYEES GROUP BY JOB_ID;

-- 12. SUM Function (Advanced)
SELECT Manager_id , SUM(salary) AS Total_salary
		FROM EMPLOYEES GROUP BY MANAGER_ID;

-- 13. GROUP BY with Multiple Columns
SELECT Department_id , Job_id , SUM(salary) AS total_salary
		FROM EMPLOYEES GROUP BY DEPARTMENT_ID , JOB_ID;

-- 14. HAVING with COUNT
SELECT JOB_ID , COUNT(*) AS Employees_Count 
		FROM EMPLOYEES GROUP BY JOB_ID HAVING COUNT(*) > 5;

-- 15. Using Aggregate Functions Together
SELECT Department_id , COUNT(*) AS total_employees , AVG(salary) AS average_salary , 
						MAX(salary) AS maximum_salary , MIN(salary) AS minimum_salary
		FROM EMPLOYEES GROUP BY DEPARTMENT_ID;
						
-- 16. Complex HAVING
SELECT Department_id , AVG(salary) AS average_salary , COUNT(*) AS employee_count 
		FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING AVG(SALARY) > 8000 AND COUNT(*) <10;

-- 17. Nested Aggregation
SELECT Department_id , SUM(salary) AS total_salary 
		FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY TOTAL_SALARY DESC FETCH FIRST 1 ROW ONLY;

-- 18. Using Aliases with Aggregates
SELECT Department_id , SUM(salary) AS total_salary , AVG(salary) average_salary 
		FROM EMPLOYEES GROUP BY DEPARTMENT_ID;

