/*Using IVY internship database*/
use ivy_sql_internship;
/*Creating table Sequence*/
create table sequence(Sl_No int,Group_Name char(1),Number_Sequence int);
/*inserting values in the tables*/
insert into sequence(Sl_No,Group_Name,Number_Sequence)
values
(1,"A",1),(2,"A",2),(3,"A",3),(4,"A",5),(5,"A",6),(6,"A",8),(7,"A",9),(8,"B",11),(9,"C",1),(10,"C",2),(11,"C",3)
;
/*Checking the table*/
select * from sequence;
/*Write a SQL query to find the maximum and minimum values of continuous ‘Sequence’ in each ‘Group’.*/
WITH Table1 as (select Group_Name,Number_Sequence,RANK() over(partition by Group_Name order by Number_Sequence) as Temp from sequence),
Table2 as (select Group_Name,Number_Sequence,Temp,(Number_Sequence-Temp) as substract from Table1)
select Group_Name,min(Number_Sequence) as "minimum values of continuous‘Sequence’" ,max(Number_Sequence) as "maximum values of continuous‘Sequence’" 
from Table2 
group by substract,Group_Name;