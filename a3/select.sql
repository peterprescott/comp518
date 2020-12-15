/*
COMP518 Assignment 3
Peter Prescott (201442927)
Question 1.2
*/


/*
a) Find the names of departments which sell blue products.
*/

SELECT dname FROM (
	(Sells INNER JOIN Product 
		ON Sells.pid = Product.pid
		WHERE pcolor = "blue")
	INNER JOIN Department);

/*
b) Find the names of departments which sell products of 
type tool and products of type toy.
*/

SELECT ...

/*
c) Find the names of departments which sell blue products 
and do not have any employee older than 40.
*/

SELECT ...

/*
d) For each department report the department-id and the
age of the oldest employee working in it.
*/

SELECT ...

/*
e) Find the names of employees who are older than at 
least one employee working in department 'Central'.
*/

SELECT ...

/*
f) Find the names of employees working in departments
which have sold at least five types of products.
*/

SELECT ...
