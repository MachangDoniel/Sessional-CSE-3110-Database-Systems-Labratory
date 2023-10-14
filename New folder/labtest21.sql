-- 1907021

--Q1

create table person(
    roll number(20),
    name varchar(50),
    hall varchar(50),
    phone varchar(50),
    dob date,
    age number(20)
);

create table performance(
    roll number(20),
    year number(10),
    semester number(10),
    gradepoint number(10,2)
);

--Q2

alter table person modify roll number(20) primary key;
alter table performance add foreign key(roll) references person(roll);

--Q3

alter table performance modify year number(20) check (year>=1 and year<=4);
alter table performance modify semester number(20) check (semester=1 or semester=2);

--Q4

insert into person(roll,name,hall,phone,dob,age) values(1,'a','aaaa','018','21-MAY-2002',22);
insert into person(roll,name,hall,phone,dob,age) values(2,'b','bbbb','017','21-MAY-2001',21);
insert into person(roll,name,hall,phone,dob,age) values(3,'c','cccc','016','21-MAY-2004',18);

insert into performance(roll,year,semester,gradepoint) values(1,1,1,3.58);
insert into performance(roll,year,semester,gradepoint) values(2,4,2,3.18);
insert into performance(roll,year,semester,gradepoint) values(3,2,1,3.23);

--Q5

-- take date of birth as parameter and insert age into rows by calculating his age from date of birth take from parameter

create or replace procedure insertage(p_dob IN person.dob%type, p_row out person%rowtype) IS

Begin
    p_row.age := EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM p_dob);
    
End;
/

--execution

set serveroutput on;
Declare
    res number;
Begin
    insertage("21-MAY-2001");
    
    dbms_output.put_line(res);
End;
/

--Q6

--Function Creation
set serveroutput on;
create or replace function getavg(p_year in performance.year%type) return number AS
    res number;

Begin
    select avg(gradepoint) into res from performance where year = p_year;

    return res;
End;
/

--Function execution
set serveroutput on;
Declare
    res number;
Begin
    res := getavg(1);
    
    dbms_output.put_line(res);
End;
/