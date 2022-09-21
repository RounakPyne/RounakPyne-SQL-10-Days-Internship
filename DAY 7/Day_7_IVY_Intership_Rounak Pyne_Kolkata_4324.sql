/*Create database ivy_sql_internship*/
create database ivy_sql_internship;
/*Using Ivy sql intership database*/
use ivy_sql_internship;
/*Creating table Marks_Data*/
create table Marks_Data
(student_id int, subjects varchar(100), marks int);
/*Adding value to the table*/
insert into Marks_Data (student_id, subjects, marks)
values
(1001,"English",88),(1001,"Science",90),(1001,"Maths",85),(1002,"English",70),(1002,"Science",80),(1002,"Maths",83);
/*Checking the dataset*/
select * from Marks_Data ;
/*Reproduce the Table into given format below:*/
select student_id, 
max(case when subjects = "English" then marks else 0 end) as English,
max(case when subjects = "Science" then marks else 0 end) as Science,
max(case when subjects = "Maths" then marks else 0 end) as Maths
from Marks_Data
group by student_id;