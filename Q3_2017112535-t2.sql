
SET transaction name 'T2';

SELECT * FROM NEW_BOOK;

UPDATE NEW_BOOK SET price = 1.1 * price WHERE bookid = 1;

commit;

-- (3) SET transaction isolation level serializable; 