/*

✏️ 4. Renaming Constraints (Code Samples)
Rename a CHECK constraint named chk_age to check_min_age on the Students table.

Rename a FOREIGN KEY constraint fk_emp_dept to fk_employee_department on the Employees table.

Rename the PRIMARY KEY constraint on the Users table to pk_users_id.

Write SQL to rename the UNIQUE constraint on the username column to uk_user_name.

Provide the syntax to rename a constraint in SQL Server vs PostgreSQL.

*/

DROP TABLE STUDENTS2;

CREATE TABLE Students2 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100),
    age     NUMBER,

    -- Done Add 5 Roy
    
    CONSTRAINT chk_age CHECK (age >= 18)

);

SELECT * FROM STUDENTS2;

ALTER TABLE STUDENTS2 RENAME CONSTRAINT chk_age TO check_main_age;

------------------------------------------------------------------------------------

CREATE TABLE Departments2 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100)

);


CREATE TABLE Employees3 (

    id       NUMBER PRIMARY KEY,
    name     VARCHAR2(100),
    dept_id  NUMBER,

    CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id) REFERENCES Departments2(id)

);

ALTER TABLE EMPLOYEES3 RENAME CONSTRAINT fk_emp_dept to fk_employee_department;

------------------------------------------------------------------------------------

CREATE TABLE Users3 (

    id       NUMBER,
    username VARCHAR2(50),

    CONSTRAINT pk_users
    PRIMARY KEY (id)

);

ALTER TABLE Users3 RENAME CONSTRAINT pk_users to pk_users_id;

------------------------------------------------------------------------------------

CREATE TABLE Users4 (

    id       NUMBER PRIMARY KEY,
    username VARCHAR2(50),

    CONSTRAINT uk_username UNIQUE (username)

);

ALTER TABLE Users4 RENAME CONSTRAINT uk_username TO uk_user_name;

------------------------------------------------------------------------------------

-- The Syntax 

ALTER TABLE table_name RENAME CONSTRAINT old_constraint_name TO new_constraint_name;

























