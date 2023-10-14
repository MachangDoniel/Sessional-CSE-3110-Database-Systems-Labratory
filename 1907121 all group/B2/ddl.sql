drop table customers;
drop table goods;
drop table orders;

create table customers (
id int  primary key,
name varchar(20) not null,
contact varchar(20) not null);

create table goods (
goods_id int primary key,
goods_name varchar(20) not null,
price numeric(10, 2) not null check (price >= 0));


create table orders (
order_date date not null,
customer_id int not null,
goods_id int not null,
primary key (customer_id, goods_id),
foreign key (customer_id) references customers (id) on delete cascade,
foreign key (goods_id) references goods (goods_id) on delete cascade);