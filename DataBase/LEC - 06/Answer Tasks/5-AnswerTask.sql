/*

🚫 5. Disabling Constraints (Code Samples)
Disable a FOREIGN KEY constraint named fk_customer_order on the Orders table.

Temporarily disable all constraints on the Products table.

Write SQL to disable the CHECK constraint on the Accounts.balance column.

Disable the PRIMARY KEY constraint on Departments(dept_id).

How would you disable all constraints on a table before bulk inserting data?

*/

CREATE TABLE Customers4 (

	id		NUMBER PRIMARY KEY,
	name	VARCHAR2 (100)

);


CREATE TABLE Orders4 (

	id			NUMBER PRIMARY KEY,
	customer_id	NUMBER,
	
	CONSTRAINT Customer_Order FOREIGN KEY (customer_id) REFERENCES Customers4 (id)

);


ALTER TABLE Orders4 DISABLE CONSTRAINT Customer_Order;


CREATE TABLE  PRODUCTS4 (

	id			NUMBER,
	name		VARCHAR2 (100),
	price		NUMBER,
	
	CONSTRAINT Product2_id PRIMARY KEY (id) ,
	CONSTRAINT Product4_name UNIQUE (name),
	CONSTRAINT Product4_Price CHECK (Price>0)

);

ALTER TABLE PRODUCTS4 DISABLE CONSTRAINT Product2_id;
ALTER TABLE PRODUCTS4 DISABLE CONSTRAINT Product4_name;
ALTER TABLE PRODUCTS4 DISABLE CONSTRAINT Product4_Price;



CREATE TABLE Accounts4 (

    id       NUMBER PRIMARY KEY,
    balance  NUMBER,

    CONSTRAINT accounts_balance CHECK (balance >= 0)

);

ALTER TABLE Accounts4 DISABLE CONSTRAINT accounts_balance;



CREATE TABLE Departments4 (

    dept_id    NUMBER,
    dept_name  VARCHAR2(100),

    CONSTRAINT departments4_pk PRIMARY KEY (dept_id)

);

ALTER TABLE Departments4 DISABLE CONSTRAINT departments4_pk;





BEGIN FOR C IN (
        SELECT constraint_name
        FROM user_constraints
        WHERE table_name = 'PRODUCTS'
    )
    
    LOOP EXECUTE IMMEDIATE
            'ALTER TABLE PRODUCTS ENABLE CONSTRAINT ' || c.constraint_name;
    END LOOP;

END;






















