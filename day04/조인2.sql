select * from emp;
select * from dept;
select * from salgrade s;

-- 조인
-- 물리적, 논리적으로 2개 이상의 테이블을 연결해서 정보를 추출한다.

-- 여러개의 테이블을 조인할 때 증거조건이 명시되지 않아 M X N 의 결과를 반환하는 조인
-- (카테시안 프로덕트 - Cartesian Product)
-- (AnsiJoin - cross Join)
-- error : 양쪽 테이블에 동일한 이름의 컬럼이 있을 경우 컬럼 사용시 앞에 테이블을 명시
select empno, ename, emp.deptno, dname
from emp, dept;

-- 가독성을 높이기 위해서 컬럼의 이름 앞에 테이블을 알려준다.
select emp.empno, emp.ename, emp.deptno, dept.dname
from emp,dept;

-- 쿼리의 복잡함을 해서 : 테이블 별칭 사용(테이블 별칭은 as를 사용하지 못한다.)
select e.empno, e.ename, e.deptno, d.dname
from emp e,dept d;

-- Ansi Join 에서 CrossJoin 이라고 한다.
select e.empno, e.ename, e.deptno, d.dname
from emp e cross join dept d;
/*
반복문?? (emp 14, dept 4)
for(emp 행) {
	for(dept 행) {
		화면 출력 : 56가지
    }
}
*/

-- Equi Join (=)
select e.empno, e.ename, e.deptno, d.dname
from emp e, dept d
where e.DEPTNO = d.DEPTNO;
/*
for(erow er : e){
	for(drow dr : d){
		if(er.deptno == dr.deptno){
			화면출력
		}
	}
}
*/

-- Ansi join 방식으로 풀이
-- Natural Join : 양쪽 테이블에서 동일한 이름의 컬럼들을 모두 조인 조건 사용
select e.empno, e.ename, e.deptno, d.dname
from emp e natural join dept d;

-- inner join using : 컬럼의 이름이 같은 경우 사용, 직접 조인에 사용될 컬럼을 명시
select e.empno, e.ename, e.deptno, d.dname
from emp e
inner join dept d
	  using(deptno);
-- inner join on
select e.empno, e.ename, e.deptno, d.dname
from emp e
inner join dept d
	  on e.deptno = d.deptno
where e.sal > 1000;
-- inner join on 만 생각하자 using 말고

-- outer join(left right full)
-- 조인조건을 만족하지 않더라도 결과에 포함
-- inner join은 테이블을 읽는 순서에 영향을 받지 안흔ㄴ다.
-- outer join은 먼저 읽히는 것에 따라서 결과가 달라진다.
-- left(왼쪽 테이블을 먼저 읽는다), right(오른쪽 테이블을 먼저 읽는다.)
/*
for (erow er: e){
	for(drow dr : d) {
		if(er.deptno == dr.deptno){
			화면출력(er.*, dr. *)
		} else {
			값 대입(null값 대입)
		}
	}
}
*/
-- outer join : 순서가 중요!!!
select e.empno, e.ename, e.mgr, m.ename, m.empno
from emp e
right outer join emp m
		on e.mgr = m.empno
order by m.empno;

