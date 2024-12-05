# 2-DML Commands
# ========================
#
# 1.Create a table named Managers with fields : 
# Manager_Id 
# First_name 
# Last_Name DOB 
# Age ->Use check constraint 
# Last_update 
# Gender 
# Department 
# Salary -> NOT NULL 1. 
# 
# Insert 10 rows. 
# 
# 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1. 
#
# 3. Write a query to display the annual income of all managers. 
#
# 4. Write a query to display records of all managers except ‘Aaliya’. 
#
# 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month. 
#
# 6. Write a query to display details of managers whose salary is between 10000 and 35000.
#
# ==========================================================================================================
# Create a Database Named Sales

create database SQL_Assigment3;

# Use the database Sales for further commands

use SQL_Assigment3;
# 1.  Create the Managers table: 
CREATE TABLE Managers (
    Manager_Id INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_Name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 0),
    Last_update TIMESTAMP,
    Gender ENUM('Male', 'Female', 'Other'),
    Department VARCHAR(50),
    Salary DECIMAL(10, 2) NOT NULL
);
desc managers;
# 1.1.  Insert 10 rows into the  Managers  table: 

  
INSERT INTO Managers (Manager_Id, First_name, Last_Name, DOB, Age, Gender, Department, Salary) VALUES
(1, 'Bruce', 'Wayne', '1980-01-15', 44, 'Male', 'IT', 30000.00),
(2, 'Peter', 'Parker', '1985-05-20', 39, 'Female', 'HR', 25000.00),
(3, 'Aaliya', 'Khan', '1990-07-25', 34, 'Female', 'Finance', 28000.00),
(4, 'Steve', 'Rogers', '1975-09-10', 49, 'Male', 'IT', 32000.00),
(5, 'Thor', 'Odinson', '1988-11-30', 36, 'Female', 'Marketing', 27000.00),
(6, 'Stephen', 'Strange', '1982-03-05', 42, 'Male', 'IT', 26000.00),
(7, 'Minnal', 'Murali', '1995-08-15', 29, 'Female', 'HR', 24000.00),
(8, 'Clark', 'Kent', '1978-12-22', 45, 'Male', 'Finance', 29000.00),
(9, 'Barry', 'Allen', '1983-04-18', 41, 'Female', 'IT', 31000.00),
(10, 'Hal', 'Jorden', '1992-06-10', 32, 'Male', 'Marketing', 23000.00);

select * from Managers;

# 2.  Write a query that retrieves the name and date of birth of the manager with Manager_Id 1

  
SELECT First_name, Last_Name, DOB
FROM Managers
WHERE Manager_Id = 1;

# 4. Write a query to display records of all managers except ‘Aaliya’. 

  
SELECT *
FROM Managers
WHERE First_name != 'Aaliya';

# 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month

  
SELECT *
FROM Managers
WHERE Department = 'IT' AND Salary > 25000;

# 6. Write a query to display details of managers whose salary is between 10000 and 35000


  
SELECT *
FROM Managers
WHERE Salary BETWEEN 10000 AND 35000;

# 3. Write a query to display the annual income of all managers. 
alter table Managers add Annual_Income DECIMAL(10, 2) NOT NULL;
update Managers set Annual_Income=Salary*12;
select Manager_Id, First_name, Last_name, Annual_income from managers;

# using AS 
  
SELECT Manager_Id, First_name, Last_Name, Salary * 12 AS Annual_Inc
FROM Managers;

