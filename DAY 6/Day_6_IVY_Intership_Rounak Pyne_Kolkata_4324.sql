/*Using Ivy sql intership database*/
use ivy_sql_internship;
/*Creating table insurance*/
create table insurance
(PID integer(11), TIV_2015 NUMERIC(15,2), TIV_2016 NUMERIC(15,2), LAT NUMERIC(5,2), LON NUMERIC(5,2));
/*inserting values in the table*/
insert into insurance(PID,TIV_2015,TIV_2016,LAT,LON)
values
('1', '10', '5', '10', '10'),
('2', '20', '20', '20', '20'),
('3', '10', '30', '20', '20'),
('4', '10', '40', '40', '40')
;
/*Write a query to print the sum of total investment values in 2016 (TIV_2016), to a scale of 2 decimal places, 
for the policy holders who meet the following criteria:
1.Have the same TIV_2015 value as one or more other policyholders.
2. Are not located in the same city as any other policyholder (i.e.: the (latitude, longitude) attribute pairs must be unique). 
Input Format: The insurance table is described as follows:*/
select * from insurance;
select sum(TIV_2016) AS TIV_2016
from insurance
where TIV_2015 in (select TIV_2015 from insurance group by TIV_2015 having count(*) > 1) 
and 
Concat(lat,lon) in (select Concat(lat,lon) from insurance group by Concat(lat,lon) having count(*) = 1)