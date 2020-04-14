-- 1) emp 테이블 정보를 확인하세요.
desc emp;

-- 2-1) 이름이 K로 시작하는 사원의 사원번호, 이름, 입사일, 급여를 검색
select empno, ename, hiredate, sal from emp where ename like "K%";
-- 2-2) 이름이 K로 시작하는 사원 중 이름이 3자인 사원의 사원번호, 이름, 입사일, 급여를 검색
select empno, ename, hiredate, sal from emp where ename like "K__";
-- 2-3) 이름의 두번 째 글자가 M
select empno, ename, hiredate, sal from emp where ename like "_M_";

-- 3) 입사일이 1981년도인 사람의 모든 정보 검색
select  empno, ename, HIREDATE, 
		year(HIREDATE), extract(year  from hiredate),
		date_format(hiredate,'%Y')
	from emp where year(HIREDATE) = 1981;
    
-- 3-2) 입사월 5월 정보검색
select * from emp where month(HIREDATE) = 5 or extract(month from HIREDATE) =5
	or date_format(HIREDATE,'%M') = 5;
    
-- 4) 커미션이 NULL이 아닌 사람의 모든 정보를 검색하세요
select * from emp where comm is not null;

-- 타이핑 규칙
select *
  from emp
 where comm is not null;

-- null 의 의미
-- null 과의 비교 연산은 무조건 false 반환
-- null 과의 산술 연산은 무조건 null

-- null + 100 -> null
-- null * 100 -> null

-- where null > 100;  false;
-- where null > null; false;
-- where null = null; false; 

-- 5) 부서가 30번 부서이고 급여가 $1,500 이상인 사람의 이름, 부서, 월급 검색
select ename, deptno, sal from emp where deptno=30 and sal>=1500;

-- 6) 부서번호가 30인 사람 중 사원번호 sort하라
select * 
	from emp
   where deptno=30
   order by empno;

select *
  from emp
 where deptno in (20,30)
 order by deptno asc, sal desc;
 
 --		 1		2	   3     4
 select empno, ename, sal, deptno
   from emp
  where deptno in (20,30)
  order by 4 asc, 3 desc, 2; -- 거의 사용 x
  
  -- 10) emp Table 에서 이름, 급여, 커미션 금액, 총액(급여+커미션금액) 구하여
  -- 총액 많은 순서로 검색. 단, 커미션 null 인 사람 제외(커미션금액: sal*comm/100)
  select ename, sal, sal*comm / 100 as comm, (sal + sal*comm/100) as total
  from emp
  where comm is not null
  order by total desc;
 
 -- 11) 10번 부서의 모든 사람들에게 급여의 13%를 보너스로 지불하기로 하였다.
 -- 이름, 급여, 보너스 금액, 부서번호 검색
 select ename, sal, sal * 0.13 as bonus, deptno
 from emp
 where deptno = 10;

-- 12) 부서번호 20인 사원의 시간당 임금을 계산하여 검색
	   단, 1달의 근무일수는 12일이고, 1일 근무시간은 5시간이다.
       출력양식은 이름, 급여, 시간당 임금을 검색하세요.
select ename, sal, (sal/60) as timesal
from emp
where deptno=20;

-- 13) 급여가 $1,500 부터 $3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다.
-- 이를 이름, 급여, 회비(소수점 두자리아래에서 반올림) 를 검색하세요.
-- 반올림 : round(), round ( , )
-- 뒤 인자에 양수 주면 소수점, 음수는 정수부분

select ename, sal, round(sal*0.15 , 2) as pay
  from emp
 where sal between 1500 and 3000;
 
 -- 14) 입사일로부터 오늘까지의 일수를 구하여 이름, 입사일, 근무일수를 검색
 -- datediff(날짜1, 날짜2) : 두 날짜간의 일수 구하는 함수
 select curdate(), curtime(), now(), datediff('2001-01-01','2000-01-01');
 select ename, hiredate, datediff(curdate(),hiredate) as'근무일수', 
		timestampdiff(day, hiredate, curdate()) as 근무일수2,
        timestampdiff(month, hiredate, curdate()) as 근무월수,
        timestampdiff(year, hiredate, curdate()) as 근무년수
   from emp;