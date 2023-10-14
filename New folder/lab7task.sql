drop table relation;
drop table book;
drop table course;
drop table dept;

set pagesize 200;
set linesize 200;

Create table dept(
dept_id number(20),
dept_name varchar(30),
faculty varchar(30),
no_of_student number(20),
primary key(dept_id)
);

describe dept;

insert into dept(dept_id,dept_name,faculty,no_of_student)values(7,'CSE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',60);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',50);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',30);

select * from dept;

set serveroutput on
declare 
cursor dept_cursor is select * from dept;
dept_row dept%rowtype;
begin
open dept_cursor;
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student;
while dept_cursor%found loop

if dept_row.no_of_student>=100
	then
	dbms_output.put_line('Catagory A ');
elsif dept_row.no_of_student>=60
	then
	dbms_output.put_line('Catagory B ');
else
	dbms_output.put_line('Catagory C ');
	end if;

	dbms_output.put_line('DEPT_id: '||dept_row.dept_id|| ' DEPT_name: '||dept_row.dept_name || ' faculty: ' ||dept_row.faculty|| ' no_of_student: '||dept_row.no_of_student);
--dbms_output.put_line('Row count: '|| dept_cursor%rowcount);
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student;
end loop;

dbms_output.put_line('Row count: '|| dept_cursor%rowcount);

close dept_cursor;
end;
/
