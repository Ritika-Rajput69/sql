USE library;

--table for user_info
CREATE TABLE User_information (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL
);


--table for book_info
CREATE TABLE Book_information (
    book_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100) NOT NULL,
    author VARCHAR(100) NOT NULL,
    quantity INT,
    is_issued BIT DEFAULT 0,
    issued_to INT NULL
);

--Card_details table
CREATE TABLE Card_details (
    transaction_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    issue_date DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (user_id) REFERENCES User_information(user_id),
    FOREIGN KEY (book_id) REFERENCES Book_information(book_id)
);

-- Stored procedure to issue a book
CREATE PROCEDURE IssueBook
    @BookID INT,
    @UserID INT
AS
BEGIN
    UPDATE Book_information
    SET is_issued = 1,
        issued_to = @UserID
    WHERE book_id = @BookID;

    INSERT INTO Card_details (user_id, book_id, issue_date)
    VALUES (@UserID, @BookID, GETDATE());
END;


-- SP to return a book
CREATE PROCEDURE ReturnBook
    @BookID INT
AS
BEGIN
    UPDATE Book_information
    SET is_issued = 0,
        issued_to = NULL
    WHERE book_id = @BookID;

    UPDATE Card_details
    SET return_date = GETDATE()
    WHERE book_id = @BookID AND return_date IS NULL;
END;



-- SP to display issued books
CREATE PROCEDURE DisplayIssuedBooks
AS
BEGIN
    SELECT c.transaction_id, u.name AS user_name, u.email AS user_email, u.phone_number AS user_phone,
           b.name AS book_name, b.author, b.quantity, c.issue_date, c.return_date
    FROM Card_details c
    JOIN User_information u ON c.user_id = u.user_id
    JOIN Book_information b ON c.book_id = b.book_id
    WHERE c.return_date IS NULL;
END;

--insert values --

INSERT INTO User_information 
(name, email, phone_number) 
VALUES ('Ritika', 'ritika@example.com', '1234567890');

INSERT INTO Book_information (name, author, quantity) 
VALUES 
('Book A', 'Author A', 5);

INSERT INTO Book_information (name, author, quantity) 
VALUES 
('Book B', 'Author B', 3);


INSERT INTO User_information (name, email, phone_number) 
VALUES 
('Sakshi', 'sakshi@example.com', '456567890');

--books--
INSERT INTO Book_information (name, author, quantity) 
VALUES 
('The Story Of My Experiments With The Truth', 'Mahatma Gandhi', 10),
('The Guide', 'R.K. Narayan', 20),
('A Fine Balance', 'Rohinton Mistry ', 20),
('Midnight’s Children ', 'Salman Rushdie', 12),
('The Interpreter Of Maladies ', 'Jhumpa Lahiri ', 13),
(' A Suitable Boy ', ' Vikram Seth', 10),
('God of Small Things', 'Arundhati Roy', 10),
('The Glass Palace', 'Amitav Ghosh  ', 10),
('The Inheritance of Loss', 'Kiran Desai – ', 10),
('The Private Life of an Indian Prince', 'Mulk Raj Anand ', 10),
(' Red Earth and Pouring Rain', ' Vikram Chandra', 10),
(' Maximum City', 'Suketu Mehta', 10),
('Gitanjali', 'abindranath Tagore', 10),
('The Collector’s Wife', ' Mitra Phukan', 10)

INSERT INTO Book_information (name, author, quantity) 
VALUES 
('Book B', 'Author B', 3);

-- select statement--	
select * from User_information;
select * from Book_information;
select * from Card_details;