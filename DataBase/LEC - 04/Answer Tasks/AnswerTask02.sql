-- Q1. Use REPLACE to replace the letter 'a' with '@' in the word 'database'.
-- Q2. Use REPLACE to replace a full word in a string (e.g., "old" with "new").
-- Q3. Create a table PRODUCT with a product_name column, and insert 3 sample products.
-- Q4. Use LPAD to format product names to 15 characters by padding with '*' on the left.
-- Q5. Use RPAD to format product names to 15 characters by padding with '#' on the right.



-- 01
SELECT REPLACE('database' , 'a' , '@') AS RESULT FROM dual;


-- 02
SELECT REPLACE('This is the old version' , 'old' , 'new') AS RESULT FROM dual;


-- 03
CREATE TABLE product (
       product_name Varchar2(100)
);

INSERT INTO product VALUES ('Laptop');
INSERT INTO PRODUCT VALUES ('Phone');
INSERT INTO PRODUCT VALUES ('Tablet');
COMMIT;

SELECT * FROM PRODUCT;


-- 04
SELECT product_name , LPAD(product_name , 15 , '*') AS lpadded_name FROM PRODUCT;


-- 05
SELECT product_name , RPAD(PRODUCT_name , 15 , '#') AS rpadded_name FROM PRODUCT;






