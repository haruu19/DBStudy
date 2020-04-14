select * 
from emp e, dept d
where e.deptno = d.deptno;
-- 1
select e.ename, e.sal, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- 2
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename='king';

-- 3
select dname from dept;
select e.ename,e.deptno,d.dname,e.sal
from emp e, dept d
where e.deptno = d.deptno;

-- 4
select e.ename, "의 매니저는", m.ename, "이다"
from emp e, emp m
where e.mgr = m.empno;

-- 5
select e.empno, d.dname, e.sal, e.job
from emp e, dept d
where e.deptno = d.deptno and job = (select job from emp where ename='scott');

-- 6
select empno, ename, hiredate, sal
from emp
where deptno = (select deptno from emp where ename='scott');

-- 7
select e.empno, e.ename, d.dname, e.hiredate, d.loc, e.sal
from emp e, dept d
where e.deptno=d.deptno and sal > (select avg(sal) from emp);

-- 8
select e.empno, e.ename, d.dname, d.loc, e.sal
from emp e, dept d
where e.deptno=d.deptno and e.job in (select job from emp where deptno=30)
order by sal desc;

-- 9
select e.empno, e.ename, d.dname, e.hiredate, d.loc
from emp e inner join dept d on(e.deptno=d.deptno)
where e.deptno=10 and e.job not in (select job from emp where deptno=30) ;

-- 10
select empno, ename, sal
from emp
where sal in (select sal from emp where ename in('king','james'));

-- 11
select empno, ename, sal
from emp
where sal > all(select sal from emp where deptno=30);

-- 12
create index idxempname on emp(ename);

-- 13
select ename, sal 
from emp
where hiredate = (select hiredate from emp where ename='allen');

-- 14
create view vsal
as
select deptno, sum(sal) as dsum
from emp
group by deptno;

drop view vsal;

select *
from vsal
order by dsum desc;