-- join
-- 1. cross join
select * 
from emp, dept;
-- ansi
select *
from emp cross join dept;

-- 2. inner join
select empno, sal, ename, e.deptno, dname
from emp e, dept d
where e.deptno=d.deptno;
-- ansi
select *
from emp inner join dept on emp.deptno = dept.deptno;

select *
from emp inner join dept using (deptno);

select * from salgrade;
-- 사번 이름 급여 급여등급을 구하시오
select empno,ename,sal,grade
from emp, salgrade
where 1=1
and sal between losal and hisal;

-- 3. outer join
update emp set deptno = null where empno = 7839;
select * from emp;

select *
from emp join dept on emp.deptno = dept.deptno;

-- 사원의 이름 사번 급여 부서명을 구하세요
-- left outer join
select *
from emp left outer join dept on emp.deptno = dept.deptno;
-- right outer join
select *
from emp right outer join dept on emp.deptno = dept.deptno;
-- full outer join
-- select *
-- from emp full outer join dept on emp.deptno = dept.deptno
-- inner join : 13 건 left right outer join 14건 full outer join 15건

-- 4. natural join
select *
from emp natural join dept;

-- self join
select a.ename, a.empno, b.ename, a.sal, b.sal -- 이름 사번 관리자이름, 사원의 급여, 관리자 급여
from emp a, emp b
where a.mgr = b.empno;

-- king 아저씨도 출력되게 할 수 있는가 -> self + outer join
select * from emp;
-- ansi 
select a.ename, a.empno, b.ename, a.sal, b.sal -- 이름 사번 관리자이름, 사원의 급여, 관리자 급여
from emp a left outer join emp b on a.mgr = b.empno;