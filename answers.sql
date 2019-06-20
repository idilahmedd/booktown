
--BOOKTOWN, USA-------


---ORDER---------
--Find all subjects sorted by subject
SELECT * FROM subjects;
SELECT * FROM subjects ORDER BY subjects;

--Find all subjects sorted by location
SELECT * FROM subjects ORDER BY location;


---WHERE----------
--Find the book "Little Women"

SELECT * FROM books WHERE title='Little Women';

--Find all books containing the word "Python"

SELECT * FROM books WHERE title LIKE '%Python%';

--Find all subjects with the location "Main St" sort them by subject

SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;

--Find all books about Computers and list ONLY the book titles

SELECT title FROM books WHERE subject_id=4;



--JOIN--------------
--Find all books and display a result table with ONLY the following columns

SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM books INNER JOIN authors ON authors.id=books.author_id INNER JOIN subjects 
ON  subjects.id=books.subject_id;


--Find all books that are listed in the stock table
SELECT books.title, stock.retail FROM books INNER JOIN editions 
ON books.id= editions.book_id INNER JOIN stock ON editions.isbn=stock.isbn;

--Find the book "Dune" and display ONLY the following columns
SELECT books.title, publishers.name, stock.isbn, stock.retail FROM books 
INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock 
ON editions.isbn = stock.isbn INNER JOIN publishers ON editions.publisher_id = publishers.id 
WHERE books.title = 'Dune';

--Find all shipments sorted by ship date display a result table with ONLY the following columns:

SELECT first_name, last_name, ship_date, title FROM shipments JOIN editions 
ON shipments.isbn = editions.isbn JOIN customers ON shipments.customer_id = customers.id
JOIN books on editions.book_id = books.id ORDER BY ship_date;



--GROUPING & COUNT--------
--Get the COUNT of all books
SELECT count(*) from books;

--Get the COUNT of all Locations
SELECT count(location) from subjects;
--Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT location, count(location) FROM subjects GROUP BY location;
--List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT books.id, title, count(editions.edition) FROM books JOIN editions ON books.id = editions.book_id GROUP BY books.id;