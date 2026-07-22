/*

Write a query to retrieve employee names and their manager names from the employees table, handling ambiguous column names for employee_id and manager_id.

Write a query to list customer names and salesperson names from the customers and employees tables, where both tables have a column named name.

Write a query to display order IDs and product IDs from orders and order_details, both of which have an order_id column.

Write a query to retrieve student names and instructor names from students and instructors tables using an alias to handle the name column.

Write a query to show employee salaries and department budgets, both of which have a budget or salary column that could conflict.

Write a query to display project names and task names where both projects and tasks tables contain a name column.

Write a query to join courses and exams tables and retrieve their date fields, resolving ambiguity between the columns.

Write a query to show the product name and category name from the products and categories tables, where both have a name column.

Write a query to display the book title and publisher name from books and publishers, avoiding column name conflicts.

Write a query to list employee names and their department's location, resolving ambiguity in the location column from both tables.

*/


-- Write a query to retrieve employee names and their manager names from the employees table, handling ambiguous column names for employee_id and manager_id.

SELECT e.first_name, e.last_name, m.first_name AS manager_first_name, m.last_name AS manager_last_name
    FROM EMP_AMB e JOIN EMP_AMB m
    ON (e.manager_id = m.employee_id);

/*
 * ON > [ e.manager_id = m.employee_id ]
 * سبب الاستخدام هنا عشان الجدول بيضم 
 * ( Self Join )
 * فا عمود 
 * employee_id and manager_id
 * بيظهرو مرتين فا لازم نستخدم 
 * [ alias ( e,m ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to list customer names and salesperson names from the customers and employees tables, where both tables have a column named name.

SELECT c.name AS customer_name, e.name AS salesperson_name
    FROM CUSTOMERS_AMB c JOIN EMPLOYEES_AMB e
    ON (c.employee_id = e.employee_id);

/*
 * ON > [ c.employee_id = e.employee_id ]
 * سبب الاستخدام هنا عشان عمود
 * name
 * موجود في الجدولين ( CUSTOMERS_AMB and EMPLOYEES_AMB )
 * فا لازم نستخدم
 * [ alias ( c,e ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to display order IDs and product IDs from orders and order_details, both of which have an order_id column.

SELECT o.order_id, od.product_id
    FROM ORDERS o JOIN ORDER_DETAILS od
    ON (o.order_id = od.order_id);

/*
 * ON > [ o.order_id = od.order_id ]
 * سبب الاستخدام هنا عشان عمود
 * order_id
 * موجود في الجدولين ( ORDERS and ORDER_DETAILS )
 * فا لازم نستخدم
 * [ alias ( o,od ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to retrieve student names and instructor names from students and instructors tables using an alias to handle the name column.

SELECT s.name AS student_name, i.name AS instructor_name
    FROM STUDENTS_AMB s JOIN INSTRUCTORS_AMB i
    ON (s.instructor_id = i.instructor_id);

/*
 * ON > [ s.instructor_id = i.instructor_id ]
 * سبب الاستخدام هنا عشان عمود
 * name
 * موجود في الجدولين ( STUDENTS_AMB and INSTRUCTORS_AMB )
 * فا لازم نستخدم
 * [ alias ( s,i ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to show employee salaries and department budgets, both of which have a budget or salary column that could conflict.

SELECT e.first_name, e.last_name, e.salary AS employee_salary, d.salary AS department_budget
    FROM EMPLOYEES e JOIN DEPARTMENTS_BUDGET d
    ON (e.department_id = d.department_id);

/*
 * ON > [ e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان عمود
 * salary
 * موجود في الجدولين ( EMPLOYEES and DEPARTMENTS_BUDGET )
 * فا لازم نستخدم
 * [ alias ( e,d ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to display project names and task names where both projects and tasks tables contain a name column.

SELECT p.name AS project_name, t.name AS task_name
    FROM PROJECTS_AMB p JOIN TASKS t
    ON (p.project_id = t.project_id);

/*
 * ON > [ p.project_id = t.project_id ]
 * سبب الاستخدام هنا عشان عمود
 * name
 * موجود في الجدولين ( PROJECTS_AMB and TASKS )
 * فا لازم نستخدم
 * [ alias ( p,t ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to join courses and exams tables and retrieve their date fields, resolving ambiguity between the columns.

SELECT c.course_name, c.record_date AS course_date, e.record_date AS exam_date
    FROM COURSES_DATES c JOIN EXAMS e
    ON (c.course_id = e.course_id);

/*
 * ON > [ c.course_id = e.course_id ]
 * سبب الاستخدام هنا عشان عمود
 * record_date
 * موجود في الجدولين ( COURSES_DATES and EXAMS )
 * فا لازم نستخدم
 * [ alias ( c,e ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to show the product name and category name from the products and categories tables, where both have a name column.

SELECT p.name AS product_name, c.name AS category_name
    FROM PRODUCTS_AMB p JOIN CATEGORIES c
    ON (p.category_id = c.category_id);

/*
 * ON > [ p.category_id = c.category_id ]
 * سبب الاستخدام هنا عشان عمود
 * name
 * موجود في الجدولين ( PRODUCTS_AMB and CATEGORIES )
 * فا لازم نستخدم
 * [ alias ( p,c ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */



-- Write a query to display the book title and publisher name from books and publishers, avoiding column name conflicts.

SELECT b.book_title, p.name AS publisher_name
    FROM BOOKS_PUB b JOIN PUBLISHERS p
    ON (b.publisher_id = p.publisher_id);

/*
 * ON > [ b.publisher_id = p.publisher_id ]
 * سبب الاستخدام هنا عشان نستخدم
 * [ alias ( b,p ) ]
 * عشان نفرق بين الجدولين ( BOOKS_PUB and PUBLISHERS ) ونحدد الجدول الصح
 * لكل عمود، حتى لو مفيش تعارض حقيقي في الاسم هنا
 */



-- Write a query to list employee names and their department's location, resolving ambiguity in the location column from both tables.

SELECT e.first_name, e.last_name, d.location AS department_location
    FROM EMPLOYEES_LOC e JOIN DEPARTMENTS_LOC d
    ON (e.department_id = d.department_id);

/*
 * ON > [ e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان عمود
 * location
 * موجود في الجدولين ( EMPLOYEES_LOC and DEPARTMENTS_LOC )
 * فا لازم نستخدم
 * [ alias ( e,d ) ]
 * عشان نفرق بينهم و نحدد الجدول الصح
 */











