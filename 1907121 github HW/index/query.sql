/*2*/
select product_name,price from order_items where price=(select max(price) from order_items where price not in(select max(price) from order_items));

/*3*/
select * from customers where customer_id=(select customer_id from orders where order_id=(select order_id from order_items where price=(select min(price) from order_items)));

/*4*/
select count(order_id) as total_order from orders where order_date>=to_date('01-01-2023','DD-MM-YYYY');

/*5*/
select product_name,quantity,price from order_items order by(quantity) desc;

/*6 
if price given for total quantity*/
select sum(price) as revenue from order_items;
/*6 

if price given for each quantity*/
select sum(price*quantity) as revenue from order_items;

/*7*/
select distinct order_id,sum(quantity) as total_quantity,sum(price*quantity) as total_price from order_items group by(order_id);

--table dropped
drop table order_items;
drop table orders;
drop table customers;