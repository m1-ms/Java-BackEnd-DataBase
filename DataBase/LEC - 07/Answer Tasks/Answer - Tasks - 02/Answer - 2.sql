/*

💡 Oracle SQL – RIGHT OUTER JOIN Coding Questions

List all departments and the employees working in them.
Use a RIGHT OUTER JOIN to ensure all departments are shown, even if they have no employees.

Retrieve all orders and their corresponding customers.
Use a RIGHT JOIN to include all customers, even if they haven't placed any orders.

Show all courses and enrolled students.
Use RIGHT JOIN to return all courses, including those without any enrolled students.

Display all projects and the employees assigned to them.
Use a RIGHT OUTER JOIN to include all projects even if no employee is assigned.

Write a query to show all payment methods and their related transactions.
Include payment methods with no transactions using RIGHT JOIN.

Find all authors and their books.
Use a RIGHT OUTER JOIN to list all authors, even those who haven't written any books.

List all categories and the products under them.
Use a RIGHT JOIN to ensure all categories are shown, even those with no products.

Retrieve all students and their assigned dorm rooms.
Use a RIGHT OUTER JOIN to include dorm rooms even if they are unassigned.

*/


-- List all departments and the employees working in them.
-- Use a RIGHT OUTER JOIN to ensure all departments are shown, even if they have no employees.

SELECT e.first_name, e.last_name, d.department_name
    FROM EMPLOYEES_LOJ e RIGHT OUTER JOIN DEPARTMENTS d ON (e.department_id = d.department_id);

/*
 * RIGHT OUTER JOIN > [ e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الاقسام
 * حتي الي مفيهاش موظفين
 * ( first_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Retrieve all orders and their corresponding customers.
-- Use a RIGHT JOIN to include all customers, even if they haven't placed any orders.

SELECT o.order_id, o.order_date, c.customer_name
    FROM ORDERS_ROJ o RIGHT JOIN CUSTOMERS_ROJ c ON (o.customer_id = c.customer_id);

/*
 * RIGHT JOIN > [ o.customer_id = c.customer_id ]
 * سبب الاستخدام هنا عشان نرجع لكل العملاء
 * حتي الي معملوش اي اوردر
 * ( order_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Show all courses and enrolled students.
-- Use RIGHT JOIN to return all courses, including those without any enrolled students.

SELECT s.student_name, c.course_name
    FROM STUDENTS_LOJ s JOIN ENROLLMENTS_ROJ en ON (s.student_id = en.student_id)
    RIGHT JOIN COURSES_ROJ c ON (en.course_id = c.course_id);

/*
 * RIGHT JOIN > [ en.course_id = c.course_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الكورسات
 * حتي الي معملهاش اي طالب مسجل
 * ( student_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Display all projects and the employees assigned to them.
-- Use a RIGHT OUTER JOIN to include all projects even if no employee is assigned.

SELECT e.first_name, e.last_name, p.project_name
    FROM EMPLOYEES_PA e JOIN ASSIGNMENTS_ROJ a ON (e.employee_id = a.employee_id)
    RIGHT OUTER JOIN PROJECTS_ROJ p ON (a.project_id = p.project_id);

/*
 * RIGHT OUTER JOIN > [ a.project_id = p.project_id ]
 * سبب الاستخدام هنا عشان نرجع لكل المشاريع
 * حتي الي معملهاش اي موظف متعين
 * ( first_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Write a query to show all payment methods and their related transactions.
-- Include payment methods with no transactions using RIGHT JOIN.

SELECT t.transaction_id, t.amount, pm.method_name
    FROM TRANSACTIONS_PM t RIGHT JOIN PAYMENT_METHODS pm ON (t.method_id = pm.method_id);

/*
 * RIGHT JOIN > [ t.method_id = pm.method_id ]
 * سبب الاستخدام هنا عشان نرجع لكل طرق الدفع
 * حتي الي معملهاش اي عملية دفع
 * ( transaction_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Find all authors and their books.
-- Use a RIGHT OUTER JOIN to list all authors, even those who haven't written any books.

SELECT b.book_title, a.author_name
    FROM BOOKS_ROJ b RIGHT OUTER JOIN AUTHORS_ROJ a ON (b.author_id = a.author_id);

/*
 * RIGHT OUTER JOIN > [ b.author_id = a.author_id ]
 * سبب الاستخدام هنا عشان نرجع لكل المؤلفين
 * حتي الي معملهاش اي كتاب
 * ( book_title = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- List all categories and the products under them.
-- Use a RIGHT JOIN to ensure all categories are shown, even those with no products.

SELECT p.product_name, c.name AS category_name
    FROM PRODUCTS_ROJ p RIGHT JOIN CATEGORIES_ROJ c ON (p.category_id = c.category_id);

/*
 * RIGHT JOIN > [ p.category_id = c.category_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الفئات
 * حتي الي معملهاش اي منتج
 * ( product_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Retrieve all students and their assigned dorm rooms.
-- Use a RIGHT OUTER JOIN to include dorm rooms even if they are unassigned.

SELECT s.student_name, r.room_number
    FROM STUDENTS_DORM s RIGHT OUTER JOIN DORM_ROOMS r ON (s.room_id = r.room_id);

/*
 * RIGHT OUTER JOIN > [ s.room_id = r.room_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الغرف
 * حتي الي معملهاش اي طالب متعين
 * ( student_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */














