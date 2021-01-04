INSERT INTO Employee(eid, ename, age) VALUES 
	(1, 'Alex', 31),
	(2, 'Bob', 30);

INSERT INTO Department(did, dname, dtype, address) VALUES
	(1, 'North', 'A', 'N1'),
	(2, 'Central', 'B', 'L1');

INSERT INTO WorksIn(eid, did, since) VALUES
	(1, 1, NULL),
	(2, 2, NULL);

INSERT INTO Product(pid, pname, ptype, pcolor) VALUES
	(1, 'Blue Tool', 'tool', 'blue'),
	(2, 'Blue Toy', 'toy', 'blue'),
	(3, 'Red Tool', 'tool', 'red'),
	(4, 'Red Toy', 'toy', 'red'),
	(5, 'Yellow Dress', 'clothing', 'yellow');

INSERT INTO Sells(did, pid, quantity) VALUES
	(1, 1, 10),
	(1, 2, 10),
	(1, 3, 10),
	(1, 4, 10),
	(1, 5, 10);

