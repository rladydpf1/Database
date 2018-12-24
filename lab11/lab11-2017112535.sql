-- 11-1) How many bytes will be needed for the final output? : 31bytes
EXPLAIN PLAN FOR
SELECT e1.Fname, e1.Lname
FROM EMPLOYEE e1
WHERE e1.Salary = (SELECT MAX(Salary)
		   FROM EMPLOYEE e2);

SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY('PLAN_TABLE', NULL, 'TYPICAL', NULL));

-- 11-2) Which join algorithm is used for this query? : Nested Loops join
EXPLAIN PLAN FOR
SELECT COUNT(*)
FROM DEPARTMENT d
WHERE d.Dnumber IN (SELECT E.Dno
		    FROM EMPLOYEE E
		    WHERE E.Salary > 20000);
SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY('PLAN_TABLE', NULL, 'BASIC', NULL));

-- 11-3) Q1 : sort merge join, nested loops join. Q2 : 10. Q3 : PROJECT
EXPLAIN PLAN FOR
SELECT /*+ USE_MERGE(EMPLOYEE PROJECT WORKS_ON) */ Fname, Lname
FROM EMPLOYEE, PROJECT, WORKS_ON
WHERE Ssn = Essn AND Pno = Pnumber AND Pname = 'ProductX'
ORDER BY Lname desc;
SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY('PLAN_TABLE', NULL, 'BASIC', NULL));