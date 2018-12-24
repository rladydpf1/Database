SET TRANSACTION NAME 'comp322_tran';
-- create table book
CREATE TABLE BOOK (
bookid  NUMBER PRIMARY KEY NOT NULL,
bookname        VARCHAR(100),
publisher       varchar(20),
price   number
);
SAVEPOINT create_table;

INSERT INTO BOOK VALUES (1, 'Database', 'Pearson', 30000);
SELECT bookname "bookname1" -- 'Database' FROM BOOK WHERE bookid = 1;
SAVEPOINT insert_1;

UPDATE BOOK SET BOOKNAME = 'Intro. to Database' WHERE bookid = 1;
SELECT bookname "bookname2" From book where bookid = 1;
SAVEPOINT update_1;

Update book set bookname = 'Database Lab.' WHERE bookid = 1;
SELECT bookname "bookname3" from book where bookid = 1;
ROLLBACK TO update_1;

SELECT bookname "bookname4" from book where bookid = 1; 
rollback to insert_1;

SELECT bookname "bookname5" from book where bookid = 1; 
commit;

update book set bookname = 'Database Lab2' WHERE bookid = 1;
SELECT bookname "bookname6" from book where bookid = 1;
rollback;

SELECT bookname "bookname7" from book where bookid = 1;
DELETE from book where bookid = 1;
rollback;

SELECT bookname "bookname8 from book where bookid = 1;
commit;