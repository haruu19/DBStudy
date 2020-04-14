/*
	조회
	select 컬럼, 컬럼, ... (출력할 컬럼을 조작)
	from 데이터집합(테이블명)
    where 조건(데이터 범위 줄이기)
    order by 정렬(화면에 순서를 정하는 절)
*/
-- emp(사원)의 정보를 화면에 출력하시오
-- from : 어떤 테이블을 사용하는지 : emp
-- select : 사원의 정보 : 컬럼명, *

-- Q) 실렉트 절의 실행순서는 ??
-- 1 select
-- 2 from
-- 3 where
-- 4 order by
-- 2 - 3 - 1 - 4 실행순서!!
-- 먼저 데이타 가져오고 -> (2) where 절에서 조작 후 -> (3) 조작한 결과를 출력하는데 -> (1) 마지막으로 정렬을 한다 -> (4) 

select * 
	from emp;
-- 사원의 정보 중에서 사원이름, 사원번호, 급여를 출력하시오
-- 단, 20번 부서에 소속된 사원들만 출력합니다.

select empno, ename, sal,deptno
	from emp
    where deptno=20
    order by empno desc;
    
select ename, empno, sal, (1000+sal)*1.1
	from emp
--  where ename like 'SMI__' 'SM%'; %는 자릿수 상관 x, _는 자릿수갯수까지 고려!
	where 1=1
--    AND sal between 1100 and 2500; -- 1100 <= sal <= 2500
    and sal in (1100,1500); -- 1100 or 1500

select ename, sal
	from emp
	where 1 = 1
    and sal * 10 >= 10000; 
    
select *
	from emp
    where 1=1
--  and comm = null -- null은 비교할 수 없다!
	and comm is not null
    