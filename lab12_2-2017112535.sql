-- T1
column bookname format a10;
SET TRANSACTION NAME 'lab12_t1';
SELECT *  FROM Book WHERE bookid = 1;
UPDATE BOOK SET PRICE = 20000 WHERE BOOKID = 1;

-- T2
column bookname format a10;
SET TRANSACTION NAME 'lab12_t2';
SELECT *  FROM Book WHERE bookid = 1;
UPDATE BOOK SET Price = Price + 1000 WHERE BOOKID = 1;

-- T1
SELECT *  FROM Book WHERE bookid = 1;
commit;

-- T2
SELECT *  FROM Book WHERE bookid = 1;
commit;