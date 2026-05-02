-- Drop exist
DROP TABLE Manager CASCADE CONSTRAINTS;

-- Create table Manager
CREATE TABLE Manager (
    id NUMBER(3),
    name VARCHAR2(100),
    age NUMBER(2),
    birth_date DATE,
    address VARCHAR2(200)
);

SELECT * FROM Manager;

-- Drop address column
ALTER TABLE Manager DROP COLUMN address;

-- Add new columns
ALTER TABLE Manager ADD (
    city_address VARCHAR2(100),
    street VARCHAR2(100)
);

-- Rename column
ALTER TABLE Manager RENAME COLUMN name TO full_name;

-- Rename table first
RENAME Manager TO MasterMain;

-- Create Owner table from Master
CREATE TABLE Owner AS
SELECT id, full_name AS name, birth_date
FROM Master
WHERE 1 = 0;

-- Make read only
ALTER TABLE Master READ ONLY;

-- Drop tables
DROP TABLE Owner;
DROP TABLE Master;