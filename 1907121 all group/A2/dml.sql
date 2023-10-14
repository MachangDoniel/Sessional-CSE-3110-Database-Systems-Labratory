INSERT INTO Customer values(0001, 'Shama', 12375);
INSERT INTO Customer values(0002, 'Sornaly', 67889);
INSERT INTO Customer values(0003, 'Arpita', 98607);

INSERT INTO Goods VALUES(1001, 'glassjar', 2500);
INSERT INTO Goods VALUES(1002, 'Icecream', 200);
INSERT INTO Goods VALUES(1003, 'Laptop', 70000);

INSERT INTO Order2(Order_Date, Customer_id, Goods_id) VALUES(TO_DATE('20-12-2023', 'dd-mm-yyyy'), 0002, 1002);
INSERT INTO Order2(Order_Date, Customer_id, Goods_id) VALUES(TO_DATE('20-12-2023', 'dd-mm-yyyy'), 0002, 1003);
INSERT INTO Order2(Order_Date, Customer_id, Goods_id) VALUES(TO_DATE('22-12-2023', 'dd-mm-yyyy'), 0001, 1001);


--1
SELECT * FROM Goods where Goods_name like '%i%';
SELECT * FROM Customer where name like '%j%';

--2
SELECT COUNT(*) FROM Customer;
SELECT name, contact FROM Customer where id = 0002;

--3
SELECT name, contact FROM Customer where id = (SELECT Customer_id FROM Order2 where Goods_id = (SELECT Goods_id FROM Goods WHERE Price = (SELECT MIN(Price) FROM Goods)));

--4
SELECT C.Name, C.Contact FROM Customer C WHERE C.ID NOT IN (SELECT DISTINCT Customer_ID FROM Order);

--5
SELECT name FROM Customer where id = (SELECT Customer_id FROM Order2 where Goods_id = (SELECT Goods_id FROM Goods WHERE Price = (SELECT MAX(Price) FROM Goods)));

--6
SELECT Customer_id, COUNT(goods_id) from Order2 group by Customer_id having COUNT(Goods_id) >=2; 