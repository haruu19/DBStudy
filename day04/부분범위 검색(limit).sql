-- 부분범위 검색
select empno, ename, sal
from emp
order by sal desc
limit 5;

select empno, ename, sal
from emp
order by sal desc;
-- limit 시작위치(0), 가져올 크기;

select empno, ename, sal
from emp
order by sal desc;
-- limit (3 - 1) * 5, 5; 리미트에 수식 넣으면 안댐

select empno, ename, sal
from emp
order by sal desc
limit 10, 5;