DROP TABLE DOCTOR_D;

CREATE TABLE Doctor_D (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	salary		NUMBER,

	CONSTRAINT Doctor_D_id CHECK (ID >0)
);


DROP TABLE Patient_D;

CREATE TABLE Patient_D (

	id			NUMBER PRIMARY KEY,
	name		VARCHAR2 (100),
	age			NUMBER,

	CONSTRAINT Patient_D_id CHECK (ID >0),
	CONSTRAINT Patient_D_age CHECK (AGE >0)
);

DROP TABLE Doctor_Patient_D;

  -- Relation Many to Many
CREATE TABLE Doctor_Patient_D (

	Doctor_D_id		NUMBER,
	Patient_D_id	NUMBER,
	
	CONSTRAINT Doctor_Patient_D_id PRIMARY KEY (Doctor_D_id,Patient_D_id),
	CONSTRAINT Doctor_Patient_D_Doctor FOREIGN KEY (Doctor_D_id) REFERENCES Doctor_D (id),
	CONSTRAINT Doctor_Patient_D_Patient FOREIGN KEY (Patient_D_id) REFERENCES Patient_D (id)

);
