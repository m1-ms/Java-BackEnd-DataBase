/*

💡 Oracle SQL – Subqueries Coding Questions
Find the names of employees who earn more than the average salary.
Use a subquery to calculate the average salary.

List the customers who placed the highest number of orders.
Use a subquery to count orders per customer and compare with the max count.

Retrieve all products whose price is higher than any product in the ‘Accessories’ category.
Use a subquery inside a WHERE clause with ANY.

Display employees who work in the same department as 'John Smith'.
Use a subquery to get John Smith’s department ID.

Get all orders that were placed by customers from 'New York'.
Use a subquery to filter customers based on city.

Find the departments that have no employees.
Use a NOT EXISTS subquery to check for departments without employees.

List the students who are not enrolled in any course.
Use a subquery with NOT IN or NOT EXISTS.

Retrieve the second highest salary from the employees table.
Use a subquery with MAX and WHERE.

Display products that have a price greater than the average price of all products.
Use a scalar subquery to get the average price.

Find customers who have ordered all products in category 'A'.
Use a correlated subquery with NOT EXISTS.

*/


-- Find the names of employees who earn more than the average salary.
-- Use a subquery to calculate the average salary.

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary > (SELECT AVG(salary) FROM EMPLOYEES);

/*
 * Subquery > [ SELECT AVG(salary) FROM EMPLOYEES ]
 * سبب الاستخدام هنا عشان نحسب متوسط المرتبات الأول من غير ما نكتبه رقم ثابت بايدينا
 * وبعدين نقارن مرتب كل موظف بيه وده بيتحسب مرة واحدة جوه الكويري الأساسية
 */



-- List the customers who placed the highest number of orders.
-- Use a subquery to count orders per customer and compare with the max count.

SELECT customer_name, COUNT(*) AS order_count
    FROM CUSTOMERS JOIN ORDERS
    USING(customer_id)
    GROUP BY customer_name
    HAVING COUNT(*) = (SELECT MAX(cnt) FROM (SELECT COUNT(*) cnt FROM ORDERS GROUP BY customer_id));

/*
 * Subquery > [ SELECT MAX(cnt) FROM (SELECT COUNT(*) cnt FROM ORDERS GROUP BY customer_id) ]
 * سبب الاستخدام هنا عشان نحسب الأول أعلى عدد أوردرات وصل له اي عميل
 * ( subquery جوه subquery )
 *  وبعدين في
 * HAVING 
 * نقارن كل عميل بالرقم ده ونجيب بس اللي وصلوله
 */



-- Retrieve all products whose price is higher than any product in the 'Accessories' category.
-- Use a subquery inside a WHERE clause with ANY.

SELECT product_name, price
    FROM PRODUCTS_SQ
    WHERE price > ANY (SELECT price FROM PRODUCTS_SQ WHERE category = 'Accessories');

/*
 * Subquery > [ SELECT price FROM PRODUCTS_SQ WHERE category = 'Accessories' ]
 * سبب الاستخدام هنا عشان نجيب كل أسعار منتجات فئة Accessories الأول
 * وبعدين نستخدم
 * ANY
 * عشان نجيب اي منتج سعره أعلى من أرخص سعر فيهم على الأقل
 */



-- Display employees who work in the same department as 'John Smith'.
-- Use a subquery to get John Smith's department ID.

SELECT first_name, last_name, department_id
    FROM EMPLOYEES_SQ
    WHERE department_id = (SELECT department_id FROM EMPLOYEES_SQ WHERE first_name = 'John' AND last_name = 'Smith');

/*
 * Subquery > [ SELECT department_id FROM EMPLOYEES_SQ WHERE first_name = 'John' AND last_name = 'Smith' ]
 * سبب الاستخدام هنا عشان نجيب رقم قسم
 * John Smith 
 * الأول وبعدين نقارن كل الموظفين بيه ونجيب اللي في نفس القسم
 */



-- Get all orders that were placed by customers from 'New York'.
-- Use a subquery to filter customers based on city.

SELECT order_id, order_date, customer_id
    FROM ORDERS_CITY
    WHERE customer_id IN (SELECT customer_id FROM CUSTOMERS_CITY WHERE city = 'New York');

/*
 * Subquery > [ SELECT customer_id FROM CUSTOMERS_CITY WHERE city = 'New York' ]
 * سبب الاستخدام هنا عشان نجيب أرقام العملاء اللي من 
 * New York
 * الأول وبعدين نستخدم
 * IN
 * عشان نجيب كل الأوردرات اللي طلبها اي عميل من الليستة دي
 */



-- Find the departments that have no employees.
-- Use a NOT EXISTS subquery to check for departments without employees.

SELECT department_name
    FROM DEPARTMENTS_FOJ d
    WHERE NOT EXISTS (SELECT 1 FROM EMPLOYEES_FOJ2 e WHERE e.department_id = d.department_id);

/*
 * Subquery > [ SELECT 1 FROM EMPLOYEES_FOJ2 e WHERE e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان لكل قسم، نتاكد معملوش اي موظف مرتبط بيه
 * NOT EXISTS
 * بترجع صح لو ال 
 * subquery 
 * معملهاش اي صف يعني القسم فاضي من الموظفين
 */



-- List the students who are not enrolled in any course.
-- Use a subquery with NOT IN or NOT EXISTS.

SELECT student_name
    FROM STUDENTS_FOJ s
    WHERE NOT EXISTS (SELECT 1 FROM ENROLLMENTS_FOJ en WHERE en.student_id = s.student_id);

/*
 * Subquery > [ SELECT 1 FROM ENROLLMENTS_FOJ en WHERE en.student_id = s.student_id ]
 * سبب الاستخدام هنا عشان لكل طالب، نتاكد معملوش اي تسجيل مرتبط بيه
 * NOT EXISTS
 * بترجع صح لو ال 
 * subquery 
 * معملهاش اي صف يعني الطالب مش مسجل في اي كورس
 */



-- Retrieve the second highest salary from the employees table.
-- Use a subquery with MAX and WHERE.

SELECT MAX(salary) AS second_highest_salary
    FROM EMPLOYEES
    WHERE salary < (SELECT MAX(salary) FROM EMPLOYEES);

/*
 * Subquery > [ SELECT MAX(salary) FROM EMPLOYEES ]
 * سبب الاستخدام هنا عشان نجيب أعلى مرتب موجود الأول
 * وبعدين نستبعده
 * WHERE salary 
 * ونجيب أعلى مرتب من الباقي وده بيبقى تاني أعلى مرتب
 */



-- Display products that have a price greater than the average price of all products.
-- Use a scalar subquery to get the average price.

SELECT product_name, price
    FROM PRODUCTS_PRICE
    WHERE price > (SELECT AVG(price) FROM PRODUCTS_PRICE);

/*
 * Subquery > [ SELECT AVG(price) FROM PRODUCTS_PRICE ]
 * سبب الاستخدام هنا عشان نحسب متوسط أسعار كل المنتجات
 * ده اسمه 
 * scalar subquery
 * لأنه بيرجع قيمة واحدة بس (رقم واحد)
 * وبعدين نقارن كل منتج بيها
 */



-- Find customers who have ordered all products in category 'A'.
-- Use a correlated subquery with NOT EXISTS.

SELECT DISTINCT c.customer_name
    FROM CUSTOMERS c
    WHERE NOT EXISTS (
        SELECT p.product_id FROM PRODUCTS_CAT p
        WHERE p.category = 'A'
        AND NOT EXISTS (
            SELECT 1 FROM CUSTOMER_ORDERS_SQ co
            WHERE co.customer_id = c.customer_id AND co.product_id = p.product_id
        ));

/*
 * Subquery > [ NOT EXISTS جوه NOT EXISTS ]
 * سبب الاستخدام هنا عشان لكل عميل بندور هل فيه منتج فئة 
 * A
 *
 * لو معملناش نلاقي منتج زي كده معناه العميل عمل أوردر لكل منتجات الفئة 
 * A
 * فال NOT EXISTS
 *  الخارجي بيرجع صح ويظهر العميل ده
 * 
 * الداخلي بيرجع لعمود من الكويري الخارجية 
 * ( c.customer_id )
 */




/*


SELECT first_name, last_name, department_id, salary 
FROM employees
WHERE department_id IN (SELECT department_id 
                        FROM departments
                        WHERE location_id IN (SELECT location_id 
                                              FROM locations
                                              WHERE country_id =  (SELECT country_id
                                                                   FROM countries
                                                                   WHERE country_name = 'United Kingdom')));


*/

