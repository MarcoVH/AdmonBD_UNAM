CREATE TABLE Branch(
	branchNo VARCHAR2(5) CONSTRAINT Branch_pk PRIMARY KEY,
	street VARCHAR2(15),
	city VARCHAR2(15),
	postcode VARCHAR2(10)
);

CREATE TABLE Staff(
	staffNo VARCHAR2(5) CONSTRAINT Staff_pk PRIMARY KEY, 
	fName VARCHAR2(15),
	Iname VARCHAR2(15),
	position VARCHAR2(15),
	sex VARCHAR2(1),
	DOB DATE,
	salary NUMBER(10,0),
	branchNo VARCHAR2(5) CONSTRAINT st_br_fk REFERENCES Branch(branchNo)
);

CREATE TABLE Client(
	clientNo VARCHAR2(5) CONSTRAINT Client_pk PRIMARY KEY,
	fName VARCHAR2(15),
	Iname VARCHAR2(15),
	telno VARCHAR2(15),
	prefType VARCHAR2(10),
	maxRent NUMBER(4,0)
);

CREATE TABLE PrivateOwner(
	ownerNo VARCHAR2(5) CONSTRAINT PrivateOwner_pk PRIMARY KEY,
	fName VARCHAR2(15),
	Iname VARCHAR2(15),
	address VARCHAR2(20),
	telno VARCHAR2(15)
);

CREATE TABLE PropertyForRent(
	propertyNo VARCHAR2(10) CONSTRAINT PropertyForRent_pk PRIMARY KEY,
	street VARCHAR2(15),
	city VARCHAR2(15),
	postcode VARCHAR2(10),
	type VARCHAR2(10),
	rooms NUMBER(1,0),
	rent NUMBER(4,0),
	ownerNo VARCHAR2(5) CONSTRAINT Pfr_po_fk REFERENCES PrivateOwner(ownerNo),
	staffNo VARCHAR2(5) CONSTRAINT Pfr_st_fk REFERENCES Staff(staffNo),
	branchNo VARCHAR2(5) CONSTRAINT Pfr_br_fk REFERENCES Branch(branchNo)
);

CREATE TABLE Viewing(
	clientNo VARCHAR2(5) CONSTRAINT vi_cl_fk REFERENCES Client(clientNo),
	propertyNo VARCHAR2(5) CONSTRAINT vi_pfr REFERENCES PropertyForRent(propertyNo),
	viewDate DATE,
	comment1 VARCHAR2(15)
);

CREATE TABLE Registration(
	clientNo CONSTRAINT re_cl_fk REFERENCES Client(clientNo),
	branchNo CONSTRAINT re_br_fk REFERENCES Branch(branchNo),
	staffNo CONSTRAINT re_st_fk REFERENCES Staff(staffNo),
	dateJoined DATE;
);
