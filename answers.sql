
SELECT * FROM subjects;
SELECT * FROM subjects ORDER BY subjects;

SELECT * FROM subjects ORDER BY location;

SELECT * FROM books WHERE title='Little Women';
SELECT * FROM books WHERE title LIKE '%Python%';
SELECT * FROM subjects WHERE location='Main St' ORDER BY subject;

SELECT title FROM books WHERE subject_id=4;

SELECT books.title, authors.first_name, authors.last_name, subjects.subject 
FROM books INNER JOIN authors ON authors.id=books.author_id INNER JOIN subjects 
ON  subjects.id=books.subject_id;

SELECT books.title, stock.retail FROM books INNER JOIN editions 
ON books.id= editions.book_id INNER JOIN stock ON editions.isbn=stock.isbn;

SELECT books.title, publishers.name, stock.isbn, stock.retail FROM books 
INNER JOIN editions ON books.id = editions.book_id INNER JOIN stock 
ON editions.isbn = stock.isbn INNER JOIN publishers ON editions.publisher_id = publishers.id 
WHERE books.title = 'Dune';

