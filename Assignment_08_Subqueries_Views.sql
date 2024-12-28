#8-Subqueries and Views
#
#Consider the Country table and Persons table that you created earlier and perform the following: 
#1. Find the number of persons in each country. 
#2. Find the number of persons in each country sorted from high to low. 
#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
#4. Find the countries with the same rating as the USA. (Use Subqueries) 
#5. Select all countries whose population is greater than the average population of all nations. 
#
#
# ===========================================================================================================
#
#
use SQL_Assigment6;
#
#1. Find the number of persons in each country. 
SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name;
#
#2. Find the number of persons in each country sorted from high to low. 
SELECT Country_name, COUNT(*) AS Number_Of_Persons
FROM Persons
GROUP BY Country_name
ORDER BY Number_Of_Persons DESC;
#
#3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
SELECT Country_name, AVG(Rating) AS Average_Rating
FROM Persons
GROUP BY Country_name
HAVING AVG(Rating) > 3.0;
#
#4. Find the countries with the same rating as the USA. (Use Subqueries) 
SELECT Country_name
FROM Persons
WHERE Rating = (SELECT Rating FROM Persons WHERE Country_name = 'USA');
#
#5. Select all countries whose population is greater than the average population of all nations. 
SELECT Country_name
FROM Country
WHERE Population > (SELECT AVG(Population) FROM Country);
#
# ===========================================================================================================
#
#Create a database named Product and create a table called Customer with the following fields in the Product database: 
#	Customer_Id - Make PRIMARY KEY 
#	First_name 
#	Last_name 
#	Email 
#	Phone_no 
#	Address 
#	City 
#	State 
#	Zip_code 
#	Country 
#
#	1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
#	2. Create a view named US_Customers that displays customers located in the US. 
#	3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
#	4. Update phone numbers of customers who live in California for Customer_details view. 
#	5. Count the number of customers in each state and show only states with more than 5 customers. 
#	6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view. 
#	7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
#
# ===========================================================================================================
#
CREATE DATABASE Product;
use Product;
#
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    First_name VARCHAR(100),
    Last_name VARCHAR(100),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    Zip_code VARCHAR(10),
    Country VARCHAR(100)
);

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country) VALUES
(1, 'Steve', 'Rogers', 'steve.rogers@dell.com', '123-456-7890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
(2, 'Diana', 'Woman', 'diana.woman@dell.com', '234-567-8901', '456 Oak St', 'San Francisco', 'California', '94101', 'US'),
(3, 'Peter', 'Parker', 'peter.parker@dell.com', '345-678-9012', '789 Pine St', 'New York', 'New York', '10001', 'US'),
(4, 'Bruce', 'Banner', 'bruce.banner@dell.com', '456-789-0123', '101 Maple St', 'Chicago', 'Illinois', '60601', 'US'),
(5, 'Tony', 'Stark', 'tomy.stark@dell.com', '567-890-1234', '202 Birch St', 'Houston', 'Texas', '77001', 'US'),
(6, 'Fire', 'Fly', 'fire.fly@dell.com', '678-901-2345', '303 Cedar St', 'Phoenix', 'Arizona', '85001', 'US'),
(7, 'Will', 'Smith', 'will.smith@dell.com', '789-012-3456', '404 Spruce St', 'Philadelphia', 'Pennsylvania', '19101', 'US'),
(8, 'Arnold', 'Shivashanker', 'arnold.shivashanker@dell.com', '890-123-4567', '505 Fir St', 'San Antonio', 'Texas', '78201', 'US'),
(9, 'Jet', 'Lee', 'jry.lee@dell.com', '901-234-5678', '606 Redwood St', 'San Diego', 'California', '92101', 'US'),
(10, 'Jacky', 'Chan', 'jacky.chan@dell.com', '012-345-6789', '707 Willow St', 'Dallas', 'Texas', '75201', 'US');
#
#
#	1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view. 
CREATE VIEW customer_info AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email
FROM Customer;

SELECT * FROM customer_info;
#
#
#	2. Create a view named US_Customers that displays customers located in the US. 
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';
#
#
#3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 
#
CREATE VIEW Customer_details AS
SELECT CONCAT(First_name, ' ', Last_name) AS Full_name, Email, Phone_no, State
FROM Customer;
#
#4. Update phone numbers of customers who live in California for Customer_details view.
#
UPDATE Customer
SET Phone_no = 'NewPhoneNumber'
WHERE State = 'California';
#
#
#	5. Count the number of customers in each state and show only states with more than 5 customers. 
#
#
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer
GROUP BY State
HAVING COUNT(*) > 5;
#
#	6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
#
SELECT State, COUNT(*) AS Number_Of_Customers
FROM Customer_details
GROUP BY State;
#
#	7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
#
SELECT *
FROM Customer_details
ORDER BY State ASC;