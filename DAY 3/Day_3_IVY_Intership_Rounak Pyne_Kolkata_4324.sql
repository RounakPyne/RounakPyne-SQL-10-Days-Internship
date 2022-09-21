/*Using IVY internship database*/
use ivy_sql_internship;
/*Creating table Customer and Order*/
create table Customer
(
Customer_id int,
Customer_Name varchar(100),
constraint customer_primary_key primary key (Customer_id)
);
create table orders
(
order_id int,
Customer_id int,
product_name varchar(100),
constraint order_primary_key primary key(order_id),
constraint order_foreign_key foreign key (Customer_id) references Customer(Customer_id)
);
/*inserting values in the tables*/
insert into Customer(Customer_id,Customer_Name)
values (1,"Mary"),(2,"John"),(3,"Peter"),(4,"Lisa");
select * from Customer;
insert into orders(order_id,Customer_id,product_name)
values
(10,1,"A"),(20,1,"B"),(30,1,"D"),(40,1,"C"),
(50,2,"A"),(60,3,"A"),(70,3,"B"),(80,3,"D"),(90,4,"C")
;
select * from orders;
/*write an sql query to report the id and names of customers who bought products “c”, 
“b” but did not buy the product “a” since we want to recommend them buy this product. 
return the result table ordered by customer_id. */

SELECT *
FROM customer 
WHERE customer_id IN (SELECT Customer_id FROM orders WHERE product_name = 'C') 
AND customer_id IN (SELECT Customer_id FROM orders WHERE product_name = 'B') 
AND customer_id NOT IN (SELECT Customer_id FROM orders WHERE product_name = 'A')
ORDER BY customer_id;








