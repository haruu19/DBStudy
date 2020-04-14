-- subQuery

select * from emp;

-- smith와 업무가 같은 직원의 정보를 조회하세요
select job from emp where ename = 'smith';
select * from emp where job = 'CLERK';
-- where 절의 서브커리
select * from emp where job = (select job from emp where ename = 'smith');
-- miller 와 같은 부서에서 급여 많이받는 사원
select * from emp where sal > (select sal from emp where ename = 'miller') 
and deptno = (select deptno from emp where ename = 'miller');
-- 다중행을 리턴하는 서브쿼리
select * from emp where sal in (select round(avg(sal)) from emp group by deptno);
/*
2917
2175
1567
*/
select * from emp where sal > any (select round(avg(sal)) from emp group by deptno) order by sal;
select * from emp where sal < all (select round(avg(sal)) from emp group by deptno);

-- 다중컬럼 서브쿼리
-- 부서에서 급여를 제일 많이 받는 사원의 정보
select * from emp 
where (deptno, sal) in (select deptno, round(max(sal)) from emp group by deptno);

-- from 절의 서브쿼리(inline view)
select a.minSal, a.maxSal
from (select deptno, max(sal) as maxSal, min(sal) as minSal, avg(sal) as avgSal from emp group by deptno) a;

-- 이름 급여 자기가 속한 부서의 급여합계
select ename, sal, dsum 
from emp a, (select deptno, sum(sal) as dsum from emp group by deptno) b
where a.deptno=b.deptno;

-- ansi
create view vsal
as
select ename, sal, dsum , tsum
from emp a
	join (select deptno, sum(sal) as dsum from emp group by deptno) b
													on (a.deptno = b.deptno)
	join (select sum(sal) as tsum from emp) c;
drop view vsal;
select *
from vsal
where 1=1;

-- projection 절에 들어가는 서브쿼리 : 한건만 나오게
select ename, sal, (select sum(sal) from emp) as tsum
from emp;

-- 이름, 급여, 부서급여합,  전체급여합 단 projection 절의 서브쿼리 구현
-- 상호연관 서브쿼리(시험 x 이런거 있다 정도)
select ename, sal, a.deptno,
(select sum(sal) from emp b where b.deptno=a.deptno) as dsum,
(select sum(sal) from emp) as tsum
from emp a;

create index idxempname on emp(ename); -- 인덱싱은 물리적 모델링일 때 해준다 
-- 모든 칼럼에 다 해주면 인덱스별로 트리가 만들어짐 : 정렬 수행. 메모리 낭비
-- create
select ename, ename
from emp
where ename = 'smith'
;