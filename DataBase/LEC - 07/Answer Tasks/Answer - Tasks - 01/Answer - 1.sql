/*

Write a query to display the names of employees and their department names using a natural join.

Write a query to list all orders with their corresponding customer names using a natural join.

Write a query to show student names and the courses they are enrolled in using a natural join.

Write a query to display project names and the employees working on them using a natural join.

Write a query to retrieve invoice details along with product names using a natural join.

Write a query to find all books with their respective author names using a natural join.

Write a query to list all class schedules along with their instructors’ names using a natural join.

Write a query to show supplier names and the products they supply using a natural join.

Write a query to display customer orders along with shipping details using a natural join.

Write a query to list employees along with their job titles using a natural join.

*/


SELECT * FROM employees;
SELECT * FROM departments;

-- Write a query to display the names of employees and their department names using a natural join.

SELECT first_name , last_name , Department_name 
			FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;


/*
 * NATURAL JOIN > [ Department_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكونن ربط تلقائي من غير مكتب شرط ربط بنفسي 
 */



-- Write a query to list all orders with their corresponding customer names using a natural join.

SELECT order_id, order_date, customer_name
    FROM ORDERS NATURAL JOIN CUSTOMERS;

/*
 * NATURAL JOIN > [ customer_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to show student names and the courses they are enrolled in using a natural join.

SELECT student_name, course_name
    FROM STUDENTS NATURAL JOIN COURSES;

/*
 * NATURAL JOIN > [ course_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to display project names and the employees working on them using a natural join.

SELECT project_name, first_name, last_name
    FROM PROJECTS NATURAL JOIN EMPLOYEES;

/*
 * NATURAL JOIN > [ employee_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to retrieve invoice details along with product names using a natural join.

SELECT invoice_id, invoice_date, product_name
    FROM INVOICES NATURAL JOIN PRODUCTS;

/*
 * NATURAL JOIN > [ product_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to find all books with their respective author names using a natural join.

SELECT book_title, author_name
    FROM BOOKS NATURAL JOIN AUTHORS;

/*
 * NATURAL JOIN > [ author_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to list all class schedules along with their instructors' names using a natural join.

SELECT class_name, instructor_name
    FROM CLASS_SCHEDULES NATURAL JOIN INSTRUCTORS;

/*
 * NATURAL JOIN > [ instructor_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to show supplier names and the products they supply using a natural join.

SELECT supplier_name, product_name
    FROM SUPPLIERS NATURAL JOIN PRODUCTS;

/*
 * NATURAL JOIN > [ supplier_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to display customer orders along with shipping details using a natural join.

SELECT order_date, customer_name, shipping_address, shipping_date
    FROM ORDERS NATURAL JOIN SHIPPING_DETAILS NATURAL JOIN CUSTOMERS;

/*
 * NATURAL JOIN > [ order_id ] then [ customer_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجداول تلاتتهم يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */



-- Write a query to list employees along with their job titles using a natural join.

SELECT first_name, last_name, job_title
    FROM EMPLOYEES NATURAL JOIN JOBS;

/*
 * NATURAL JOIN > [ job_id ]
 * سبب الاستخدام هنا عشان اعمل ربط بين الجدولين يكون ربط تلقائي من غير ما اكتب شرط ربط بنفسي
 */
