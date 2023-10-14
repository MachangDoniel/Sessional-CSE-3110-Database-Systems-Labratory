
DROP TABLE Order2;
DROP TABLE Goods;
DROP TABLE Customer;


CREATE TABLE Customer (
    id NUMBER(10) NOT NULL,
    name VARCHAR(20),
    contact number(15),
    PRIMARY KEY(id)
);

CREATE TABLE Goods (
    Goods_id NUMBER(10) NOT NULL,
    Goods_name VARCHAR(20),
    Price number(15) check(Price >=0),
    PRIMARY KEY(Goods_id)
);

CREATE TABLE Order2 (
    Order_Date DATE,
    Customer_id NUMBER(10),
    Goods_id NUMBER(10),
    PRIMARY KEY(Order_Date),
    FOREIGN KEY(Customer_id) REFERENCES Customer(id),
    FOREIGN KEY(Goods_id) REFERENCES Goods(Goods_id)
    on delete CASCADE
);

