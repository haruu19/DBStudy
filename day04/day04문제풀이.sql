-- 1
select ename, job, sal
from emp e, dept d
where e.deptno=d.deptno and loc = 'chicago';

-- 2
select empno, ename, job, deptno
from emp
where empno not in (select mgr from emp where mgr is not null);

-- 3
select ename, job, mgr
from emp
where mgr = (select mgr from emp where ename = 'blake');

-- 4
select * 
from emp
order by hiredate
limit 5;

-- 5
select ename, job, dname
from emp e, dept d
where e.deptno = d.deptno and mgr = (select empno from emp where ename = 'jones');

select * from emp;