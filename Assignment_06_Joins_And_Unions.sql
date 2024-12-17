## 6-Joins and Union
# ========================
#
# 
# Consider the Country table and Persons table that you created earlier and perform the following: 
# (1)Perform inner join, Left join, and Right join on the tables. 
# (2)List all distinct country names from both the Country and Persons tables. 
# (3)List all country names from both the Country and Persons tables, including duplicates. 
# (4)Round the ratings of all persons to the nearest integer in the Persons table.
# ===========================================================================================================
# Create a Database Named SQL_Assignment6

create database SQL_Assigment6;

# Use the database SQL_Assigment6 for further commands

use SQL_Assigment6;

# Create Tables

CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);

CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(100),
    Lname VARCHAR(100),
    Population INT,
    Rating DECIMAL(3, 2),
    Country_Id INT,
    Country_name VARCHAR(100),
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);



INSERT INTO Country (Id, Country_name, Population, Area) VALUES
(1, 'USA', 5000000, 100000),
(2, 'CANADA', 10000000, 200000),
(3, 'UK', 15000000, 300000),
(4, 'INDIA', 20000000, 400000),
(5, 'AUSTRALIA', 25000000, 500000),
(6, 'RUSSIA', 30000000, 600000),
(7, 'POLAND', 35000000, 700000),
(8, 'NEPAL', 40000000, 800000),
(9, 'SRILANKA', 45000000, 900000),
(10, 'ALASKA', 50000000, 1000000);

INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(1, 'Bruce', 'Wayne', 5000000, 4.5, 1, 'USA'),
(2, 'Peter', 'Parker', 10000000, 4.7, 2, 'CANADA'),
(3, 'Aaliya', 'Khan', 15000000, 4.6, 3, 'UK'),
(4, 'Steve', 'Rogers', 20000000, 4.8, 4, 'INDIA'),
(5, 'Thor', 'Odinson', 25000000, 4.9, 5, 'AUSTRALIA'),
(6, 'Stephen', 'Strange', 30000000, 4.4, 6, 'RUSSIA'),
(7, 'Minnal', 'Murali', 35000000, 4.3, 7, 'POLAND'),
(8, 'Clark', 'Kent', 40000000, 4.2, 8, 'NEPAL'),
(9, 'Barry', 'Allen', 45000000, 4.1, 9, 'SRILANKA'),
(10, 'Hal', 'Jorden', 50000000, 4.0, 10, 'ALASKA'),
(11, 'Mickey', 'Mouse', 331000000, 4.9, 1, 'USA'),
(12, 'Donald', 'Duck', 37700000, 4.8, 2, 'Canada'),
(13, 'Bugs', 'Bunny', 67800000, 4.7, 3, 'UK'),
(14, 'Tom', 'Cat', 1393409038, 4.6, 4, 'India'),
(15, 'Jerry', 'Mouse', 25687041, 4.5, 5,''),
(16, 'SpongeBob', 'SquarePants', 144104080, 4.4, 6, 'Russia'),
(17, 'Scooby', 'Doo', 38386000, 4.3, 7, 'Poland'),
(18, 'Dora', 'Explorer', 29136808, 4.2, 8, 'Nepal'),
(19, 'Shrek', 'Ogre', 21803000, 4.1, 9,'' ),
(20, 'Elsa', 'Frozen', 731000, 4.0, 10, 'Alaska');

# (1)Perform inner join, Left join, and Right join on the tables. 
-- Inner Join
SELECT p.Fname, p.Lname, c.Country_name, c.Population
FROM Persons p
INNER JOIN Country c ON p.Country_name = c.Country_name;

-- Left Join
SELECT p.Fname, p.Lname, c.Country_name, c.Population
FROM Persons p
LEFT JOIN Country c ON p.Country_name = c.Country_name;

-- Right Join
SELECT p.Fname, p.Lname, c.Country_name, c.Population
FROM Persons p
RIGHT JOIN Country c ON p.Country_name = c.Country_name;
#
#
#
# (2)List all distinct country names from both the Country and Persons tables
SELECT DISTINCT Country_name
FROM Country
UNION
SELECT DISTINCT Country_name
FROM Persons;
#
#
# (3)List all country names from both the Country and Persons tables, including duplicates
SELECT Country_name
FROM Country
UNION ALL
SELECT Country_name
FROM Persons;
#
#
# (4)Round the ratings of all persons to the nearest integer in the Persons table
#
#
SELECT Fname, Lname, ROUND(Rating) AS Rounded_Rating
FROM Persons;
#
#
