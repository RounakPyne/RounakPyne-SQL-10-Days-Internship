/*using ivy_sql_internship databasse*/
use ivy_sql_internship;
/*Creating table activity*/
create table Activity (player_id int, device_id int, event_date date, games_played int);
/*inserting value in table*/
insert into Activity (player_id,device_id,event_date,games_played)
values
(1,2,"2016-03-01",5),
(1,2,"2016-03-02",6),
(2,3,"2017-06-25",1),
(3,1,"2016-03-01",0),
(3,4,"2016-07-03",5);
/*Checking the table*/
select * from Activity;
/*Write an SQL query that reports for each install date, the number of players that installed
the game on that day and the day 1 retention.*/

select a1.event_date as install_dt, count(a1.player_id) as installs, round(count(a3.player_id) / count(a1.player_id), 2) as Day1_retention
    from Activity a1 left join Activity a2
    on a1.player_id = a2.player_id and a1.event_date > a2.event_date
    left join Activity a3
    on a1.player_id = a3.player_id and datediff(a3.event_date, a1.event_date) = 1
    where a2.event_date is null
    group by a1.event_date;