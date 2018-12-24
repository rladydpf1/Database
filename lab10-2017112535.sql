-- 10-1)
DROP INDEX employee_first_last_name_idx;
CREATE INDEX employee_first_last_name_idx ON EMPLOYEE(Fname, Lname);
SELECT Fname, Lname
FROM EMPLOYEE
WHERE Fname = 'John' AND Lname = 'Smith';

-- 10-2)
DROP INDEX dept_dname_mgrs_idx;
CREATE INDEX dept_dname_mgrs_idx ON DEPARTMENT(Dname, Mgr_ssn);

SELECT Dnumber, Dname, Mgr_ssn
FROM DEPARTMENT
WHERE Dname = 'Administration' AND TO_NUMBER(Mgr_ssn) = 987654321;

-- 10-3)
SELECT index_name, table_name, column_name
FROM USER_IND_COLUMNS
WHERE table_name IN ('PROJECT');

-- 10-4)
SELECT COUNT(index_name) AS WORKS_ON_number_of_index
FROM USER_INDEXES
WHERE table_name IN ('WORKS_ON')
GROUP BY index_name;

SELECT COUNT(index_name) AS DEPT_LOCATIONS_number_of_index
FROM USER_INDEXES
WHERE table_name IN ('DEPT_LOCATIONS')
GROUP BY index_name;

-- 10-5)
DROP INDEX dependent_relationshp;
CREATE INDEX dependent_relationshp ON DEPENDENT(Relationship);

SELECT Essn, Dependent_name, Relationship
FROM DEPENDENT
WHERE TO_NUMBER(Essn) = 123456789;

