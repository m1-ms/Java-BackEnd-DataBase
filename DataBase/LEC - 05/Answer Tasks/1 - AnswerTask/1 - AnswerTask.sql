DROP TABLE Player;

CREATE TABLE Player (

	id			NUMBER NOT NULL,
	name		VARCHAR2 (100) UNIQUE,
	age			NUMBER,
	
	CONSTRAINT Player_id_unique UNIQUE (id),
	CONSTRAINT Player_id CHECK (ID >0)

);


DROP TABLE Manger;

CREATE TABLE Manger (

	id			NUMBER NOT NULL,
	name		VARCHAR2 (100),
	salary		NUMBER,
	
	CONSTRAINT Manger_id_name_unique UNIQUE (id,name),
	CONSTRAINT Manger_id_ CHECK (ID >0)

);


CREATE TABLE Manger (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100) UNIQUE ,
	age			NUMBER,
	
	CONSTRAINT Manger_id CHECK (ID >0),
	CONSTRAINT Manger_age CHECK (age>0)
	
);