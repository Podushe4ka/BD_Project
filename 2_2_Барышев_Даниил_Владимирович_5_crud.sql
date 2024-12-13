begin transaction;
INSERT INTO readers (Full_name, Contact_info, Date_of_registration)
VALUES ('Иван Петров', '+79887873211', CURRENT_DATE);

INSERT INTO readers (Full_name, Contact_info, Date_of_registration)
VALUES ('Анна Сидорова', '+79556667777', CURRENT_DATE);

INSERT INTO books (name, author, genre, Year_of_publication)
VALUES ('Война и мир', 'Лев Толстой', 'Роман', 1869);

INSERT INTO books (name, author, genre, Year_of_publication)
VALUES ('Преступление и наказание', 'Федор Достоевский', 'Роман' , 1866);

SELECT name, author
FROM books 
WHERE Year_of_publication > 1860;

UPDATE readers 
SET Contact_info = '+78005535352' 
WHERE Full_name = 'Иван Петров';

UPDATE books 
SET Year_of_publication = 1867 
WHERE name = 'Война и мир' AND author = 'Лев Толстой';

DELETE FROM readers 
WHERE Full_name = 'Анна Сидорова';

DELETE FROM books 
WHERE name = 'Преступление и наказание' AND author = 'Федор Достоевский';
commit;
