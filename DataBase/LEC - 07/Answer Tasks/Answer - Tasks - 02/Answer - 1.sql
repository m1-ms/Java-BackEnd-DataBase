/* 

💡 Oracle SQL – LEFT OUTER JOIN Coding Questions
Retrieve all employees and their department names.

Write an Oracle SQL query using LEFT OUTER JOIN to show all employees, including those who are not assigned to any department.

List all products and their associated categories.
Some products may not belong to any category. Write a query using LEFT JOIN to include all products regardless of category association.

Find all students and the courses they are enrolled in.
Use a LEFT OUTER JOIN to include students who are not enrolled in any course.

Display all orders with customer names, including orders without a matched customer.
Assume the orders table has a foreign key customer_id. Use LEFT JOIN to include all orders.

Show all departments and their managers.
Write a query to return all departments using a LEFT OUTER JOIN to show their assigned managers, including departments with no manager.

List all books and their authors from the books and authors tables.
Include books that don’t have an assigned author using a LEFT JOIN.

Write a query that retrieves all invoices along with their corresponding payment status.
Use LEFT JOIN to include invoices with no payment.

Get all employees and their projects from employees and projects_assigned tables.
Include employees who are not assigned to any project.

 */


-- Retrieve all employees and their department names.
-- Write an Oracle SQL query using LEFT OUTER JOIN to show all employees, including those who are not assigned to any department.

SELECT e.first_name, e.last_name, d.department_name
    FROM EMPLOYEES_LOJ e LEFT OUTER JOIN DEPARTMENTS d ON (e.department_id = d.department_id);

/*
 * LEFT OUTER JOIN > [ e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الموظفين
 * حتي الي ملهمش  
 * ( department_id = NULL )
 * لو استخدمنا 
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- List all products and their associated categories.
-- Some products may not belong to any category. Write a query using LEFT JOIN to include all products regardless of category association.

SELECT p.product_name, c.name AS category_name
    FROM PRODUCTS_LOJ p LEFT JOIN CATEGORIES c ON (p.category_id = c.category_id);

/*
 * LEFT JOIN > [ p.category_id = c.category_id ]
 * سبب الاستخدام هنا عشان نرجع لكل المنتجات
 * حتي الي ملهاش فئة
 * ( category_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Find all students and the courses they are enrolled in.
-- Use a LEFT OUTER JOIN to include students who are not enrolled in any course.

SELECT s.student_name, c.course_name
    FROM STUDENTS_LOJ s LEFT OUTER JOIN ENROLLMENTS e ON (s.student_id = e.student_id)
    LEFT OUTER JOIN COURSES c ON (e.course_id = c.course_id);

/*
 * LEFT OUTER JOIN > [ s.student_id = e.student_id ] then [ e.course_id = c.course_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الطلاب
 * حتي الي ملهمش تسجيل في اي كورس
 * ( enrollment = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Display all orders with customer names, including orders without a matched customer.
-- Assume the orders table has a foreign key customer_id. Use LEFT JOIN to include all orders.

SELECT o.order_id, o.order_date, c.customer_name
    FROM ORDERS_LOJ o LEFT JOIN CUSTOMERS c ON (o.customer_id = c.customer_id);

/*
 * LEFT JOIN > [ o.customer_id = c.customer_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الاوردرات
 * حتي الي ملهاش عميل متطابق
 * ( customer_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Show all departments and their managers.
-- Write a query to return all departments using a LEFT OUTER JOIN to show their assigned managers, including departments with no manager.

SELECT d.department_name, e.first_name AS manager_first_name, e.last_name AS manager_last_name
    FROM DEPARTMENTS_MGR d LEFT OUTER JOIN EMPLOYEES e ON (d.manager_id = e.employee_id);

/*
 * LEFT OUTER JOIN > [ d.manager_id = e.employee_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الاقسام
 * حتي الي ملهاش مدير
 * ( manager_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- List all books and their authors from the books and authors tables.
-- Include books that don't have an assigned author using a LEFT JOIN.

SELECT b.book_title, a.author_name
    FROM BOOKS_LOJ b LEFT JOIN AUTHORS a ON (b.author_id = a.author_id);

/*
 * LEFT JOIN > [ b.author_id = a.author_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الكتب
 * حتي الي ملهاش مؤلف متطابق
 * ( author_id = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Write a query that retrieves all invoices along with their corresponding payment status.
-- Use LEFT JOIN to include invoices with no payment.

SELECT i.invoice_id, i.invoice_date, p.payment_status
    FROM INVOICES i LEFT JOIN PAYMENTS p ON (i.invoice_id = p.invoice_id);

/*
 * LEFT JOIN > [ i.invoice_id = p.invoice_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الفواتير
 * حتي الي ملهاش دفع متسجل
 * ( payment_status = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */



-- Get all employees and their projects from employees and projects_assigned tables.
-- Include employees who are not assigned to any project.

SELECT e.first_name, e.last_name, p.project_name
    FROM EMPLOYEES_PA e LEFT JOIN PROJECTS_ASSIGNED p ON (e.employee_id = p.employee_id);

/*
 * LEFT JOIN > [ e.employee_id = p.employee_id ]
 * سبب الاستخدام هنا عشان نرجع لكل الموظفين
 * حتي الي ملهمش مشروع متسجل
 * ( project_name = NULL )
 * لو استخدمنا
 * Inner join
 * كان هيستبعدهم من النتيجه
 */
