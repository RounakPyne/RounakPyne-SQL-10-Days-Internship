/*Create Database IT_Company_Interview_Candidate*/
create database IT_Company_Interview_Candidate;

/*Use database IT_Company_Interview_Candidate*/
use IT_Company_Interview_Candidate;

/*create table Contests, Colleges, Challenges,View_Stats, Submission_Stats */
create table Contests(Contest_ID int,hacker_ID int, Contestent_Name varchar(100));
create table Colleges(College_ID int, Contest_ID int);
create table Challenges(challenge_id int, College_ID int);
create table View_Stats(challenge_id int, total_views int, total_unique_views int);
create table Submission_Stats(challenge_id int, total_submissions int, total_submissions_accepted int);

/*insert into table Contests*/
insert into Contests(Contest_ID, hacker_ID, Contestent_Name) values(66406,17973,"Rose"),(66556,79153,"Angela"),(94828,80275,"Frank");
/*insert into table Colleges*/
insert into Colleges(College_ID,Contest_ID) values (11219,66406),(32473,66556),(56685,94828);
/*insert into table Challenges*/
insert into Challenges(challenge_id,College_ID) values(18765,11219),(47127,11219),(60292,32473),(72974,56685);
/*insert into View_Stats*/
insert into View_Stats(challenge_id, total_views, total_unique_views) 
values(47127,26,19),(47127,15,14),(18765,43,10),(18765,72,13),(75516,35,17),(60292,11,10),(72974,41,15),(75516,75,11);
/*insert into Submission_Stats*/
insert into Submission_Stats(challenge_id,total_submissions,total_submissions_accepted) 
values(75516,34,12),(47127,27,10),(47127,56,18),(75516,74,12),(75516,83,8),(72974,68,24),(72974,82,14),(47127,28,11);

/*checking tables*/
select * from challenges;

/*Write a query to print the contest_id , hacker_id , name , and the sums of total_submissions,
total_accepted_submissions, total_views, and total_unique_views for each contest sorted by contest_id. Exclude the contest from the result if all four sums are 0 .*/

select con.Contest_ID, hacker_ID, Contestent_Name, ifnull(sum(temp1.total_submissions),0),ifnull(sum(temp1.total_submissions_accepted),0),
sum(temp2.total_views),sum(temp2.total_unique_views)
from contests as con 
left join colleges as col on con.Contest_ID=col.Contest_ID
left join challenges as cha on cha.College_ID = col.College_ID
left join
(select ss.challenge_id, sum(ss.total_submissions) as total_submissions, sum(ss.total_submissions_accepted) as total_submissions_accepted
from submission_stats as ss group by ss.challenge_id) as temp1 on cha.challenge_id = temp1.challenge_id
left join
(select vs.challenge_id, sum(vs.total_views) as total_views, sum(vs.total_unique_views) as total_unique_views
from view_stats as vs group by vs.challenge_id) as temp2 on cha.challenge_id = temp2.challenge_id
group by con.Contest_ID, hacker_ID, Contestent_Name
;