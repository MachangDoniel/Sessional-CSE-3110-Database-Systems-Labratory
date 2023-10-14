insert into customers values(10001,'doniel','doniel@gmail.com');
insert into customers values(10002,'tripura','tripura@gmail.com');
insert into customers values(10003,'chakma','chakma@gmail.com');
insert into customers values(10004,'Rimi','Rimi@gmail.com');
insert into customers values(10005,'Rim','rim123@gmail.com');

insert into orders values(201,to_date('11-05-2021','DD-MM-YYYY'),10002);
insert into orders values(202,to_date('12-05-2001','DD-MM-YYYY'),10002);
insert into orders values(203,to_date('14-05-2024','DD-MM-YYYY'),10003);
insert into orders values(204,to_date('13-05-2001','DD-MM-YYYY'),10001);
insert into orders values(205,to_date('11-05-2001','DD-MM-YYYY'),10005);
insert into orders values(206,to_date('17-05-2001','DD-MM-YYYY'),10001);
insert into orders values(207,to_date('11-05-2001','DD-MM-YYYY'),10004);
insert into orders values(208,to_date('11-05-2023','DD-MM-YYYY'),10002);

insert into order_items values(1001,203,'rice',3,123);
insert into order_items values(1002,202,'egg',20,120);
insert into order_items values(1005,207,'meat',32,223);
insert into order_items values(1003,206,'nuts',13,23);
insert into order_items values(100,201,'veg',12,1230);
insert into order_items values(1004,204,'fish',1,1023);






