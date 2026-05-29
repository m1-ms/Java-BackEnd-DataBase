-- Q1. Create a table called EMP_TEST with a column NAME having leading and trailing spaces.
-- Q2. Display all names using TRIM to remove both leading and trailing spaces.
-- Q3. Use LTRIM to remove only leading spaces.
-- Q4. Use RTRIM to remove only trailing spaces.
-- Q5. Use TRIM to remove a specific character (e.g., ‘*’ or ‘#’) from both sides of a string.



-- 01
CREATE TABLE EMP_TEST ( name VARCHAR2 (100) );

INSERT INTO EMP_TEST VALUES ('   Ahmed   ');
INSERT INTO EMP_TEST VALUES ('   Mohamed   ');
INSERT INTO EMP_TEST VALUES ('   Osama   ');
COMMIT;

SELECT * FROM EMP_TEST;


-- 02
SELECT name AS original_name , TRIM(NAME) AS trimmed_name FROM EMP_TEST;


-- 03
SELECT name AS original_name, LTRIM(NAME) AS ltrimmed_name FROM EMP_TEST;


-- 04
SELECT name AS original_name , RTRIM(NAME) AS rtrimmed_name FROM EMP_TEST;


-- 05
SELECT TRIM('*' FROM '***Ahmed***') AS RESULT FROM dual;

SELECT TRIM('#' FROM '###Mohamed###') AS RESULT FROM dual;

SELECT TRIM(BOTH '*' FROM '***Ahmed***') AS BOTH_trim FROM dual;

SELECT TRIM(LEADING '*' FROM '***Ahmed***') AS LEADING_trim FROM dual;

SELECT TRIM(TRAILING '*' FROM '***Ahmed***') AS TRAILING_trim FROM dual;
















