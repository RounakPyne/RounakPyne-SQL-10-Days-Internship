/*using ivy_sql_internship databasse*/
use ivy_sql_internship;
/*Creating Table Queue*/
create table Queue(person_id int primary key, person_name varchar(100), weight int, turn int);
/*inputing data into table Queue*/
insert into queue(person_id,person_name,weight,turn)
values
(5,"George Washington",250,1),
(3,"John Adams",350,2),
(6,"Thomas Jefferson",400,3),
(2,"Will Johnliams",200,4),
(4,"Thomas Jefferson",175,5),
(1,"James Elephant",500,6)
;
select * from queue;
/*Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit.
 It is guaranteed that the person who is first in the Queue can fit in the elevator*/
 
 select person_name 
from queue a
where (select sum(weight) from queue where a.turn >= turn) <= 1000
order by turn desc 
limit 1