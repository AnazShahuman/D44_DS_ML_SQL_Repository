# 7-Functions
# ========================
#
# 
# 
# Consider the Country table and Persons table that you created earlier and perform the following: 
# 1. Add a new column called DOB in Persons table with data type as Date. 
# 2. Write a user-defined function to calculate age using DOB. 
# 3. Write a select query to fetch the Age of all persons using the function that has been created. 
# 4. Find the length of each country name in the Country table. 
# 5. Extract the first three characters of each country's name in the Country table. 
# 6. Convert all country names to uppercase and lowercase in the Country table.
# ===========================================================================================================
#

use SQL_Assigment6;
#
# 1. Add a new column called DOB in Persons table with data type as Date
ALTER TABLE Persons
ADD DOB DATE;
#
#
desc persons;
#
# 2. Write a user-defined function to calculate age using DOB
#
#
DELIMITER //

CREATE FUNCTION CalculateAge(DOB DATE) RETURNS INT
deterministic
no sql
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
    RETURN age;
END //

DELIMITER ;
#
#
#
#
select * from persons;
#
update persons set DOB = '2000-01-02' where id = 1;
update persons set DOB = '2001-02-02' where id = 2;
update persons set DOB = '2003-01-03' where id = 3;
update persons set DOB = '1990-01-02' where id = 4;
update persons set DOB = '1991-01-02' where id = 5;
update persons set DOB = '1992-01-02' where id = 6;
update persons set DOB = '1993-01-02' where id = 7;
update persons set DOB = '1980-01-02' where id = 8;
update persons set DOB = '1981-01-02' where id = 9;
update persons set DOB = '1982-01-02' where id = 10;
update persons set DOB = '1983-01-02' where id = 11;
update persons set DOB = '1984-01-02' where id = 12;
update persons set DOB = '1985-01-02' where id = 13;
update persons set DOB = '1986-01-02' where id = 14;
update persons set DOB = '1987-01-02' where id = 15;
update persons set DOB = '1994-01-02' where id = 16;
update persons set DOB = '1995-01-02' where id = 17;
update persons set DOB = '1996-01-02' where id = 18;
update persons set DOB = '1997-01-02' where id = 19;
update persons set DOB = '2004-01-02' where id = 20;
#
#
# 3. Write a select query to fetch the Age of all persons using the function that has been created
#
#
SELECT Id, Fname, Lname, DOB, CalculateAge(DOB) AS Age
FROM Persons;
#
#
# 4. Find the length of each country name in the Country table
#
#
SELECT Country_name, LENGTH(Country_name) AS Length_of_Name
FROM Country;
#
#
#
# 5. Extract the first three characters of each country's name in the Country table
#
#
SELECT Country_name, LEFT(Country_name, 3) AS FirstThreeChars
FROM Country;
#
#
# 6. Convert all country names to uppercase and lowercase in the Country table
#
#
SELECT Country_name, UPPER(Country_name) AS UpperCaseName, LOWER(Country_name) AS LowerCaseName
FROM Country;
#
#