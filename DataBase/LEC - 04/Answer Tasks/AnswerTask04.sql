-- Q1. Create a table STUDENTS with columns: name, marks.
-- Q2. Insert 5 sample students with marks.
-- Q3. Use CASE to assign grades:  >=90 => 'A', 80–89 => 'B', 70–79 => 'C', else => 'F'




-- 01
CREATE TABLE Students (
       name VARCHAR2 (100) , marks NUMBER (5,2)
);


-- 02
-- A
INSERT INTO students VALUES ('Ahmed' , 95);
-- B
INSERT INTO students VALUES ('Sara' , 85);
-- C
INSERT INTO STUDENTS VALUES ('Mohamed' , 75);
-- F
INSERT INTO STUDENTS VALUES ('Nour' , 60);
-- A
INSERT INTO STUDENTS VALUES ('Mai' , 90);

COMMIT ;

SELECT * FROM STUDENTS;

-- 03
SELECT name , marks , 
       CASE
	       WHEN marks >= 90 THEN 'A'
	       WHEN marks >= 80 THEN 'B'
	       WHEN marks >= 70 THEN 'C'
	       ELSE 'F'
	   END AS grade FROM STUDENTS;    
	   