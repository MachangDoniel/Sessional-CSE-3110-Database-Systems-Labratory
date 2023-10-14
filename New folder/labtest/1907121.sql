--1907121

--Q1

drop table Orders;
drop table Customer;

create table Customer(
    customer_id number(5) primary key,
    customer_name varchar(20),
    customer_email varchar(20)
);

create table Orders(
    order_id number(4) primary key,
    order_date date,
    customer_id number(5)
    --foreign key(customer_id) references Customer(customer_id)
);

--Q2

alter table Customer modify customer_email varchar(20) unique;
alter table Orders modify customer_id number(5) references Customer(customer_id);

--insert

insert into Customer values(10001,'Shimu','shimu@gmail.com');
insert into Customer values(10002,'Sina','sina@gmail.com');
insert into Customer values(10003,'Chinmoy','turjo@gmail.com');

insert into Orders values(1001,'13-JUN-2023',10001);
insert into Orders values(1002,'03-MAY-2022',10002);
insert into Orders values(1003,'23-FEB-2021',10003);

--Q3
    
set serveroutput on
declare
    cursor o_cursor is select * from Orders where customer_id=10001;
    o_row Orders%rowtype;
    begin
        open o_cursor;
        fetch o_cursor into o_row.order_id,o_row.order_date,o_row.customer_id;
        while o_cursor%found loop
        dbms_output.put_line('Oder Id: ' || o_row.order_id);
        fetch o_cursor into o_row.order_id,o_row.order_date,o_row.customer_id;
        end loop;
    end;
/

--Q4

create or replace trigger auto_update_date
before insert on Orders
for each row
begin
    new.order_date:=SYSDATE;
end;
/

--insert into Orders(order_id,customer_id) values(1004,10001);

--Q5

create or replace function total_order(
    id IN number(5)
)
return total as total number;
begin
    select count(*) from Orders where customer_id=id;
	return total;
end;
/

--Q6

create or replace procedure total_order(
    customer_id1 IN customer.customer_id,
    customer_date1 IN customer.customer_date,
    customer_email1 IN customer.customer_email
)
as
begin
    insert into Customer values(customer_id1,customer_name1,customer_email1);
end;
/