use scott;

delete from dept where deptno = 30;

update dept set deptno = 50 where deptno = 30;

select * from dept;
select * from emp;
rollback;


create table test ( AA varchar(10) primary key, BB int);

insert into test(AA,BB) values('AA',1000);
select * from test;
commit;
rollback;
