#1-DDL Commands
#=======================
#Create a database named School and perform all the DDL commands(CREATE, ALTER, DROP, RENAME, TRUNCATE) for the table named STUDENT with fields: 
#Roll_No 
#Name 
#Marks 
#Grade
#
#
#Create data on your own based on the given columns 
#(1) Use the select command to display the table. 
#(2) Add a column named Contact to the STUDENT table. 
#(3) Remove the Grade column from the Student table. 
#(4) Rename the table to CLASSTEN. 
#(5) Delete all rows from the table. 
#(6) Remove the table from the database.


#Create a Database Named Navodaya_School

create database Navodaya_School;

#Use the database Navodaya_School for further commands

use Navodaya_School;

#Create a table named Student with fields Roll_No, Name, Marks, Grade

create table Students (
Roll_No int auto_increment primary key,
Name varchar(50) not null,
Marks int check(Marks >0),
Grade char(1) 
);

desc students
;

#1.Use Select command to display table

select * from Students;

#2.Add a column named Contact to the STUDENT table

alter table Students add Contact varchar(100);
desc students;

#3.Remove the Grade column from the Student table

alter table Students drop column Grade;
desc students;

#4.Rename the table to CLASSTEN

rename table Students to CLASSTEN;
desc students;
desc Classten;

#5.Delete all rows from the table

truncate table CLASSTEN;
desc Classten;

select * from Classten;

#6.Remove the table from the database
drop table classten;
desc classten;






