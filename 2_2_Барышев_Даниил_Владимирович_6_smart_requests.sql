/*1 */
SELECT genre, AVG(Year_of_publication) as avg_year, COUNT(*) as book_count
FROM Library.Books
GROUP BY genre
HAVING AVG(Year_of_publication) > 1800 AND COUNT(*) > 1
ORDER BY avg_year DESC;
/*2 */
SELECT name, author, Year_of_publication
FROM Library.Books
ORDER BY Year_of_publication
LIMIT 5;
/*3 */
SELECT Full_name, Role, Date_of_hire
FROM Library.Employees
ORDER BY Date_of_hire DESC;
/*4 */
SELECT 
    b.name, 
    b.author, 
    b.genre, 
    AVG(r.Grade) OVER (PARTITION BY b.ID_Book) as book_rating,
    AVG(r.Grade) OVER (PARTITION BY b.genre) as genre_avg_rating
FROM 
    Library.Books b
LEFT JOIN 
    Library.Reviews r ON b.ID_Book = r.ID_Book
ORDER BY 
    book_rating DESC NULLS LAST;
/*5 */
SELECT 
    r.Full_name,
    COUNT(c.ID_Checkout) as books_checked_out,
    DENSE_RANK() OVER (ORDER BY COUNT(c.ID_Checkout) DESC) as rank
FROM 
    Library.Readers r
LEFT JOIN 
    Library.Checkouts c ON r.ID_Reader = c.ID_Reader
GROUP BY 
    r.ID_Reader, r.Full_name;

/*6 */
SELECT r.Address, COUNT(c.ID_Employee) as staff_count
FROM library.locations r 
left join library.location_x_employee c ON r.ID_Location = c.ID_Location
group by r.Address
ORDER BY staff_count ASC;
/*7 */
INSERT INTO Library.Locations_history (ID_Location, Opening_hours, Address, History_DTTM)
SELECT ID_Location,opening_hours,Address,NOW()
FROM library.Locations
WHERE ID_Location=1;

UPDATE Library.Locations set Opening_hours = '12:00-16:00' where ID_Location=1;
/*8 */
INSERT INTO Library.Locations_history (ID_Location, Opening_hours, Address, History_DTTM)
SELECT ID_Location,opening_hours,Address,NOW()
FROM library.Locations
WHERE ID_Location=2;

UPDATE Library.Locations set Opening_hours = '7:00-15:00' where ID_Location=2;
/*9 */

with result as (
SELECT 
    l.ID_Location, 
    l.Address, 
    l.Opening_hours,
    NULL AS History_DTTM
FROM 
    library.Locations l
UNION ALL
SELECT 
    lh.ID_Location, 
    lh.Address, 
    lh.Opening_hours,
    lh.History_DTTM
FROM 
    library.Locations_history lh
ORDER BY 
    ID_Location, History_DTTM DESC NULLS LAST)
select result.address, 
       opening_hours, 
       history_dttm, 
       RANK() OVER (PARTITION BY result.address ORDER BY history_DTTM DESC)
from result;
