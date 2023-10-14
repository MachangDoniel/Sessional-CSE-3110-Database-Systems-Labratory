insert into customers values (1, 'John Smith', 'john.smith@example.com');
insert into customers values (2, 'Jane Doe', 'jane.doe@example.com');
insert into customers values (3, 'Bob Johnson', 'bob.johnson@example.com');
insert into customers values (4, 'Alice Williams', 'alice.williams@example.com');



insert into orders values (1001, date '2023-03-28', 1);
insert into orders values (1002, date '2023-03-29', 2);
insert into orders values (1003, date '2023-03-30', 1);
insert into orders values (1004, date '2023-03-31', 3);



insert into order_items values (1, 1001, 'iPhone', 2, 999.99);
insert into order_items values (2, 1001, 'Google Pixel', 1, 699.99);
insert into order_items values (3, 1002, 'Samsung Galaxy', 1, 799.99);
insert into order_items values (4, 1003, 'OnePlus', 3, 899.99);