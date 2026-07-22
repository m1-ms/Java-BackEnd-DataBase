/*

💡 Oracle SQL – Single Row Subqueries Coding Questions
Find the employee(s) with the highest salary.
Use a single-row subquery to get the maximum salary.

List the names of employees who work in the same department as employee 'Alice'.
Use a subquery to get the department ID of 'Alice'.

Display the details of the product with the lowest price.
Use a single-row subquery to get the minimum price.

Retrieve the department name of the employee with the highest salary.
Use nested subqueries: one to find the employee, and one to find the department.

Find the manager of the employee who was hired most recently.
Use a subquery to get the employee with the latest hire date.

Show the employee whose salary is equal to the average salary of the company.
Use a single-row subquery with AVG().

List the order(s) with the earliest order date.
Use a subquery to get the minimum order date.

Get the name and salary of the employee who earns more than the employee with ID = 101.
Use a single-row subquery to get the salary of employee 101.

Find the student who has the same GPA as student 'John Doe'.
Use a subquery to get 'John Doe’s GPA'.

Display all books that have the same price as the most expensive book in the ‘Science’ category.
Use a subquery to find the max price from the 'Science' category.

*/


-- Find the employee(s) with the highest salary.
-- Use a single-row subquery to get the maximum salary.

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary = (SELECT MAX(salary) FROM EMPLOYEES);

/*
 * Subquery > [ SELECT MAX(salary) FROM EMPLOYEES ]
 * سبب الاستخدام هنا عشان نجيب أعلى مرتب موجود وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل موظف بيه ونجيب اللي وصله
 */



-- List the names of employees who work in the same department as employee 'Alice'.
-- Use a subquery to get the department ID of 'Alice'.

SELECT first_name, last_name
    FROM EMPLOYEES_SRQ
    WHERE department_id = (SELECT department_id FROM EMPLOYEES_SRQ WHERE first_name = 'Alice');

/*
 * Subquery > [ SELECT department_id FROM EMPLOYEES_SRQ WHERE first_name = 'Alice' ]
 * سبب الاستخدام هنا عشان نجيب رقم قسم 
 * Alice
 * وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل الموظفين بيه ونجيب اللي في نفس القسم
 */



-- Display the details of the product with the lowest price.
-- Use a single-row subquery to get the minimum price.

SELECT product_name, price
    FROM PRODUCTS_PRICE
    WHERE price = (SELECT MIN(price) FROM PRODUCTS_PRICE);

/*
 * Subquery > [ SELECT MIN(price) FROM PRODUCTS_PRICE ]
 * سبب الاستخدام هنا عشان نجيب أرخص سعر موجود وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل منتج بيه ونجيب اللي وصله
 */



-- Retrieve the department name of the employee with the highest salary.
-- Use nested subqueries: one to find the employee, and one to find the department.

SELECT department_name
    FROM DEPARTMENTS
    WHERE department_id = (
        SELECT department_id FROM EMPLOYEES
        WHERE salary = (SELECT MAX(salary) FROM EMPLOYEES)
    );

/*
 * Subquery > [ SELECT department_id FROM EMPLOYEES WHERE salary = (SELECT MAX(salary) FROM EMPLOYEES) ]
 * سبب الاستخدام هنا محتاجين خطوتين متداخلتين 
 * ( nested subqueries )
 * الأولى نجيب أعلى مرتب موجود
 * الثانية نجيب رقم قسم الموظف اللي مرتبه ده
 * وبعدين نجيب اسم القسم بالرقم ده
 */



-- Find the manager of the employee who was hired most recently.
-- Use a subquery to get the employee with the latest hire date.

SELECT m.first_name, m.last_name
    FROM EMPLOYEES e JOIN EMPLOYEES m ON (e.manager_id = m.employee_id)
    WHERE e.hire_date = (SELECT MAX(hire_date) FROM EMPLOYEES);

/*
 * Subquery > [ SELECT MAX(hire_date) FROM EMPLOYEES ]
 * سبب الاستخدام هنا عشان نجيب أحدث تاريخ توظيف موجود وهو تاريخ واحد بس 
 * ( single-row )
 * وبعدين نجيب الموظف اللي اتوظف في التاريخ ده وناخد مديره عن طريق 
 * self join ( e, m )
 */

-- Show the employee whose salary is equal to the average salary of the company.
-- Use a single-row subquery with AVG().

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary = (SELECT AVG(salary) FROM EMPLOYEES);

/*
 * Subquery > [ SELECT AVG(salary) FROM EMPLOYEES ]
 * سبب الاستخدام هنا عشان نحسب متوسط المرتبات وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل موظف بيه ونجيب اللي مرتبه يساوي المتوسط بالظبط
 * ملاحظة النتيجة ممكن تطلع فاضية لو معملش أي موظف مرتبه يساوي المتوسط بالظبط وده وارد وطبيعي
 */



-- List the order(s) with the earliest order date.
-- Use a subquery to get the minimum order date.

SELECT order_id, customer_id, order_date
    FROM ORDERS
    WHERE order_date = (SELECT MIN(order_date) FROM ORDERS);

/*
 * Subquery > [ SELECT MIN(order_date) FROM ORDERS ]
 * سبب الاستخدام هنا عشان نجيب أقدم تاريخ أوردر موجود وهو تاريخ واحد بس 
 * ( single-row )
 * وبعدين نقارن كل أوردر بيه ونجيب اللي وصله
 */



-- Get the name and salary of the employee who earns more than the employee with ID = 101.
-- Use a single-row subquery to get the salary of employee 101.

SELECT first_name, last_name, salary
    FROM EMPLOYEES
    WHERE salary > (SELECT salary FROM EMPLOYEES WHERE employee_id = 101);

/*
 * Subquery > [ SELECT salary FROM EMPLOYEES WHERE employee_id = 101 ]
 * سبب الاستخدام هنا عشان نجيب مرتب الموظف رقم 101 وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل موظف بيه ونجيب اللي مرتبه أعلى منه
 */



-- Find the student who has the same GPA as student 'John Doe'.
-- Use a subquery to get 'John Doe's GPA.

SELECT student_name, gpa
    FROM STUDENTS_GPA
    WHERE gpa = (SELECT gpa FROM STUDENTS_GPA WHERE student_name = 'John Doe')
    AND student_name != 'John Doe';

/*
 * Subquery > [ SELECT gpa FROM STUDENTS_GPA WHERE student_name = 'John Doe' ]
 * سبب الاستخدام هنا عشان نجيب معدل 
 * John Doe
 * وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل طالب بيه ونجيب اللي معدله يساوي معدله بالظبط
 * استبعدنا 
 * John Doe
 * نفسه من النتيجة عشان التاسك بيدور على طالب تاني ليه نفس المعدل
 */



-- Display all books that have the same price as the most expensive book in the 'Science' category.
-- Use a subquery to find the max price from the 'Science' category.

SELECT book_title, category, price
    FROM BOOKS_PRICE
    WHERE price = (SELECT MAX(price) FROM BOOKS_PRICE WHERE category = 'Science');

/*
 * Subquery > [ SELECT MAX(price) FROM BOOKS_PRICE WHERE category = 'Science' ]
 * سبب الاستخدام هنا عشان نجيب أعلى سعر كتاب في فئة 
 * Science
 * وهو رقم واحد بس 
 * ( single-row )
 * وبعدين نقارن كل الكتب 
 * (مش بس Science)
 *  بيه ونجيب اللي وصله حتى لو من فئة تانية
 */




