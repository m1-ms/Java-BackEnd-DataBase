-- Relation One to One

CREATE TABLE Phone (

	id			NUMBER PRIMARY KEY,
	phoneNumber VARCHAR2 (20),
	
	CONSTRAINT Phone_id CHECK (id>0)

);


CREATE TABLE Employee (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	age			NUMBER,
	
	phone_id	NUMBER UNIQUE,
	CONSTRAINT Employe_id CHECK (id > 0),
	CONSTRAINT Employe_age CHECK (AGE > 0),
	
	CONSTRAINT Employe_Phone FOREIGN KEY (Phone_id) REFERENCES Phone(id)

);