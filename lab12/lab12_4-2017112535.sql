INSERT INTO BOOK VALUES (2, 'Machine Learning', 'McGrawHill', 20000);
commit;

-- T1
column bookname format a20;
set transaction name 'T1';

select bookname, price from book;
update book set price = price + 10000 where bookid = 1;

-- T2
column bookname format a20;
set transaction name 'T2';

select bookname, price from book;
update book set price = price*1.2 where bookid = 2;


-- T1
select bookname, price from book;
Update book set price = price + 1000 where bookid = 2;


-- T2
select bookname, price from book;
update book set price = price * 1.1 where bookid = 1;

-- T1
commit;

-- T2
select bookname, price from book;
commit;