--2
SELECT first_name, last_name, email, name, salary FROM Departments NATURAL JOIN Employees JOIN Salaries on Employees.employee_id=Salaries.employee_id WHERE name='Sales';

--3
SELECT avg(salary) FROM Salaries;

--4
select name from Departments d join Employees e on d.department_id = e.department_id join Salaries s on e.employee_id = s.employee_id where salary = (select max(avg_sal) from (select avg(salary) as avg_sal from Employees ee join Salaries ss on ee.employee_id = ss.employee_id group by ee.department_id));

--5
SELECT first_name, last_name, email, (SELECT sum(salary) FROM Salaries WHERE from_date>=date '2022-01-01') as Total_Salary FROM Departments NATURAL JOIN Employees NATURAL JOIN Salaries WHERE hire_date>=date'2022-01-01';

--6
SELECT first_name, last_name, email, salary FROM Departments NATURAL JOIN Employees NATURAL JOIN Salaries WHERE salary = (SELECT max(salary) FROM Salaries);

--7
SELECT first_name, last_name, email FROM Departments NATURAL JOIN Employees NATURAL JOIN Salaries WHERE name LIKE '%ng%';

--drop
drop table Salaries;
drop table Employees;
drop table Departments;
