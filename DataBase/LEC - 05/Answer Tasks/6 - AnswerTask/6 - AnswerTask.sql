-- Relation is One To Many

CREATE TABLE Language (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	
	CONSTRAINT Language_id CHECK (id>0)

);


CREATE TABLE Teacher (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	salary		NUMBER,

	-- One to Many
	Language_id		NUMBER,
	CONSTRAINT Teacher_id CHECK (id>0),
	CONSTRAINT Teacher_Language FOREIGN KEY (Language_id) REFERENCES Language(id)
	
);


