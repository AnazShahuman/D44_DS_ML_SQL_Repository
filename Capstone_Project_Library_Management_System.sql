
# Capstone Project: Library Management System
# ===================================================================
#
# Topic : Library Management System 
# ===================================================================
# 
# You are going to build a project based on Library Management System. It keeps track of all information about books in the library, their cost, status and total number of books available in the library. 
# 
# Create a database named library and following TABLES in the database: 
# 1. Branch 
# 2. Employee 
# 3. Books 
# 4. Customer 
# 5. IssueStatus 
# 6. ReturnStatus 
# 
# Attributes for the tables: 
# 1. Branch 
#      Branch_no - Set as PRIMARY KEY 
#      Manager_Id 
#      Branch_address 
#      Contact_no 
# 
# 2. Employee 
#      Emp_Id – Set as PRIMARY KEY 
#      Emp_name 
#      Position 
#      Salary 
#      Branch_no - Set as FOREIGN KEY and it refer Branch_no in Branch table 
# 
# 3. Books 
#      ISBN - Set as PRIMARY KEY 
#      Book_title 
#      Category 
#      Rental_Price 
#      Status [Give yes if book available and no if book not available] 
#      Author 
#      Publisher 
# 
# 4. Customer 
#      Customer_Id - Set as PRIMARY KEY 
#      Customer_name 
#      Customer_address 
#      Reg_date 
# 
# 5. IssueStatus 
#      Issue_Id - Set as PRIMARY KEY 
#      Issued_cust – Set as FOREIGN KEY and it refer customer_id in CUSTOMER table 
#      Issued_book_name 
#      Issue_date 
#      Isbn_book – Set as FOREIGN KEY and it should refer isbn in BOOKS table 
# 
# 6. ReturnStatus 
#      Return_Id - Set as PRIMARY KEY 
#      Return_cust 
#      Return_book_name 
#      Return_date 
#      Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in BOOKS table 
# 
# 
# Display all the tables and Write the queries for the following : 
# 
# 1. Retrieve the book title, category, and rental price of all available books. 
# 2. List the employee names and their respective salaries in descending order of salary. 
# 3. Retrieve the book titles and the corresponding customers who have issued those books. 
# 4. Display the total count of books in each category. 
# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
# 7. Display the branch numbers and the total count of employees in each branch. 
# 8. Display the names of customers who have issued books in the month of June 2023. 
# 9. Retrieve book_title from book table containing history. 
# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
# 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
#
# ===================================================================
#
#
CREATE DATABASE library;

USE library;

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(100),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
#
#
-- Insert values into Branch table
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Gotham City', '123-456-7890'),
(2, 102, 'Metropolis', '234-567-8901'),
(3, 103, 'Central City', '345-678-9012'),
(4, 104, 'Star City', '456-789-0123'),
(5, 105, 'Atlantis', '567-890-1234'),
(6, 106, 'Themyscira', '678-901-2345'),
(7, 107, 'Wakanda', '789-012-3456'),
(8, 108, 'Asgard', '890-123-4567'),
(9, 109, 'Krypton', '901-234-5678'),
(10, 110, 'Xandar', '012-345-6789');

-- Insert values into Employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'Bruce Wayne', 'Manager', 100000.00, 1),
(2, 'Clark Kent', 'Assistant Manager', 90000.00, 2),
(3, 'Barry Allen', 'Librarian', 80000.00, 3),
(4, 'Oliver Queen', 'Librarian', 75000.00, 4),
(5, 'Arthur Curry', 'Assistant Librarian', 70000.00, 5),
(6, 'Diana Prince', 'Manager', 95000.00, 6),
(7, 'T Challa', 'Manager', 105000.00, 7),
(8, 'Thor Odinson', 'Assistant Manager', 85000.00, 8),
(9, 'Kara Zor-El', 'Librarian', 72000.00, 9),
(10, 'Peter Quill', 'Assistant Librarian', 68000.00, 10);

-- Insert values into Books table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1, 'The Dark Knight Returns', 'Comics', 15.00, 'yes', 'Frank Miller', 'DC Comics'),
(2, 'Superman: Red Son', 'Comics', 12.00, 'yes', 'Mark Millar', 'DC Comics'),
(3, 'The Flash: Rebirth', 'Comics', 10.00, 'no', 'Geoff Johns', 'DC Comics'),
(4, 'Green Arrow: Year One', 'Comics', 14.00, 'yes', 'Andy Diggle', 'DC Comics'),
(5, 'Aquaman: The Trench', 'Comics', 13.00, 'no', 'Geoff Johns', 'DC Comics'),
(6, 'Wonder Woman: Blood', 'Comics', 16.00, 'yes', 'Brian Azzarello', 'DC Comics'),
(7, 'Black Panther: A Nation Under Our Feet', 'Comics', 18.00, 'yes', 'Ta-Nehisi Coates', 'Marvel Comics'),
(8, 'Thor: God of Thunder', 'Comics', 17.00, 'no', 'Jason Aaron', 'Marvel Comics'),
(9, 'Supergirl: Being Super', 'Comics', 11.00, 'yes', 'Mariko Tamaki', 'DC Comics'),
(10, 'Guardians of the Galaxy: Legacy', 'Comics', 19.00, 'yes', 'Dan Abnett', 'Marvel Comics');

-- Insert values into Customer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Tony Stark', 'Stark Tower', '2021-01-01'),
(2, 'Steve Rogers', 'Brooklyn', '2021-02-15'),
(3, 'Natasha Romanoff', 'Red Room', '2021-03-20'),
(4, 'Bruce Banner', 'Gamma Lab', '2021-04-25'),
(5, 'Clint Barton', 'Farmhouse', '2021-05-30'),
(6, 'Wanda Maximoff', 'Westview', '2021-06-10'),
(7, 'Vision', 'Westview', '2021-07-15'),
(8, 'Peter Parker', 'Queens', '2021-08-20'),
(9, 'Stephen Strange', 'Sanctum Sanctorum', '2021-09-25'),
(10, 'Carol Danvers', 'Space', '2021-10-30');

-- Insert values into IssueStatus table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'The Dark Knight Returns', '2023-06-01', 1),
(2, 2, 'Superman: Red Son', '2023-06-05', 2),
(3, 3, 'The Flash: Rebirth', '2023-06-10', 3),
(4, 4, 'Green Arrow: Year One', '2023-06-15', 4),
(5, 5, 'Aquaman: The Trench', '2023-06-20', 5),
(6, 6, 'Wonder Woman: Blood', '2023-06-25', 6),
(7, 7, 'Black Panther: A Nation Under Our Feet', '2023-06-30', 7),
(8, 8, 'Thor: God of Thunder', '2023-07-05', 8),
(9, 9, 'Supergirl: Being Super', '2023-07-10', 9),
(10, 10, 'Guardians of the Galaxy: Legacy', '2023-07-15', 10);

-- Insert values into ReturnStatus table
INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'The Dark Knight Returns', '2023-07-01', 1),
(2, 2, 'Superman: Red Son', '2023-07-05', 2),
(3, 3, 'The Flash: Rebirth', '2023-07-10', 3),
(4, 4, 'Green Arrow: Year One', '2023-07-15', 4),
(5, 5, 'Aquaman: The Trench', '2023-07-20', 5),
(6, 6, 'Wonder Woman: Blood', '2023-07-25', 6),
(7, 7, 'Black Panther: A Nation Under Our Feet', '2023-07-30', 7),
(8, 8, 'Thor: God of Thunder', '2023-08-05', 8),
(9, 9, 'Supergirl: Being Super', '2023-08-10', 9),
(10, 10, 'Guardians of the Galaxy: Legacy', '2023-08-15', 10);
#
#
# Display all the tables:
SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;
#
# 1. Retrieve the book title, category, and rental price of all available books. 
#
SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';
#
#
# 2. List the employee names and their respective salaries in descending order of salary.
#
#
SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;
#
#
# 3. Retrieve the book titles and the corresponding customers who have issued those books.
#
#
SELECT b.Book_title, c.Customer_name
FROM Books b
JOIN IssueStatus i ON b.ISBN = i.Isbn_book
JOIN Customer c ON i.Issued_cust = c.Customer_Id;
#
#
# 4. Display the total count of books in each category. 
#
#
SELECT Category, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Category;
#
#
# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
#
#
SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;
#
#
# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
#
#
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
#
#
# 7. Display the branch numbers and the total count of employees in each branch. 
#
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no;
#
#
# 8. Display the names of customers who have issued books in the month of June 2023.
#
#
SELECT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
WHERE i.Issue_date BETWEEN '2023-06-01' AND '2023-06-30';
#
#
# 9. Retrieve book_title from book table containing history. 
#
#
SELECT Book_title
FROM Books
WHERE Book_title LIKE '%thunder%';
#
#
# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
#
#
SELECT Branch_no, COUNT(*) AS TotalEmployees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;
#
#
# 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
#
#
SELECT e.Emp_name, b.Branch_address
FROM Employee e
JOIN Branch b ON e.Emp_Id = b.Manager_Id;
#
#
# 12. Display the names of customers who have issued books with a rental price higher than Rs. 10. 
#
#
SELECT c.Customer_name
FROM Customer c
JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust
JOIN Books b ON i.Isbn_book = b.ISBN
WHERE b.Rental_Price > 10;