--1
SELECT g.Goods_Name FROM Goods g JOIN Orders o ON g.Goods_ID = o.Goods_ID JOIN Customer c ON o.Customer_ID = c.ID WHERE g.Goods_Name LIKE '%i%' AND c.Name LIKE '%J%';

--2
SELECT (SELECT count(*) from Customer) as total_customers, Name, Contact from Customer where ID = 102;

--3
SELECT Name, Contact FROM Customer c JOIN Orders o on c.ID = o.Customer_ID JOIN Goods g on g.Goods_ID=o.Goods_ID WHERE g.Price = (SELECT min(Price) FROM Goods);

--4
SELECT ID, Name, Contact FROM Customer WHERE ID NOT IN (SELECT DISTINCT Customer_ID FROM Orders);


--5
SELECT Name FROM Customer c JOIN Orders o on c.ID = o.Customer_ID JOIN Goods g on g.Goods_ID=o.Goods_ID WHERE g.Price = (SELECT max(Price) FROM Goods);

--6
SELECT DISTINCT c.Name FROM Customer c JOIN Orders o on c.ID = o.Customer_ID WHERE c.ID = (SELECT Customer_ID FROM Orders GROUP BY Customer_ID HAVING count(*)>2);



--7
DROP TABLE Orders;
DROP TABLE Customer;
DROP TABLE Goods;