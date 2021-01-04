/*

COMP518 ASSIGNMENT 3
Peter Prescott (201442927)

Question 1.1

- Entity Integrity is ensured by requiring 
primary keys to be NOT NULL.

- Referential Integrity is ensured by 
the necessary FOREIGN KEY CONSTRAINTS.

- An attempt has been made to set sensible 
datatypes for required variables.

- Personally, I would recommend that table 
names be lowercase and in the collective/plural,
as recommended at https://sqlstyle.guide, but
as required by the assignment they are here 
in CamelCase.

*/



CREATE TABLE Employee (
	eid INT NOT NULL AUTO_INCREMENT,
	ename VARCHAR(64),
	age TINYINT,
	PRIMARY KEY(eid)
);

CREATE TABLE Department(
	did INT NOT NULL AUTO_INCREMENT,
	dname VARCHAR(64),
	dtype VARCHAR(64),
	address VARCHAR(256),
	PRIMARY KEY(did)
);

CREATE TABLE WorksIn(
	eid INT NOT NULL,
	did INT NOT NULL,
	since DATE,

	PRIMARY KEY(eid, did),

	CONSTRAINT fk_eid
	FOREIGN KEY (eid)
	REFERENCES Employee(eid)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	
	CONSTRAINT fk_did
	FOREIGN KEY (did)
	REFERENCES Department(did)
		ON UPDATE CASCADE
		ON DELETE CASCADE

);


CREATE TABLE Product(
	pid INT NOT NULL AUTO_INCREMENT,
	pname VARCHAR(64),
	ptype VARCHAR(64),
	pcolor VARCHAR(16),
	PRIMARY KEY(pid)
);


CREATE TABLE Sells(
	did INT NOT NULL,
	pid INT NOT NULL,
	quantity TINYINT,

	PRIMARY KEY(did, pid),

	CONSTRAINT fk_did_sells
	FOREIGN KEY(did)
	REFERENCES Department(did)
		ON UPDATE CASCADE
		ON DELETE CASCADE,

	CONSTRAINT fk_pid
	FOREIGN KEY(pid)
	REFERENCES Product(pid)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);


