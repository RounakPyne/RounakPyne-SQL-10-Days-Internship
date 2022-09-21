/*Creating a database for IVY SQL Internship*/
CREATE database IVY_SQL_INTERNSHIP;
/*Using this DB and importing data using Import Wizard*/
use IVY_SQL_INTERNSHIP;
/*Referring to the Zomato Case Study comprising of two datasets:
Find the Top  Countries with the 4.9 rating  businesses. Output the Country Name along with the number of '4.9' Rating businesses and order records by the City names in Descending Order. In case there are two countries with the same result, sort them in alphabetical order.*/
select * from(
select  Country as Country_Name,count(*) as `number of '4.9' Rating businesses`
from zomato inner join country_details on zomato.CountryCode=country_details.`Country Code`
where rating = 4.9
group by country
order by city desc) as sort_country_rating
order by Country_Name 
