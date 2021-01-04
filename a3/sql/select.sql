/*
COMP518 Assignment 3
Peter Prescott (201442927)
Question 1.2
*/


/*
a) Find the names of departments which sell blue products.
*/
PROMPT (A) Names of departments selling blue products

SELECT DISTINCT D.dname
FROM Department D, Product P, Sells S
WHERE D.did = S.did
  AND S.pid = P.pid
  AND P.pcolor = 'blue';

/*
b) Find the names of departments which sell products of 
type tool and products of type toy.
*/
PROMPT (B) Name of departments selling products of type tool and toy

SELECT D.dname 
FROM Department D
WHERE D.did IN (SELECT S.did
  FROM Sells as S
  WHERE S.pid in (SELECT P.pid
    FROM Product as P
    WHERE P.ptype = 'tool'))
AND D.did IN (SELECT S.did
  FROM Sells as S
  WHERE S.pid in (SELECT P.pid
    FROM Product as P
    WHERE P.ptype = 'toy'));

/*
c) Find the names of departments which sell blue products 
and do not have any employee older than 40.
*/

PROMPT (C) Names of departments which sell blue products and do not have any employee older than 40

SELECT DISTINCT D.dname
FROM Department D, Product P, Sells S
WHERE D.did = S.did
  AND S.pid = P.pid
  AND P.pcolor = 'blue'
AND D.did IN (SELECT D.did
  FROM Employee E, WorksIn W, Department D
  WHERE E.eid = W.eid AND W.did = D.did
  GROUP BY D.did
  HAVING MAX(E.age) < 41
);
  

/*
d) For each department report the department-id and the
age of the oldest employee working in it.
*/

PROMPT (D) For each department, id and age of oldest employee.

SELECT D.did, MAX(E.age)
FROM Employee E, WorksIn W, Department D
WHERE E.eid = W.eid AND W.did = D.did
GROUP BY D.did;


/*
e) Find the names of employees who are older than at 
least one employee working in department 'Central'.
*/

PROMPT (E) Names of employees older than at least one employee working in 'Central' dept.

SELECT E.ename
FROM Employee E
WHERE E.age > ANY(SELECT age FROM Employee
  WHERE eid IN (SELECT W.eid
    FROM WorksIn W
    WHERE W.did IN (SELECT D.did
	FROM Department D
	WHERE D.dname = 'Central'
      )
    )
  );

/*
f) Find the names of employees working in departments
which have sold at least five types of products.
*/

PROMPT (F) Names of employees working in depts which sell at least five types of products

SELECT E.ename
FROM Employee E, WorksIn W, Department D
WHERE E.eid = W.eid AND W.did = D.did
AND 5 <= (SELECT COUNT(S.quantity)
          FROM Sells AS S
          WHERE D.did = S.did);
