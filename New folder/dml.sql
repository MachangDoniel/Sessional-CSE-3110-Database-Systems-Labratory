--3

insert into customer values(1,'A',5,'E');
insert into customer values(2,'B',6,'F');
insert into customer values(3,'C',7,'G');
insert into customer values(4,'D',8,'H');

insert into goods values(11,'L',100);
insert into goods values(12,'M',101);
insert into goods values(13,'N',102);
insert into goods values(14,'apple',103);
insert into goods values(15,'potato',104);

insert into orderr values('23-2-21',1,11);
insert into orderr values('24-2-21',2,12);
insert into orderr values('25-2-21',3,13);
insert into orderr values('26-2-21',4,14);

select * from customer;
select * from goods;
select * from orderr;

--4

select goods_id,goods_name from goods where goods_name like '%p%'; 

--5

select count(order_date) from orderr where customer_id=(select customer_id from customer where name='A');

--6

select goods_name,price from goods where goods_id=(select goods_id from orderr where customer_id=(select customer_id from customer where name='A'));

--7

select name from customer where customer_id=(select customer_id from orderr where goods_id=(select goods_id from goods where goods_name='apple'));

--8

drop table orderr;
drop table goods;
drop table customer;