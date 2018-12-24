INSERT INTO EMPLOYEE VALUES ('Gildong', '', 'Hong', '333666999', TO_DATE('1999-03-21', 'yyyy-mm-dd'), 'KNU CSE', 'M', 40000, NULL, 1);
commit;

-- T1
set transaction isolation level read committed;
select * from employee where ssn = '333666999';

-- T2
set transaction isolation level read committed;
update employee set salary = 70000 where ssn = '333666999';
commit;
select * from employee where ssn = '333666999';

-- T1
select * from employee where ssn = '333666999';

-- T1
set transaction isolation level read committed;
select * from employee where salary between 60000 AND 80000;

-- T2
insert into employee values('Younghee', '', 'Kim', '000111222', To_date('1997-05-11', 'yyyy-mm-dd'), 'KNU CSE', 'F', 75000, NULL, 1);
commit;
select * from employee where salary between 60000 AND 80000;

-- T1
select * from employee where salary between 60000 AND 80000;
commit;

-- T1
set transaction isolation level serializable;
select sum(salary) from employee;

-- T2
set transaction isolation level read committed;
select sum(salary) from employee;
insert into employee values('Chsolsoo', '', 'Suh', '444777999', To_date('1996-03-31', 'yyyy-mm-dd'), 'KNU CSE', 'M', 60000, NULL, 1);

-- T1
select sum(salary) from employee;
commit;

-- T2
select sum(salary) from employee;
commit;