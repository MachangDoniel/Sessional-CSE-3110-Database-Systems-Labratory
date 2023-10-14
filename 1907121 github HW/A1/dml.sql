insert into Departments values(1, 'Sales');
insert into Departments values(2, 'Marketing');
insert into Departments values(3, 'Engineering');
insert into Departments values(4, 'Finance');

insert into Employees values(1, 'Doniel', 'Tripura', 'donieltripura@example.com', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1);
insert into Employees values(2, 'Shrabonti', 'Devnath', 'janedoe@example.com', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 1);
insert into Employees values(3, 'Agent', 'Venom', 'alicesmith@example.com', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 2);
insert into Employees values(4, 'Tony', 'Stark', 'bobjohnson@example.com', TO_DATE('2022-04-01', 'YYYY-MM-DD'), 2);

insert into Salaries values(1, 50000, TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));
insert into Salaries values(2, 60000, TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));
insert into Salaries values(3, 70000, TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));
insert into Salaries values(4, 80000, TO_DATE('2022-04-01', 'YYYY-MM-DD'), TO_DATE('2022-12-31', 'YYYY-MM-DD'));