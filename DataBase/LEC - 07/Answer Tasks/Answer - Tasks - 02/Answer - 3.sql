/*

💡 Oracle SQL – FULL OUTER JOIN Coding Questions

Write a query to list all customers and all orders.
Use a FULL OUTER JOIN to include customers with no orders and orders with no matching customer.

Display all employees and all projects.
Some employees may not be assigned to any project, and some projects may not have any employee. Use a FULL OUTER JOIN.

Show all products and all suppliers.
Include products without suppliers and suppliers without products using FULL OUTER JOIN.

List all students and all courses.
Write a FULL OUTER JOIN query to include students not enrolled in any course and courses with no students.

Retrieve all authors and all books.
Include authors with no books and books without an assigned author using FULL OUTER JOIN.

Write a query to find all employees and all departments.
Include employees not assigned to any department and departments with no employees.

Show all transactions and all payment methods.
Include unmatched records from both sides using a FULL OUTER JOIN.

Combine two customer lists from two different regions.
Use FULL OUTER JOIN to include all customers from both regions, even if they don’t exist in both lists.

*/


-- Write a query to list all customers and all orders.
-- Use a FULL OUTER JOIN to include customers with no orders and orders with no matching customer.

SELECT c.customer_name, o.order_id, o.order_date
    FROM CUSTOMERS_FOJ c FULL OUTER JOIN ORDERS_FOJ o ON (c.customer_id = o.customer_id);

/*
 * FULL OUTER JOIN > [ c.customer_id = o.customer_id ]
 * سبب الاستخدام هنا عشان نرجع كل العملاء وكل الاوردرات مع بعض حتي الي معملهمش تطابق من الجهتين
 * ( عميل من غير اوردر أو اوردر من غير عميل )
 * لو استخدمنا
 * Inner join
 * كان هيستبعد الحالتين من النتيجه
 */



-- Display all employees and all projects.
-- Some employees may not be assigned to any project, and some projects may not have any employee. Use a FULL OUTER JOIN.

SELECT e.first_name, e.last_name, p.project_name
    FROM EMPLOYEES_FOJ e FULL OUTER JOIN ASSIGN_FOJ a ON (e.employee_id = a.employee_id)
    FULL OUTER JOIN PROJECTS_FOJ p ON (a.project_id = p.project_id);

/*
 * FULL OUTER JOIN > [ e.employee_id = a.employee_id ] then [ a.project_id = p.project_id ] 
 * سبب الاستخدام هنا عشان نرجع كل الموظفين وكل المشاريع مع بعض حتي الي معملهمش تطابق من الجهتين ( موظف من غير مشروع أو مشروع من غير موظف )
 * لازم نستخدم
 * FULL OUTER JOIN 
 * في  الاتنين مع بعض مش الأولى بس عشان لو استخدمنا 
 * JOIN
 *  عادي في الأولى هيستبعد الموظف اللي مالوش مشروع بدري قبل ما نوصل للوصلة التانية
 */



-- Show all products and all suppliers.
-- Include products without suppliers and suppliers without products using FULL OUTER JOIN.

SELECT p.product_name, s.supplier_name
    FROM PRODUCTS_FOJ p FULL OUTER JOIN SUPPLIERS_FOJ s ON (p.supplier_id = s.supplier_id);

/*
 * FULL OUTER JOIN > [ p.supplier_id = s.supplier_id ]
 * سبب الاستخدام هنا عشان نرجع كل المنتجات وكل الموردين مع بعض حتي الي معملهمش تطابق من الجهتين
 * ( منتج من غير مورد أو مورد من غير منتج )
 * لو استخدمنا
 * Inner join
 * كان هيستبعد الحالتين من النتيجه
 */



-- List all students and all courses.
-- Write a FULL OUTER JOIN query to include students not enrolled in any course and courses with no students.

SELECT s.student_name, c.course_name
    FROM STUDENTS_FOJ s FULL OUTER JOIN ENROLLMENTS_FOJ en ON (s.student_id = en.student_id)
    FULL OUTER JOIN COURSES_FOJ c ON (en.course_id = c.course_id);

/*
 * FULL OUTER JOIN > [ s.student_id = en.student_id ] then [ en.course_id = c.course_id ]
 * سبب الاستخدام هنا عشان نرجع كل الطلاب وكل الكورسات مع بعض حتي الي معملهمش تطابق من الجهتين ( طالب من غير كورس أو كورس من غير طالب )
 * لازم نستخدم
 * FULL OUTER JOIN
 * في الاتنين مع بعض مش الأولى بس عشان لو استخدمنا
 * JOIN
 * عادي في الأولى هيستبعد الطالب اللي مالوش تسجيل بدري قبل ما نوصل للوصلة التانية
 */



-- Retrieve all authors and all books.
-- Include authors with no books and books without an assigned author using FULL OUTER JOIN.

SELECT a.author_name, b.book_title
    FROM AUTHORS_FOJ a FULL OUTER JOIN BOOKS_FOJ b ON (a.author_id = b.author_id);

/*
 * FULL OUTER JOIN > [ a.author_id = b.author_id ]
 * سبب الاستخدام هنا عشان نرجع كل المؤلفين وكل الكتب مع بعض حتي الي معملهمش تطابق من الجهتين ( مؤلف من غير كتاب أو كتاب من غير مؤلف )
 * هنا الجدولين متربطين مباشرة من غير جدول وسيط، فـ FULL OUTER JOIN واحد كفاية
 * لو استخدمنا
 * Inner join
 * كان هيستبعد الحالتين من النتيجه
 */



-- Write a query to find all employees and all departments.
-- Include employees not assigned to any department and departments with no employees.

SELECT e.first_name, e.last_name, d.department_name
    FROM EMPLOYEES_FOJ2 e FULL OUTER JOIN DEPARTMENTS_FOJ d ON (e.department_id = d.department_id);

/*
 * FULL OUTER JOIN > [ e.department_id = d.department_id ]
 * سبب الاستخدام هنا عشان نرجع كل الموظفين وكل الأقسام مع بعض حتي الي معملهمش تطابق من الجهتين ( موظف من غير قسم أو قسم من غير موظفين )
 * هنا الجدولين متربطين مباشرة من غير جدول وسيط، فـ FULL OUTER JOIN واحد كفاية
 * لو استخدمنا
 * Inner join
 * كان هيستبعد الحالتين من النتيجه
 */



-- Show all transactions and all payment methods.
-- Include unmatched records from both sides using a FULL OUTER JOIN.

SELECT t.transaction_id, t.amount, pm.method_name
    FROM TRANSACTIONS_FOJ t FULL OUTER JOIN PAYMENT_METHODS_FOJ pm ON (t.method_id = pm.method_id);

/*
 * FULL OUTER JOIN > [ t.method_id = pm.method_id ]
 * سبب الاستخدام هنا عشان نرجع كل المعاملات وكل طرق الدفع مع بعض حتي الي معملهمش تطابق من الجهتين ( معاملة من غير طريقة دفع أو طريقة دفع من غير معاملات )
 * هنا الجدولين متربطين مباشرة من غير جدول وسيط، فـ FULL OUTER JOIN واحد كفاية
 * لو استخدمنا
 * Inner join
 * كان هيستبعد الحالتين من النتيجه
 */



-- Combine two customer lists from two different regions.
-- Use FULL OUTER JOIN to include all customers from both regions, even if they don't exist in both lists.

SELECT a.customer_name AS region_a_customer, b.customer_name AS region_b_customer
    FROM CUSTOMERS_REGION_A a FULL OUTER JOIN CUSTOMERS_REGION_B b ON (a.customer_name = b.customer_name);

/*
 * FULL OUTER JOIN > [ a.customer_name = b.customer_name ]
 * سبب الاستخدام هنا عشان نرجع كل عملاء المنطقة A وكل عملاء المنطقة B مع بعض حتي الي معملهمش تطابق ( عميل موجود في منطقة واحدة بس )
 * هنا الربط بيتم على اسم العميل نفسه ( customer_name ) مش على ID، عشان الجدولين مختلفين ومفيش مفتاح مشترك بينهم غير الاسم
 * لو استخدمنا
 * Inner join
 * كان هيرجع بس العملاء المشتركين بين المنطقتين
 */

























