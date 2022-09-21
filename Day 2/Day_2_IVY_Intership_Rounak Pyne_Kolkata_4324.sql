/*Creating a new database named time_diff_stamp*/
create database time_diff_stamp;
/*Using the database*/
use time_diff_stamp;
# Creating a table
create table time_sample
(Task_ID int,
Start_Date date,
End_Date date);

/*Inserting data into the table*/
insert into time_sample(Task_ID,Start_Date,End_Date)
values(
7,"2015-10-30","2015-10-31"
)
;
/*Displaying the table*/
select * from time_sample;
/*Write a query to output the start and end dates of projects listed by the number of
days it took to complete the project in ascending order. 
If there is more than one project that have the same number of completion days,then order by the start date of the project.*/

SELECT Start_Date, MIN(End_Date) as End_Date FROM
(SELECT Start_Date FROM time_sample WHERE Start_Date NOT IN (SELECT End_Date FROM time_sample)) AS T1,
(SELECT End_Date FROM time_sample WHERE End_Date NOT IN (SELECT Start_Date FROM time_sample)) AS T2
WHERE Start_Date < End_Date
GROUP BY Start_Date
ORDER BY DATEDIFF(MIN(End_Date), Start_Date), Start_Date;