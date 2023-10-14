INSERT INTO Customer VALUES (1, 'John Doe', '555-1234');											
INSERT INTO Customer VALUES (2, 'Jane Smith', '555-5678');											
INSERT INTO Customer VALUES (3, 'Bob Johnson', '555-9012');											
INSERT INTO Customer VALUES (4, 'Alice Brown', '555-3456');


INSERT INTO Goods VALUES (1, 'Widget', 10.99);		
INSERT INTO Goods VALUES (2, 'Gadget', 19.99);		
INSERT INTO Goods VALUES (3, 'Thingamajig', 8.99);	
INSERT INTO Goods VALUES (4, 'Doohickey', 14.99);


insert into orders values (date '2023-03-19', 101, 1);
insert into orders values (date '2023-03-20', 101, 2);
insert into orders values (date '2023-03-20', 102, 2);
insert into orders values (date '2023-03-21', 102, 3);
insert into orders values (date '2023-03-22', 103, 4);


--1
SELECT * FROM Customer c JOIN Orders o on c.ID = o.Customer_ID JOIN Goods g on g.Goods_ID=o.Goods_ID WHERE g.Goods_Name LIKE '%i%' AND c.Name LIKE '%j%';

--2
select (select count(*) from customers) as total_customers, name, contact from customers where id = 102;

--3
SELECT Name, Contact FROM Customer c JOIN Orders o on c.ID = o.Customer_ID JOIN Goods g on g.Goods_ID=o.Goods_ID WHERE g.Price = (SELECT min(Price) FROM Goods);

--4
select id, name, contact from customers c where c.id not in (select distinct customer_id from orders);

--5
SELECT Name FROM Customer c JOIN Orders o on c.ID = o.Customer_ID JOIN Goods g on g.Goods_ID=o.Goods_ID WHERE g.Price = (SELECT max(Price) FROM Goods);

--6
select c.name, count(*) from customers c join orders o on c.id = o.customer_id group by c.name having count(*) > 2;

--7

DROP TABLE Orders;
DROP TABLE Customer;
DROP TABLE Goods;