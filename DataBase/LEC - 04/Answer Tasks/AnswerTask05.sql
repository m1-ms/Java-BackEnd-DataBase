-- Q1. Use DECODE to achieve the same result as the CASE example above.
-- Q2. Create a table ORDERS with a column status ('P', 'S', 'D').
-- Q3. Use DECODE to display full form of status: 'P' => 'Pending', 'S' => 'Shipped', 'D' => 'Delivered'




-- 01
SELECT name , marks , DECODE(
                         SIGN(marks - 90) , 0 , 'A' , 1 , 'A' ,
                         DECODE(
                           SIGN(marks - 80) , 0 , 'B' , 1 , 'B' ,
                           DECODE(
                             SIGN(marks - 70) , 0 , 'C' , 1 , 'C' , 'F'
                           )
                        )
                     ) AS grade FROM students;

-- 02
CREATE TABLE Orders (
       order_id NUMBER (3) , status varchar2(1)
);

INSERT INTO Orders VALUES (1 , 'P');
INSERT INTO Orders VALUES (2 , 'S');
INSERT INTO Orders VALUES (3 , 'D');

COMMIT;

SELECT * FROM Orders;
	

-- 03
SELECT 
      order_id , status , DECODE( status , 'P' , 'Pending' , 'S' , 'Shipped' , 'D' , 'Delivered' , 'Unknown') 
AS status_full FROM Orders;


