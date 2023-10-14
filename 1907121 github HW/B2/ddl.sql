create table customer (
ID INT NOT NULL,
Name VARCHAR(50) NOT NULL,
Contact VARCHAR(50) NOT NULL,
PRIMARY KEY (ID));
					
create table Goods (
Goods_ID INT NOT NULL,
Goods_Name VARCHAR(50) NOT NULL,
Price DECIMAL(10, 2) NOT NULL CHECK (Price >= 0),
PRIMARY KEY (Goods_ID));

create table Orders (
Order_Date DATE NOT NULL,
Customer_ID INT NOT NULL,
Goods_ID INT NOT NULL,
PRIMARY KEY (Customer_ID, Goods_ID),
FOREIGN KEY (Customer_ID) REFERENCES Customer(ID) ON DELETE CASCADE,
FOREIGN KEY (Goods_ID) REFERENCES Goods(Goods_ID) ON DELETE CASCADE);