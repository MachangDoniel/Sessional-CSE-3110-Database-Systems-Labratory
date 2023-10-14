create table customers(
customer_id number,
customer_name varchar(50),
customer_email varchar(100) unique not null,
primary key(customer_id));
 
create table orders(
order_id number,
order_date date,
customer_id number,
primary key(order_id),
foreign key(customer_id) references customers);

create table order_items(
order_item_id number,
order_id number,
product_name varchar(100),
quantity number,
price number,
primary key(order_item_id),
foreign key(order_id) references orders);

