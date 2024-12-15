# 5-Sorting and Grouping data
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
# 1. Write an SQL query to print the first three characters of Country_name from the Country table. 
# 2. Write an SQL query to concatenate first name and last name from Persons table. 
# 3. Write an SQL query to count the number of unique country names from Persons table. 
# 4. Write a query to print the maximum population from the Country table. 
# 5. Write a query to print the minimum population from Persons table. 
# 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
# 7. Write a query to find the number of rows in the Persons table. 
# 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
# 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
# 10. List all persons ordered by their rating in descending order. 
# 11. Find the total population for each country in the Persons table. 
# 12. Find countries in the Persons table with a total population greater than 50,000 
# 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
# ===========================================================================================================
#
#
#
# Create a Database Named SQL_Assignment5

create database SQL_Assigment5;

# Use the database SQL_Assigment5 for further commands

use SQL_Assigment5;

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


# 
# 1. Write an SQL query to print the first three characters of Country_name from the Country table. 
select left(country_name,3) from country;

# 2. Write an SQL query to concatenate first name and last name from Persons table
select concat(Fname,' ',Lname) AS Full_Name from persons;

# 3. Write an SQL query to count the number of unique country names from Persons table
select count(distinct country_name) as Unique_Country_Name from persons;


# 4. Write a query to print the maximum population from the Country table
select max(population) as Maximum_Population from country;

# 5. Write a query to print the minimum population from Persons table. 
select min(population) as Minimum_Population from Persons;

# 6. Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
insert into persons(Id, Fname, Lname, Population, Rating, Country_Id, Country_name) VALUES
(21, 'Pom', Null, 48346000, 4.3, 7, 'Poland'),
(22, 'Misha', Null, 39133808, 4.2, 8, 'Nepal');

select count(lname) as Last_Name_Count from persons;

# 7. Write a query to find the number of rows in the Persons table
select count(*) AS Total_Rows_In_Persons_Table from persons;

# 8. Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
select population from country limit 3;

# 9. Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT) 
select * from country order by rand() limit 3;

# 10. List all persons ordered by their rating in descending order. 
select * from persons order by rating desc;

# 11. Find the total population for each country in the Persons table. 
select country_name, sum(population) AS Total_Population from persons group by country_name;

# 12. Find countries in the Persons table with a total population greater than 50,000 
select country_name from persons group by country_name having sum(population) > 50000;

# 13. List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.
select country_name, count(*) AS Total_Number_of_Persons, avg(rating) as Average_Ratings from persons group by country_name having count(*) > 2 order by Average_Ratings asc;