--procedure execution

--alter session set "_ORACLE_SCRIPT"=true;  

--1907121

drop trigger gradecount;
drop procedure getCount;
drop procedure ageCount;
drop function getAvg;
drop table performance;
drop table person;

--create person & performance table

create table person(
    roll number(20),
    name varchar(20),
    hall varchar(20),
    phone number(11),
    dob date,
    age number(20)
);

create table performance(
    roll number(20),
    year number(20),
    semester number(10),
    gradepoint number(3,2)
);

-- modify roll as pk at person and fk at performance and dob can't be null

alter table person modify roll number(20) primary key;
alter table performance add foreign key(roll) references person(roll);
alter table person modify dob date not null;

--domain integrity
--add check constraint to modify year and semester

alter table performance modify year check (year>=1 and year<=4);
alter table performance modify semester number(10) check (semester=1 or semester=2);

--insert values

insert into person(roll,name,hall,phone,dob) values(1907001,'Shimu','Rokeya','01234567890','01-MAY-2001');
insert into person(roll,name,hall,phone,dob) values(1907002,'Sina','Amar','01234567891','01-JAN-2001');
insert into person(roll,name,hall,phone,dob) values(1907003,'Chinmoy','Rashid','01234567892','01-DEC-2001');

insert into performance values(1907001,1,1,3.78);
insert into performance values(1907001,1,2,3.82);
insert into performance values(1907001,2,1,3.98);
insert into performance values(1907002,2,1,3.78);
insert into performance values(1907002,2,2,3.82);
insert into performance values(1907002,3,1,3.98);
insert into performance values(1907003,3,1,3.78);
insert into performance values(1907003,3,2,3.82);
insert into performance values(1907003,4,1,3.98);


--procedure creation ageCount

create or replace procedure ageCount(
    dob IN date
)
as age int;
begin
    age:=EXTRACT(YEAR FROM SYSDATE)-EXTRACT(YEAR FROM dob);
    dbms_output.put_line('Calculated Age: ' || age);
end;
/

--procedure execution

set serveroutput on
declare
begin
    ageCount('01-MAY-2001');
end;
/

--function creation getAvg

create or replace function getAvg(
    p_year IN PERFORMANCE.YEAR%type
)
return number as ans number;

begin
    select avg(gradepoint) into ans from performance where year=p_year;
    return ans;
end;
/

--function execution

set serveroutput on
declare
    avgGrade PERFORMANCE.GRADEPOINT%type;
    p_year PERFORMANCE.year%type:=3;
begin
    avgGrade:=getAvg(p_year);
    dbms_output.put_line('Average grade: ' || avgGrade || ' in year: ' || p_year);
end;
/

--A2
alter table person add bloodgroup varchar(3);
alter table performance add L_Grade varchar(2);

create or replace trigger gradeCount
before insert on performance
--referencing new as n
for each row
begin
    if(:new.gradepoint>=3.75)
        then :new.L_grade:='A+';
    elsif(:new.gradepoint>=3.50)
        then :new.L_grade:='A';
    elsif(:new.gradepoint>=3.25)
        then :new.L_grade:='A-';
    elsif(:new.gradepoint>=3.00)
        then :new.L_grade:='B+';
    elsif(:new.gradepoint>=2.75)
        then :new.L_grade:='B';
    elsif(:new.gradepoint>=2.50)
        then :new.L_grade:='C+';
    elsif(:new.gradepoint>=2.25)
        then :new.L_grade:='C';
    elsif(:new.gradepoint>=2.00)
        then :new.L_grade:='D';
    else
        :new.L_grade:='F';
    end if;
end;
/


insert into performance(roll,year,semester,gradepoint) values(1907001,4,1,3.78);
insert into performance(roll,year,semester,gradepoint) values(1907001,4,2,3.22);
insert into performance(roll,year,semester,gradepoint) values(1907001,4,1,3.68);


--procedure creation getCount

CREATE OR REPLACE PROCEDURE getCount(
    mn IN performance.gradepoint%type,
    mx IN performance.gradepoint%type,
    ans OUT NUMBER
)
is
BEGIN
    SELECT COUNT(*) INTO ans 
    FROM performance
    WHERE gradepoint >= mn AND gradepoint <= mx;
END;
/

--function execution

set serveroutput on
declare
    ans number;
begin
    getCount(3.50,3.60,ans);
    dbms_output.put_line('Ans: ' || ans);
end;
/


