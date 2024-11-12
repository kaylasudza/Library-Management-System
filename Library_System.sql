---- CREATE TABLE
CREATE TABLE Users (
	
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

CREATE TABLE Libraries (
    library_id SERIAL PRIMARY KEY,
    library_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE Libraries (
    library_id SERIAL PRIMARY KEY,
    library_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);


CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);


CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    library_id INT NOT NULL,
    category_id INT NOT NULL,
    FOREIGN KEY (library_id) REFERENCES Libraries(library_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Loans (
    loan_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    loan_date DATE NOT NULL,
    return_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


CREATE TABLE Holds (
    hold_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    hold_date DATE NOT NULL,
    queue_position INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);


--- Insert CSV dummy Files
--- Table Users

COPY public.users (user_id, name, email, password, registration_date)
FROM 'E:\Downloads\users_dummy_data.csv'
DELIMITER ','
CSV HEADER;

--- Table Library
COPY public.libraries (library_id, library_name, location)
FROM 'E:\Downloads\libraries_dummy_data.csv'
DELIMITER ','
CSV HEADER;

--- Table Categories
COPY public.categories (category_id, category_name)
FROM 'E:\Downloads\categories_dummy_data.csv'
DELIMITER ','
CSV HEADER;

--- Table Books
COPY public.books (book_id, title, author, quantity, library_id, category_id)
FROM 'E:\Downloads\books_dummy_data.csv'
DELIMITER ','
CSV HEADER;


--- Table Loans
COPY public.loans (loan_id, user_id, book_id, loan_date, return_date)
FROM 'E:\Downloads\loans_dummy_data.csv'
DELIMITER ','
CSV HEADER;


--- Table Holds
COPY public.holds (hold_id, user_id, book_id, hold_date, queue_position)
FROM 'E:\Downloads\holds_dummy_data.csv'
DELIMITER ','
CSV HEADER;



--- Question 1:   How many books are available in each library?
SELECT l.library_name, SUM(b.quantity) AS total_books
FROM books b
JOIN libraries l ON b.library_id = l.library_id
GROUP BY l.library_name;



--- Question 2: Who are the most frequent book borrowers?
SELECT u.name, COUNT(l.loan_id) AS total_loans
FROM loans l
JOIN users u ON l.user_id = u.user_id
GROUP BY u.name
ORDER BY total_loans DESC
LIMIT 1;


--- Question 3 :What is the most borrowed category of books?
SELECT c.category_name, COUNT(l.loan_id) AS total_loans
FROM loans l
JOIN books b ON l.book_id = b.book_id
JOIN categories c ON b.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_loans DESC
LIMIT 1;


--- Question 4: How many books are currently on hold by users?
SELECT COUNT(hold_id) AS total_on_hold
FROM holds;


--- Question 5: What is the average loan duration before books are returned?
SELECT AVG(return_date - loan_date) AS average_loan_duration
FROM loans;




