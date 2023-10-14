drop table childs;
drop table parents;

create table parents(
    roll number(3) primary key
);
create table childs(
    names varchar(10) primary key,
    roll number(3) references parents(roll)
    --on delete cascade
);

insert into parents values(121);
insert into parents values(122);
insert into parents values(123);
insert into childs values('doniel',121);
insert into childs values('rimi',122);
insert into childs values('aditi',123);

--delete from parents where roll=123;

create or replace trigger delete_child_to_parents_by_roll
before delete on childs
referencing old as o new as n
for each row
enable
begin
    delete from parents where roll=:o.roll;
end;
/

delete from childs where roll=121;