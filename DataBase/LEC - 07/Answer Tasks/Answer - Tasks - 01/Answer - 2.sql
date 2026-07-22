/*

Write a query to display employee names and department names by joining the employees and departments tables using the USING clause on department_id.

Write a query to list all orders and their corresponding customer names using the USING clause on customer_id.

Write a query to retrieve product names and supplier names from the products and suppliers tables using the USING clause on supplier_id.

Write a query to show student names and course titles by joining students and enrollments using the USING clause on student_id.

Write a query to display invoice numbers and product names by joining invoices and products using the USING clause on product_id.

Write a query to list project names and employee names using the USING clause on project_id.

Write a query to retrieve author names and book titles using the USING clause on author_id.

Write a query to show sales order details with employee names using the USING clause on employee_id.

Write a query to display course schedules and instructor names using the USING clause on instructor_id.

Write a query to list transactions along with account holder names using the USING clause on account_id.

*/


-- Write a query to display employee names and department names by joining the employees and departments tables using the USING clause on department_id.

SELECT first_name, last_name, department_name
    FROM EMPLOYEES JOIN DEPARTMENTS
    USING(department_id);

/*
 * USING > [ department_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle 
 * تدور عليه لوحدها زي 
 * NATURAL JOIN
 */



-- Write a query to list all orders and their corresponding customer names using the USING clause on customer_id.

SELECT order_id, order_date, customer_name
    FROM ORDERS JOIN CUSTOMERS
    USING(customer_id);

/*
 * USING > [ customer_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to retrieve product names and supplier names from the products and suppliers tables using the USING clause on supplier_id.

SELECT product_name, supplier_name
    FROM PRODUCTS JOIN SUPPLIERS
    USING(supplier_id);

/*
 * USING > [ supplier_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */
 


-- Write a query to show student names and course titles by joining students and enrollments using the USING clause on student_id.

SELECT student_name, course_name
    FROM STUDENTS_ENR JOIN ENROLLMENTS
    USING(student_id)
    JOIN COURSES
    USING(course_id);

/*
 * USING > [ student_id ] then [ course_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجداول تلاتتهم بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to display invoice numbers and product names by joining invoices and products using the USING clause on product_id.

SELECT invoice_id, product_name
    FROM INVOICES JOIN PRODUCTS
    USING(product_id);

/*
 * USING > [ product_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to list project names and employee names using the USING clause on project_id.

SELECT project_name, first_name, last_name
    FROM PROJECTS JOIN EMPLOYEES_PROJ
    USING(project_id);

/*
 * USING > [ project_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to retrieve author names and book titles using the USING clause on author_id.

SELECT author_name, book_title
    FROM AUTHORS JOIN BOOKS
    USING(author_id);

/*
 * USING > [ author_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to show sales order details with employee names using the USING clause on employee_id.

SELECT sales_order_id, order_amount, order_date, first_name, last_name
    FROM SALES_ORDERS JOIN EMPLOYEES
    USING(employee_id);

/*
 * USING > [ employee_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to display course schedules and instructor names using the USING clause on instructor_id.

SELECT class_name, instructor_name
    FROM CLASS_SCHEDULES JOIN INSTRUCTORS
    USING(instructor_id);

/*
 * USING > [ instructor_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */



-- Write a query to list transactions along with account holder names using the USING clause on account_id.

SELECT transaction_id, amount, transaction_date, account_holder_name
    FROM TRANSACTIONS111 JOIN ACCOUNTS111
    USING(account_id);

/*
 * USING > [ account_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين بشرط تحديد اسم العمود المشترك بنفسي بدل ما
 * Oracle
 * تدور عليه لوحدها زي
 * NATURAL JOIN
 */











