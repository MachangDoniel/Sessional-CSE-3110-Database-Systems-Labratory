-- start D:\SQL\ddl.sql;

--1

drop table orderr;
drop table customer;
drop table goods;


create table customer(
customer_id number(20),
name varchar(20),
contact number(11),
primary key(customer_id)
);

create table goods(
goods_id number(20),
goods_name varchar(20),
price number(11,2),
primary key(goods_id)
);
create table orderr(
order_date varchar(20),
customer_id number(20),
goods_id number(20),
foreign key(customer_id) references customer,
foreign key(goods_id) references goods
);


describe customer;
describe goods;
describe orderr;

--2

alter table customer add address varchar(20);

