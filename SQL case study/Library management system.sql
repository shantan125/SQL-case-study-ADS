-- Create the Book table
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(100),
    publisher VARCHAR(100),
    publication_year INT,
    ISBN VARCHAR(20),
    genre VARCHAR(50),
    availability BOOLEAN
);

-- Insert sample data into the Book table
INSERT INTO Book (book_id, title, author, publisher, publication_year, ISBN, genre, availability)
VALUES
    (1, 'The Guide', 'R.K. Narayan', 'Penguin Books', 1958, '978-0143039642', 'Fiction', TRUE),
    (2, 'The Immortals of Meluha', 'Amish Tripathi', 'Westland', 2010, '978-9380658742', 'Mythological Fiction', TRUE),
    (3, 'Half Girlfriend', 'Chetan Bhagat', 'Rupa Publications', 2014, '978-8129135728', 'Romance', TRUE),
    (4, 'The God of Small Things', 'Arundhati Roy', 'Random House', 1997, '978-0812979657', 'Literary Fiction', TRUE);
-- Create the Borrower table
CREATE TABLE Borrower (
    borrower_id INT PRIMARY KEY,
    borrower_name VARCHAR(255),
    book_id INT,
    address VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);
-- Insert sample data into the Borrower table
INSERT INTO Borrower (borrower_id, borrower_name, book_id, address, phone_number, email)
VALUES
    (1, 'Shantan Sharma', 1, 'Mumbai, Maharashtra', '9876543210', 'shantan@example.com'),
    (2, 'Salman Khan', 2, 'Delhi, Delhi', '9876543211', 'salman@example.com'),
    (3, 'Alan Patel', 3, 'Ahmedabad, Gujarat', '9876543212', 'alan@example.com'),
    (4, 'Vijay Singh', 4, 'Bangalore, Karnataka', '9876543213', 'vijay@example.com');
    -- Create the Loan table
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    date_borrowed DATE,
    due_date DATE,
    date_returned DATE,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id)
);

-- Insert sample data into the Loan table
INSERT INTO Loan (loan_id, book_id, borrower_id, date_borrowed, due_date, date_returned)
VALUES
    (1, 1, 1, '2023-08-10', '2023-09-10', '2023-09-05'),
    (2, 2, 2, '2023-08-15', '2023-09-15', NULL),
    (3, 3, 3, '2023-08-20', '2023-09-20', NULL),
    (4, 4, 4, '2023-08-25', '2023-09-25', '2023-09-10');
-- Create the Reservation table
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    date_reserved DATE,
    status VARCHAR(50),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrower(borrower_id)
);
-- Insert sample data into the Reservation table
INSERT INTO Reservation (reservation_id, book_id, borrower_id, date_reserved, status)
VALUES
    (1, 1, 1, '2023-08-12', 'Confirmed'),
    (2, 2, 2, '2023-08-18', 'Pending'),
    (3, 3, 3, '2023-08-22', 'Confirmed'),
    (4, 4, 4, '2023-08-28', 'Canceled');
    
    -- queries that are said to be performed in the given case study
    -- query to retrieve all the books
    SELECT Book.title, Borrower.borrower_name, Loan.date_borrowed, Loan.due_date
FROM Book
INNER JOIN Loan ON Book.book_id = Loan.book_id
INNER JOIN Borrower ON Loan.borrower_id = Borrower.borrower_id;
-- get all reserved books
SELECT Book.title, Borrower.borrower_name, Reservation.date_reserved, Reservation.status
FROM Book
INNER JOIN Reservation ON Book.book_id = Reservation.book_id
INNER JOIN Borrower ON Reservation.borrower_id = Borrower.borrower_id;

-- get all available books
SELECT title, author, publisher, publication_year, ISBN, genre
FROM Book
WHERE availability = TRUE;
