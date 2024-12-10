# 4-Querying Data
# ========================
#
# Insert 10 rows into both tables, as given below. 
#
# Create a table named Country with fields: 
# Id 
# Country_name 
# Population 
# Area 
# 
# Create another table named Persons with fields: 
# Id 
# Fname 
# Lname 
# Population 
# Rating 
# Country_Id 
# Country_name 
# 
# (1)List the distinct country names from the Persons table 
# (2)Select first names and last names from the Persons table with aliases. 
# (3)Find all persons with a rating greater than 4.0. 
# (4)Find countries with a population greater than 10 lakhs. 
# (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
# (6)Find all persons where the country name is NULL. 
# (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
# (8)Find all persons not from the countries 'India' and 'Australia'. 
# (9)Find all countries with a population between 5 lakhs and 20 lakhs. 
# (10)Find all countries whose names do not start with 'C'.
# ===========================================================================================================
#
#
# Create a Database Named SQL_Assignment4

create database SQL_Assigment4;
# Use the database SQL_Assigment4 for further commands

use SQL_Assigment4;# Create Tables

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
desc country;
desc persons;

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

select * from country;

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
(15, 'Jerry', 'Mouse', 25687041, 4.5, 5, ''),
(16, 'SpongeBob', 'SquarePants', 144104080, 4.4, 6, 'Russia'),
(17, 'Scooby', 'Doo', 38386000, 4.3, 7, 'Poland'),
(18, 'Dora', 'Explorer', 29136808, 4.2, 8, 'Nepal'),
(19, 'Shrek', 'Ogre', 21803000, 4.1, 9, '' ),
(20, 'Elsa', 'Frozen', 731000, 4.0, 10, 'Alaska');

select * from persons;

# (1)List the distinct country names from the Persons table 
select distinct country_name from Persons;

# (2)Select first names and last names from the Persons table with aliases
select Fname AS First_Name, Lname AS Last_Name from Persons;

# (3)Find all persons with a rating greater than 4.0
select * from Persons where rating > 4.0;



# (4)Find countries with a population greater than 10 lakhs. 
select * from country where population > 1000000;

# (4)Find countries with a population greater than 400 lakhs. 
select * from country where population > 40000000;

# (5)Find persons who are from 'USA' or have a rating greater than 4.5
select * from Persons where country_name = 'USA' or rating > 4.5;

# (6)Find all persons where the country name is NULL
select * from persons where country_name is NULL;
select * from persons where country_name = '';

# (7)Find all persons from the countries 'USA', 'Canada', and 'UK'
select * from persons where country_name = 'USA' or country_name = 'Canada' or country_name = 'UK';

# (8)Find all persons not from the countries 'India' and 'Australia'
select * from persons where country_name <> 'India' and country_name != 'Australia';

# (9)Find all countries with a population between 200 lakhs and 300 lakhs
select * from country where population between 20000000 and 30000000;

# (10)Find all countries whose names do not start with 'C'
select * from country where not country_name like 'C%';


