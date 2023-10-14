create table departments(
department_id number(5),
name varchar(20),
primary key (department_id)
);
create table employees(
employee_id number(5),
first_name varchar(20),
last_name varchar(20),
email varchar(30),
hire_date date,
department_id number(5),
primary key (employee_id),
foreign key (department_id) references departments
);
create table salaries(
employee_id number(5),
salary number(10),
from_date date,
to_date date,
foreign key (employee_id) references employees,
primary key (employee_id, from_date)
);