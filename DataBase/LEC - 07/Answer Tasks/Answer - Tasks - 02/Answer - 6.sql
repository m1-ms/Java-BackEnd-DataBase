/*

	💡 Oracle SQL – Multiple Row Subqueries Coding Questions
Find all employees who earn more than at least one employee in department 10.
Use a subquery with ANY or SOME.

List the employees who earn less than all employees in department 20.
Use a subquery with ALL.

Display products that have a price equal to any product in the 'Electronics' category.
Use a subquery inside an IN clause.

Retrieve names of customers who have placed an order for a product with price greater than $1000.
Use a subquery with IN or EXISTS.

List the employees who work in the same job titles as at least one other employee.
Use a subquery with IN on job titles.

Find the departments that have more than one employee.
Use a subquery with GROUP BY and HAVING, or join with a subquery returning multiple department IDs.

Show all orders placed by customers who are from cities where other customers have placed orders too.
Use a correlated subquery or a multiple-row subquery with IN.

List all books that were written by authors who have published more than one book.
Use a subquery with GROUP BY and HAVING.

Display the names of students who are enrolled in any of the courses taught by professor 'Dr. Smith'.
Use a subquery to get course IDs.

Retrieve all employees whose salary matches any of the salaries in department 30.
Use a subquery with IN.
   
 */


-- Find all employees who earn more than at least one employee in department 10.
-- Use a subquery with ANY or SOME.

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary > ANY (SELECT salary FROM EMPLOYEES WHERE department_id = 10);

/*
 * Subquery > [ SELECT salary FROM EMPLOYEES WHERE department_id = 10 ]
 * سبب الاستخدام هنا عشان نجيب كل مرتبات موظفين قسم 10 وممكن تكون أكتر من قيمة 
 * ( multiple-row )
 * وبعدين نستخدم
 * ANY
 * عشان نجيب اي موظف مرتبه أعلى من واحد منهم على الأقل
 */



-- List the employees who earn less than all employees in department 20.
-- Use a subquery with ALL.

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary < ALL (SELECT salary FROM EMPLOYEES WHERE department_id = 20);

/*
 * Subquery > [ SELECT salary FROM EMPLOYEES WHERE department_id = 20 ]
 * سبب الاستخدام هنا عشان نجيب كل مرتبات موظفين قسم 20 وممكن تكون أكتر من قيمة 
 * ( multiple-row )
 * وبعدين نستخدم
 * ALL
 * عشان نجيب اي موظف مرتبه أقل من كل واحد فيهم مش بس واحد منهم
 */



-- Display products that have a price equal to any product in the 'Electronics' category.
-- Use a subquery inside an IN clause.

SELECT product_name, category, price
    FROM PRODUCTS_SQ
    WHERE price IN (SELECT price FROM PRODUCTS_SQ WHERE category = 'Electronics');

/*
 * Subquery > [ SELECT price FROM PRODUCTS_SQ WHERE category = 'Electronics' ]
 * سبب الاستخدام هنا عشان نجيب كل أسعار منتجات فئة 
 * Electronics
 * وممكن تكون أكتر من قيمة 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب اي منتج سعره يطابق واحد من الأسعار دي بالظبط، حتى لو من فئة تانية
 */



-- Retrieve names of customers who have placed an order for a product with price greater than $1000.
-- Use a subquery with IN or EXISTS.

SELECT customer_name
    FROM CUSTOMERS_MRQ
    WHERE customer_id IN (
        SELECT o.customer_id FROM ORDERS_MRQ o JOIN ORDER_ITEMS_MRQ oi
        ON (o.order_id = oi.order_id)
        WHERE oi.price > 1000
    );

/*
 * Subquery > [ SELECT o.customer_id FROM ORDERS_MRQ o JOIN ORDER_ITEMS_MRQ oi ON () WHERE oi.price > 1000 ]
 * سبب الاستخدام هنا عشان نجيب أرقام العملاء اللي عندهم أوردر فيه منتج سعره أكتر من 1000
 * وممكن تكون أكتر من عميل 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب اسم كل عميل من الليستة دي
 */



-- List the employees who work in the same job titles as at least one other employee.
-- Use a subquery with IN on job titles.

SELECT first_name, last_name, job_id
    FROM EMPLOYEES e
    WHERE job_id IN (SELECT job_id FROM EMPLOYEES WHERE employee_id != e.employee_id);

/*
 * Subquery > [ SELECT job_id FROM EMPLOYEES WHERE employee_id != e.employee_id ]
 * سبب الاستخدام هنا عشان لكل موظف نجيب كل ال 
 * job_id
 *  بتاعة باقي الموظفين ما عداه هو
 * وممكن تكون أكتر من قيمة 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نشوف هل الوظيفة بتاعته موجودة عند حد تاني ولا لا
 * ( e.employee_id )
 */



-- Find the departments that have more than one employee.
-- Use a subquery with GROUP BY and HAVING, or join with a subquery returning multiple department IDs.

SELECT department_name
    FROM DEPARTMENTS
    WHERE department_id IN (
        SELECT department_id FROM EMPLOYEES
        GROUP BY department_id
        HAVING COUNT(*) > 1
    );

/*
 * Subquery > [ SELECT department_id FROM EMPLOYEES GROUP BY department_id HAVING COUNT(*) > 1 ]
 * سبب الاستخدام هنا عشان نجمع الموظفين حسب القسم ونجيب بس الأقسام اللي عدد موظفيها أكتر من 1
 * وممكن تكون أكتر من قسم 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب اسم كل قسم من الليستة دي
 */



-- Show all orders placed by customers who are from cities where other customers have placed orders too.
-- Use a correlated subquery or a multiple-row subquery with IN.

SELECT o.order_id, c.customer_name, c.city
    FROM ORDERS_CITY o JOIN CUSTOMERS_CITY c
    ON (o.customer_id = c.customer_id)
    WHERE c.city IN (
        SELECT c2.city FROM CUSTOMERS_CITY c2 JOIN ORDERS_CITY o2
        ON (c2.customer_id = o2.customer_id)
        WHERE c2.customer_id != c.customer_id
    );

/*
 * Subquery > [ SELECT c2.city FROM CUSTOMERS_CITY c2 JOIN ORDERS_CITY o2 ON () WHERE c2.customer_id != c.customer_id ]
 * سبب الاستخدام هنا عشان لكل أوردر نجيب كل المدن اللي فيها عملاء تانيين (غيره) عملوا أوردر
 * وممكن تكون أكتر من مدينة 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نشوف هل مدينة العميل ده من ضمنهم
 */



-- List all books that were written by authors who have published more than one book.
-- Use a subquery with GROUP BY and HAVING.

SELECT book_title, author_id
    FROM BOOKS_ROJ
    WHERE author_id IN (
        SELECT author_id FROM BOOKS_ROJ
        GROUP BY author_id
        HAVING COUNT(*) > 1
    );

/*
 * Subquery > [ SELECT author_id FROM BOOKS_ROJ GROUP BY author_id HAVING COUNT(*) > 1 ]
 * سبب الاستخدام هنا عشان نجمع الكتب حسب المؤلف ونجيب بس المؤلفين اللي عندهم أكتر من كتاب
 * وممكن تكون أكتر من مؤلف 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب كل كتب المؤلفين دول
 */



-- Display the names of students who are enrolled in any of the courses taught by professor 'Dr. Smith'.
-- Use a subquery to get course IDs.

SELECT student_name
    FROM STUDENTS_PROF s JOIN ENROLL_PROF e
    ON (s.student_id = e.student_id)
    WHERE e.course_id IN (SELECT course_id FROM COURSES_PROF WHERE instructor_name = 'Dr. Smith');

/*
 * Subquery > [ SELECT course_id FROM COURSES_PROF WHERE instructor_name = 'Dr. Smith' ]
 * سبب الاستخدام هنا عشان نجيب كل كورسات 
 * Dr. Smith
 * وممكن يدرس أكتر من كورس 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب كل طالب مسجل في اي كورس من الليستة دي
 */



-- Retrieve all employees whose salary matches any of the salaries in department 30.
-- Use a subquery with IN.

SELECT first_name, last_name, salary, department_id
    FROM EMPLOYEES
    WHERE salary IN (SELECT salary FROM EMPLOYEES WHERE department_id = 30);

/*
 * Subquery > [ SELECT salary FROM EMPLOYEES WHERE department_id = 30 ]
 * سبب الاستخدام هنا عشان نجيب كل مرتبات موظفين قسم 30 وممكن تكون أكتر من قيمة 
 * ( multiple-row )
 * وبعدين نستخدم
 * IN
 * عشان نجيب اي موظف مرتبه يطابق واحد من المرتبات دي بالظبط، حتى لو من قسم تاني
 */



