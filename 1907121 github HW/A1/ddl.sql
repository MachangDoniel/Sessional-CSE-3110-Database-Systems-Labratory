create table Departments (
department_id integer primary key,
name varchar(30));

create table Employees (
employee_id integer primary key,
first_name varchar(20),
last_name varchar(20),
email varchar(30),
hire_date date,
department_id integer,
foreign key(department_id) references Departments); 


create table Salaries (
employee_id integer,
salary number(6),
from_date date,
to_date date,
foreign key(employee_id) references Employees, 
primary key(employee_id, from_date));
