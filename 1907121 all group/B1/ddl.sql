drop table order_items;
drop table orders;
drop table customers;

create table customers (
customer_id number(10) not null primary key,
customer_name varchar(30),
customer_email varchar(50));

create table orders (
order_id number(10) not null primary key,
order_date date,
customer_id number(10),
foreign key (customer_id) references customers (customer_id));

create table order_items (
order_item_id number(10) primary key,
order_id number(10),
product_name varchar(30),
quantity number(10),
price numeric(10, 2),
foreign key (order_id) references orders (order_id));