-- 뷰의 사용
-- 복잡한 질의문을 간단하게 처리한다
-- 뷰는 데이터를 가지고 있는 것이 아니라 질의문장을 가지고 있다.
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

create or replace view emp_view
as
select e.empno, e.ename, e.sal, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

select * from emp_view;