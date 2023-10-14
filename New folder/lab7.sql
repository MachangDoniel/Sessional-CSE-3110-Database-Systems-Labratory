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
Create table course(
course_no varchar(20),
course_name varchar(50),
year_semister number(3),
credit number(20,4),
dept_id number(20),
primary key(course_no),
foreign key(dept_id) references dept(dept_id)
);
create table book(
book_no number(20),
book_name varchar(50),
author varchar(50),
book_edition number(4),
course_offering number(6),
primary key(book_no) 
);
create table relation(
book_no number(20),
course_no varchar(20),
primary key(book_no,course_no),
foreign key (book_no) references book(book_no),
foreign key (course_no) references course(course_no) 
);
alter table dept add location char(20);
alter table dept modify location varchar(23);
alter table dept rename column location to location2;
alter table dept drop column location2;

insert into dept(dept_id,dept_name,faculty,no_of_student)values(7,'CSE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(3,'EEE','EE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(1,'CE','CE',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(5,'ME','ME',120);
insert into dept(dept_id,dept_name,faculty,no_of_student)values(2,'ECE','EE',60);

insert into course(course_no,course_name,year_semister,credit,dept_id)values('CSE1101','discreate math',11,3.00,7);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('CSE3105','database systems',31,3.00,7);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('EEE1101','Basic electrical engineering',11,3.00,3);
insert into course(course_no,course_name,year_semister,credit,dept_id)values('ME3101','solid mechanics',31,3.00,5);

insert into book(book_no,book_name,author,book_edition,course_offering)values(12,'discreate math','rosen',4,2);
insert into book(book_no,book_name,author,book_edition,course_offering)values(13,'database systems','korth',5,1);
insert into book(book_no,book_name,author,book_edition,course_offering)values(14,'data_communication','willim stallings',6,3);
insert into book(book_no,book_name,author,book_edition,course_offering)values(15,'solid mechanics','john abraham',3,2);
insert into book(book_no,book_name,author,book_edition,course_offering)values(16,'electrical engineering','boylsted',8,4);

insert into relation(book_no,course_no)values(12,'CSE1101');
insert into relation(book_no,course_no)values(16,'EEE1101');
insert into relation(book_no,course_no)values(15,'ME3101');
insert into relation(book_no,course_no)values(13,'CSE3105');

select * from dept;
select * from book;
select * from course;
select * from relation;



--lab 7


set serveroutput on
declare 
dept_id dept.dept_id%type;
dept_name DEPT.DEPT_NAME%type;
no_of_student number;
begin
select dept_id,dept_name,no_of_student into dept_id,dept_name,no_of_student from dept where dept_id=7;
dbms_output.put_line('DEPT_id: '||dept_id|| ' DEPT_name: '||dept_name || ' no_of_student: '||no_of_student);
end;
/

set serveroutput on
declare 
dept_id dept.dept_id%type:=9;
dept_name DEPT.DEPT_NAME%type:='MME';
faculty dept.faculty%type:='ME';
no_of_student number:=30;
begin
insert into dept values(dept_id,dept_name,faculty,no_of_student);
end;
/


set serveroutput on
declare 
dept_row dept%rowtype;
begin
select dept_id,dept_name,no_of_student into dept_row.dept_id,dept_row.dept_name,dept_row.no_of_student from dept where dept_id=7;
end;
/

set serveroutput on
declare 
cursor dept_cursor is select * from dept;
dept_row dept%rowtype;
begin
open dept_cursor;
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student;
while dept_cursor%found loop
dbms_output.put_line('DEPT_id: '||dept_row.dept_id|| ' DEPT_name: '||dept_row.dept_name || ' faculty: ' ||dept_row.faculty|| ' no_of_student: '||dept_row.no_of_student);
dbms_output.put_line('Row count: '|| dept_cursor%rowcount);
fetch dept_cursor into dept_row.dept_id,dept_row.dept_name,dept_row.faculty,dept_row.no_of_student;
end loop;
close dept_cursor;
end;
/


TYPE NAMEARRAY IS VARRAY(5) OF book.book_name%type;

A_NAME NAMEARRAY:=NAMEARRAY();

set serveroutput on
declare 
  counter number;
  book_name2 book.book_name%type;
  TYPE NAMEARRAY IS VARRAY(5) OF book.book_name%type; 
  A_NAME NAMEARRAY:=NAMEARRAY();
begin
  counter:=1;
  for x in 12..16  
  loop
    select book_name into book_name2 from book where book_no=x;
    A_NAME.EXTEND();
    A_NAME(counter):=book_name2;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/

