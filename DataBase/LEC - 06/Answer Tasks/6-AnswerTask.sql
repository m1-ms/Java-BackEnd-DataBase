/*

✅ 6. Enabling Constraints (Code Samples)
Enable the FOREIGN KEY constraint fk_customer_order on the Orders table.

Re-enable all constraints on the Products table after a data load.

Write SQL to enable a CHECK constraint on salary in the Staff table.

Enable the PRIMARY KEY constraint on Departments(dept_id) after it was disabled.

How do you enable a constraint only if it's currently disabled?

*/


CREATE TABLE Customers5 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100)

);

CREATE TABLE Orders5 (

    id           NUMBER PRIMARY KEY,
    customer_id  NUMBER,

    CONSTRAINT customer5_orders5 FOREIGN KEY (customer_id) REFERENCES Customers5(id)

);


ALTER TABLE Orders5 ENABLE CONSTRAINT customer5_orders5; 



CREATE TABLE Products5 (

    id      NUMBER,
    name    VARCHAR2(100),
    price   NUMBER,

    CONSTRAINT products5_id PRIMARY KEY (id),
    CONSTRAINT products5_name UNIQUE (name),
    CONSTRAINT products5_price CHECK (price > 0)

);


ALTER TABLE Products5 ENABLE CONSTRAINT products5_id;

ALTER TABLE Products5 ENABLE CONSTRAINT products5_name;

ALTER TABLE Products5 ENABLE CONSTRAINT products5_price;




CREATE TABLE Staff5 (

    id      NUMBER PRIMARY KEY,
    name    VARCHAR2(100),
    salary  NUMBER,

    CONSTRAINT check_salary CHECK (salary > 0)

);

ALTER TABLE Staff5 ENABLE CONSTRAINT check_salary;



CREATE TABLE Departments5 (

    dept_id    NUMBER,
    dept_name  VARCHAR2(100),

    CONSTRAINT departments5_id PRIMARY KEY (dept_id)

);

ALTER TABLE Departments5 ENABLE CONSTRAINT departments5_id;





BEGIN FOR C IN (
        SELECT constraint_name
        FROM user_constraints
        WHERE table_name = 'PRODUCTS5'
        AND status = 'DISABLED'
    )
    
    LOOP EXECUTE IMMEDIATE
            'ALTER TABLE PRODUCTS5 ENABLE CONSTRAINT ' || c.constraint_name;
    END LOOP;
END;






















